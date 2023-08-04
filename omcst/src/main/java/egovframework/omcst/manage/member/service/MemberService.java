package egovframework.omcst.manage.member.service;
import org.springframework.validation.BindingResult;

import egovframework.omcst.manage.member.vo.MemberVO;

public interface MemberService {

	void insertMember(MemberVO memberVO, BindingResult bindingResult) throws Exception;

	void duplicatedId(String mberId);
	
	void duplicatedEmail(String email);

}
