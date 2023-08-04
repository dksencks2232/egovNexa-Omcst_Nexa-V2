package egovframework.omcst.code.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.com.cmm.LoginVO;
import egovframework.let.sym.ccm.ccc.service.EgovCcmCmmnClCodeManageService;
import egovframework.let.utl.fcc.service.PageInfoUtil;
import egovframework.omcst.code.service.CommCodeMngService;
import egovframework.omcst.code.vo.CodeVO;
import egovframework.omcst.code.vo.CommCodeVO;

/**
 *
 * 공통코드에 관한 요청을 받아 서비스 클래스로 요청을 전달하고 서비스클래스에서 처리한 결과를 웹 화면으로 전달을 위한 Controller를 정의한다
 * @author 공통서비스 개발팀 이중호
 * @since 2009.04.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2009.04.01  이중호          최초 생성
 *   2011.08.31  JJY            경량환경 템플릿 커스터마이징버전 생성
 *
 * </pre>
 */
@Controller
public class CommCodeMngController {

	@Resource(name = "CommCodeMngService")
    private CommCodeMngService commCodeMngService;

	@Resource(name = "CmmnClCodeManageService")
    private EgovCcmCmmnClCodeManageService cmmnClCodeManageService;

    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;

	@Autowired
	private DefaultBeanValidator beanValidator;
	
	@Autowired
	private PageInfoUtil pageInfoUtil;

    /**
	 * 공통코드 목록을 조회한다.
     * @param loginVO
     * @param searchVO
     * @param model
     * @return "/omcst/code/CommCodeMng"
     * @throws Exception
     */
    @GetMapping(value="commCodeMng")
	public String selectCommCodeList (@ModelAttribute("loginVO") LoginVO loginVO
			, @ModelAttribute("searchVO") CommCodeVO searchVO
			, ModelMap model, HttpServletRequest request
			) throws Exception {
    	
    	//메뉴 갱신을 위해 추가
    	request.getSession().setAttribute("baseMenuNo", "6000000");
    	
    	/** EgovPropertyService.sample */
    	searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
    	searchVO.setPageSize(propertiesService.getInt("pageSize"));

    	/** pageing */
    	//csh 페이징 모듈화
    	PaginationInfo paginationInfo= (PaginationInfo) pageInfoUtil.makePaginationInfo(searchVO);
    	searchVO = (CommCodeVO) pageInfoUtil.makeObjectVO(paginationInfo, searchVO);

        model.addAttribute("resultList", commCodeMngService.selectCommCodeList(searchVO));

        int totCnt =commCodeMngService.selectCommCodeListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);

        return "/omcst/code/CommCodeMng";
	}
    
    @GetMapping(value="commCodeDetail")
	public String selectCommCodeDetail (@ModelAttribute("cmmnCode") CodeVO searchVO, ModelMap model) throws Exception {
    	CodeVO result = commCodeMngService.selectCommCodeDetail(searchVO);
    	model.addAttribute("cmmnCode", result);
    	return "/omcst/code/CommCodeDetail";
    }    

    @PostMapping(value="commCodeDetail")
	public String initCommCodeDetail (@ModelAttribute("cmmnCode") CodeVO searchVO, ModelMap model) throws Exception {
    	CodeVO result = new CodeVO();
    	model.addAttribute("cmmnCode", result);
    	return "/omcst/code/CommCodeDetail";
    }    
    
	/**
	 * 공통코드를 수정한다.
	 * @param loginVO
	 * @param codeVO
	 * @param bindingResult
	 * @param commandMap
	 * @param model
	 * @return "/cmm/sym/ccm/EgovCcmCommCodeModify"
	 * @throws Exception
	 */
    @PostMapping(value="commCodeInfo")
	public String updateCommCode (@RequestParam(value="codeId", required=false) String codeId, ModelMap model) throws Exception {
		
    	return "/omcst/code/CommCodeInfo";
    }
    
	/**
	 * 공통코드를 삭제한다.
	 * @param loginVO
	 * @param codeVO
	 * @param model
	 * @return "forward:commCodeMng"
	 * @throws Exception
	 */
    @DeleteMapping(value="commCodeInfo")
	public String deleteCommCode (@ModelAttribute("loginVO") LoginVO loginVO
			, CodeVO codeVO
			, ModelMap model
			) throws Exception {
    	commCodeMngService.deleteCommCode(codeVO);
        return "forward:commCodeMng";
	}
}