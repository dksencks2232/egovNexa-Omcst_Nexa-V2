package egovframework.omcst.vacation.year.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.egovframe.rte.fdl.security.userdetails.util.EgovUserDetailsHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.omcst.vacation.year.service.YearVacationService;
import egovframework.omcst.vacation.year.service.YearVacationVO;

@Controller
public class VacationController {
	
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;
	
	@Resource(name="YearVacationService")
	private YearVacationService yearVacationService;
	
	@Autowired
	private DefaultBeanValidator beanValidator;
	
	@GetMapping("/vacation")
	public String initVacation(@ModelAttribute("searchVO") YearVacationVO yearVacationVO, ModelMap model, HttpServletRequest request) throws Exception {
		// 메뉴 갱신을 위해 추가
		request.getSession().setAttribute("baseMenuNo", "7000000");
		
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		yearVacationVO.setUserId(user.getId());
		
		//List<YearVacationVO> vacationList= yearVacationService.selectListYearVacation(yearVacationVO);
		
		//model.addAttribute("list", vacationList);
		
		Map<String, Object> map = yearVacationService.selectYearVacations(yearVacationVO);
		yearVacationVO.setTotaldaycnt(Integer.parseInt((String) map.get("totaldaycnt")));
		yearVacationVO.setUsedaycnt(Integer.parseInt((String) map.get("usedaycnt")));
		yearVacationVO.setNowdaycnt(Integer.parseInt((String) map.get("nowdaycnt")));
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("yearVacationVO",yearVacationVO);
		
		System.out.println("totaldaycnt= "+ yearVacationVO.getTotaldaycnt());
		System.out.println("usedaycnt= "+ yearVacationVO.getUsedaycnt());
		System.out.println("nowdaycnt= "+ yearVacationVO.getNowdaycnt());
		
		return "omcst/vacation/member/Vacation";
	}
	
	@GetMapping("/vacationInfo")
	public String initVacationInfo(@ModelAttribute("searchVO") YearVacationVO yearVacationVo, ModelMap model, HttpServletRequest request) throws Exception {
		model.addAttribute("vcday",yearVacationVo);
		return "omcst/vacation/member/VacationInfo";
	}
	
	@PostMapping("/vacationInfo")
	public String insertVacation(@ModelAttribute("yearVacationVO") YearVacationVO yearVacationVo, ModelMap model)throws Exception{
		
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		yearVacationVo.setFrstRegisterId(user.getId());
		
		yearVacationService.insertYearVacation(yearVacationVo);
		
		model.addAttribute("message", egovMessageSource.getMessage("success.common.insert"));
		
		return "redirect:/vacation";
	}
	
	@PostMapping("/deleteVacation")
	public String deleteVacation(@RequestParam("checkVcIdForDel") String checkVcId, ModelMap model) throws Exception{
		
		// 미인증 사용자에 대한 보안처리
//		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
//		if(!isAuthenticated) {
//			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
//			return "uat/uia/EgovLoginUsr";
//		}
		yearVacationService.deleteYearVacation(checkVcId);
		
		return "redirect:/vacation";
	}
	
	@GetMapping("/vacationCheck")
	public String initVacationCheck(@ModelAttribute("searchVO") YearVacationVO yearVacationVO, ModelMap model, HttpServletRequest request) throws Exception {
		// 메뉴 갱신을 위해 추가
		request.getSession().setAttribute("baseMenuNo", "7000000");
		return "omcst/vacation/member/VacationCheck";
	}
	
	@GetMapping("/vacationStatus")
	public String selectListYearVacation(@ModelAttribute("searchVO") YearVacationVO yearVacationVO, ModelMap model, HttpServletRequest request) throws Exception {
		// 메뉴 갱신을 위해 추가
		request.getSession().setAttribute("baseMenuNo", "7000000");
		return "omcst/vacation/member/VacationStatus";
	}	
}
