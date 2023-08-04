package egovframework.omcst.manage.absence.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.egovframe.rte.fdl.security.userdetails.util.EgovUserDetailsHelper;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.let.sec.rmt.service.RoleManageVO;
import egovframework.let.uss.ion.uas.service.UserAbsnce;
import egovframework.let.uss.ion.uas.service.UserAbsnceVO;
import egovframework.let.utl.fcc.service.PageInfoUtil;
import egovframework.omcst.manage.absence.service.UserAncService;

/**
 * 사용자부재에 대한 controller 클래스를 정의한다.
 * 사용자부재에 대한 등록, 수정, 삭제, 조회, 반영확인 기능을 제공한다.
 * 사용자부재의 조회기능은 목록조회, 상세조회로 구분된다.
 * @author 공통서비스개발팀 lee.m.j
 * @since 2009.08.03
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2009.08.03  lee.m.j        최초 생성
 *   2011.08.31  JJY            경량환경 템플릿 커스터마이징버전 생성
 *
 * </pre>
 */
@Controller
public class UserAncContoller {
	
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;
	
	@Resource(name="userAncService")
	private UserAncService userAncService;
	
	@Autowired
	private DefaultBeanValidator beanValidator;
	
	@Autowired
	private PageInfoUtil pageInfoUtil;

	/**
	 * 사용자부재 목록화면 이동
	 * @return String
	 * @exception Exception
	 */
	@RequestMapping("/userAbsnceList")
	public String selectUserAbsnceList(@RequestParam(value="selAbsnceAt", required=false , defaultValue="A") String selAbsnceAt, @ModelAttribute("userAbsnceVO") UserAbsnceVO userAbsnceVO,ModelMap model, HttpServletRequest request) throws Exception {
		
		// 메인화면에서 넘어온 경우 메뉴 갱신을 위해 추가
		request.getSession().setAttribute("baseMenuNo", "6000000");
				
    	//csh 페이징 모듈화
    	PaginationInfo paginationInfo= (PaginationInfo) pageInfoUtil.makePaginationInfo(userAbsnceVO);
    	userAbsnceVO = (UserAbsnceVO) pageInfoUtil.makeObjectVO(paginationInfo, userAbsnceVO);
		
		userAbsnceVO.setSelAbsnceAt(selAbsnceAt);
		userAbsnceVO.setUserAbsnceList(userAncService.selectUserAbsnceList(userAbsnceVO));

		model.addAttribute("userAbsnceList", userAbsnceVO.getUserAbsnceList());

		int totCnt = userAncService.selectUserAbsnceListTotCnt(userAbsnceVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);

		model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));

		return "omcst/manage/absence/UserAbsnceList";
		
	}
	
	/**
	 * 사용자부재정보를 신규로 등록한다.
	 * @param userAbsnce - 사용자부재 model
	 * @return String - 리턴 Url
	 */
	@RequestMapping("/addViewUserAbsnce")
	public String insertUserAbsnceView(@RequestParam("userId") String userId, @ModelAttribute("userAbsnceVO") UserAbsnceVO userAbsnceVO, ModelMap model) throws Exception {
		userAbsnceVO.setUserId(userId);
		model.addAttribute("userAbsnce", userAncService.selectUserAbsnce(userAbsnceVO));
		model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));

		return "omcst/manage/absence/UserAbsnceRegist";
	}
	
	/**
	 * 등록된 사용자부재 상세정보를 조회한다.
	 * @param userAbsnceVO - 사용자부재 VO
	 * @return String - 리턴 Url
	 */
	@RequestMapping("/getUserAbsnce")
	public String selectUserAbsnce(@RequestParam("userId") String userId, @ModelAttribute("userAbsnceVO") UserAbsnceVO userAbsnceVO, ModelMap model) throws Exception {

		userAbsnceVO.setUserId(userId);
		model.addAttribute("userAbsnce", userAncService.selectUserAbsnce(userAbsnceVO));
		model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));

		UserAbsnceVO vo = (UserAbsnceVO) model.get("userAbsnce");

		if (vo.getRegYn().equals("N"))
			return "omcst/manage/absence/UserAbsnceRegist";
		else
			return "omcst/manage/absence/UserAbsnceUpdt";
	}

	/**
	 * 등록된 사용자부재 상세정보를 조회한다.
	 * @param userAbsnceVO - 사용자부재 VO
	 * @return String - 리턴 Url
	 */
	@RequestMapping("/getUserAbsnceTmp")
	public String getUserAbsnceTmp(@RequestParam("userId") String userId, @ModelAttribute("userAbsnceVO") UserAbsnceVO userAbsnceVO, ModelMap model) throws Exception {

		userAbsnceVO.setUserId(userId);
		model.addAttribute("userAbsnce", userAncService.selectUserAbsnce(userAbsnceVO));
		model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));

		UserAbsnceVO vo = (UserAbsnceVO) model.get("userAbsnce");

		if (vo.getRegYn().equals("N"))
			return "omcst/manage/absence/UserAbsnceRegistTmp";
		else
			return "omcst/manage/absence/UserAbsnceUpdtTmp";
	}

	/**
	 * 사용자부재정보를 신규로 등록한다.
	 * @param userAbsnce - 사용자부재 model
	 * @return String - 리턴 Url
	 */
	@RequestMapping("/addUserAbsnceTmp")
	public String insertUserAbsnceTmp(@ModelAttribute("userAbsnce") UserAbsnce userAbsnce, @ModelAttribute("userAbsnceVO") UserAbsnceVO userAbsnceVO, BindingResult bindingResult,
			ModelMap model) throws Exception {

		beanValidator.validate(userAbsnce, bindingResult); //validation 수행

		if (bindingResult.hasErrors()) {
			model.addAttribute("userAbsnceVO", userAbsnceVO);
			return "/uss/ion/msi/EgovMainImageRegist";
		} else {
			LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
			userAbsnce.setLastUpdusrId(user.getId());
			// userAbsnce.setLastUpdusrId("jung");

			model.addAttribute("userAbsnce", userAncService.insertUserAbsnce(userAbsnce, userAbsnceVO));
			model.addAttribute("message", egovMessageSource.getMessage("success.common.insert"));

//			return "omcst/manage/absence/UserAbsnceUpdt";
			return "forward:/userManage";
		}
	}
	
	/**
	 * 기 등록된 사용자부재정보를 수정한다.
	 * @param userAbsnce - 사용자부재 model
	 * @return String - 리턴 Url
	 */
	@RequestMapping("/updtUserAbsnceTmp")
	public String updateUserAbsnceTmp(@ModelAttribute("userAbsnce") UserAbsnce userAbsnce, BindingResult bindingResult, ModelMap model) throws Exception {

		if (bindingResult.hasErrors()) {
			model.addAttribute("userAbsnceVO", userAbsnce);
			return "omcst/manage/absence/UserAbsnceUpdt";
		} else {

			LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
			userAbsnce.setLastUpdusrId(user.getId());
			//userAbsnce.setLastUpdusrId("jung");

			userAncService.updateUserAbsnce(userAbsnce);
			return "forward:/getUserAbsnceTmp";
		}
	}
	
	/**
	 * 등록된 사용자부재정보를 삭제한다.
	 * @param userAbsnce - 사용자부재 model
	 * @return String - 리턴 Url
	 */
	@RequestMapping("/removeUserAbsnceTmp")
	public String deleteUserAbsnceTmp(@ModelAttribute("userAbsnce") UserAbsnce userAbsnce, ModelMap model) throws Exception {

		userAncService.deleteUserAbsnce(userAbsnce);
		model.addAttribute("message", egovMessageSource.getMessage("success.common.delete"));
		return "forward:/userManage";
	}

	
	/**
	 * 사용자부재정보를 신규로 등록한다.
	 * @param userAbsnce - 사용자부재 model
	 * @return String - 리턴 Url
	 */
	@RequestMapping("/addUserAbsnce")
	public String insertUserAbsnce(@ModelAttribute("userAbsnce") UserAbsnce userAbsnce, @ModelAttribute("userAbsnceVO") UserAbsnceVO userAbsnceVO, BindingResult bindingResult,
			ModelMap model) throws Exception {

		beanValidator.validate(userAbsnce, bindingResult); //validation 수행

		if (bindingResult.hasErrors()) {
			model.addAttribute("userAbsnceVO", userAbsnceVO);
			return "/uss/ion/msi/EgovMainImageRegist";
		} else {
			LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
			userAbsnce.setLastUpdusrId(user.getId());
			// userAbsnce.setLastUpdusrId("jung");

			model.addAttribute("userAbsnce", userAncService.insertUserAbsnce(userAbsnce, userAbsnceVO));
			model.addAttribute("message", egovMessageSource.getMessage("success.common.insert"));

			return "omcst/manage/absence/UserAbsnceUpdt";
		}
	}
	
	/**
	 * 기 등록된 사용자부재정보를 수정한다.
	 * @param userAbsnce - 사용자부재 model
	 * @return String - 리턴 Url
	 */
	@RequestMapping("/updtUserAbsnce")
	public String updateUserAbsnce(@ModelAttribute("userAbsnce") UserAbsnce userAbsnce, BindingResult bindingResult, ModelMap model) throws Exception {

		if (bindingResult.hasErrors()) {
			model.addAttribute("userAbsnceVO", userAbsnce);
			return "omcst/manage/absence/UserAbsnceUpdt";
		} else {

			LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
			userAbsnce.setLastUpdusrId(user.getId());
			//userAbsnce.setLastUpdusrId("jung");

			userAncService.updateUserAbsnce(userAbsnce);
			return "forward:/getUserAbsnce";
		}
	}
	
	/**
	 * 등록된 사용자부재정보를 삭제한다.
	 * @param userAbsnce - 사용자부재 model
	 * @return String - 리턴 Url
	 */
	@RequestMapping("/removeUserAbsnce")
	public String deleteUserAbsnce(@ModelAttribute("userAbsnce") UserAbsnce userAbsnce, ModelMap model) throws Exception {

		userAncService.deleteUserAbsnce(userAbsnce);
		model.addAttribute("message", egovMessageSource.getMessage("success.common.delete"));
		return "forward:/userAbsnceList";
	}

	/**
	 * 등록된 사용자부재정보를 삭제한다.
	 * @param userAbsnce - 사용자부재 model
	 * @return String - 리턴 Url
	 */
	@RequestMapping("/removeUserAbsnceList")
	public String deleteUserAbsnceList(@RequestParam("userIds") String userIds, @ModelAttribute("userAbsnce") UserAbsnce userAbsnce, ModelMap model) throws Exception {

		String[] strUserIds = userIds.split(";");

		for (int i = 0; i < strUserIds.length; i++) {
			userAbsnce.setUserId(strUserIds[i]);
			userAncService.deleteUserAbsnce(userAbsnce);
		}

		model.addAttribute("message", egovMessageSource.getMessage("success.common.delete"));
		return "forward:/userAbsnceList";
	}
}
