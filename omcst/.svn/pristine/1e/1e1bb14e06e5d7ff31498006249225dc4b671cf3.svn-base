package egovframework.omcst.pdata;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.ListIterator;
import java.util.Map;
import java.util.stream.Collectors;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.let.utl.fcc.service.JsonUtil;
import egovframework.let.utl.fcc.service.PageInfoUtil;
import egovframework.omcst.common.service.CodeCacheService;

/**
 * @author csh
 * 20230308
 * 공공데이터포털 open api를 이용한 데이터 처리 컨트롤러
 */
@Controller
public class PublicHouseDataContoller {
		@Value("${Public.serviceKey}") //globals.properties 파일에서 Public.serviceKey의 값을 가지고 옴
		String serviceKey; //공공데이터포털 서비스키 
		DataUtils dataUtils = new DataUtils();
		
		@Resource(name = "CodeCacheService")
		private CodeCacheService CodeCacheService;
		
		@Autowired
		private PageInfoUtil pageInfoUtil;
		
		@GetMapping("/houseEmpChart") 
		public String initHoustEmpChart() {
			return "omcst/pdata/houseEmpChart"; 
		}
		
		@GetMapping("/houseEmpChartData") 
		@ResponseBody
		public ResponseEntity<Object> getHouseEmpChartData(DataSearchVO dsvo) throws Exception {
			Map<String,String> paramMap = new HashMap<String,String>();
			paramMap.put("serviceKey",serviceKey);
			paramMap.put("pageNo"	 ,1+"");
			paramMap.put("numOfRows" ,URLEncoder.encode("1000", "UTF-8"));
			paramMap.put("type"		 ,URLEncoder.encode("json", "UTF-8"));
			paramMap.put("BJD_CDE"	 ,dsvo.getBjdCode());
			
			String sBjdCode = dsvo.getBjdCode();
			int index = 1;
			StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/5700000/GetEmptyHouseRateService/getEmptyHouseRateList"); 
			urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=" + serviceKey); 
			urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + index); 
			urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("100", "UTF-8"));
			urlBuilder.append("&" + URLEncoder.encode("type","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); 
//			if(!(sBjdCode == null || sBjdCode.isBlank())) {
			if(!(sBjdCode == null)) {				
				urlBuilder.append("&" + URLEncoder.encode("BJD_CDE","UTF-8") + "=" + URLEncoder.encode(sBjdCode, "UTF-8")); 
			}
			
			try {
				return ResponseEntity.ok().body(getPublicData(urlBuilder.toString(),dsvo).get("list"));
		    } catch (Exception e) {
		        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
		    }
		}		
		
		/**
		 * @param houseEmpDataSearchVO
		 * @param model
		 * @return omcst/pdata/houseEmpData
		 * @throws Exception
		 *  빈집정보
		 */	
		@GetMapping("/houseEmpDataApi")
		public String inithouseEmpDataApi(HttpServletRequest request, ModelMap model)throws Exception{
			// 메인화면에서 넘어온 경우 메뉴 갱신을 위해 추가
			request.getSession().setAttribute("baseMenuNo", "8000000");	
			model.addAttribute("cityList",CodeCacheService.getCityMap());
			return "omcst/pdata/houseEmpData";
		}
		
		@PostMapping("/houseEmpDataApi")
		public String callhouseEmpDataApi(@ModelAttribute("houseEmpDataSearchVO") DataSearchVO houseEmpDataSearchVO, ModelMap model, HttpServletRequest request)throws Exception{
			
			// 메인화면에서 넘어온 경우 메뉴 갱신을 위해 추가
			request.getSession().setAttribute("baseMenuNo", "8000000");
			
			//csh 페이징 모듈화
			PaginationInfo paginationInfo= (PaginationInfo) pageInfoUtil.makePaginationInfo(houseEmpDataSearchVO);
			houseEmpDataSearchVO = (DataSearchVO) pageInfoUtil.makeObjectVO(paginationInfo, houseEmpDataSearchVO);
			
			int index = paginationInfo.getCurrentPageNo();
			
			String sBjdCode = houseEmpDataSearchVO.getBjdCode();
			StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/5700000/GetEmptyHouseRateService/getEmptyHouseRateList"); /*URL*/
			urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=" + serviceKey); /*Service Key*/
			urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + index); /*페이지번호*/
			urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과 수*/
			urlBuilder.append("&" + URLEncoder.encode("type","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*오픈API 리턴 타입을 JSON으로 받고 싶을 경우 'json' 으로 지정함*/
//			if(!(sBjdCode == null || sBjdCode.isBlank())) {
			if(!(sBjdCode == null )) {				
				urlBuilder.append("&" + URLEncoder.encode("BJD_CDE","UTF-8") + "=" + URLEncoder.encode(sBjdCode, "UTF-8")); 
			}
			
			//공통 처리부분 분리 getPublicData
			Map<String, Object> map = getPublicData(urlBuilder.toString(), houseEmpDataSearchVO);
			int totCnt = Integer.parseInt(map.get("totCnt").toString());
			paginationInfo.setTotalRecordCount(totCnt);
			model.addAttribute("list",map.get("list"));
			model.addAttribute("cityList",CodeCacheService.getCityMap());
			model.addAttribute("houseEmpDataSearchVO", houseEmpDataSearchVO);
			model.addAttribute("paginationInfo", paginationInfo);
	        
	        return "omcst/pdata/houseEmpData";
		}
		
		/**
		 * @param url
		 * @return map
		 * @throws Exception
		 * 공공데이터 정보를 가지고옴
		 */
		public Map<String, Object> getPublicData(String path,DataSearchVO vo) throws Exception{
	        
			JSONObject obj = dataUtils.getPublicJSonData(path);
			JSONObject responseResult = (JSONObject)obj.get("response");
			JSONObject headerResult = (JSONObject)responseResult.get("header");
			String resultCode = (String) headerResult.get("resultCode");
			
			List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
			int totCnt = 0;  //페이징 처리를 위한 총게시물 갯수를 가지고옴
			
			if(resultCode.equals("00")) {
				JSONObject bodyResult = (JSONObject)responseResult.get("body");
				JSONObject itemsResult = (JSONObject)bodyResult.get("items");
				JSONArray itemResult = (JSONArray)itemsResult.get("item"); //jsonObject to jsonArray 형식으로 형변환
				
				// 기간조건필터링 
		        int fromYear = Integer.parseInt(vo.getSttsYearFrom());
		        int toYear = Integer.parseInt(vo.getSttsYearTo());
		        
		        list = JsonUtil.getListMapFromJsonArray(itemResult).stream()
							.filter(m -> (int)m.get("STTS_YEAR") >= fromYear && toYear >= (int)m.get("STTS_YEAR"))
							.collect(Collectors.toList());
		        totCnt = list.size(); 
		       
			}
			
	        Map<String, Object> map = new HashMap<String, Object>();
	        map.put("list", list);
	        map.put("totCnt", totCnt);
           
			return map;
		}

}
