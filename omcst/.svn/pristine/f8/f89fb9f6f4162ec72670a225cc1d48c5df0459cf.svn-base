package egovframework.let.uat.uia.service;

import java.util.List;
import java.util.Map;

import egovframework.com.cmm.LoginVO;

/**
 * 일반 로그인, 인증서 로그인을 처리하는 비즈니스 인터페이스 클래스
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
public interface EgovLoginService {
	
	/**
	 * 일반 로그인을 처리한다
	 * @param vo LoginVO
	 * @return LoginVO
	 * @exception Exception
	 */
    LoginVO actionLogin(LoginVO vo) throws Exception;
    
    /**
	 * 아이디를 찾는다.
	 * @param vo LoginVO
	 * @return LoginVO
	 * @exception Exception
	 */
    LoginVO searchId(LoginVO vo) throws Exception;
    
    /**
	 * 비밀번호를 찾는다.
	 * @param vo LoginVO
	 * @return boolean
	 * @exception Exception
	 */
    boolean searchPassword(LoginVO vo) throws Exception;

    /**
	 * 사용자 아이디를 조회한다.
	 * @param vo
	 * @exception Exception
	 */
    public List<Map<String,Object>> selectEgovFindId(Map<String,Object> vo) throws Exception;

    /**
	 * 사용자 아이디 정보를 조회한다.
	 * @param vo
	 * @exception Exception
	 */
    public List<Map<String,Object>> selectEgovFindPwd(Map<String,Object> vo) throws Exception;

    /**
	 * 변경 대상 아이디의 비밀번호를 초기화한다.
	 * @param vo
	 * @exception Exception
	 */
    public int updateEgovFindPwd(Map<String,Object> vo) throws Exception;

    /**
	 * 사용자 인증  패스워드 조회
	 * @param vo
	 * @exception Exception
	 */
   public List<Map<String,Object>> selectPwd(Map<String,Object> vo) throws Exception;

    
}
