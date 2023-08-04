package egovframework.let.uat.uia.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.support.WebApplicationContextUtils;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.let.uat.uap.service.EgovLoginPolicyService;
import egovframework.let.uat.uap.service.LoginPolicyVO;
import egovframework.let.uat.uia.service.EgovLoginService;
import egovframework.let.utl.sim.service.EgovClntInfo;
import egovframework.let.utl.sim.service.EgovFileScrty;

import org.egovframe.rte.fdl.cmmn.trace.LeaveaTrace;
import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.fdl.security.userdetails.util.EgovUserDetailsHelper;


/**
 * 일반 로그인, 인증서 로그인을 처리하는 컨트롤러 클래스
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
@Controller
public class EgovLoginController {

	/** EgovLoginService */
	@Resource(name = "loginService")
	private EgovLoginService loginService;

	/** EgovMessageSource */
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;

	/** EgovLoginPolicyService */
	@Resource(name = "egovLoginPolicyService")
	EgovLoginPolicyService egovLoginPolicyService;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/** TRACE */
	@Resource(name = "leaveaTrace")
	LeaveaTrace leaveaTrace;

	/**
	 * 로그인 화면으로 들어간다
	 * @param vo - 로그인후 이동할 URL이 담긴 LoginVO
	 * @return 로그인 페이지
	 * @exception Exception
	 */
	@RequestMapping(value = "/uat/uia/egovLoginUsr.do")
	public String loginUsrView(@ModelAttribute("loginVO") LoginVO loginVO, HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		return "uat/uia/EgovLoginUsr";
	}
	
	/**
	 * 인증 실패시 로그인 화면으로 이동
	 * 
	 */
	@RequestMapping(value = "/uat/uia/authFailed.do")
	public String authFailed(@ModelAttribute("loginVO") LoginVO loginVO, HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
		return "uat/uia/EgovLoginUsr";
	}

	/**
	 * 일반(스프링 시큐리티) 로그인을 처리한다
	 * @param vo - 아이디, 비밀번호가 담긴 LoginVO
	 * @param request - 세션처리를 위한 HttpServletRequest
	 * @return result - 로그인결과(세션정보)
	 * @exception Exception
	 */
	@RequestMapping(value = "/uat/uia/actionSecurityLogin.do")
	public String actionSecurityLogin(@ModelAttribute("loginVO") LoginVO loginVO, HttpServletResponse response, HttpServletRequest request, ModelMap model) throws Exception {

		// 접속IP
		String userIp = EgovClntInfo.getClntIP(request);
		
		// 1. 일반 로그인 처리
		LoginVO resultVO = loginService.actionLogin(loginVO);

		boolean loginPolicyYn = true;

		LoginPolicyVO loginPolicyVO = new LoginPolicyVO();
		loginPolicyVO.setEmplyrId(resultVO.getId());
		loginPolicyVO = egovLoginPolicyService.selectLoginPolicy(loginPolicyVO);

		if (loginPolicyVO == null) {
			loginPolicyYn = true;
		} else {
			if (loginPolicyVO.getLmttAt().equals("Y")) {
				if (!userIp.equals(loginPolicyVO.getIpInfo())) {
					loginPolicyYn = false;
				}
			}
		}
		if (resultVO != null && resultVO.getId() != null && !resultVO.getId().equals("") && loginPolicyYn) {

			// 2. spring security 연동
			request.getSession().setAttribute("LoginVO", resultVO);

			UsernamePasswordAuthenticationFilter springSecurity = null;

			ApplicationContext act = WebApplicationContextUtils.getRequiredWebApplicationContext(request.getSession().getServletContext());
						
			Map<String, UsernamePasswordAuthenticationFilter> beans = act.getBeansOfType(UsernamePasswordAuthenticationFilter.class);
			
			if (beans.size() > 0) {
				
				springSecurity = (UsernamePasswordAuthenticationFilter) beans.values().toArray()[0];
				springSecurity.setUsernameParameter("egov_security_username");
				springSecurity.setPasswordParameter("egov_security_password");
				springSecurity.setRequiresAuthenticationRequestMatcher(new AntPathRequestMatcher(request.getServletContext().getContextPath() +"/egov_security_login", "POST"));
				
			} else {
				throw new IllegalStateException("No AuthenticationProcessingFilter");
			}
			
			springSecurity.doFilter(new RequestWrapperForSecurity(request, resultVO.getUserSe()+ resultVO.getId(), resultVO.getUniqId()), response, null);
			
			return "forward:/cmm/main/mainPage.do"; // 성공 시 페이지.. (redirect 불가)

		} else {

			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "uat/uia/EgovLoginUsr";
		}
	}

	
	/**
	 * 로그인 후 메인화면으로 들어간다
	 * @param
	 * @return 로그인 페이지
	 * @exception Exception 
	 */
	@RequestMapping(value = "/uat/uia/actionMain.do")
	public String actionMain(HttpServletResponse response, HttpServletRequest request, ModelMap model) throws Exception {
				
		// 1. Spring Security 사용자권한 처리
//		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
//		if (!isAuthenticated) {
//			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
//			return "uat/uia/EgovLoginUsr";
//		}

		// 2. 메인 페이지 이동
		return "forward:/cmm/main/mainPage.do";
	}

	/**
	 * 로그아웃한다.
	 * @return String
	 * @exception Exception
	 */
	@RequestMapping(value = "/uat/uia/actionLogout.do")
	public String actionLogout(HttpServletRequest request, ModelMap model) throws Exception {
		request.getSession().setAttribute("LoginVO", null);
		
		return "redirect:/egov_security_logout";
	}
	
	/**
	 * 로그인 아이디 찾기 페이지 이동
	 *
	 * @param request
	 * @param model
	 * @return /uat/uia/EgovFindId
	 * @throws Exception
	 */
	@RequestMapping(value = "/uat/uia/EgovFindId.do")
	public String EgovFindId(HttpServletRequest request, ModelMap model) throws Exception {
		return "/uat/uia/EgovFindId";
	}

	/**
	 * 로그인 아이디 찾기 조회
	 *
	 * @param userNm
	 * @param areaNo
	 * @param homemiddleTelno
	 * @param homeendTelno
	 * @return rtnStr
	 * @throws Exception
	 */
	@RequestMapping(value = "/uat/uia/selectEgovFindId.do", method = RequestMethod.POST)
	@ResponseBody
	public String selectEgovFindId(String userNm,String areaNo,String homemiddleTelno,String homeendTelno ){

		Map<String,Object> vo = new HashMap<String,Object>();
		vo.put("userNm", userNm);
		vo.put("areaNo", areaNo);
		vo.put("homemiddleTelno", homemiddleTelno);
		vo.put("homeendTelno", homeendTelno);
		
		/*
		핸드폰번호
		vo.put("mbtlnum", mbtlnum);
		*/

		String rtnStr = "";
		// 1. 일반 로그인 처리
		try {
			List<Map<String,Object>> resultList = loginService.selectEgovFindId(vo);
			if(resultList.size()>0)
			{
				Map<String,Object> rtnMap =(Map<String,Object>)resultList.get(0);
				System.out.println(rtnMap);
				rtnStr = (String)rtnMap.get("EMPLYR_ID");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return rtnStr;
	}
	
	/**
	 * 로그인 패스워드 찾기 페이지 이동
	 *
	 * @param request
	 * @param model
	 * @return /uat/uia/EgovFindPwd
	 * @throws Exception
	 */
	@RequestMapping(value = "/uat/uia/EgovFindPwd.do")
	public String EgovFindPwd(HttpServletRequest request, ModelMap model) throws Exception {
		return "/uat/uia/EgovFindPwd";
	}

	
	/**
	 * 로그인 아이디 찾기 조회
	 *
	 * @param userId
	 * @param hint
	 * @param model
	 * @param answer
	 * @return rtnStr
	 * @throws Exception
	 */
	@RequestMapping(value = "/uat/uia/selectEgovFindPwd.do", method = RequestMethod.POST)
	@ResponseBody
	public String selectEgovFindPwd(String userId,String hint,String answer){

		Map<String,Object> vo = new HashMap<String,Object>();
		vo.put("userId", userId);
		vo.put("hint", hint);
		vo.put("answer", answer);

		String rtnStr = "";
		// 1. 일반 로그인 처리
		try {
			List<Map<String,Object>> resultList = loginService.selectEgovFindPwd(vo);
			if(resultList.size()>0)
			{
				Map<String,Object> rtnMap =(Map<String,Object>)resultList.get(0);
				rtnStr = ((java.lang.Long)rtnMap.get("cnt")).toString();
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return rtnStr;
	}

	/**
	 * 로그인 아이디 찾기 변경
	 *
	 * @param userId
	 * @return rtnStr
	 * @throws Exception
	 */
	@RequestMapping(value = "/uat/uia/updateEgovFindPwd.do", method = RequestMethod.POST)
	@ResponseBody
	public String updateEgovFindPwd(String userId) throws Exception{

		Map<String,Object> vo = new HashMap<String,Object>();
		vo.put("userId", userId);
//		vo.put("password", "JfQ7FIatlaE5jj7rPYO8QBABX8yb7bNbQy4AKY1QIfc=");

		vo.put("password", (String)EgovFileScrty.encryptPassword("1", userId));		
		String rtnStr = "";
		try {
			int resultInt = loginService.updateEgovFindPwd(vo);
			if(resultInt == 1)
			{
				rtnStr = String.valueOf(resultInt);
			}
			else
			{
				rtnStr = String.valueOf(-1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return rtnStr;
	}


	/**
	 * 사용자 인증  패스워드 조회
	 *
	 * @param pwd
	 * @return rtnStr
	 * @throws Exception
	 */
	@RequestMapping(value = "/uat/uia/selectPwd.do", method = RequestMethod.POST)
	@ResponseBody
	public String selectPwd(String pwd) throws Exception{

		Map<String,Object> vo = new HashMap<String,Object>();
		LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
//		String uniqId = loginVO.getId();
		String Id = loginVO.getId();

		vo.put("id", Id);
		vo.put("pwd", (String)EgovFileScrty.encryptPassword(pwd, Id));
		
		String rtnStr = "";
		// 1. 일반 로그인 처리
		try {
			List<Map<String,Object>> resultList = loginService.selectPwd(vo);
			if(resultList.size()>0)
			{
				Map<String,Object> rtnMap =(Map<String,Object>)resultList.get(0);
				rtnStr = ((java.lang.Long)rtnMap.get("cnt")).toString();
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return rtnStr;
	}

	
}

class RequestWrapperForSecurity extends HttpServletRequestWrapper {
	private String username = null;
	private String password = null;

	public RequestWrapperForSecurity(HttpServletRequest request, String username, String password) {
		super(request);

		this.username = username;
		this.password = password;
	}
	
	@Override
	public String getServletPath() {		
		return ((HttpServletRequest) super.getRequest()).getContextPath() + "/egov_security_login";
	}

	@Override
	public String getRequestURI() {		
		return ((HttpServletRequest) super.getRequest()).getContextPath() + "/egov_security_login";
	}

	@Override
	public String getParameter(String name) {
		if (name.equals("egov_security_username")) {
			return username;
		}

		if (name.equals("egov_security_password")) {
			return password;
		}

		return super.getParameter(name);
	}
}