package egovframework.omcst.manage.users.service;
import java.util.List;
import java.util.Map;

import egovframework.let.uss.umt.service.UserDefaultVO;
import egovframework.let.uss.umt.service.UserManageVO;
import egovframework.omcst.attendance.vo.AttendanceVO;
import egovframework.omcst.manage.users.vo.AtnVO;

public interface UserMngService {
	
	public List<?> selectUserList(UserDefaultVO userSearchVO) throws Exception;
	
	public int selectUserListTotCnt(UserDefaultVO userSearchVO) throws Exception;
	
	public List<?> selectAtnList(AttendanceVO antVo) throws Exception;
	
	public int selectAtnListTotCnt(AttendanceVO antVo) throws Exception;

    public int updateUncheckLat(String latList) throws Exception;
	
	public int idCheck(String checkId) throws Exception;
	
	public int authCheck(String checkId) throws Exception;
	
	public void insertUser(UserManageVO userManageVO) throws Exception;
	
	public UserManageVO selectUser(String uniqId) throws Exception;
	
	public UserManageVO selectPassword(UserManageVO passVO) throws Exception;
	
	public void updatePassword(UserManageVO userManageVO) throws Exception;
	
	public void insertUserHistory(UserManageVO userManageVO) throws Exception;
	
	public void updateUser(UserManageVO userManageVO) throws Exception;
	
	public void updateTopUser(UserManageVO userManageVO) throws Exception;
	
	public void deleteUser(String checkedIdForDel) throws Exception;
	
	public int updateGridList(Map updateGridListMap) throws Exception;
	
//	public void deleteUserTmp(String checkedIdForDel,String checkedAbIdForDel) throws Exception;
}
