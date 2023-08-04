package egovframework.omcst.pdata;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import egovframework.let.utl.fcc.service.JsonUtil;
import egovframework.let.utl.fcc.service.PageInfoUtil;

import org.json.simple.parser.JSONParser;
import org.json.simple.JSONObject;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.json.simple.JSONArray;

/**
 * @author csh
 * 20230308
 * 공공데이터포털 open api를 이용한 데이터 처리 컨트롤러
 */
@Controller
public class PublicDataContoller {
	@Value("${Public.serviceKey}") //globals.properties 파일에서 Public.serviceKey의 값을 가지고 옴
	String serviceKey; //공공데이터포털 서비스키 
	
	@Autowired
	private PageInfoUtil pageInfoUtil;
	
		/**
		 * @param bidSearchVO
		 * @param model
		 * @return omcst/pdata/BidData
		 * @throws Exception
		 * 공공입찰데이터
		 */
		@GetMapping("/bidDataApi")
		public String callBidApi(@ModelAttribute("bidSearchVO") DataSearchVO bidSearchVO, ModelMap model, HttpServletRequest request) throws Exception {
			
			// 메인화면에서 넘어온 경우 메뉴 갱신을 위해 추가
			request.getSession().setAttribute("baseMenuNo", "8000000");
			
			//csh 페이징 모듈화
			PaginationInfo paginationInfo= (PaginationInfo) pageInfoUtil.makePaginationInfo(bidSearchVO);
			bidSearchVO = (DataSearchVO) pageInfoUtil.makeObjectVO(paginationInfo, bidSearchVO);
			
			int index = paginationInfo.getCurrentPageNo();
			
			String bidNtceBgnDt;
			
			//입찰데이터는 1개월씩 검색 되기 때문에 공고일시 지정 null일경우에는 현재 달로 지정
			if(bidSearchVO.getSearchBgnde() != null ) {
				bidNtceBgnDt = bidSearchVO.getSearchBgnde();
				bidNtceBgnDt = bidNtceBgnDt.replaceAll("[^0-9]", "");
			}else {
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMM");
		        Calendar c1 = Calendar.getInstance();
		        bidNtceBgnDt = sdf.format(c1.getTime());
		        bidSearchVO.setSearchBgnde(bidNtceBgnDt);
			}
			
			bidNtceBgnDt +="01";
			
			//월 마지막날 가져옴
			String bidNtceEndDt = getLastDateOfMonth(bidNtceBgnDt);
			//월 처음날 시간 입력hhmm
			bidNtceBgnDt += "0000";
			
			
			StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1230000/PubDataOpnStdService/getDataSetOpnStdBidPblancInfo"); /*URL*/
			urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=" + serviceKey); /*Service Key*/
			urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + index); /*페이지번호*/
			urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과 수*/
			urlBuilder.append("&" + URLEncoder.encode("type","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*오픈API 리턴 타입을 JSON으로 받고 싶을 경우 'json' 으로 지정함*/
			urlBuilder.append("&" + URLEncoder.encode("bidNtceBgnDt","UTF-8") + "=" + URLEncoder.encode(bidNtceBgnDt, "UTF-8")); /*검색하고자하는 입찰공고일시범위 시작 'YYYYMMDDHHMM' (입찰공고일시 범위는 1개월 로 제한)*/
			urlBuilder.append("&" + URLEncoder.encode("bidNtceEndDt","UTF-8") + "=" + URLEncoder.encode(bidNtceEndDt, "UTF-8")); /*검색하고자하는 입찰공고일시범위 종료 'YYYYMMDDHHMM' (입찰공고일시 범위는 1개월 로 제한)*/
			
			//공통 처리부분 분리 getPublicData
			Map<String, Object> map = getPublicData(urlBuilder.toString());
			
			int totCnt = Integer.parseInt(map.get("totCnt").toString());
			paginationInfo.setTotalRecordCount(totCnt);
			
			model.addAttribute("list",map.get("list"));
			model.addAttribute("bidSearchVO", bidSearchVO);
			model.addAttribute("paginationInfo", paginationInfo);
			
	        return "omcst/pdata/BidData";
	    }
		
		/**
		 * @param prvtCntrctSearchVO
		 * @param model
		 * @return omcst/pdata/PrvtCntrctData
		 * @throws Exception
		 *  민간계약정보
		 */
		@GetMapping("/prvtCntrctDataApi")
		public String callPrvtCntrctApi(@ModelAttribute("prvtCntrctSearchVO") DataSearchVO prvtCntrctSearchVO, ModelMap model, HttpServletRequest request)throws Exception{
			
			// 메인화면에서 넘어온 경우 메뉴 갱신을 위해 추가
			request.getSession().setAttribute("baseMenuNo", "8000000");
			
			//csh 페이징 모듈화
			PaginationInfo paginationInfo= (PaginationInfo) pageInfoUtil.makePaginationInfo(prvtCntrctSearchVO);
			prvtCntrctSearchVO = (DataSearchVO) pageInfoUtil.makeObjectVO(paginationInfo, prvtCntrctSearchVO);
			
			int index = paginationInfo.getCurrentPageNo();
			
			String inqryBgnDt;
			
			//계약데이터는 1개월씩 검색  null일경우에는 현재 달로 지정
			if(prvtCntrctSearchVO.getSearchBgnde() != null ) {
				inqryBgnDt = prvtCntrctSearchVO.getSearchBgnde();
				inqryBgnDt = inqryBgnDt.replaceAll("[^0-9]", "");
			}else {
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMM");
		        Calendar c1 = Calendar.getInstance();
		        inqryBgnDt = sdf.format(c1.getTime());
		        prvtCntrctSearchVO.setSearchBgnde(inqryBgnDt);		       
			}
			
			inqryBgnDt += "01";
			 
			//월 마지막날 가져옴
			String inqryEndDt = getLastDateOfMonth(inqryBgnDt);
			//월 처음날 시간 입력hhmm
			inqryBgnDt += "0000";
			
//			System.out.println("##############inqryBgnDt "+inqryBgnDt);
//			System.out.println("##############inqryEndDt "+inqryEndDt);
			
			StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1230000/PrvtCntrctInfoService/getPrvtCntrctInfoList"); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "="+ serviceKey); /*Service Key*/
	        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + index ); /*페이지번호*/
	        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과 수*/
	        urlBuilder.append("&" + URLEncoder.encode("type","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*오픈API 리턴 타입을 JSON으로 받고 싶을 경우 'json' 으로 지정*/
	        urlBuilder.append("&" + URLEncoder.encode("inqryDiv","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*검색하고자하는 조회구분 1:등록일시, 2:통합계약번호*/
	        urlBuilder.append("&" + URLEncoder.encode("inqryBgnDt","UTF-8") + "=" + URLEncoder.encode(inqryBgnDt, "UTF-8")); /*검색하고자하는 등록일시 범위 시작 'YYYYMMDDHHMM' 조회구분이 1인 경우 필수*/
	        urlBuilder.append("&" + URLEncoder.encode("inqryEndDt","UTF-8") + "=" + URLEncoder.encode(inqryEndDt, "UTF-8")); /*검색하고자하는 등록일시범위 종료 'YYYYMMDDHHMM' 조회구분이 1인 경우 필수*/
	     // urlBuilder.append("&" + URLEncoder.encode("untyCntrctNo","UTF-8") + "=" + URLEncoder.encode("2016050000077", "UTF-8")); /*검색하고자하는 통합계약번호 조회구분이 2인 경우 필수*/
	        
	      //공통 처리부분 분리 getPublicData
			Map<String, Object> map = getPublicData(urlBuilder.toString());
	        
			int totCnt = Integer.parseInt(map.get("totCnt").toString());
			paginationInfo.setTotalRecordCount(totCnt);
			
			model.addAttribute("list",map.get("list"));
			model.addAttribute("prvtCntrctSearchVO", prvtCntrctSearchVO);
			model.addAttribute("paginationInfo", paginationInfo);
	        
	        return "omcst/pdata/PrvtCntrctData";
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
	        System.out.println(sb.toString());
	        
	        String result = sb.toString();
	        
	        //문자열 형태의 JSON을 파싱하기 위한 JSONParser 객체 생성.
	        JSONParser parser = new JSONParser();
	        //문자열을 JSON 형태로 JSONObject 객체에 저장.
			JSONObject obj = (JSONObject)parser.parse(result);
			JSONObject responseResult = (JSONObject)obj.get("response");
			JSONObject bodyResult = (JSONObject)responseResult.get("body");
			
			//jsonObject to jsonArray 형식으로 형변환
			JSONArray itemsResult = (JSONArray)bodyResult.get("items");
			
			//페이징 처리를 위한 총게시물 갯수를 가지고옴
			int totCnt = Integer.parseInt(bodyResult.get("totalCount").toString());
			
			//jsonArray to list<map> 형식으로 형변환
	        List<Map<String, Object>> list = JsonUtil.getListMapFromJsonArray(itemsResult);
	        
	        Map<String, Object> map = new HashMap<String, Object>();
	        
	        map.put("list", list);
	        map.put("totCnt", totCnt);
           
			return map;
		}
		
		/**
		 * @param yyyyMMdd
		 * @return
		 * 월 마지막날 가져오기
		 */
		public String getLastDateOfMonth(String yyyyMMdd) {	
			String year = yyyyMMdd.substring(0,4);
			String month = yyyyMMdd.substring(4,6);
			
			Calendar cal = Calendar.getInstance();
			cal.set(Integer.parseInt(year),Integer.parseInt(month)-1,1);
			
			String lastDay = year+month+Integer.toString(cal.getActualMaximum(Calendar.DAY_OF_MONTH));
			
			//마지막날 시간입력hhmm
			lastDay += "2359";
			
			return lastDay;
		}
	
}
