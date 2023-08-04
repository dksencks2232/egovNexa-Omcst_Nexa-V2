package egovframework.let.uat.uia.service.impl;

import egovframework.com.cmm.LoginVO;

import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.EgovAbstractMapper;

import org.springframework.stereotype.Repository;

/**
 * 일반 로그인, 인증서 로그인을 처리하는 DAO 클래스
 * @author 공통서비스 개발팀 박지욱
 * @since 2009.03.06
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자          수정내용
 *  -------    --------    ---------------------------
 *  2009.03.06  박지욱          최초 생성
 *  2011.08.31  JJY            경량환경 템플릿 커스터마이징버전 생성
 *
 *  </pre>
 */
@Repository("loginDAO")
public class LoginDAO extends EgovAbstractMapper {

	/**
	 * 일반 로그인을 처리한다
	 * @param vo LoginVO
	 * @return LoginVO
	 * @exception Exception
	 */
    public LoginVO actionLogin(LoginVO vo) throws Exception {
    	return (LoginVO)selectOne("loginDAO.actionLogin", vo);
    }

	/**
	 * 최종 접속시간을 구함
	 * @param String
	 * @return Date
	 * @exception Exception
	 */
    public String connectTime(String enstlId) throws Exception{
    	return selectOne("connectTime", enstlId);
    }
    
    /**
	 * 아이디를 찾는다.
	 * @param vo LoginVO
	 * @return LoginVO
	 * @exception Exception
	 */
    public LoginVO searchId(LoginVO vo) throws Exception {

    	return (LoginVO)selectOne("loginDAO.searchId", vo);
    }

    /**
	 * 비밀번호를 찾는다.
	 * @param vo LoginVO
	 * @return LoginVO
	 * @exception Exception
	 */
    public LoginVO searchPassword(LoginVO vo) throws Exception {

    	return (LoginVO)selectOne("loginDAO.searchPassword", vo);
    }

    /**
	 * 변경된 비밀번호를 저장한다.
	 * @param vo LoginVO
	 * @exception Exception
	 */
    public void updatePassword(LoginVO vo) throws Exception {
    	update("loginDAO.updatePassword", vo);
    }

    /**
	 * 사용자 아이디를 조회한다.
	 * @param vo
	 * @exception Exception
	 */
    public List<Map<String,Object>> selectEgovFindId(Map<String, Object> vo) throws Exception {
    	return selectList("loginDAO.selectEgovFindId", vo);
    }
    
    /**
	 * 사용자 아이디 정보를 조회한다.
	 * @param vo
	 * @exception Exception
	 */
    public List<Map<String,Object>> selectEgovFindPwd(Map<String, Object> vo) throws Exception {
    	return selectList("loginDAO.selectEgovFindPwd", vo);
    }

    /**
	 * 변경 대상 아이디의 비밀번호를 초기화한다.
	 * @param vo
	 * @exception Exception
	 */
    public int updateEgovFindPwd(Map<String,Object> vo) throws Exception {
    	return update("loginDAO.updateEgovFindPwd", vo);
    }

    /**
	 * 변경 대상 아이디의 비밀번호를 초기화한다.
	 * @param vo
	 * @exception Exception
	 */
    public List<Map<String,Object>> selectPwd(Map<String,Object> vo) throws Exception {
    	return selectList("loginDAO.selectPwd", vo);
    }

    
}
