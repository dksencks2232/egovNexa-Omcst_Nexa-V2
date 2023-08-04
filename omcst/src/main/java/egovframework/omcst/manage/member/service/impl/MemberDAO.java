package egovframework.omcst.manage.member.service.impl;

import org.egovframe.rte.psl.dataaccess.EgovAbstractMapper;
import org.springframework.stereotype.Repository;

import egovframework.omcst.manage.member.vo.MemberVO;

@Repository("memberDAO")
public class MemberDAO extends EgovAbstractMapper{

	public void insertMember(MemberVO memberVO) {
		insert("memberDAO.insertMember", memberVO);
	}
}
