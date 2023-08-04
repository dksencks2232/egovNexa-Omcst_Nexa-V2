package egovframework.omcst.vacation.year.web;

import java.util.List;

import javax.annotation.Resource;
import javax.enterprise.inject.Model;
import javax.servlet.http.HttpServletRequest;

import org.egovframe.rte.fdl.security.userdetails.util.EgovUserDetailsHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.omcst.vacation.year.service.YearVacationService;
import egovframework.omcst.vacation.year.service.YearVacationVO;

@Controller
public class YearVacationController {
	
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;
	
	@Resource(name = "YearVacationService")
	private YearVacationService yearVacationService;
	
	@Autowired
	private DefaultBeanValidator beanValidator;
	
	@RequestMapping("/omcst/yearVacation/selectListYearVacation.do")
	public String selectListYearVacation(@ModelAttribute("searchVO") YearVacationVO yearVacationVO, ModelMap model, HttpServletRequest request) throws Exception {
		
		//20230209 csh 상위 메뉴 지정
		request.getSession().setAttribute("baseMenuNo", "4000000");
		
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		yearVacationVO.setUserId(user.getId());		
		
		List<YearVacationVO> vacationList = yearVacationService.selectListYearVacation(yearVacationVO);
		
		model.addAttribute("list", vacationList);
		return "omcst/vacation/member/YearVacationList";
	}
	
	@GetMapping(value = "/omcst/yearVacation/insertYearVacation.do")
	public String insertYearVacation(@ModelAttribute("yearVacation") YearVacationVO yearVacationVo, BindingResult bindingResult, SessionStatus stats, ModelMap model) throws Exception {		
		return "omcst/vacation/member/YearVacationRegist";		
	}
	
	@PostMapping(value = "/omcst/yearVacation/insertYearVacation.do")
	public String insertYearVacationPost(@ModelAttribute("yearVacationVO") YearVacationVO yearVacationVo, BindingResult bindingResult, SessionStatus stats, ModelMap model) throws Exception {
		
		// Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		
		beanValidator.validate(yearVacationVo, bindingResult);
		
		
		if(bindingResult.hasErrors()) {
			model.addAttribute("yearVacationVo", yearVacationVo);
			return "omcst/vacation/member/YearVacationRegist";
			
			 
		} else {
			LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
			yearVacationVo.setFrstRegisterId(user.getId());
			
			// 저장 처리
			yearVacationService.insertYearVacation(yearVacationVo);
			
			model.addAttribute("message", egovMessageSource.getMessage("success.common.insert"));
			
			
			return "forward:/omcst/yearVacation/selectListYearVacation.do";
		}
	}
	
	@RequestMapping(value = "/omcst/yearVacation/updateYearVacation.do")
	public String updateYearVacation(@RequestParam("checkVcIdForAsk") String checkVcId, ModelMap model) throws Exception {
		// 미인증 사용자에 대한 보안처리
//		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
//    	if(!isAuthenticated) {
//    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
//        	return "uat/uia/EgovLoginUsr";
//    	}
   	 	yearVacationService.updateYearVacation(checkVcId);
		
    	model.addAttribute("resultMsg", "success.common.delete");
		return "forward:/omcst/yearVacation/selectListYearVacation.do";
	}
	
	
	
	@RequestMapping(value = "/omcst/yearVacation/deleteYearVacation.do")
	public String deleteYearVacation(@RequestParam("checkVcIdForDel") String checkVcId, ModelMap model) throws Exception {
		// 미인증 사용자에 대한 보안처리
//		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
//    	if(!isAuthenticated) {
//    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
//        	return "uat/uia/EgovLoginUsr";
//    	}
   	 	yearVacationService.deleteYearVacation(checkVcId);
		
    	model.addAttribute("resultMsg", "success.common.delete");
		return "forward:/omcst/yearVacation/selectListYearVacation.do";
	}
	
	
	
	

}
