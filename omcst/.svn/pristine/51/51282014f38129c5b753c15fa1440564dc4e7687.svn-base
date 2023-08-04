package egovframework.omcst.business.project.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.let.utl.fcc.service.PageInfoUtil;
import egovframework.omcst.business.project.service.ProjectService;
import egovframework.omcst.business.project.service.ProjectVO;

@Controller
public class ProjectController {

	
	@Resource(name = "ProjectService") 
	private ProjectService projectService;
	
	@Autowired
    private PageInfoUtil pageInfoUtil;
	

	@RequestMapping("/omcst/business/selectListProject.do")
	public String selectListProject(@ModelAttribute("projectVO") ProjectVO projectVO, ModelMap model, HttpServletRequest request) throws Exception {

		request.getSession().setAttribute("baseMenuNo", "1100000");
		
		PaginationInfo paginationInfo = (PaginationInfo) pageInfoUtil.makePaginationInfo(projectVO);
		projectVO = (ProjectVO) pageInfoUtil.makeObjectVO(paginationInfo, projectVO);
		
		int totCnt = projectService.selectListProjectTotCnt(projectVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		
		List<ProjectVO> clientList = projectService.selectListclient(projectVO);
		model.addAttribute("clientList", clientList);

		
		List<ProjectVO> projectList = projectService.selectListProject(projectVO);
		model.addAttribute("projectList", projectList);
		
		
		if(projectVO.getClientNo() != 0) {
			projectVO.setSearchCondition("0");
			List<ProjectVO> departmentList = projectService.SearchSelectBoxInfo(projectVO);
			model.addAttribute("departmentList", departmentList);
		}
		if(projectVO.getDepartmentNo() != 0) {
			projectVO.setSearchCondition("1");
			List<ProjectVO> projectNmList = projectService.SearchSelectBoxInfo(projectVO);
			model.addAttribute("projectNmList", projectNmList);
		}
		
		return "omcst/business/ProjectList";
	}
	
    /**
	 * 프로젝트 생성 팝업
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping("/omcst/business/InsertProject.do")
    public String selectGroupSearchView(@ModelAttribute("projectVO") ProjectVO projectVO, ModelMap model)
            throws Exception {
    	model.addAttribute("projectVO", new ProjectVO());
        return "/omcst/business/ProjectInsert";
    } 
    
    /**
	 * 프로젝트 생성 팝업
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping("/omcst/business/SelectClientListPop.do")
    public String selectClientListPop(@ModelAttribute("projectVO") ProjectVO projectVO, ModelMap model)
            throws Exception {
    	model.addAttribute("projectVO", new ProjectVO());
        return "/omcst/business/ClientListPop";
    }
    
	
	@RequestMapping(value = "/omcst/business/SearchSelectBoxInfo.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<List<ProjectVO>> SearchSelectBoxInfo(@RequestBody ProjectVO projectVO) throws Exception  {
		List<ProjectVO> selectBoxInfo = projectService.SearchSelectBoxInfo(projectVO);
		System.out.println("!");
		return ResponseEntity.ok().body(selectBoxInfo);
	}
}
