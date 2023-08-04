package egovframework.omcst.pdata;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import egovframework.let.utl.fcc.service.JsonUtil;
import egovframework.let.utl.fcc.service.PageInfoUtil;
import egovframework.omcst.common.service.CodeCacheService;

/**
 * @author csh
 * 20230308
 * 공공데이터포털 open api를 이용한 데이터 처리 컨트롤러
 */
@Controller
public class PublicSeoDataContoller {
		@Value("${Publicseo.serviceKey}") //globals.properties 파일에서 Publicseo.serviceKey 추가하여 가져옴
		String NewserviceKey; // 서울시 공공데이터포털 서비스키 

		@Resource(name = "CodeCacheService")
		private CodeCacheService CodeCacheService;
		
		@Autowired
		private PageInfoUtil pageInfoUtil;
		
		/**
		 * @param parkingLotDataSearchVO
		 * @param model
		 * @return omcst/pdata/parkingLotData
		 * @throws Exception
		 *  주차정보 
		 */
	
		@GetMapping("/parkingLotDataApi")
		public String callHouseEmpDataApi(@ModelAttribute("parkingLotDataSearchVO") DataSearchVO parkingLotDataSearchVO, ModelMap model, HttpServletRequest request)throws Exception{
			
			// 메인화면에서 넘어온 경우 메뉴 갱신을 위해 추가
			request.getSession().setAttribute("baseMenuNo", "8000000");

			String regex = "^11[1-9]\\d*$";
	        Pattern pattern = Pattern.compile(regex);
	        
			Map<String, String> seoulMap = new TreeMap<>(CodeCacheService.getCityMap().entrySet()
																				    .stream()
																				    .filter(entry -> pattern.matcher(entry.getKey()).matches())
																				    .collect(Collectors.toMap(Map.Entry::getKey, Map.Entry::getValue)));	
			
			// 페이징 처리 start
			//csh 페이징 모듈화
			PaginationInfo paginationInfo= (PaginationInfo) pageInfoUtil.makePaginationInfo(parkingLotDataSearchVO);
			parkingLotDataSearchVO = (DataSearchVO) pageInfoUtil.makeObjectVO(paginationInfo, parkingLotDataSearchVO);
			
			int curPage = paginationInfo.getCurrentPageNo();
			int perPage = 10;
			int startIndex = (curPage * perPage) - perPage + 1;
			int endIndex = curPage * perPage;
			
			// 페이징 처리 end
			
			StringBuilder urlBuilder = new StringBuilder("http://openapi.seoul.go.kr:8088"); 
	        urlBuilder.append("/" + URLEncoder.encode(NewserviceKey,"UTF-8"));             
		    urlBuilder.append("/" + URLEncoder.encode("json", "UTF-8")); 
		    urlBuilder.append("/" + URLEncoder.encode("GetParkInfo", "UTF-8"));  
		    urlBuilder.append("/" + URLEncoder.encode(startIndex+"", "UTF-8")); 
		    urlBuilder.append("/" + URLEncoder.encode(endIndex+"", "UTF-8")); 
		    
		    String sBjdCodeNm = "";
		    String sBjdCode = parkingLotDataSearchVO.getBjdCode();
		    
//		    if(sBjdCode == null || sBjdCode.isBlank()) {
		    if(sBjdCode == null) {		    	
				Iterator<String> iterator = seoulMap.values().iterator();
				if(iterator.hasNext()) { sBjdCodeNm = iterator.next(); }
		    } else {
		    	sBjdCodeNm = seoulMap.get(sBjdCode);
		    }

	    	String[] codes = sBjdCodeNm.split(" ");
			if(codes.length > 1) { urlBuilder.append("/" + URLEncoder.encode(codes[1], "UTF-8")); }	
		    
	        //공통 처리부분 분리 getPublicData
			Map<String, Object> map = getPublicData(urlBuilder.toString());
	        int totCnt = Integer.parseInt(map.get("totCnt").toString()); 
			
			paginationInfo.setTotalRecordCount(totCnt);
			
			model.addAttribute("list",map.get("list"));
			model.addAttribute("seoulList",seoulMap);
			model.addAttribute("parkingLotDataSearchVO", parkingLotDataSearchVO);
			model.addAttribute("paginationInfo", paginationInfo); 
			
			return "omcst/pdata/ParkingLotData"; 
		}
		
		/**
		 * @param url
		 * @return map
		 * @throws Exception
		 * 공공데이터 정보를 가지고옴
		 */
		public  Map<String, Object> getPublicData(String path) throws Exception{
			
			URL url = new URL(path);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/json");
	        System.out.println("Response code: " + conn.getResponseCode());
	        BufferedReader rd;
	        
	        //getResponseCode가 200이상 300이하일때는 정상적으로 작동, 한글깨짐 방지를 위해 UTF-8처리
	        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	            rd = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
	        } else {
	            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream(), "UTF-8"));
	        }
	        StringBuilder sb = new StringBuilder();
	        String line;
	        while ((line = rd.readLine()) != null) {
	            sb.append(line);
	        }
	        rd.close();
	        conn.disconnect();
	        	        
	        String result = sb.toString();
	        
	        //문자열 형태의 JSON을 파싱하기 위한 JSONParser 객체 생성.
	        JSONParser parser = new JSONParser();
	        //문자열을 JSON 형태로 JSONObject 객체에 저장.
			JSONObject obj = (JSONObject)parser.parse(result);
			 
			JSONObject bodyResult = (JSONObject)obj.get("GetParkInfo");
			
			//jsonObject to jsonArray 형식으로 형변환
			JSONArray itemsResult = (JSONArray)bodyResult.get("row"); 
			
			//페이징 처리를 위한 총게시물 갯수를 가지고옴
			int totCnt = Integer.parseInt(bodyResult.get("list_total_count").toString());
			
			//jsonArray to list<map> 형식으로 형변환
	        List<Map<String, Object>> list = JsonUtil.getListMapFromJsonArray(itemsResult);
	        
	        Map<String, Object> map = new HashMap<String, Object>();
	        
	        map.put("list", list);
	        map.put("totCnt", totCnt);
           
			return map;
		}
	
}
