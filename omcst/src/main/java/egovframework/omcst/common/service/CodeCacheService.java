package egovframework.omcst.common.service;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import egovframework.let.utl.fcc.service.JsonUtil;
import egovframework.omcst.common.service.dao.CodeCacheDAO;
import egovframework.omcst.common.vo.CommonVO;
import egovframework.omcst.pdata.DataUtils;
	
/**
 *
 * 공통코드를 WAS 기동시 메모리에 캐싱하여 사용하도록 한다.
 * 
 * @author Hwang Sanggyu
 * @since 2019.06.12
 * @version 1.0
 * @see
 *
 *      <pre>
 * << 개정이력(Modification Information) >>
 * 
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2019.06.12  황상규          최초 생성
 *   2023.02.17 
 *
 * </pre>
 */
@Service("CodeCacheService")
public class CodeCacheService extends EgovAbstractServiceImpl {
	@Value("${Public.serviceKey}") //globals.properties 파일에서 Public.serviceKey의 값을 가지고 옴
	String serviceKey; //공공데이터포털 서비스키 
	
	@Resource(name="codeCacheDAO") 
	public CodeCacheDAO codeCacheDAO;

	private final Logger LOGGER = LoggerFactory.getLogger(this.getClass());
	private static List<CommonVO> code = new ArrayList<CommonVO>();	
	private static Map<String, String> cityMap = new TreeMap<String, String>();
	DataUtils dataUtils = new DataUtils();
	Gson gson = new Gson();
	
	/**
	 * 공통코드 메모리 등록
	 */
	@SuppressWarnings("unchecked")
	@PostConstruct
	public void resetCodeList() throws Exception {		
				
		if (code.isEmpty()) {
			synchronized (code) {
				if (code.isEmpty()) {		
					
					List<CommonVO> codeMapList;
					// 코드 그룹
					/*
					 * egovMapList = (ArrayList<EgovMap>)CodeCacheDAO.selectListCodeGroup(); //
					 * codeId, codeIdNm
					 * 
					 * codeGroup.clear(); codeGroup.addAll(egovMapList);
					 */
					
					// 상세코드
					codeMapList = (ArrayList<CommonVO>)codeCacheDAO.selectListCode();	// codeId, code, codeNm, codeDc
					code.clear();
					code.addAll(codeMapList);
					
				}				
			}			
		}	
	}
	
	public static void clear() throws Exception { 				
		//codeGroup.clear();
		code.clear();
	}
	
	/**
	 * @param String codeId 코드그룹 ID
	 * @return String 그룹코드명
	 */
	/*
	 * public static String getCodeGroupNm(String codeId) throws Exception { String
	 * returnVal = ""; Iterator<EgovMap> iterator = codeGroup.iterator(); while
	 * (iterator.hasNext()) { EgovMap egovMap = (EgovMap) iterator.next();
	 * if(codeId.equals((String)egovMap.get("codeId"))) { returnVal =
	 * (String)egovMap.get("codeIdNm"); break; } } return returnVal; }
	 */
	
	/**
	 * @param String codeId 코드그룹 ID
	 * @param String code 코드 
	 * @return String 상세코드명
	 */
	public static String getCodeNm(String codeId, String detailCode) throws Exception { 
		String returnVal = "";
		Iterator<CommonVO> iterator = code.iterator();
		while (iterator.hasNext()) {
			CommonVO codeMap = (CommonVO) iterator.next();
			if(codeId.equals((String)codeMap.getCodeId()) && detailCode.equals((String)codeMap.getCode()) ) {				
				returnVal = (String)codeMap.getCodeNm();
				break;
			}
		}
		return returnVal;
	}
	
	/** 
	 * @param String codeId 코드그룹 ID
	 * @return List<CommonVO> 코드그룹에 속한 상세 코드 List
	 */
	public static List<CommonVO> getCode(String codeId) throws Exception {		
		
		List<CommonVO> returnVal = new ArrayList<CommonVO>();
		
		Iterator<CommonVO> iterator = code.iterator();
		while (iterator.hasNext()) {
			CommonVO codeMap = (CommonVO) iterator.next();
			if(codeId.equals((String)codeMap.getCodeId())) {				
				returnVal.add(codeMap);
			}
		}
		return returnVal;
	}
	
	/** 
	 * @param 
	 * @return List<CommonVO> 상세 코드 List
	 */
	public static List<CommonVO> getCode() throws Exception { 		
		return code;
	}
	
	
	/**
	 * 공통코드 메모리 등록
	 */
	@SuppressWarnings("unchecked")
	@PostConstruct
	public void getCityCodeData() throws Exception {		
				
		if (cityMap.isEmpty()) {
			synchronized (cityMap) {
				if (cityMap.isEmpty()) {		
					
					// 법정동 코드 데이터 가져오기
					int index = 1;
					StringBuilder urlBuilder = new StringBuilder("https://api.odcloud.kr/api/15066113/v1/uddi:b72a7ab6-9c27-44ad-937e-93188c67c53d"); /*URL*/
					urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=" + serviceKey); /*Service Key*/
					urlBuilder.append("&" + URLEncoder.encode("page","UTF-8") + "=" + index); /*페이지번호*/
					urlBuilder.append("&" + URLEncoder.encode("perPage","UTF-8") + "=" + URLEncoder.encode("1000", "UTF-8")); /*한 페이지 결과 수*/
					urlBuilder.append("&" + URLEncoder.encode("returnType","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*오픈API 리턴 타입을 JSON으로 받고 싶을 경우 'json' 으로 지정함*/
						
					JSONObject obj = dataUtils.getPublicJSonData(urlBuilder.toString());
					JSONArray itemResult = (JSONArray)obj.get("data");
					List<Map<String, Object>> itemList = JsonUtil.getListMapFromJsonArray(itemResult);
					
					for(int i = 0; i < itemList.size(); i++) {
						Map<String,Object> tempData = itemList.get(i);
						cityMap.put( tempData.get("법정동코드").toString() , (tempData.get("법정동(시도)") + " " + tempData.get("법정동(시군구)")).toString() );
					}
				}				
			}			
		}	
	}	
	
	public static Map<String,String> getCityMap() throws Exception { 		
		return cityMap;
	}		
}