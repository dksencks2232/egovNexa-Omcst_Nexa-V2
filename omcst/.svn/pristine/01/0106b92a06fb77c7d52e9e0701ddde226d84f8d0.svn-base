package egovframework.omcst.attendance.service.dao;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractMapper;
import org.springframework.stereotype.Repository;

import egovframework.com.cmm.LoginVO;
import egovframework.omcst.attendance.vo.AttendanceVO;

@Repository("attendanceDAO")
public class AttendanceDAO extends EgovAbstractMapper {
	
	public String searchEsntlId (String loginId) {		
		return selectOne("attendanceDAO.searchEsntlId",loginId);				
	}
	
	public String serachAttId (AttendanceVO attendanceVO) {
		return selectOne("attendanceDAO.searchAttId",attendanceVO);
	}
	
	public List<AttendanceVO> searchAttInfo (String estnlId) {		
		return selectList("attendanceDAO.searchAttInfo",estnlId);				
	}
	
	public int attendanceCheck(AttendanceVO attendanceVO) {
		return insert("attendanceDAO.attendanceCheck", attendanceVO);
	}
	
	public int attendanceCheck2(AttendanceVO attendanceVO) {
		return update("attendanceDAO.attendanceCheck2", attendanceVO);
	}
	
}
