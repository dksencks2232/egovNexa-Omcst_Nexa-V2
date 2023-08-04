package egovframework.omcst.business.project.service;

import egovframework.com.cmm.ComDefaultVO;

public class ProjectVO extends ComDefaultVO{
	
	private static final long serialVersionUID = -6062858939907510631L;
	
	private int projectNo;
	/*
	 * 프로젝트 번호
	 * */
	
	private int clientNo;
	/*
	 * 고객번호
	 * */
	
	private String clientNm;
	/*
	 * 고객명
	 * */
	
	private String clientSideDepartment;
	/*
	 * 고객측 담당부서
	 * */
	
	private int departmentNo;
	/*
	 * 부서 번호
	 * */
	
	private String clientSideManager;
	/*
	 * 고객측 담당자명
	 * */
	
	private String projectNm;
	/*
	 * 프로젝트 이름
	 * */
	
	private String projectBegineDate;
	/*
	 * 프로젝트 시작일
	 * */
	
	private String projectEndDate;
	/*
	 * 프로젝트 종료일
	 * */
	
	private String projectLeader;
	/*
	 * 프로젝트 담당자명
	 * */
	
	private int projectStaffCnt;
	/*
	 * 프로젝트 인원
	 * */
	
	private String projectStatus;
	/*
	 * 프로젝트 상태
	 * */
	
	private int parentClientNo;
	/*
	 * 상위 고객 번호
	 * */
	
	private String projectDecription;
	/*
	 * 프로젝트 설명
	 * */
	
	public int getProjectNo() {
		return projectNo;
	}
	public void setProjectNo(int projectNo) {
		this.projectNo = projectNo;
	}
	public int getClientNo() {
		return clientNo;
	}
	public void setClientNo(int clientNo) {
		this.clientNo = clientNo;
	}
	public String getClientNm() {
		return clientNm;
	}
	public void setClientNm(String clientNm) {
		this.clientNm = clientNm;
	}
	public String getClientSideDepartment() {
		return clientSideDepartment;
	}
	public void setClientSideDepartment(String clientSideDepartment) {
		this.clientSideDepartment = clientSideDepartment;
	}
	public int getDepartmentNo() {
		return departmentNo;
	}
	public void setDepartmentNo(int departmentNo) {
		this.departmentNo = departmentNo;
	}
	public String getClientSideManager() {
		return clientSideManager;
	}
	public void setClientSideManager(String clientSideManager) {
		this.clientSideManager = clientSideManager;
	}
	public String getProjectNm() {
		return projectNm;
	}
	public void setProjectNm(String projectNm) {
		this.projectNm = projectNm;
	}
	public String getProjectBegineDate() {
		return projectBegineDate;
	}
	public void setProjectBegineDate(String projectBegineDate) {
		this.projectBegineDate = projectBegineDate;
	}
	public String getProjectEndDate() {
		return projectEndDate;
	}
	public void setProjectEndDate(String projectEndDate) {
		this.projectEndDate = projectEndDate;
	}
	public String getProjectLeader() {
		return projectLeader;
	}
	public void setProjectLeader(String projectLeader) {
		this.projectLeader = projectLeader;
	}
	public int getprojectStaffCnt() {
		return projectStaffCnt;
	}
	public void setprojectStaffCnt(int projectStaffCnt) {
		this.projectStaffCnt = projectStaffCnt;
	}
	public String getProjectStatus() {
		return projectStatus;
	}
	public void setProjectStatus(String projectStatus) {
		this.projectStatus = projectStatus;
	}
	public int getParentClientNo() {
		return parentClientNo;
	}
	public void setParentClientNo(int parentClientNo) {
		this.parentClientNo = parentClientNo;
	}
	public String getProjectDecription() {
		return projectDecription;
	}
	public void setProjectDecription(String projectDecription) {
		this.projectDecription = projectDecription;
	}
	
	

}
