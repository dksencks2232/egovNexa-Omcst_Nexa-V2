package egovframework.omcst.pdata;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Iterator;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class DataUtils {
	public JSONObject getPublicJSonData(String path) throws Exception{
		
		URL url = new URL(path);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        // System.out.println("Response code: " + conn.getResponseCode());
        
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
        // System.out.println(sb.toString());
        
        String result = sb.toString();
        
        JSONParser parser = new JSONParser(); 					//문자열 형태의 JSON을 파싱하기 위한 JSONParser 객체 생성.
        JSONObject jsonObj = (JSONObject)parser.parse(result);  //문자열을 JSON 형태로 JSONObject 객체에 저장.
		
		return jsonObj;
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
	
	public StringBuilder getDataApi(DataSearchVO vo) {
		StringBuilder urlBuilder = new StringBuilder(vo.getApiUrl()); /*URL*/
		String GET_FORM_FIRST = "?{KEY}={VALUE}";
		String GET_FORM = "&{KEY}={VALUE}";
		String POST_FORM = "/{KEY}={VALUE}";
		String sUrl = "";
		
		switch(vo.getCallType()) {
	        case "GET":
	    		boolean isFirst = true;
	    		for (String key : vo.getParams().keySet()) {
	            	sUrl = isFirst ? GET_FORM_FIRST : GET_FORM;
	            	if(isFirst) { isFirst = false; }
	            	sUrl = sUrl.replace("{KEY}", key);
	            	sUrl = sUrl.replace("{VALUE}", vo.getParams().get(key));
	                urlBuilder.append(sUrl);	    			  
	    		}	    		
	        	break;
	        	
	        case "POST":
	    		for (String key : vo.getParams().keySet()) {
	    			sUrl = POST_FORM;
	    			sUrl = sUrl.replace("{KEY}", key);
	            	sUrl = sUrl.replace("{VALUE}", vo.getParams().get(key));
	                urlBuilder.append(sUrl);	    			  
	    		}	    		
	        	break;
	        
	        default:
	        	urlBuilder = null;
	        	break;
        }
        

		System.out.println("URL:: " + urlBuilder);
		return urlBuilder;
	}
	

}
