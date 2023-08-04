package egovframework.omcst.attendance.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import egovframework.omcst.attendance.service.AttendanceService;
import egovframework.omcst.attendance.service.dao.AttendanceDAO;
import egovframework.omcst.attendance.vo.AttendanceVO;

@Service("attendanceService")
public class AttendanceServiceImpl extends EgovAbstractServiceImpl implements AttendanceService {

	@Resource(name="attendanceDAO")
	private AttendanceDAO attendacneDAO;
	
	@Override
	public String searchEstnlId(String loginId) throws Exception {
		return attendacneDAO.searchEsntlId(loginId);
	}
	
	@Override
	public String searchAttId(AttendanceVO attendanceVO) throws Exception {		
		return attendacneDAO.serachAttId(attendanceVO);
	}	
	
	@Override
	public List<AttendanceVO> searchAttInfo(String esntlId) throws Exception {
	    List<AttendanceVO> result = attendacneDAO.searchAttInfo(esntlId);
	    if (result.isEmpty()) {
	        result = new ArrayList<AttendanceVO>();
	    }
	    return result;
	}
	
	@Override
	public int attendanceCheck(AttendanceVO attendanceVO) throws Exception {		
		return attendacneDAO.attendanceCheck(attendanceVO);
	}
	
	@Override
	public int attendanceCheck2(AttendanceVO attendanceVO) throws Exception {
		return attendacneDAO.attendanceCheck2(attendanceVO);
	}
	
}
