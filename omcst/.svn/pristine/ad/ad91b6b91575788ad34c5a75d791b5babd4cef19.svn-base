package egovframework.omcst.manage.users.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.idgnr.EgovIdGnrService;
import org.springframework.stereotype.Service;

import egovframework.let.uss.umt.service.UserDefaultVO;
import egovframework.let.uss.umt.service.UserManageVO;
import egovframework.let.utl.sim.service.EgovFileScrty;
import egovframework.omcst.manage.users.service.UserMngService;
import egovframework.omcst.manage.users.vo.AtnVO;
import egovframework.omcst.attendance.vo.AttendanceVO;
import egovframework.omcst.manage.absence.service.dao.UserAncDAO;

@Service("userMngService")
public class UserMngServiceImpl implements UserMngService{
	
	@Resource(name="userMngDAO")
	private UserMngDAO userMngDAO;

	@Resource(name="userAncDAO")
	private UserAncDAO userAncDAO;


	/** egovUsrCnfrmIdGnrService */
	@Resource(name="egovUsrCnfrmIdGnrService")
	private EgovIdGnrService idgenService;
	
	
	@Override
	public List<?> selectUserList(UserDefaultVO userSearchVO) throws Exception{
		List<?> result = userMngDAO.selectUserList(userSearchVO);
		return result;
	}
	
	@Override
	public int selectUserListTotCnt(UserDefaultVO userSearchVO) throws Exception{
		return userMngDAO.selectUserListTotCnt(userSearchVO);
	}

	@Override
	public List<?> selectAtnList(AttendanceVO atnVO) throws Exception{
		List<?> result = userMngDAO.selectAtnList(atnVO);
		return result;
	}
	
	@Override
	public int selectAtnListTotCnt(AttendanceVO atnVO) throws Exception{
		return userMngDAO.selectAntListTotCnt(atnVO);
	}
	
	@Override
	public int idCheck(String checkId) {
		return userMngDAO.idCheck(checkId);
	}

	@Override
	public int authCheck(String checkId) {
		return userMngDAO.authCheck(checkId);
	}

	
	@Override
	public void insertUser(UserManageVO userManageVO) throws Exception {
		//고유아이디 셋팅
		String uniqId = idgenService.getNextStringId();
		userManageVO.setUniqId(uniqId);
		//패스워드 암호화
		String pass = EgovFileScrty.encryptPassword(userManageVO.getPassword(), userManageVO.getEmplyrId());
		userManageVO.setPassword(pass);
		userMngDAO.insertUser(userManageVO);
		userMngDAO.insertMemberVacation(userManageVO);
	}
	
	@Override
	public int updateUncheckLat(String latList) throws Exception {
		return userMngDAO.updateUncheckLat(latList);
	}

	@Override
	public UserManageVO selectUser(String uniqId) {
		UserManageVO userManageVO = userMngDAO.selectUser(uniqId);
		return userManageVO;
	}
	
	@Override
	public UserManageVO selectPassword(UserManageVO passVO) {
		UserManageVO userManageVO = userMngDAO.selectPassword(passVO);
		return userManageVO;
	}
	
	@Override
	public void updatePassword(UserManageVO userManageVO) {
		userMngDAO.updatePassword(userManageVO);
	}
	
	@Override
	public void insertUserHistory(UserManageVO userManageVO) {
		userMngDAO.insertUserHistory(userManageVO);
	}

	@Override
	public void updateTopUser(UserManageVO userManageVO) throws Exception {
		//패스워드 암호화
//		String pass = EgovFileScrty.encryptPassword(userManageVO.getPassword(), userManageVO.getEmplyrId());
//		userManageVO.setPassword(pass);

		userMngDAO.updateTopUser(userManageVO);
	}

	@Override
	public void updateUser(UserManageVO userManageVO) throws Exception {
		//패스워드 암호화
		String pass = EgovFileScrty.encryptPassword(userManageVO.getPassword(), userManageVO.getEmplyrId());
		userManageVO.setPassword(pass);

		userMngDAO.updateUser(userManageVO);
	}
	
	@Override
	public void deleteUser(String checkedIdForDel) {
		String [] delId = checkedIdForDel.split(",");
		for (int i=0; i<delId.length ; i++){
			String [] id = delId[i].split(":");
			if (id[0].equals("USR03")){
		        //업무사용자(직원)삭제
				userMngDAO.deleteMemberVacation(id[1]);
				userMngDAO.deleteUser(id[1]);
			}else if(id[0].equals("USR01")){
				//일반회원삭제
				//EBT-CUSTOMIZING//mberManageDAO.deleteMber(id[1]);
			}else if(id[0].equals("USR02")){
				//기업회원삭제
				//EBT-CUSTOMIZING//entrprsManageDAO.deleteEntrprsmber(id[1]);
			}
		}
	}
	
	@Override
	public int updateGridList(Map updateGridListVo) {
		return userMngDAO.updateGridList(updateGridListVo);
	}
	
//	@Override
//	public void deleteUserTmp(String checkedIdForDel,String checkedAbIdForDel) {
//		String [] delId = checkedIdForDel.split(",");
//		String [] delAbId = checkedAbIdForDel.split(",");
//		for (int i=0; i<delId.length ; i++){
//			String [] id = delId[i].split(":");
//			if (id[0].equals("USR03")){
//		        //업무사용자(직원)삭제
//				userMngDAO.deleteUser(id[1]);
////				userMngDAO.deleteUserAbsnce(delAbId[i]);
//			}else if(id[0].equals("USR01")){
//				//일반회원삭제
//				//EBT-CUSTOMIZING//mberManageDAO.deleteMber(id[1]);
//			}else if(id[0].equals("USR02")){
//				//기업회원삭제
//				//EBT-CUSTOMIZING//entrprsManageDAO.deleteEntrprsmber(id[1]);
//			}
//		}
//	}

	
}
