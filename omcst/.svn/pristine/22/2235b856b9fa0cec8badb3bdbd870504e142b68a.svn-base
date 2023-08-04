package egovframework.omcst.vacation.year.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.com.cmm.ComDefaultCodeVO;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.let.utl.fcc.service.PageInfoUtil;
import egovframework.omcst.vacation.year.service.YearVacationMngService;
import egovframework.omcst.vacation.year.service.YearVacationVO;

@Controller
public class VacationMngController {
	
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;
	
	@Resource(name = "YearVacationMngService")
	YearVacationMngService yearVacationMngService;
	
	@Resource(name = "EgovCmmUseService")
	private EgovCmmUseService cmmUseService;
	
	@Autowired
	private DefaultBeanValidator beanValidator;
	
	@Autowired
	private PageInfoUtil pageInfoUtil;
	
	@GetMapping("/admin/vacationCheck")
	public String initVacation(@ModelAttribute("searchVO") YearVacationVO yearVacationVO, ModelMap model, HttpServletRequest request) throws Exception {
		// 메뉴 갱신을 위해 추가
		request.getSession().setAttribute("baseMenuNo", "7000000");
		
		//csh 페이징 모듈화
		PaginationInfo paginationInfo= (PaginationInfo) pageInfoUtil.makePaginationInfo(yearVacationVO);
		yearVacationVO = (YearVacationVO) pageInfoUtil.makeObjectVO(paginationInfo, yearVacationVO);
		
		Map<String, Object> map = yearVacationMngService.selectYearVacationMng(yearVacationVO);
		//List<YearVacationVO> mngList = yearVacationMngService.selectListYearVacationMng(yearVacationVO);
		int totCnt = Integer.parseInt((String) map.get("resultCnt"));
		
		paginationInfo.setTotalRecordCount(totCnt);
		
		yearVacationVO.setApply(map.get("apply").toString());
		yearVacationVO.setPass(map.get("pass").toString());
		yearVacationVO.setDeny(map.get("deny").toString());
		
		model.addAttribute("list", map.get("resultList"));
		model.addAttribute("totCnt", map.get("resultCnt"));
		model.addAttribute("yearVacationVO", yearVacationVO);
		model.addAttribute("paginationInfo", paginationInfo);
		
		return "omcst/vacation/admin/VacationCheckMng";
	}
	
	@PostMapping("/admin/updateSignVacation")
	public String updateSignVacation(@RequestParam("checkVcIdForAsk") String checkVcIdForAsk, @RequestParam("forSign") String forSign, ModelMap model) throws Exception{
		
		yearVacationMngService.updateSignYearVacation(checkVcIdForAsk, forSign);
		
		return "redirect:/admin/vacationCheck";
	}
	
	@RequestMapping("/admin/vacationInfo")
	public String initVacationInfo(@ModelAttribute("searchVO") YearVacationVO yearVacationVO, ModelMap model, HttpServletRequest request) throws Exception {
		// 메뉴 갱신을 위해 추가
		request.getSession().setAttribute("baseMenuNo", "7000000");
		
		
		ComDefaultCodeVO vo = new ComDefaultCodeVO();

		//조직정보를 조회 - ORGNZT_ID정보
		vo.setTableNm("LETTNORGNZTINFO");
		model.addAttribute("orgnztId_result", cmmUseService.selectOgrnztIdDetail(vo));
		
		//csh 페이징 모듈화
		PaginationInfo paginationInfo= (PaginationInfo) pageInfoUtil.makePaginationInfo(yearVacationVO);
		yearVacationVO = (YearVacationVO) pageInfoUtil.makeObjectVO(paginationInfo, yearVacationVO);
		
		List<YearVacationVO> resultList= yearVacationMngService.selectListInitVacationInfo(yearVacationVO);
		int totCnt = yearVacationMngService.selectListInitVacationInfoTotCnt(yearVacationVO);
		paginationInfo.setTotalRecordCount(totCnt);
		
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("list",resultList);
		
		
		return "omcst/vacation/admin/VacationInfoMng";
	}
	
	@RequestMapping("/admin/vacationUpdate")
	public String vacationUpdate(@RequestParam("checkVcIdForAsk") String checkVcIdForAsk,@ModelAttribute("searchVO") YearVacationVO yearVacationVO, Model model) throws Exception{
		yearVacationMngService.vacationUpdate(checkVcIdForAsk, yearVacationVO);
		model.addAttribute("resultMsg", "success.common.update");
		return "redirect:/admin/vacationInfo";
	}
}
