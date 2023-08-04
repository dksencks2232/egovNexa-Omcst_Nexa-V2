package egovframework.omcst.manage.users.service.impl;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.egovframe.rte.fdl.idgnr.EgovIdGnrService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import egovframework.let.utl.sim.service.EgovFileScrty;
import egovframework.omcst.common.DefaultException;
import egovframework.omcst.common.vo.ResultVO;
import egovframework.omcst.common.web.DefaultValidation;
import egovframework.omcst.manage.member.service.MemberService;
import egovframework.omcst.manage.member.service.impl.MemberDAO;
import egovframework.omcst.manage.member.vo.MemberVO;
import egovframework.omcst.manage.users.exception.DuplicatedEmailException;
import egovframework.omcst.manage.users.exception.DuplicatedIdException;
import egovframework.omcst.manage.users.exception.UnmatchedPasswordException;

@Service("memberService")
public class MemberServiceImpl extends EgovAbstractServiceImpl implements MemberService{
	@Resource(name="memberDAO")
	private MemberDAO memberDAO;
	
	@Resource(name="userMngDAO")
	private UserMngDAO userMngDAO;
	
	@Resource(name="egovUsrCnfrmIdGnrService")
	private EgovIdGnrService idgenService;
	
	@Autowired
	private DefaultValidation defaultValidation;

	@Override
	public void insertMember(MemberVO memberVO, BindingResult bindingResult) throws Exception {
		ResultVO result = new ResultVO();
		if(!defaultValidation.checkDefaultValidation(memberVO, bindingResult,result)) { 
			throw new DefaultException(result.getMessage());
		}
		
		if(!validateDuplicatedId(memberVO.getMberId())) {
			throw new DuplicatedIdException();
		}
		
		if(!validatePasswordMatch(memberVO.getPassword(),memberVO.getRePassword())) {
			throw new UnmatchedPasswordException();
		}		

		// 회원가입
		memberVO.setEsntlId(idgenService.getNextStringId());
		memberVO.setPassword(EgovFileScrty.encryptPassword(memberVO.getPassword(), memberVO.getMberId()));
		memberDAO.insertMember(memberVO);
	}
	
	public boolean validateDuplicatedId(String mberId) {
		if(userMngDAO.idCheck(mberId) > 0) { return false; }
		return true;
	}
	
	public boolean validatePasswordMatch(String password, String rePassword) {
		if(!password.equals(rePassword)) { return false; }
		return true;
	}
	
	public boolean validateDuplicatedEmail(String email) {
		if(userMngDAO.emailCheck(email) > 0) { return false; }
		return true;
	}
	
	@Override
	public void duplicatedEmail(String email) {
		if(!validateDuplicatedEmail(email)) {
			throw new DuplicatedEmailException();
		}
	}

	@Override
	public void duplicatedId(String mberId) {
		if(!validateDuplicatedId(mberId)) {
			throw new DuplicatedIdException();
		}
	}
}
