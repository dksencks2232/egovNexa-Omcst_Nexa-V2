package egovframework.omcst.attendance.service;

import java.util.List;

import egovframework.omcst.attendance.vo.AttendanceVO;

public interface AttendanceService {
	
	public String searchEstnlId(String loginId) throws Exception;
	
	public String searchAttId(AttendanceVO attendanceVO) throws Exception;
	
	public List<AttendanceVO> searchAttInfo(String esntlId) throws Exception;	
		
	public int attendanceCheck(AttendanceVO attendanceVO) throws Exception;
	
	public int attendanceCheck2(AttendanceVO attendanceVO) throws Exception;
	
	
}
