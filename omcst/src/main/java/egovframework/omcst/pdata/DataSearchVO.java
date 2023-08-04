package egovframework.omcst.pdata;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Map;

import egovframework.let.uss.umt.service.UserDefaultVO;

public class DataSearchVO extends UserDefaultVO	{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	LocalDate dt = LocalDate.now();
	
	private String searchBgnde;
	private String code;
	private String apiUrl;
	private Map<String,String> params;
	private String callType;
	private String bjdCode;
	private String searchEndde;
	private String sttsYearFrom = ( dt.getYear() - 5 )+"";
	private String sttsYearTo = dt.getYear()+"";
	private String viewType = "TABLE"; //TABLE,CHART
	
	public String getSearchBgnde() {
		return searchBgnde;
	}

	public void setSearchBgnde(String searchBgnde) {
		this.searchBgnde = searchBgnde;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getApiUrl() {
		return apiUrl;
	}

	public void setApiUrl(String apiUrl) {
		this.apiUrl = apiUrl;
	}

	public Map<String, String> getParams() {
		return params;
	}

	public void setParams(Map<String, String> params) {
		this.params = params;
	}

	public String getCallType() {
		return callType;
	}

	public void setCallType(String callType) {
		this.callType = callType;
	}

	public String getBjdCode() {
		return bjdCode;
	}

	public void setBjdCode(String bjdCode) {
		this.bjdCode = bjdCode;
	}

	public String getSearchEndde() {
		return searchEndde;
	}

	public void setSearchEndde(String searchEndde) {
		this.searchEndde = searchEndde;
	}

	public String getSttsYearFrom() {
		return sttsYearFrom;
	}

	public void setSttsYearFrom(String sttsYearFrom) {
		this.sttsYearFrom = sttsYearFrom;
	}

	public String getSttsYearTo() {
		return sttsYearTo;
	}

	public void setSttsYearTo(String sttsYearTo) {
		this.sttsYearTo = sttsYearTo;
	}

	public String getViewType() {
		return viewType;
	}

	public void setViewType(String viewType) {
		this.viewType = viewType;
	}
	
}
