package egovframework.omcst.manage.users.service.impl;

import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.EgovAbstractMapper;
import org.springframework.stereotype.Repository;

import egovframework.let.uss.umt.service.UserDefaultVO;
import egovframework.let.uss.umt.service.UserManageVO;
import egovframework.omcst.attendance.vo.AttendanceVO;
import egovframework.omcst.manage.users.vo.AtnVO;

@Repository("userMngDAO")
public class UserMngDAO extends EgovAbstractMapper{
	
	public List<?> selectUserList(UserDefaultVO userSearchVO){
		return selectList("userMngDAO.selectUserList_S", userSearchVO);
    }
	
	public int selectUserListTotCnt(UserDefaultVO userSearchVO) {
		return (Integer)selectOne("userMngDAO.selectUserListTotCnt_S", userSearchVO);
	}

	public int updateUncheckLat(String latList) {
		return update("userMngDAO.updatelatList",latList);
	}
	
	public List<?> selectAtnList(AttendanceVO atnVO){
		return selectList("userMngDAO.selectAntList_S", atnVO);
    }
	
	public int selectAntListTotCnt(AttendanceVO atnVO) {
		return (Integer)selectOne("userMngDAO.selectAntListTotCnt_S", atnVO);
	}
	 
	public int idCheck(String checkId) {
		return (Integer)selectOne("userMngDAO.idCheck_S", checkId);
	}
	
	public int authCheck(String checkId) {
		return (Integer)selectOne("userMngDAO.authCheck_S", checkId);
	}
	
	public void insertUser(UserManageVO userManageVO){
		insert("userMngDAO.insertUser_S", userManageVO);
	}
	
	public void insertMemberVacation(UserManageVO userManageVO) {
		insert("userMngDAO.insertMemberVacation", userManageVO);
	}
	 
	public UserManageVO selectUser(String uniqId) {
		return (UserManageVO) selectOne("userMngDAO.selectUser_S", uniqId);
	}
	 
	public UserManageVO selectPassword(UserManageVO userManageVO){
		return (UserManageVO) selectOne("userMngDAO.selectPassword_S", userManageVO);
	}
	 
	public void updatePassword(UserManageVO passVO) {
		update("userMngDAO.updatePassword_S", passVO);
	}
	 
	public void insertUserHistory(UserManageVO userManageVO){
		insert("userMngDAO.insertUserHistory_S", userManageVO);
	}
	 
	public void updateUser(UserManageVO userManageVO){
		update("userMngDAO.updateUser_S",userManageVO);
	}

	public void updateTopUser(UserManageVO userManageVO){
		update("userMngDAO.updateTopUser_S",userManageVO);
	}

	public void deleteUser(String delId){
		delete("userMngDAO.deleteUser_S", delId);
	}
	
	public void deleteMemberVacation(String delId) {
		delete("userMngDAO.deleteMemberVacation", delId);
	}

//	public void deleteUserAbsnce(String delId){
//		delete("userMngDAO.deleteUserAbsnce", delId);
//	}
	public int updateGridList(Map updateGridListMap){
		return update("userMngDAO.updateGridList_S",updateGridListMap);
	}
	

	
	public int emailCheck(String email) {
		return (Integer)selectOne("userMngDAO.emailCheck", email);
	}
	
}
