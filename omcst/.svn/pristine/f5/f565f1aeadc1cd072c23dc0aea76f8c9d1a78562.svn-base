package egovframework.omcst.vacation.year.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.egovframe.rte.fdl.security.userdetails.util.EgovUserDetailsHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.omcst.vacation.year.service.YearVacationMngService;
import egovframework.omcst.vacation.year.service.YearVacationVO;

@Controller
public class YearVacationMngController {
	
	@Resource(name = "YearVacationMngService")
	private YearVacationMngService yearVacationMngService;
	
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;
	
	
	@RequestMapping("/omcst/yearVacationMng/selectListYearVacation.do")
	public String selectListYearVacationMng(@ModelAttribute("searchVO") YearVacationVO mngVo, HttpServletRequest request, ModelMap model) throws Exception {
		
		//20230209 csh 상위 메뉴 지정
		request.getSession().setAttribute("baseMenuNo", "4000000");
		
		List<YearVacationVO> mngList = yearVacationMngService.selectListYearVacationMng(mngVo);
		
		model.addAttribute("list", mngList);
		
		
		return "omcst/vacation/admin/YearVacationMngList";
	}
	
	
	@RequestMapping(value = "/omcst/yearVacationMng/updateSignYearVacation.do")
	public String updateSignYearVacation(@RequestParam("checkVcIdForAsk") String checkVcIdForAsk, @RequestParam("forSign") String forSign, ModelMap model) throws Exception {
		// 미인증 사용자에 대한 보안처리
//		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
//    	if(!isAuthenticated) {
//    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
//        	return "uat/uia/EgovLoginUsr";
//    	}
    	yearVacationMngService.updateSignYearVacation(checkVcIdForAsk, forSign);
		
    	model.addAttribute("resultMsg", "success.common.delete");
		return "forward:/omcst/yearVacationMng/selectListYearVacation.do";
	}
	
	
	

}
