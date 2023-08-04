package egovframework.omcst.manage.users.web;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.fdl.security.userdetails.util.EgovUserDetailsHelper;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springmodules.validation.commons.DefaultBeanValidator;

import com.google.gson.Gson;

import egovframework.com.cmm.ComDefaultCodeVO;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.let.uss.ion.uas.service.UserAbsnceVO;
import egovframework.let.uss.umt.service.UserDefaultVO;
import egovframework.let.uss.umt.service.UserManageVO;
import egovframework.let.utl.fcc.service.PageInfoUtil;
import egovframework.let.utl.sim.service.EgovFileScrty;
import egovframework.omcst.attendance.vo.AttendanceVO;
import egovframework.omcst.manage.users.service.UserMngService;
import egovframework.omcst.manage.users.vo.AtnVO;

@Controller
public class UserMngContoller {

	@Resource(name = "userMngService")
	private UserMngService userMngService;

	@Resource(name = "EgovCmmUseService")
	private EgovCmmUseService cmmUseService;

	/** EgovMessageSource */
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/** DefaultBeanValidator beanValidator */
	@Autowired
	private DefaultBeanValidator beanValidator;
	
	@Autowired
	private PageInfoUtil pageInfoUtil;

	@RequestMapping("/userManage")
	public String selectUsersList(@RequestParam(value="selAbsnceAt", required=false , defaultValue="A") String selAbsnceAt, @ModelAttribute("userSearchVO") UserDefaultVO userSearchVO,
			HttpServletRequest request, ModelMap model) throws Exception {
		// 메인화면에서 넘어온 경우 메뉴 갱신을 위해 추가
		request.getSession().setAttribute("baseMenuNo", "9000000");

		// 미인증 사용자에 대한 보안처리
//		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
//		if (!isAuthenticated) {
//			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
//			return "uat/uia/EgovLoginUsr";
//		}

		/** EgovPropertyService */
		userSearchVO.setPageUnit(propertiesService.getInt("pageUnit"));
		userSearchVO.setPageSize(propertiesService.getInt("pageSize"));

		/** pageing */
		//csh 페이징 모듈화
		PaginationInfo paginationInfo= (PaginationInfo) pageInfoUtil.makePaginationInfo(userSearchVO);
		userSearchVO = (UserDefaultVO) pageInfoUtil.makeObjectVO(paginationInfo, userSearchVO);

		userSearchVO.setSelAbsnceAt(selAbsnceAt);
		model.addAttribute("resultList", userMngService.selectUserList(userSearchVO));

		int totCnt = userMngService.selectUserListTotCnt(userSearchVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
//		return "omcst/manage/users/User";
//		return "omcst/manage/users/UserTmp";
		return "omcst/manage/users/UserTmp2";		
	}

	@GetMapping("/userManageInfo")
	public String usesManageInfo(@ModelAttribute("userSearchVO")UserDefaultVO userSearchVO, @ModelAttribute("userManageVO") UserManageVO userManageVO, Model model) throws Exception {
		
		//미인증 사용자에 대한 보안처리
//		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
//		if(!isAuthenticated) {
//			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
//			return "uat/uia/EgovLoginUsr";
//		}
		
		ComDefaultCodeVO vo = new ComDefaultCodeVO();

		//조직정보를 조회 - ORGNZT_ID정보
		vo.setTableNm("LETTNORGNZTINFO");
		model.addAttribute("orgnztId_result", cmmUseService.selectOgrnztIdDetail(vo));

		//그룹정보를 조회 - GROUP_ID정보
		vo.setTableNm("LETTNORGNZTINFO");
		model.addAttribute("groupId_result", cmmUseService.selectGroupIdDetail(vo));
		
		return "omcst/manage/users/UserInfo";
	}

	@GetMapping("/userManageToastInfo")
	public String userManageToastInfo(@ModelAttribute("userSearchVO")UserDefaultVO userSearchVO, @ModelAttribute("userManageVO") UserManageVO userManageVO, Model model) throws Exception {
		
		//미인증 사용자에 대한 보안처리
//		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
//		if(!isAuthenticated) {
//			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
//			return "uat/uia/EgovLoginUsr";
//		}
		
		ComDefaultCodeVO vo = new ComDefaultCodeVO();

		//조직정보를 조회 - ORGNZT_ID정보
		vo.setTableNm("LETTNORGNZTINFO");
		model.addAttribute("orgnztId_result", cmmUseService.selectOgrnztIdDetail(vo));

		//그룹정보를 조회 - GROUP_ID정보
		vo.setTableNm("LETTNORGNZTINFO");
		model.addAttribute("groupId_result", cmmUseService.selectGroupIdDetail(vo));
		
		return "omcst/manage/users/UserToastInfo";
	}

	@GetMapping(value="/idCheckView")
	public String idCheckView(ModelMap model) throws Exception{
		
		// 미인증 사용자에 대한 보안처리
//		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
//		if(!isAuthenticated) {
//		    model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
//		    return "uat/uia/EgovLoginUsr";
//		}
		
		model.addAttribute("checkId", "");
		model.addAttribute("usedCnt", "-1");
		
		return "omcst/manage/users/IdCheck";
	}
	
	@GetMapping(value="/idCheck")
	public String idCheck(@RequestParam Map<String, Object> commandMap, ModelMap model) throws Exception{
		
		//미인증 사용자에 대한 보안처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "uat/uia/EgovLoginUsr";
		}
		
		String checkId = (String) commandMap.get("checkId");
		checkId = new String(checkId.getBytes("ISO-8859-1"), "UTF-8");
		
		if (checkId == null || checkId.equals(""))
			return "forward:/idCheckView";
		
		int usedCnt = userMngService.idCheck(checkId);
		model.addAttribute("usedCnt", usedCnt);
		model.addAttribute("checkId", checkId);
		
		return "omcst/manage/users/IdCheck";
	}

	
	//권한관리 
	@GetMapping(value="/authCheckView")
	public String authCheckView(@RequestParam Map<String, Object> commandMap, ModelMap model) throws Exception{
		model.addAttribute("checkId", "");
		model.addAttribute("usedCnt", "-1");

		return "omcst/manage/users/AuthCheckView";
	}

	//권한관리 
	@GetMapping(value="/authCheck")
	public String authCheck(@RequestParam Map<String, Object> commandMap, ModelMap model) throws Exception{
		
		//미인증 사용자에 대한 보안처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "uat/uia/EgovLoginUsr";
		}
		
		String checkId = (String) commandMap.get("checkId");
		checkId = new String(checkId.getBytes("ISO-8859-1"), "UTF-8");
		
		if (checkId == null || checkId.equals(""))
			return "forward:/idCheckView";
		
		int usedCnt = userMngService.authCheck(checkId);
		model.addAttribute("usedCnt", usedCnt);
		model.addAttribute("checkId", checkId);
		
		return "omcst/manage/users/AuthCheckView";
	}

	@PostMapping(value="/userInsert")
	public String insertUser(@ModelAttribute("userManageVO") UserManageVO userManageVO, BindingResult bindingResult, Model model) throws Exception {

		
		// 미인증 사용자에 대한 보안처리
//		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
//		if(!isAuthenticated) {
//		    model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
//		    return "uat/uia/EgovLoginUsr";
//		}
		beanValidator.validate(userManageVO, bindingResult);
		if (bindingResult.hasErrors()) {
			userMngService.insertUser(userManageVO);

			ComDefaultCodeVO vo = new ComDefaultCodeVO();

			//조직정보를 조회 - ORGNZT_ID정보
			vo.setTableNm("LETTNORGNZTINFO");
			model.addAttribute("orgnztId_result", cmmUseService.selectOgrnztIdDetail(vo));

			//그룹정보를 조회 - GROUP_ID정보
			vo.setTableNm("LETTNORGNZTINFO");
			model.addAttribute("groupId_result", cmmUseService.selectGroupIdDetail(vo));
			//return "forward:/uss/umt/user/EgovUserInsertView.do";
			//return "omcst/manage/users/UserInfo";
			return "forward:/userManage";
		} else {
			userMngService.insertUser(userManageVO);
			//Exception 없이 진행시 등록성공메시지
			model.addAttribute("resultMsg", "success.common.insert");
		}
		return "forward:/userManage";
	}

	@PostMapping(value="/userInsertToast")
	public String userInsertToast(@ModelAttribute("userManageVO") UserManageVO userManageVO, BindingResult bindingResult, Model model) throws Exception {

		
		// 미인증 사용자에 대한 보안처리
//		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
//		if(!isAuthenticated) {
//		    model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
//		    return "uat/uia/EgovLoginUsr";
//		}
		beanValidator.validate(userManageVO, bindingResult);
		if (bindingResult.hasErrors()) {
			userMngService.insertUser(userManageVO);

			ComDefaultCodeVO vo = new ComDefaultCodeVO();

			//조직정보를 조회 - ORGNZT_ID정보
			vo.setTableNm("LETTNORGNZTINFO");
			model.addAttribute("orgnztId_result", cmmUseService.selectOgrnztIdDetail(vo));

			//그룹정보를 조회 - GROUP_ID정보
			vo.setTableNm("LETTNORGNZTINFO");
			model.addAttribute("groupId_result", cmmUseService.selectGroupIdDetail(vo));
			//return "forward:/uss/umt/user/EgovUserInsertView.do";
			//return "omcst/manage/users/UserInfo";
			return "forward:/selectGridList";
		} else {
			userMngService.insertUser(userManageVO);
			//Exception 없이 진행시 등록성공메시지
			model.addAttribute("resultMsg", "success.common.insert");
		}
		return "forward:/selectGridList";
	}

	@RequestMapping("/userView")
	public String userView(@RequestParam("selectedId") String uniqId, @ModelAttribute("searchVO") UserDefaultVO userSearchVO, Model model) throws Exception {
		
		// 미인증 사용자에 대한 보안처리
//		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
//		if(!isAuthenticated) {
//			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
//			return "uat/uia/EgovLoginUsr";
//		}
		
		ComDefaultCodeVO vo = new ComDefaultCodeVO();

		//조직정보를 조회 - ORGNZT_ID정보
		vo.setTableNm("LETTNORGNZTINFO");
		model.addAttribute("orgnztId_result", cmmUseService.selectOgrnztIdDetail(vo));

		//그룹정보를 조회 - GROUP_ID정보
		vo.setTableNm("LETTNORGNZTINFO");
		model.addAttribute("groupId_result", cmmUseService.selectGroupIdDetail(vo));

		UserManageVO userManageVO = new UserManageVO();
		
		userManageVO = userMngService.selectUser(uniqId);
		model.addAttribute("userSearchVO", userSearchVO);
		model.addAttribute("userManageVO", userManageVO);
		
		return "omcst/manage/users/UserView";
	}

	@RequestMapping("/userViewToast")
	public String userViewToast(@RequestParam("selectedId") String uniqId, @ModelAttribute("searchVO") UserDefaultVO userSearchVO, Model model) throws Exception {
		// 미인증 사용자에 대한 보안처리
//		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
//		if(!isAuthenticated) {
//			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
//			return "uat/uia/EgovLoginUsr";
//		}
		
		ComDefaultCodeVO vo = new ComDefaultCodeVO();

		//조직정보를 조회 - ORGNZT_ID정보
		vo.setTableNm("LETTNORGNZTINFO");
		model.addAttribute("orgnztId_result", cmmUseService.selectOgrnztIdDetail(vo));

		//그룹정보를 조회 - GROUP_ID정보
		vo.setTableNm("LETTNORGNZTINFO");
		model.addAttribute("groupId_result", cmmUseService.selectGroupIdDetail(vo));

		UserManageVO userManageVO = new UserManageVO();
		
		userManageVO = userMngService.selectUser(uniqId);
		model.addAttribute("userSearchVO", userSearchVO);
		model.addAttribute("userManageVO", userManageVO);
		
		return "omcst/manage/users/UserViewToast";
	}
	
	@RequestMapping(value = "/userPasswordUpdate")
	public String updatePasswordView(ModelMap model, @RequestParam Map<String, Object> commandMap, @ModelAttribute("searchVO") UserDefaultVO userSearchVO,
			@ModelAttribute("userManageVO") UserManageVO userManageVO) throws Exception {
		
		// 미인증 사용자에 대한 보안처리
//		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
//		if(!isAuthenticated) {
//		    model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
//		    return "uat/uia/EgovLoginUsr";
//		}
		
		String userTyForPassword = (String) commandMap.get("userTyForPassword");
		userManageVO.setUserTy(userTyForPassword);

		model.addAttribute("userManageVO", userManageVO);
		model.addAttribute("userSearchVO", userSearchVO);
		return "omcst/manage/users/PasswordUpdate";
	}
	
	@RequestMapping(value = "/passwordUpdate")
	public String updatePassword(ModelMap model, @RequestParam Map<String, Object> commandMap, @ModelAttribute("searchVO") UserDefaultVO userSearchVO,
			@ModelAttribute("userManageVO") UserManageVO userManageVO) throws Exception {

		// 미인증 사용자에 대한 보안처리
//		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
//    	if(!isAuthenticated) {
//    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
//        	return "uat/uia/EgovLoginUsr";
//    	}

		String oldPassword = (String) commandMap.get("oldPassword");
		String newPassword = (String) commandMap.get("newPassword");
		String newPassword2 = (String) commandMap.get("newPassword2");
		String uniqId = (String) commandMap.get("uniqId");

		boolean isCorrectPassword = false;
		UserManageVO resultVO = new UserManageVO();
		userManageVO.setPassword(newPassword);
		userManageVO.setOldPassword(oldPassword);
		userManageVO.setUniqId(uniqId);

		String resultMsg = "";
		resultVO = userMngService.selectPassword(userManageVO);
		//패스워드 암호화
		String encryptPass = EgovFileScrty.encryptPassword(oldPassword, userManageVO.getEmplyrId());
		if (encryptPass.equals(resultVO.getPassword())) {
			if (newPassword.equals(newPassword2)) {
				isCorrectPassword = true;
			} else {
				isCorrectPassword = false;
				resultMsg = "fail.user.passwordUpdate2";
			}
		} else {
			isCorrectPassword = false;
			resultMsg = "fail.user.passwordUpdate1";
		}

		if (isCorrectPassword) {
			userManageVO.setPassword(EgovFileScrty.encryptPassword(newPassword, userManageVO.getEmplyrId()));
			userMngService.updatePassword(userManageVO);
			model.addAttribute("userManageVO", userManageVO);
			resultMsg = "success.common.update";
		} else {
			model.addAttribute("userManageVO", userManageVO);
		}
		model.addAttribute("userSearchVO", userSearchVO);
		model.addAttribute("resultMsg", resultMsg);

		return "omcst/manage/users/PasswordUpdate";
	}
	
	@RequestMapping("/userUpdate")
	public String updateUser(@ModelAttribute("userManageVO") UserManageVO userManageVO, BindingResult bindingResult, Model model) throws Exception {

		// 미인증 사용자에 대한 보안처리
//		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
//    	if(!isAuthenticated) {
//    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
//        	return "uat/uia/EgovLoginUsr";
//    	}

		beanValidator.validate(userManageVO, bindingResult);
		if (bindingResult.hasErrors()) {
			ComDefaultCodeVO vo = new ComDefaultCodeVO();

			//조직정보를 조회 - ORGNZT_ID정보
			vo.setTableNm("LETTNORGNZTINFO");
			model.addAttribute("orgnztId_result", cmmUseService.selectOgrnztIdDetail(vo));

			//그룹정보를 조회 - GROUP_ID정보
			vo.setTableNm("LETTNORGNZTINFO");
			model.addAttribute("groupId_result", cmmUseService.selectGroupIdDetail(vo));
			return "omcst/manage/users/UserView";
		} else {			
			//업무사용자 수정시 히스토리 정보를 등록한다.
			userMngService.insertUserHistory(userManageVO);
			userMngService.updateUser(userManageVO);			
			//Exception 없이 진행시 수정성공메시지
			model.addAttribute("resultMsg", "success.common.update");
			return "forward:/selectGridList";
		}
	}

	@RequestMapping("/userUpdateToast")
	public String userUpdateToast(@ModelAttribute("userManageVO") UserManageVO userManageVO, BindingResult bindingResult, Model model) throws Exception {

		// 미인증 사용자에 대한 보안처리
//		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
//    	if(!isAuthenticated) {
//    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
//        	return "uat/uia/EgovLoginUsr";
//    	}

		beanValidator.validate(userManageVO, bindingResult);
		if (bindingResult.hasErrors()) {
			ComDefaultCodeVO vo = new ComDefaultCodeVO();

			//조직정보를 조회 - ORGNZT_ID정보
			vo.setTableNm("LETTNORGNZTINFO");
			model.addAttribute("orgnztId_result", cmmUseService.selectOgrnztIdDetail(vo));

			//그룹정보를 조회 - GROUP_ID정보
			vo.setTableNm("LETTNORGNZTINFO");
			model.addAttribute("groupId_result", cmmUseService.selectGroupIdDetail(vo));
			return "omcst/manage/users/userUpdateToast";
		} else {			
			//업무사용자 수정시 히스토리 정보를 등록한다.
			userMngService.insertUserHistory(userManageVO);
			userMngService.updateUser(userManageVO);			
			//Exception 없이 진행시 수정성공메시지
			model.addAttribute("resultMsg", "success.common.update");
			return "forward:/userManage";
		}
	}

	@RequestMapping("/userToastDelete")
	public String userToastDelete(@RequestParam("checkedIdForDel") String checkedIdForDel, @ModelAttribute("searchVO") UserDefaultVO userSearchVO, Model model) throws Exception {

		// 미인증 사용자에 대한 보안처리
//		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
//    	if(!isAuthenticated) {
//    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
//        	return "uat/uia/EgovLoginUsr";
//    	}

    	userMngService.deleteUser(checkedIdForDel);
		//Exception 없이 진행시 등록성공메시지
		model.addAttribute("resultMsg", "success.common.delete");
		return "forward:/selectGridList";
	}

	@RequestMapping("/userDelete")
	public String deleteUser(@RequestParam("checkedIdForDel") String checkedIdForDel, @ModelAttribute("searchVO") UserDefaultVO userSearchVO, Model model) throws Exception {

		// 미인증 사용자에 대한 보안처리
//		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
//    	if(!isAuthenticated) {
//    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
//        	return "uat/uia/EgovLoginUsr";
//    	}

    	userMngService.deleteUser(checkedIdForDel);
		//Exception 없이 진행시 등록성공메시지
		model.addAttribute("resultMsg", "success.common.delete");
		return "forward:/userManage";
	}

	@RequestMapping("/userDeleteToast")
	public String deleteUserToast(@RequestParam("checkedIdForDel") String checkedIdForDel, @ModelAttribute("searchVO") UserDefaultVO userSearchVO, Model model) throws Exception {

		// 미인증 사용자에 대한 보안처리
//		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
//    	if(!isAuthenticated) {
//    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
//        	return "uat/uia/EgovLoginUsr";
//    	}

    	userMngService.deleteUser(checkedIdForDel);
		//Exception 없이 진행시 등록성공메시지
		model.addAttribute("resultMsg", "success.common.delete");
		return "forward:/selectGridList";
	}

//	@RequestMapping("/userDeleteTmp")
//	public String deleteUserTmp(@RequestParam("checkedIdForDel") String checkedIdForDel,@RequestParam("checkedAbIdForDel") String checkedAbIdForDel, @ModelAttribute("searchVO") UserDefaultVO userSearchVO, Model model) throws Exception {
//		
//		// 미인증 사용자에 대한 보안처리
//		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
//    	if(!isAuthenticated) {
//    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
//        	return "uat/uia/EgovLoginUsr";
//    	}
//
//    	userMngService.deleteUserTmp(checkedIdForDel,checkedAbIdForDel);
//
//    	//Exception 없이 진행시 등록성공메시지
//		model.addAttribute("resultMsg", "success.common.delete");
//		return "forward:/userManage";
//	}

	@GetMapping("/userConfirmPop")
	public String userConfirmPop(@ModelAttribute("userSearchVO")UserDefaultVO userSearchVO, @ModelAttribute("userManageVO") UserManageVO userManageVO, Model model) throws Exception {
		
		//미인증 사용자에 대한 보안처리
//		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
//		if(!isAuthenticated) {
//			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
//			return "uat/uia/EgovLoginUsr";
//		}
		
//		ComDefaultCodeVO vo = new ComDefaultCodeVO();
//
//		//조직정보를 조회 - ORGNZT_ID정보
//		vo.setTableNm("LETTNORGNZTINFO");
//		model.addAttribute("orgnztId_result", cmmUseService.selectOgrnztIdDetail(vo));
//
//		//그룹정보를 조회 - GROUP_ID정보
//		vo.setTableNm("LETTNORGNZTINFO");
//		model.addAttribute("groupId_result", cmmUseService.selectGroupIdDetail(vo));

		ComDefaultCodeVO vo = new ComDefaultCodeVO();

		//조직정보를 조회 - ORGNZT_ID정보
		vo.setTableNm("LETTNORGNZTINFO");
		model.addAttribute("orgnztId_result", cmmUseService.selectOgrnztIdDetail(vo));
		
		//그룹정보를 조회 - GROUP_ID정보
		vo.setTableNm("LETTNORGNZTINFO");
		model.addAttribute("groupId_result", cmmUseService.selectGroupIdDetail(vo));

		
		LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		String uniqId = loginVO.getUniqId();

		userManageVO = userMngService.selectUser(uniqId);
		model.addAttribute("userSearchVO", userSearchVO);
		model.addAttribute("userManageVO", userManageVO);

		return "omcst/manage/users/UserConfirmPop";
	}

	@GetMapping("/userConfirm")
	public String userConfirm(@ModelAttribute("userSearchVO")UserDefaultVO userSearchVO, @ModelAttribute("userManageVO") UserManageVO userManageVO, Model model) throws Exception {
		
		//미인증 사용자에 대한 보안처리
//		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
//		if(!isAuthenticated) {
//			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
//			return "uat/uia/EgovLoginUsr";
//		}
		
//		ComDefaultCodeVO vo = new ComDefaultCodeVO();
//
//		//조직정보를 조회 - ORGNZT_ID정보
//		vo.setTableNm("LETTNORGNZTINFO");
//		model.addAttribute("orgnztId_result", cmmUseService.selectOgrnztIdDetail(vo));
//
//		//그룹정보를 조회 - GROUP_ID정보
//		vo.setTableNm("LETTNORGNZTINFO");
//		model.addAttribute("groupId_result", cmmUseService.selectGroupIdDetail(vo));

		ComDefaultCodeVO vo = new ComDefaultCodeVO();

		//조직정보를 조회 - ORGNZT_ID정보
		vo.setTableNm("LETTNORGNZTINFO");
		model.addAttribute("orgnztId_result", cmmUseService.selectOgrnztIdDetail(vo));
		
		//그룹정보를 조회 - GROUP_ID정보
		vo.setTableNm("LETTNORGNZTINFO");
		model.addAttribute("groupId_result", cmmUseService.selectGroupIdDetail(vo));

		
		LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		String uniqId = loginVO.getUniqId();

		userManageVO = userMngService.selectUser(uniqId);
		model.addAttribute("userSearchVO", userSearchVO);
		model.addAttribute("userManageVO", userManageVO);

		return "omcst/manage/users/UserConfirm";
	}

	@GetMapping("/userModify")
	public String userModify(@ModelAttribute("userSearchVO")UserDefaultVO userSearchVO, @ModelAttribute("userManageVO") UserManageVO userManageVO, Model model) throws Exception {
		
		//미인증 사용자에 대한 보안처리
//		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
//		if(!isAuthenticated) {
//			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
//			return "uat/uia/EgovLoginUsr";
//		}
		
//		ComDefaultCodeVO vo = new ComDefaultCodeVO();
//
//		//조직정보를 조회 - ORGNZT_ID정보
//		vo.setTableNm("LETTNORGNZTINFO");
//		model.addAttribute("orgnztId_result", cmmUseService.selectOgrnztIdDetail(vo));
//
//		//그룹정보를 조회 - GROUP_ID정보
//		vo.setTableNm("LETTNORGNZTINFO");
//		model.addAttribute("groupId_result", cmmUseService.selectGroupIdDetail(vo));

		ComDefaultCodeVO vo = new ComDefaultCodeVO();

		//조직정보를 조회 - ORGNZT_ID정보
		vo.setTableNm("LETTNORGNZTINFO");
		model.addAttribute("orgnztId_result", cmmUseService.selectOgrnztIdDetail(vo));
		
		//그룹정보를 조회 - GROUP_ID정보
		vo.setTableNm("LETTNORGNZTINFO");
		model.addAttribute("groupId_result", cmmUseService.selectGroupIdDetail(vo));

		
		LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		String uniqId = loginVO.getUniqId();

		userManageVO = userMngService.selectUser(uniqId);
		model.addAttribute("userSearchVO", userSearchVO);
		model.addAttribute("userManageVO", userManageVO);

		return "omcst/manage/users/UserModify";
	}

	@RequestMapping("/atnList")
	public String selectAtnList(@ModelAttribute("AtnVO") AttendanceVO atnVO, BindingResult bindingResult,HttpServletRequest request, ModelMap model) throws Exception {
		// 메인화면에서 넘어온 경우 메뉴 갱신을 위해 추가
		request.getSession().setAttribute("baseMenuNo", "9000000");
		// 미인증 사용자에 대한 보안처리
//		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
//		if (!isAuthenticated) {
//			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
//			return "uat/uia/EgovLoginUsr";
//		}
		/** EgovPropertyService */
		atnVO.setPageUnit(propertiesService.getInt("pageUnit"));
		atnVO.setPageSize(propertiesService.getInt("pageSize"));

    	//csh 페이징 모듈화
    	PaginationInfo paginationInfo= (PaginationInfo) pageInfoUtil.makePaginationInfo(atnVO);
    	atnVO = (AttendanceVO) pageInfoUtil.makeObjectVO(paginationInfo, atnVO);

		LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		String uniqId = loginVO.getUniqId();
		atnVO.setEsntl_id(uniqId);
		model.addAttribute("resultList", userMngService.selectAtnList(atnVO));
		int totCnt = userMngService.selectAtnListTotCnt(atnVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);		
		model.addAttribute("atnVO", atnVO);
//		return "omcst/manage/users/User";
//		return "omcst/manage/users/UserTmp";
		return "omcst/manage/users/Atn";		
	}	

	@RequestMapping("/updateUncheckLat")
	@ResponseBody
	public Map<String, Object> updateUncheckLat(@RequestParam(value="latList", required=true)String latList) throws Exception {
		String[] strArray = latList.split(",");
		Map<String,Object> result = new HashMap<String, Object>();
		
		for (int i = 0; i < strArray.length; i++) {		    
			userMngService.updateUncheckLat(strArray[i]);
		}
		result.put("success", "uccess.common.update");
				
		return result;
	}	

	@RequestMapping("/topUserUpdate")
	public String topUserUpdate(@ModelAttribute("userSearchVO")UserDefaultVO userSearchVO,@ModelAttribute("userManageVO") UserManageVO userManageVO, BindingResult bindingResult, Model model) throws Exception {

		// 미인증 사용자에 대한 보안처리
//		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
//    	if(!isAuthenticated) {
//    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
//        	return "uat/uia/EgovLoginUsr";
//    	}

		beanValidator.validate(userManageVO, bindingResult);
		if (!bindingResult.hasErrors()) {
			ComDefaultCodeVO vo = new ComDefaultCodeVO();

			//조직정보를 조회 - ORGNZT_ID정보
			vo.setTableNm("LETTNORGNZTINFO");
			model.addAttribute("orgnztId_result", cmmUseService.selectOgrnztIdDetail(vo));

			//그룹정보를 조회 - GROUP_ID정보
			vo.setTableNm("LETTNORGNZTINFO");
			model.addAttribute("groupId_result", cmmUseService.selectGroupIdDetail(vo));
			return "omcst/manage/users/UserView";
		} else {			
			//업무사용자 수정시 히스토리 정보를 등록한다.
			userMngService.insertUserHistory(userManageVO);
			userMngService.updateTopUser(userManageVO);			
			//Exception 없이 진행시 수정성공메시지
			model.addAttribute("resultMsg", "변경이 완료 되었습니다.");
//			return "forward:/uat/uia/actionMain.do";
			ComDefaultCodeVO vo = new ComDefaultCodeVO();

			//조직정보를 조회 - ORGNZT_ID정보
			vo.setTableNm("LETTNORGNZTINFO");
			model.addAttribute("orgnztId_result", cmmUseService.selectOgrnztIdDetail(vo));
			
			//그룹정보를 조회 - GROUP_ID정보
			vo.setTableNm("LETTNORGNZTINFO");
			model.addAttribute("groupId_result", cmmUseService.selectGroupIdDetail(vo));

			
			LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
			String uniqId = loginVO.getUniqId();

			userManageVO = userMngService.selectUser(uniqId);
			model.addAttribute("userSearchVO", userSearchVO);
			model.addAttribute("userManageVO", userManageVO);

			return "omcst/manage/users/UserModify";

		}
	}

//	@RequestMapping("/selectGridList")
//	public String selectGridList(@RequestParam(value="selAbsnceAt", required=false , defaultValue="A") String selAbsnceAt, @ModelAttribute("userSearchVO") UserDefaultVO userSearchVO,
//			HttpServletRequest request, ModelMap model) throws Exception {
//		// 메인화면에서 넘어온 경우 메뉴 갱신을 위해 추가
//		request.getSession().setAttribute("baseMenuNo", "9000000");
//
//		// 미인증 사용자에 대한 보안처리
////		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
////		if (!isAuthenticated) {
////			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
////			return "uat/uia/EgovLoginUsr";
////		}
//
//		/** EgovPropertyService */
//
//		userSearchVO.setPageUnit(propertiesService.getInt("pageUnit"));
//		userSearchVO.setPageSize(propertiesService.getInt("pageSize"));
//
//		
//		/** pageing */
//		//csh 페이징 모듈화
//		PaginationInfo paginationInfo= (PaginationInfo) pageInfoUtil.makePaginationInfo(userSearchVO);
//		paginationInfo.setTotalRecordCount(0);
//		model.addAttribute("paginationInfo", paginationInfo);
////		return "omcst/manage/users/User";
////		return "omcst/manage/users/UserTmp";
//
//		return "omcst/manage/users/gridList";		
//	}

//	@PostMapping(value="/updateGridList", produces = "application/text; charset=UTF-8")
//	@ResponseBody
	@RequestMapping("/updateGridList")
	public String updateGridList(@RequestParam(value="jsonStr", required=false , defaultValue="") String jsonStr, @ModelAttribute("userSearchVO") UserDefaultVO userSearchVO,
			HttpServletRequest request, ModelMap model) throws Exception {
        Gson gson = new Gson();

        // 방법1
        HashMap[] array = gson.fromJson(jsonStr, HashMap[].class);
        List<HashMap> list = Arrays.asList(array);
        for(int i=0; i < list.size();i++)
        {
        	Map u1= (Map)list.get(i);
//    		System.out.println("@@@@@@@@@@@@@@@@@@@@@");
//    		System.out.println(u1.get("uniqId"));
//    		System.out.println(u1.get("userNm"));
//    		System.out.println("@@@@@@@@@@@@@@@@@@@@@");

        	int cmp1 = userMngService.updateGridList(u1);
        	if(cmp1 > 0)
        	{
        		model.addAttribute("message", "변경에 성공 하였습니다.");        		
        	}
        	else
        	{
        		model.addAttribute("message", "변경에 실패 하였습니다.");
        	}
        }
        
        

		
		// 메인화면에서 넘어온 경우 메뉴 갱신을 위해 추가
		request.getSession().setAttribute("baseMenuNo", "9000000");

		// 미인증 사용자에 대한 보안처리
//		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
//		if (!isAuthenticated) {
//			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
//			return "uat/uia/EgovLoginUsr";
//		}

		/** EgovPropertyService */
		userSearchVO.setPageUnit(propertiesService.getInt("pageUnit"));
		userSearchVO.setPageSize(propertiesService.getInt("pageSize"));

		/** pageing */
//		//csh 페이징 모듈화
//		PaginationInfo paginationInfo= (PaginationInfo) pageInfoUtil.makePaginationInfo(userSearchVO);
//		userSearchVO = (UserDefaultVO) pageInfoUtil.makeObjectVO(paginationInfo, userSearchVO);
//
//		userSearchVO.setSelAbsnceAt(selAbsnceAt);
//		
//		List rtnList = new ArrayList();
//		Map map1 = new HashMap();
//		map1.put("resultList", userMngService.selectUserList(userSearchVO));
//		
//		int totCnt = userMngService.selectUserListTotCnt(userSearchVO);
//		paginationInfo.setTotalRecordCount(totCnt);
//		map1.put("paginationInfo", paginationInfo);
//		
//		Gson gson = new Gson();
//		return gson.toJson(map1);
		/** EgovPropertyService */
		userSearchVO.setPageUnit(propertiesService.getInt("pageUnit"));
		userSearchVO.setPageSize(propertiesService.getInt("pageSize"));

		/** pageing */
		//csh 페이징 모듈화
		PaginationInfo paginationInfo= (PaginationInfo) pageInfoUtil.makePaginationInfo(userSearchVO);
		userSearchVO = (UserDefaultVO) pageInfoUtil.makeObjectVO(paginationInfo, userSearchVO);

//		userSearchVO.setSelAbsnceAt(selAbsnceAt);
		
		model.addAttribute("resultList", gson.toJson(userMngService.selectUserList(userSearchVO)));

		int totCnt = userMngService.selectUserListTotCnt(userSearchVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		
//		return "omcst/manage/users/User";
//		return "omcst/manage/users/UserTmp";

		return"omcst/manage/users/gridList"; 
	}	
	@RequestMapping("/selectGridList")
	public String selectGridSample(@RequestParam(value="selAbsnceAt", required=false , defaultValue="A") String selAbsnceAt, @ModelAttribute("userSearchVO") UserDefaultVO userSearchVO,
			HttpServletRequest request, ModelMap model) throws Exception {
		// 메인화면에서 넘어온 경우 메뉴 갱신을 위해 추가
		request.getSession().setAttribute("baseMenuNo", "9000000");

		// 미인증 사용자에 대한 보안처리
//		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
//		if (!isAuthenticated) {
//			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
//			return "uat/uia/EgovLoginUsr";
//		}

		/** EgovPropertyService */
		userSearchVO.setPageUnit(propertiesService.getInt("pageUnit"));
		userSearchVO.setPageSize(propertiesService.getInt("pageSize"));

		/** pageing */
//		//csh 페이징 모듈화
//		PaginationInfo paginationInfo= (PaginationInfo) pageInfoUtil.makePaginationInfo(userSearchVO);
//		userSearchVO = (UserDefaultVO) pageInfoUtil.makeObjectVO(paginationInfo, userSearchVO);
//
//		userSearchVO.setSelAbsnceAt(selAbsnceAt);
//		
//		List rtnList = new ArrayList();
//		Map map1 = new HashMap();
//		map1.put("resultList", userMngService.selectUserList(userSearchVO));
//		
//		int totCnt = userMngService.selectUserListTotCnt(userSearchVO);
//		paginationInfo.setTotalRecordCount(totCnt);
//		map1.put("paginationInfo", paginationInfo);
//		
//		Gson gson = new Gson();
//		return gson.toJson(map1);
		/** EgovPropertyService */
		userSearchVO.setPageUnit(propertiesService.getInt("pageUnit"));
		userSearchVO.setPageSize(propertiesService.getInt("pageSize"));

		/** pageing */
		//csh 페이징 모듈화
		PaginationInfo paginationInfo= (PaginationInfo) pageInfoUtil.makePaginationInfo(userSearchVO);
		userSearchVO = (UserDefaultVO) pageInfoUtil.makeObjectVO(paginationInfo, userSearchVO);

		userSearchVO.setSelAbsnceAt(selAbsnceAt);
		Gson gson = new Gson();
		model.addAttribute("resultList", gson.toJson(userMngService.selectUserList(userSearchVO)));

		int totCnt = userMngService.selectUserListTotCnt(userSearchVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
//		return "omcst/manage/users/User";
//		return "omcst/manage/users/UserTmp";

		return "omcst/manage/users/gridList";	
	}


}