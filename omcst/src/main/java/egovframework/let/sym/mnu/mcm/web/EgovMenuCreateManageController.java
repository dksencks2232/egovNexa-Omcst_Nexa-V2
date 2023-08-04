package egovframework.let.sym.mnu.mcm.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.fdl.security.userdetails.util.EgovUserDetailsHelper;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.com.cmm.ComDefaultVO;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.let.sym.log.clg.service.LoginLog;
import egovframework.let.sym.mnu.mcm.service.EgovMenuCreateManageService;
import egovframework.let.sym.mnu.mcm.service.MenuCreatVO;
import egovframework.let.utl.fcc.service.PageInfoUtil;

/**
 * 메뉴목록 관리및 메뉴생성, 사이트맵 생성을 처리하는 비즈니스 구현 클래스
 *
 * @author 개발환경 개발팀 이용
 * @since 2009.06.01
 * @version 1.0
 * @see <pre>
 * &lt;&lt; 개정이력(Modification Information) &gt;&gt;
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2009.03.20  이  용          최초 생성
 * 	 2011.07.29	 서준식          사이트맵 저장경로 수정
 *   2011.08.31  JJY            경량환경 템플릿 커스터마이징버전 생성
 *
 * </pre>
 */

@Controller
public class EgovMenuCreateManageController {

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/** EgovMenuManageService */
	@Resource(name = "meunCreateManageService")
	private EgovMenuCreateManageService menuCreateManageService;

	/** EgovMessageSource */
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;
	
	@Autowired
	private PageInfoUtil pageInfoUtil;

	/*********** 메뉴 생성 관리 ***************/

	/**
	 * *메뉴생성목록을 조회한다.
	 *
	 * @param searchVO
	 *            ComDefaultVO
	 * @return 출력페이지정보 "sym/mnu/mcm/EgovMenuCreatManage"
	 * @exception Exception
	 */
	@RequestMapping(value = "/sym/mnu/mcm/EgovMenuCreatManageSelect.do")
	public String selectMenuCreatManagList(@ModelAttribute("searchVO") ComDefaultVO searchVO, ModelMap model, HttpServletRequest request) throws Exception {
		
		// 메뉴 갱신을 위해 추가
		request.getSession().setAttribute("baseMenuNo", "6000000");
		
		String resultMsg = "";
		// 내역 조회
		/** EgovPropertyService.sample */
		searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
		searchVO.setPageSize(propertiesService.getInt("pageSize"));

		/** pageing */
		//csh 페이징 모듈화
		PaginationInfo paginationInfo= (PaginationInfo) pageInfoUtil.makePaginationInfo(searchVO);
		searchVO = (ComDefaultVO) pageInfoUtil.makeObjectVO(paginationInfo, searchVO);
		
		if (searchVO.getSearchKeyword() != null && !searchVO.getSearchKeyword().equals("")) {
			int IDcnt = menuCreateManageService.selectUsrByPk(searchVO);
			if (IDcnt == 0) {
				resultMsg = egovMessageSource.getMessage("info.nodata.msg");
			} else {
				/* AuthorCode 검색 */
				MenuCreatVO vo = new MenuCreatVO();
				vo = menuCreateManageService.selectAuthorByUsr(searchVO);
				searchVO.setSearchKeyword(vo.getAuthorCode());
			}
		}
		model.addAttribute("list_menumanage", menuCreateManageService.selectMenuCreatManagList(searchVO));

		int totCnt = menuCreateManageService.selectMenuCreatManagTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("resultMsg", resultMsg);
		return "sym/mnu/mcm/EgovMenuCreatManage";
	}

	/* 메뉴생성 세부조회 */
	/**
	 * 메뉴생성 세부화면을 조회한다.
	 *
	 * @param menuCreatVO
	 *            MenuCreatVO
	 * @return 출력페이지정보 "sym/mnu/mcm/EgovMenuCreat"
	 * @exception Exception
	 */
	@RequestMapping(value = "/sym/mnu/mcm/EgovMenuCreatSelect.do")
	public String selectMenuCreatList(@ModelAttribute("menuCreatVO") MenuCreatVO menuCreatVO, ModelMap model) throws Exception {
		model.addAttribute("list_menulist", menuCreateManageService.selectMenuCreatList(menuCreatVO));
		model.addAttribute("resultVO", menuCreatVO);

		return "sym/mnu/mcm/EgovMenuCreat";
	}

	/**
	 * 메뉴생성처리 및 메뉴생성내역을 등록한다.
	 *
	 * @param checkedAuthorForInsert
	 *            String
	 * @param checkedMenuNoForInsert
	 *            String
	 * @return 출력페이지정보 등록처리시 "forward:/sym/mnu/mcm/EgovMenuCreatSelect.do"
	 * @exception Exception
	 */
	@RequestMapping("/sym/mnu/mcm/EgovMenuCreatInsert.do")
	public String insertMenuCreatList(@RequestParam("checkedAuthorForInsert") String checkedAuthorForInsert, @RequestParam("checkedMenuNoForInsert") String checkedMenuNoForInsert,
			@ModelAttribute("menuCreatVO") MenuCreatVO menuCreatVO, ModelMap model) throws Exception {
		String resultMsg = "";
		String[] insertMenuNo = checkedMenuNoForInsert.split(",");
		
		if (insertMenuNo == null || (insertMenuNo.length == 0)) {
			resultMsg = "fail.common.insert";
		} else {
			menuCreateManageService.insertMenuCreatList(checkedAuthorForInsert, checkedMenuNoForInsert);
			resultMsg = "success.common.insert";
		}
		
		model.addAttribute("resultMsg", egovMessageSource.getMessage(resultMsg));
		return "forward:/sym/mnu/mcm/EgovMenuCreatSelect.do";
	}
	
	@RequestMapping("/sym/mnu/mcm/EgovMenuCreatDelete.do")
	public String deleteMenuCreatList(@ModelAttribute("menuCreatVO") MenuCreatVO menuCreatVO, ModelMap model) throws Exception {
		menuCreateManageService.deleteMenuCreat(menuCreatVO);
		model.addAttribute("resultMsg", egovMessageSource.getMessage("success.common.delete"));
		return "forward:/sym/mnu/mcm/EgovMenuCreatSelect.do";
	}	

}
