package egovframework.let.cop.bbs.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.InetAddress;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.codehaus.jackson.map.ObjectMapper;
import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.fdl.security.userdetails.util.EgovUserDetailsHelper;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.com.cmm.service.FileVO;
import egovframework.let.cop.bbs.service.Board;
import egovframework.let.cop.bbs.service.BoardMaster;
import egovframework.let.cop.bbs.service.BoardMasterVO;
import egovframework.let.cop.bbs.service.BoardVO;
import egovframework.let.cop.bbs.service.EgovBBSAttributeManageService;
import egovframework.let.cop.bbs.service.EgovBBSManageService;
import egovframework.let.utl.fcc.service.PageInfoUtil;

/**
 * 게시물 관리를 위한 컨트롤러 클래스
 * @author 공통 서비스 개발팀 이삼섭
 * @since 2009.03.19
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자          수정내용
 *  -------    --------    ---------------------------
 *  2009.03.19  이삼섭          최초 생성
 *  2009.06.29  한성곤	       2단계 기능 추가 (댓글관리, 만족도조사)
 *  2011.08.31  JJY            경량환경 템플릿 커스터마이징버전 생성
 *
 *  </pre>
 */
@Controller
public class EgovBBSManageController {

	@Resource(name = "EgovBBSManageService")
	private EgovBBSManageService bbsMngService;

	@Resource(name = "EgovBBSAttributeManageService")
	private EgovBBSAttributeManageService bbsAttrbService;

	@Resource(name = "EgovFileMngService")
	private EgovFileMngService fileMngService;

	@Resource(name = "EgovFileMngUtil")
	private EgovFileMngUtil fileUtil;

	@Resource(name = "propertiesService")
	protected EgovPropertyService propertyService;

	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;

	@Autowired
	private DefaultBeanValidator beanValidator;
	
	@Autowired
	private PageInfoUtil  pageInfoUtil;

	String TEMP_DIR = "";
	String COPY_DIR = "";
	
	/**
	 * XSS 방지 처리.
	 *
	 * @param data
	 * @return
	 */
	protected String unscript(String data) {
		if (data == null || data.trim().equals("")) {
			return "";
		}

		String ret = data;

		ret = ret.replaceAll("<(S|s)(C|c)(R|r)(I|i)(P|p)(T|t)", "&lt;script");
		ret = ret.replaceAll("</(S|s)(C|c)(R|r)(I|i)(P|p)(T|t)", "&lt;/script");

		ret = ret.replaceAll("<(O|o)(B|b)(J|j)(E|e)(C|c)(T|t)", "&lt;object");
		ret = ret.replaceAll("</(O|o)(B|b)(J|j)(E|e)(C|c)(T|t)", "&lt;/object");

		ret = ret.replaceAll("<(A|a)(P|p)(P|p)(L|l)(E|e)(T|t)", "&lt;applet");
		ret = ret.replaceAll("</(A|a)(P|p)(P|p)(L|l)(E|e)(T|t)", "&lt;/applet");

		ret = ret.replaceAll("<(E|e)(M|m)(B|b)(E|e)(D|d)", "&lt;embed");
		ret = ret.replaceAll("</(E|e)(M|m)(B|b)(E|e)(D|d)", "&lt;embed");

		ret = ret.replaceAll("<(F|f)(O|o)(R|r)(M|m)", "&lt;form");
		ret = ret.replaceAll("</(F|f)(O|o)(R|r)(M|m)", "&lt;form");

		return ret;
	}

	/**
	 * 게시물에 대한 목록을 조회한다.
	 *
	 * @param boardVO
	 * @param sessionVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/cop/bbs/selectBoardList.do")
	public String selectBoardArticles(@ModelAttribute("searchVO") BoardVO boardVO, ModelMap model, HttpServletRequest request) throws Exception {
		// 메인화면에서 넘어온 경우 메뉴 갱신을 위해 추가
		request.getSession().setAttribute("baseMenuNo", "1000000");

		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		String uniqId = user.getUniqId();
		String role= bbsAttrbService.selectUserRole(uniqId);
		
		//관리자 게시판 수정 삭제기능 오픈 위한 권한 세션 추가
		request.getSession().setAttribute("role",role);
		
		boardVO.setBbsId(boardVO.getBbsId());
		boardVO.setBbsNm(boardVO.getBbsNm());

		BoardMasterVO vo = new BoardMasterVO();

		vo.setBbsId(boardVO.getBbsId());
		vo.setUniqId(user.getUniqId());

		BoardMasterVO master = bbsAttrbService.selectBBSMasterInf(vo);

		//-------------------------------
		// 방명록이면 방명록 URL로 forward
		//-------------------------------
		if (master.getBbsTyCode().equals("BBST04")) {
			return "forward:/cop/bbs/selectGuestList.do";
		}
		////-----------------------------
		
		//갤러리게시판 페이징 처리
		if (master.getBbsAttrbCode().equals("BBSA02")) {
			boardVO.setRecordCountPerPage(12);
		}
		
		boardVO.setPageUnit(propertyService.getInt("pageUnit"));
		boardVO.setPageSize(propertyService.getInt("pageSize"));

		//csh 페이징 모듈화
		PaginationInfo paginationInfo= (PaginationInfo) pageInfoUtil.makePaginationInfo(boardVO);
		boardVO = (BoardVO) pageInfoUtil.makeObjectVO(paginationInfo, boardVO);

		Map<String, Object>map = bbsMngService.selectBoardArticles(boardVO, master.getBbsAttrbCode());
		int totCnt = Integer.parseInt((String) map.get("resultCnt"));

		paginationInfo.setTotalRecordCount(totCnt);

		/*
		// 기본 BBS template 지정
		if (master.getTmplatCours() == null || master.getTmplatCours().equals("")) {
			master.setTmplatCours("/css/egovframework/cop/bbs/egovBaseTemplate.css");
		}
		*/

		model.addAttribute("resultList", map.get("resultList"));
		model.addAttribute("resultCnt", map.get("resultCnt"));
		model.addAttribute("boardVO", boardVO);
		model.addAttribute("brdMstrVO", master);
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("fixedList", map.get("fixedList"));
		return "cop/bbs/EgovNoticeList";
	}
	
	@RequestMapping("/cop/bbs/selectGalleryList.do")
	public String selectGalleryList(@ModelAttribute("searchVO") BoardVO boardVO, ModelMap model, HttpServletRequest request) throws Exception {
		// 메인화면에서 넘어온 경우 메뉴 갱신을 위해 추가
		request.getSession().setAttribute("baseMenuNo", "1000000");

		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		
		String uniqId = user.getUniqId();
		String role= bbsAttrbService.selectUserRole(uniqId);
		
		//관리자 게시판 수정 삭제기능 오픈 위한 권한 세션 추가
		request.getSession().setAttribute("role",role);
		
		boardVO.setBbsId(boardVO.getBbsId());
		boardVO.setBbsNm(boardVO.getBbsNm());

		BoardMasterVO vo = new BoardMasterVO();

		vo.setBbsId(boardVO.getBbsId());
		vo.setUniqId(user.getUniqId());

		BoardMasterVO master = bbsAttrbService.selectBBSMasterInf(vo);

		//갤러리게시판 페이징 처리
		boardVO.setPageUnit(12);
		boardVO.setPageSize(propertyService.getInt("pageSize"));

		//csh 페이징 모듈화
		PaginationInfo paginationInfo= (PaginationInfo) pageInfoUtil.makePaginationInfo(boardVO);
		boardVO = (BoardVO) pageInfoUtil.makeObjectVO(paginationInfo, boardVO);

		Map<String, Object> map = bbsMngService.selectBoardArticles(boardVO, master.getBbsAttrbCode());
		int totCnt = Integer.parseInt((String) map.get("resultCnt"));

		paginationInfo.setTotalRecordCount(totCnt);

		model.addAttribute("resultList", map.get("resultList"));
		model.addAttribute("resultCnt", map.get("resultCnt"));
		model.addAttribute("boardVO", boardVO);
		model.addAttribute("brdMstrVO", master);
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("fixedList", map.get("fixedList"));
		return "cop/bbs/EgovGalleryList";
	}	

	/**
	 * 게시물에 대한 상세 정보를 조회한다.
	 *
	 * @param boardVO
	 * @param sessionVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/cop/bbs/selectBoardArticle.do")
	public String selectBoardArticle(@ModelAttribute("searchVO") BoardVO boardVO, ModelMap model) throws Exception {
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		
		// 조회수 증가 여부 지정
		boardVO.setPlusCount(true);

		if (!boardVO.getSubPageIndex().equals("")) {
			boardVO.setPlusCount(false);
		}
		////-------------------------------

		boardVO.setLastUpdusrId(user.getUniqId());
		BoardVO vo = bbsMngService.selectBoardArticle(boardVO);

		model.addAttribute("result", vo);
		model.addAttribute("sessionUniqId", user.getUniqId());

		//----------------------------
		// template 처리 (기본 BBS template 지정  포함)
		//----------------------------
		BoardMasterVO master = new BoardMasterVO();
		master.setBbsId(boardVO.getBbsId());
		master.setUniqId(user.getUniqId());

		BoardMasterVO masterVo = bbsAttrbService.selectBBSMasterInf(master);

		/*
		if (masterVo.getTmplatCours() == null || masterVo.getTmplatCours().equals("")) {
			masterVo.setTmplatCours("/css/egovframework/cop/bbs/egovBaseTemplate.css");
		}
		*/
		model.addAttribute("brdMstrVO", masterVo);

		return "cop/bbs/EgovNoticeInqire";
	}

	/**
	 * 게시물 등록을 위한 등록페이지로 이동한다.
	 *
	 * @param boardVO
	 * @param sessionVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/cop/bbs/addBoardArticle.do")
	public String addBoardArticle(@ModelAttribute("searchVO") BoardVO boardVO, ModelMap model) throws Exception {
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

		BoardMasterVO bdMstr = new BoardMasterVO();

		if (isAuthenticated) {

			BoardMasterVO vo = new BoardMasterVO();
			vo.setBbsId(boardVO.getBbsId());
			vo.setUniqId(user.getUniqId());

			bdMstr = bbsAttrbService.selectBBSMasterInf(vo);
			model.addAttribute("bdMstr", bdMstr);
		}

		//----------------------------
		// 기본 BBS template 지정
		//----------------------------
		if (bdMstr.getTmplatCours() == null || bdMstr.getTmplatCours().equals("")) {
			bdMstr.setTmplatCours("/css/egovframework/cop/bbs/egovBaseTemplate.css");
		}

		model.addAttribute("brdMstrVO", bdMstr);
		////-----------------------------

		return "cop/bbs/EgovNoticeRegist";
	}

	/**
	 * 게시물을 등록한다.
	 *
	 * @param boardVO
	 * @param board
	 * @param sessionVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/cop/bbs/insertBoardArticle.do")
	public String insertBoardArticle(final MultipartHttpServletRequest multiRequest, 
									@ModelAttribute("searchVO") BoardVO boardVO, @ModelAttribute("board") Board board, 
									BindingResult bindingResult, ModelMap model) throws Exception {

		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

		beanValidator.validate(board, bindingResult);
		if (bindingResult.hasErrors()) {

			BoardMasterVO master = new BoardMasterVO();
			BoardMasterVO vo = new BoardMasterVO();

			vo.setBbsId(boardVO.getBbsId());
			vo.setUniqId(user.getUniqId());

			master = bbsAttrbService.selectBBSMasterInf(vo);

			model.addAttribute("bdMstr", master);
			model.addAttribute("brdMstrVO", master);
			/*
			// 기본 BBS template 지정
			if (master.getTmplatCours() == null || master.getTmplatCours().equals("")) {
				master.setTmplatCours("/css/egovframework/cop/bbs/egovBaseTemplate.css");
			}
			*/
			
			return "cop/bbs/EgovNoticeRegist";
		}

		if (isAuthenticated) {
			List<FileVO> result = null;
			String atchFileId = "";

			final Map<String, MultipartFile> files = multiRequest.getFileMap();
			if (!files.isEmpty()) {
				result = fileUtil.parseFileInf(files, "BBS_", 0, "", "");
				atchFileId = fileMngService.insertFileInfs(result);
			}
			board.setAtchFileId(atchFileId);
			board.setFrstRegisterId(user.getUniqId());
			board.setBbsId(board.getBbsId());

			board.setNtcrNm(""); // dummy 오류 수정 (익명이 아닌 경우 validator 처리를 위해 dummy로 지정됨)
			board.setPassword(""); // dummy 오류 수정 (익명이 아닌 경우 validator 처리를 위해 dummy로 지정됨)

			board.setNttCn(unscript(board.getNttCn())); // XSS 방지

			Board bo = bbsMngService.insertBoardArticle(board);
			
			//게시물 등록후 게시물 확인
			boardVO.setPlusCount(false);
			boardVO.setBbsId(bo.getBbsId());
			boardVO.setNttId(bo.getNttId());
			
			BoardVO vo = bbsMngService.selectBoardArticle(boardVO);
			
			model.addAttribute("result", vo);
			model.addAttribute("sessionUniqId", user.getUniqId());
			
		}

		return "cop/bbs/EgovNoticeInqire";
	}

	/**
	 * 게시물에 대한 답변 등록을 위한 등록페이지로 이동한다.
	 *
	 * @param boardVO
	 * @param sessionVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/cop/bbs/addReplyBoardArticle.do")
	public String addReplyBoardArticle(@ModelAttribute("searchVO") BoardVO boardVO, ModelMap model) throws Exception {
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();

		BoardMasterVO master = new BoardMasterVO();
		BoardMasterVO vo = new BoardMasterVO();

		vo.setBbsId(boardVO.getBbsId());
		vo.setUniqId(user.getUniqId());

		master = bbsAttrbService.selectBBSMasterInf(vo);

		model.addAttribute("bdMstr", master);
		model.addAttribute("result", boardVO);

		//----------------------------
		// 기본 BBS template 지정
		//----------------------------
		if (master.getTmplatCours() == null || master.getTmplatCours().equals("")) {
			master.setTmplatCours("/css/egovframework/cop/bbs/egovBaseTemplate.css");
		}

		model.addAttribute("brdMstrVO", master);
		////-----------------------------

		return "cop/bbs/EgovNoticeReply";
	}

	/**
	 * 게시물에 대한 답변을 등록한다.
	 *
	 * @param boardVO
	 * @param board
	 * @param sessionVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/cop/bbs/replyBoardArticle.do")
	public String replyBoardArticle(final MultipartHttpServletRequest multiRequest, @ModelAttribute("searchVO") BoardVO boardVO, @ModelAttribute("bdMstr") BoardMaster bdMstr,
			@ModelAttribute("board") Board board, BindingResult bindingResult, ModelMap model, SessionStatus status) throws Exception {

		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

		beanValidator.validate(board, bindingResult);
		if (bindingResult.hasErrors()) {
			BoardMasterVO master = new BoardMasterVO();
			BoardMasterVO vo = new BoardMasterVO();

			vo.setBbsId(boardVO.getBbsId());
			vo.setUniqId(user.getUniqId());

			master = bbsAttrbService.selectBBSMasterInf(vo);

			model.addAttribute("bdMstr", master);
			model.addAttribute("result", boardVO);

			//----------------------------
			// 기본 BBS template 지정
			//----------------------------
			if (master.getTmplatCours() == null || master.getTmplatCours().equals("")) {
				master.setTmplatCours("/css/egovframework/cop/bbs/egovBaseTemplate.css");
			}

			model.addAttribute("brdMstrVO", master);
			////-----------------------------

			return "cop/bbs/EgovNoticeReply";
		}

		if (isAuthenticated) {
			final Map<String, MultipartFile> files = multiRequest.getFileMap();
			String atchFileId = "";

			if (!files.isEmpty()) {
				List<FileVO> result = fileUtil.parseFileInf(files, "BBS_", 0, "", "");
				atchFileId = fileMngService.insertFileInfs(result);
			}

			board.setAtchFileId(atchFileId);
			board.setReplyAt("Y");
			board.setFrstRegisterId(user.getUniqId());
			board.setBbsId(board.getBbsId());
			board.setParnts(Long.toString(boardVO.getNttId()));
			board.setSortOrdr(boardVO.getSortOrdr());
			board.setReplyLc(Integer.toString(Integer.parseInt(boardVO.getReplyLc()) + 1));

			board.setNtcrNm(""); // dummy 오류 수정 (익명이 아닌 경우 validator 처리를 위해 dummy로 지정됨)
			board.setPassword(""); // dummy 오류 수정 (익명이 아닌 경우 validator 처리를 위해 dummy로 지정됨)

			board.setNttCn(unscript(board.getNttCn())); // XSS 방지

			Board bo = bbsMngService.insertBoardArticle(board);
			
			//답변 등록 후  답변확인
			boardVO.setPlusCount(false);
			boardVO.setBbsId(bo.getBbsId());
			boardVO.setNttId(bo.getNttId());
			
			BoardVO vo = bbsMngService.selectBoardArticle(boardVO);
			
			model.addAttribute("result", vo);
			model.addAttribute("sessionUniqId", user.getUniqId());
		}

		//return "forward:/cop/bbs/selectBoardList.do";
		return "cop/bbs/EgovNoticeInqire";
	}

	/**
	 * 게시물 수정을 위한 수정페이지로 이동한다.
	 *
	 * @param boardVO
	 * @param vo
	 * @param sessionVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/cop/bbs/forUpdateBoardArticle.do")
	public String selectBoardArticleForUpdt(@ModelAttribute("searchVO") BoardVO boardVO, @ModelAttribute("board") BoardVO vo, ModelMap model) throws Exception {

		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

		boardVO.setFrstRegisterId(user.getUniqId());

		BoardMaster master = new BoardMaster();
		BoardMasterVO bmvo = new BoardMasterVO();
		BoardVO bdvo = new BoardVO();

		vo.setBbsId(boardVO.getBbsId());

		master.setBbsId(boardVO.getBbsId());
		master.setUniqId(user.getUniqId());

		if (isAuthenticated) {
			bmvo = bbsAttrbService.selectBBSMasterInf(master);
			bdvo = bbsMngService.selectBoardArticle(boardVO);
			bdvo.setNttCn(unscript(bdvo.getNttCn()));
		}

		model.addAttribute("result", bdvo);
		model.addAttribute("bdMstr", bmvo);

		//----------------------------
		// 기본 BBS template 지정
		//----------------------------
		if (bmvo.getTmplatCours() == null || bmvo.getTmplatCours().equals("")) {
			bmvo.setTmplatCours("/css/egovframework/cop/bbs/egovBaseTemplate.css");
		}

		model.addAttribute("brdMstrVO", bmvo);
		////-----------------------------

		return "cop/bbs/EgovNoticeUpdt";
	}

	/**
	 * 게시물에 대한 내용을 수정한다.
	 *
	 * @param boardVO
	 * @param board
	 * @param sessionVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/cop/bbs/updateBoardArticle.do")
	public String updateBoardArticle(final MultipartHttpServletRequest multiRequest, @ModelAttribute("searchVO") BoardVO boardVO, @ModelAttribute("bdMstr") BoardMaster bdMstr,
			@ModelAttribute("board") Board board, BindingResult bindingResult, ModelMap model, SessionStatus status) throws Exception {

		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

		String atchFileId = boardVO.getAtchFileId();

		beanValidator.validate(board, bindingResult);
		if (bindingResult.hasErrors()) {

			boardVO.setFrstRegisterId(user.getUniqId());

			BoardMaster master = new BoardMaster();
			BoardMasterVO bmvo = new BoardMasterVO();
			BoardVO bdvo = new BoardVO();

			master.setBbsId(boardVO.getBbsId());
			master.setUniqId(user.getUniqId());

			bmvo = bbsAttrbService.selectBBSMasterInf(master);
			bdvo = bbsMngService.selectBoardArticle(boardVO);

			model.addAttribute("result", bdvo);
			model.addAttribute("bdMstr", bmvo);

			return "cop/bbs/EgovNoticeUpdt";
		}

		if (isAuthenticated) {
			final Map<String, MultipartFile> files = multiRequest.getFileMap();
			if (!files.isEmpty()) {
				if ("".equals(atchFileId)) {
					List<FileVO> result = fileUtil.parseFileInf(files, "BBS_", 0, atchFileId, "");
					atchFileId = fileMngService.insertFileInfs(result);
					board.setAtchFileId(atchFileId);
				} else {
					FileVO fvo = new FileVO();
					fvo.setAtchFileId(atchFileId);
					int cnt = fileMngService.getMaxFileSN(fvo);
					List<FileVO> _result = fileUtil.parseFileInf(files, "BBS_", cnt, atchFileId, "");
					fileMngService.updateFileInfs(_result);
				}
			}

			board.setLastUpdusrId(user.getUniqId());

			board.setNtcrNm(""); // dummy 오류 수정 (익명이 아닌 경우 validator 처리를 위해 dummy로 지정됨)
			board.setPassword(""); // dummy 오류 수정 (익명이 아닌 경우 validator 처리를 위해 dummy로 지정됨)
			board.setNttCn(unscript(board.getNttCn())); // XSS 방지

			bbsMngService.updateBoardArticle(board);
			
			//게시글 수정 후 확인
			boardVO.setPlusCount(false);
			boardVO.setBbsId(board.getBbsId());
			boardVO.setNttId(board.getNttId());
			
			BoardVO vo = bbsMngService.selectBoardArticle(boardVO);
			
			model.addAttribute("result", vo);
			model.addAttribute("sessionUniqId", user.getUniqId());
			

		}

		//return "forward:/cop/bbs/selectBoardList.do";
		return "cop/bbs/EgovNoticeInqire";
	}

	/**
	 * 게시물에 대한 내용을 삭제한다.
	 *
	 * @param boardVO
	 * @param board
	 * @param sessionVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/cop/bbs/deleteBoardArticle.do")
	public String deleteBoardArticle(@ModelAttribute("searchVO") BoardVO boardVO, @ModelAttribute("board") Board board, @ModelAttribute("bdMstr") BoardMaster bdMstr, ModelMap model)
			throws Exception {

		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

		if (isAuthenticated) {
			board.setLastUpdusrId(user.getUniqId());

			bbsMngService.deleteBoardArticle(board);
		}

		return "forward:/cop/bbs/selectBoardList.do";
	}

	/**
	 * 템플릿에 대한 미리보기용 게시물 목록을 조회한다.
	 *
	 * @param boardVO
	 * @param sessionVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/cop/bbs/previewBoardList.do")
	public String previewBoardArticles(@ModelAttribute("searchVO") BoardVO boardVO, ModelMap model) throws Exception {

		String template = boardVO.getSearchWrd(); // 템플릿 URL

		BoardMasterVO master = new BoardMasterVO();

		master.setBbsNm("미리보기 게시판");

		boardVO.setPageUnit(propertyService.getInt("pageUnit"));
		boardVO.setPageSize(propertyService.getInt("pageSize"));

		//csh 페이징 모듈화
		PaginationInfo paginationInfo= (PaginationInfo) pageInfoUtil.makePaginationInfo(boardVO);
		boardVO = (BoardVO) pageInfoUtil.makeObjectVO(paginationInfo, boardVO);

		BoardVO target = null;
		List<BoardVO> list = new ArrayList<BoardVO>();

		target = new BoardVO();
		target.setNttSj("게시판 기능 설명");
		target.setFrstRegisterId("ID");
		target.setFrstRegisterNm("관리자");
		target.setFrstRegisterPnttm("2009-01-01");
		target.setInqireCo(7);
		target.setParnts("0");
		target.setReplyAt("N");
		target.setReplyLc("0");
		target.setUseAt("Y");

		list.add(target);

		target = new BoardVO();
		target.setNttSj("게시판 부가 기능 설명");
		target.setFrstRegisterId("ID");
		target.setFrstRegisterNm("관리자");
		target.setFrstRegisterPnttm("2009-01-01");
		target.setInqireCo(7);
		target.setParnts("0");
		target.setReplyAt("N");
		target.setReplyLc("0");
		target.setUseAt("Y");

		list.add(target);

		boardVO.setSearchWrd("");

		int totCnt = list.size();

		paginationInfo.setTotalRecordCount(totCnt);

		master.setTmplatCours(template);

		model.addAttribute("resultList", list);
		model.addAttribute("resultCnt", Integer.toString(totCnt));
		model.addAttribute("boardVO", boardVO);
		model.addAttribute("brdMstrVO", master);
		model.addAttribute("paginationInfo", paginationInfo);

		model.addAttribute("preview", "true");

		return "cop/bbs/EgovNoticeList";
	}
	
	/**
	 * 2023.03.03 KJE
	 * 갤러리게시판 게시물을 등록한다.
	 *
	 * @param boardVO
	 * @param board
	 * @param sessionVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/cop/bbs/insertBoardGallery.do")
	public String insertBoardGallery(@ModelAttribute("searchVO") BoardVO boardVO, HttpServletRequest request,
			@ModelAttribute("bdMstr") BoardMaster bdMstr, @ModelAttribute("gallery") Board board, 
			BindingResult bindingResult, SessionStatus status, ModelMap model) throws Exception {
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		// 유효성 체크 필요
		
		if (isAuthenticated) {
			
			if(boardVO.getImgUrlList().length > 0) {
				boolean result = copyImage(board.getImgUrlList());
				
				String content = board.getNttCn().replaceAll(propertyService.getString("Globals.tempPath"), propertyService.getString("Globals.copyPath"));
				String thumbnail = board.getThumbnailUrl().replaceAll(propertyService.getString("Globals.tempPath"), propertyService.getString("Globals.copyPath"));
				
				board.setNttCn(unscript(content)); // XSS 방지
				board.setThumbnailUrl(unscript(thumbnail)); // XSS 방지
			}
			
			board.setFrstRegisterId(user.getUniqId());
			board.setBbsId(board.getBbsId());
			board.setNtcrNm(""); // dummy 오류 수정 (익명이 아닌 경우 validator 처리를 위해 dummy로 지정됨)
			board.setPassword(""); // dummy 오류 수정 (익명이 아닌 경우 validator 처리를 위해 dummy로 지정됨)
			Board bo = bbsMngService.insertBoardArticle(board);
			
			//게시물 등록후 게시물 확인
			boardVO.setPlusCount(false);
			boardVO.setBbsId(bo.getBbsId());
			boardVO.setNttId(bo.getNttId());
			
			BoardVO vo = bbsMngService.selectBoardArticle(boardVO);
			vo.setBbsAttrbCode(bdMstr.getBbsAttrbCode());
			
			model.addAttribute("result", vo);
			model.addAttribute("sessionUniqId", user.getUniqId());
			
		}		
		
		return "cop/bbs/EgovNoticeInqire";
	}

	@RequestMapping("/cop/bbs/updateBoardGallery.do")
	public String updateBoardGallery(@ModelAttribute("searchVO") BoardVO boardVO, @ModelAttribute("bdMstr") BoardMaster bdMstr,
			@ModelAttribute("board") Board board, BindingResult bindingResult, ModelMap model, SessionStatus status) throws Exception {

		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

		String atchFileId = boardVO.getAtchFileId();

		beanValidator.validate(board, bindingResult);
		if (bindingResult.hasErrors()) {

			boardVO.setFrstRegisterId(user.getUniqId());

			BoardMaster master = new BoardMaster();
			BoardMasterVO bmvo = new BoardMasterVO();
			BoardVO bdvo = new BoardVO();

			master.setBbsId(boardVO.getBbsId());
			master.setUniqId(user.getUniqId());

			bmvo = bbsAttrbService.selectBBSMasterInf(master);
			bdvo = bbsMngService.selectBoardArticle(boardVO);

			model.addAttribute("result", bdvo);
			model.addAttribute("bdMstr", bmvo);

			return "cop/bbs/EgovNoticeUpdt";
		}

		if (isAuthenticated) {
			if(boardVO.getImgUrlList().length > 0) {
				boolean result = copyImage(board.getImgUrlList());
				
				String content = board.getNttCn().replaceAll(propertyService.getString("Globals.tempPath"), propertyService.getString("Globals.copyPath"));
				String thumbnail = board.getThumbnailUrl().replaceAll(propertyService.getString("Globals.tempPath"), propertyService.getString("Globals.copyPath"));
				
				board.setNttCn(unscript(content)); // XSS 방지
				board.setThumbnailUrl(unscript(thumbnail)); // XSS 방지
			}
			
			board.setLastUpdusrId(user.getUniqId());

			board.setNtcrNm(""); // dummy 오류 수정 (익명이 아닌 경우 validator 처리를 위해 dummy로 지정됨)
			board.setPassword(""); // dummy 오류 수정 (익명이 아닌 경우 validator 처리를 위해 dummy로 지정됨)
			// board.setNttCn(unscript(board.getNttCn())); // XSS 방지

			bbsMngService.updateBoardArticle(board);
			
			//게시글 수정 후 확인
			boardVO.setPlusCount(false);
			boardVO.setBbsId(board.getBbsId());
			boardVO.setNttId(board.getNttId());
			
			BoardVO vo = bbsMngService.selectBoardArticle(boardVO);
			
			model.addAttribute("result", vo);
			model.addAttribute("sessionUniqId", user.getUniqId());
		}

		return "cop/bbs/EgovNoticeInqire";
	}
	
	@PostMapping(value="/uploadSummernoteImageFile.do", produces = "application/json")
    @ResponseBody
    public BoardVO uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request) throws Exception {

		InetAddress ipAddress = InetAddress.getLocalHost();
		String ip = ipAddress.getHostAddress();
        BoardVO vo = new BoardVO();
        
        String fileRoot = propertyService.getString("Globals.tempDir");	//저장될 파일 경로
        String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
        String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자

        // 랜덤 UUID+확장자로 저장될 savedFileName
        String savedFileName = UUID.randomUUID() + extension;	
        
        File targetFile = new File(fileRoot + savedFileName);

        try {
            InputStream fileStream = multipartFile.getInputStream();
            FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
            vo.setImgUrl("/" + propertyService.getString("Globals.tempPath") + "/"+savedFileName);
        } catch (IOException e) {
            FileUtils.deleteQuietly(targetFile);	// 실패시 저장된 파일 삭제
            e.printStackTrace();
        }

        return vo;
    }	
	
    private boolean copyImage(String[] imgUrlList) {
		for(int i = 0; i < imgUrlList.length; i++) {
			String sTarget = "/" + propertyService.getString("Globals.tempPath");
    		if(imgUrlList[i].indexOf(sTarget) > -1) {
    			String imgUrl = imgUrlList[i].replace(sTarget, "");
        		
        		String oriFilePath = propertyService.getString("Globals.tempDir") + imgUrl;
        		String copyFilePath = propertyService.getString("Globals.copyDir") + imgUrl;
        	    
        		try {
        	        FileInputStream fis = new FileInputStream(oriFilePath); //읽을파일
        	        FileOutputStream fos = new FileOutputStream(copyFilePath); //복사할파일
        	        int data = 0;
        	        
        	        while((data=fis.read())!=-1) {
        	        	fos.write(data);
        	        }
        	        
        	        fis.close();
        	        fos.close();
        	    } catch (IOException e) {
        	        e.printStackTrace();
        	    }    		    			
    		}
    	}
    	
    	deleteTempFile();
    	return true;
	}	
	
	public void deleteTempFile() {
		String path = propertyService.getString("Globals.tempDir");
		File deleteFolder = new File(path);
		File[] deleteFolderList = deleteFolder.listFiles();
		
		if(deleteFolderList.length > 0) {
			for (int j = 0; j < deleteFolderList.length; j++) {
				deleteFolderList[j].delete();
			}			
		}
	}
}
