package egovframework.let.sec.gmt.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.egovframe.rte.fdl.idgnr.EgovIdGnrService;
import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.let.sec.gmt.service.EgovGroupManageService;
import egovframework.let.sec.gmt.service.GroupManage;
import egovframework.let.sec.gmt.service.GroupManageVO;
import egovframework.let.sec.gmt.service.JsonObj;
import egovframework.let.utl.fcc.service.JsonUtil;
import egovframework.let.utl.fcc.service.PageInfoUtil;

/**
 * 그룹관리에 관한 controller 클래스를 정의한다.
 * @author 공통서비스 개발팀 이문준
 * @since 2009.06.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *   
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2009.03.11  이문준          최초 생성
 *   2011.08.31  JJY            경량환경 템플릿 커스터마이징버전 생성 
 *
 * </pre>
 */

@Controller
public class EgovGroupManageController {
	
    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;

    @Resource(name = "egovGroupManageService")
    private EgovGroupManageService egovGroupManageService;

    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;
	
    /** Message ID Generation */
    @Resource(name="egovGroupIdGnrService")    
    private EgovIdGnrService egovGroupIdGnrService;
    
    @Autowired
	private DefaultBeanValidator beanValidator;
    
    @Autowired
    private PageInfoUtil pageInfoUtil;
    
    /**
	 * 그룹 목록화면 이동
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping("/sec/gmt/EgovGroupListView.do")
    public String selectGroupListView()
            throws Exception {
        return "/sec/gmt/EgovGroupManage";
    }   

	/**
	 * 시스템사용 목적별 그룹 목록 조회
	 * @param groupManageVO GroupManageVO
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping(value="/sec/gmt/EgovGroupList.do")
	public String selectGroupList(@ModelAttribute("groupManageVO") GroupManageVO groupManageVO, 
                                   ModelMap model, HttpServletRequest request) throws Exception {
    	
    	// 메뉴 갱신을 위해 추가
    	request.getSession().setAttribute("baseMenuNo", "6000000");
    	
    	//csh 페이징 모듈화
    	PaginationInfo paginationInfo= (PaginationInfo) pageInfoUtil.makePaginationInfo(groupManageVO);
    	groupManageVO = (GroupManageVO) pageInfoUtil.makeObjectVO(paginationInfo, groupManageVO);
		
		groupManageVO.setGroupManageList(egovGroupManageService.selectGroupList(groupManageVO));
        model.addAttribute("groupList", groupManageVO.getGroupManageList());
        
        int totCnt = egovGroupManageService.selectGroupListTotCnt(groupManageVO);
		paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);
        model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));

        return "/sec/gmt/EgovGroupManage";
	}

	/**
	 * 검색조건에 따른 그룹정보를 조회
	 * @param groupManageVO GroupManageVO
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping(value="/sec/gmt/EgovGroup.do")
	public String selectGroup(@ModelAttribute("groupManageVO") GroupManageVO groupManageVO, 
	    		               ModelMap model) throws Exception {

	    model.addAttribute("groupManage", egovGroupManageService.selectGroup(groupManageVO));
	    return "/sec/gmt/EgovGroupUpdate";
	}

    /**
	 * 그룹 등록화면 이동
	 * @return String
	 * @exception Exception
	 */     
    @RequestMapping(value="/sec/gmt/EgovGroupInsertView.do")
    public String insertGroupView()
            throws Exception {
        return "/sec/gmt/EgovGroupInsert";
    }

	/**
	 * 그룹 기본정보를 화면에서 입력하여 항목의 정합성을 체크하고 데이터베이스에 저장
	 * @param groupManage GroupManage
	 * @param groupManageVO GroupManageVO
	 * @return String
	 * @exception Exception
	 */ 
    @RequestMapping(value="/sec/gmt/EgovGroupInsert.do")
	public String insertGroup(@ModelAttribute("groupManage") GroupManage groupManage, 
			                  @ModelAttribute("groupManageVO") GroupManageVO groupManageVO, 
			                   BindingResult bindingResult,
			                   SessionStatus status, 
			                   ModelMap model) throws Exception {
    	
    	beanValidator.validate(groupManage, bindingResult); //validation 수행
    	
    	if (bindingResult.hasErrors()) { 
			return "/sec/gmt/EgovGroupInsert";
		} else {
	    	groupManage.setGroupId(egovGroupIdGnrService.getNextStringId());
	        groupManageVO.setGroupId(groupManage.getGroupId());
	        
	        status.setComplete();
	        model.addAttribute("message", egovMessageSource.getMessage("success.common.insert"));
	        model.addAttribute("groupManage", egovGroupManageService.insertGroup(groupManage, groupManageVO));
	        return "/sec/gmt/EgovGroupUpdate";
		}
	}
    
	/**
	 * 화면에 조회된 그룹의 기본정보를 수정하여 항목의 정합성을 체크하고 수정된 데이터를 데이터베이스에 반영
	 * @param groupManage GroupManage
	 * @return String
	 * @exception Exception
	 */     
    @RequestMapping(value="/sec/gmt/EgovGroupUpdate.do")
	public String updateGroup(@ModelAttribute("groupManage") GroupManage groupManage, 
			                   BindingResult bindingResult,
                               SessionStatus status, 
                               Model model) throws Exception {
    	
    	beanValidator.validate(groupManage, bindingResult); //validation 수행
    	
    	if (bindingResult.hasErrors()) { 
			return "/sec/gmt/EgovGroupUpdate";
		} else {
    	    egovGroupManageService.updateGroup(groupManage);
            status.setComplete();
            model.addAttribute("message", egovMessageSource.getMessage("success.common.update"));
    	    return "forward:/sec/gmt/EgovGroup.do";
		}
	}	
	
	/**
	 * 불필요한 그룹정보를 화면에 조회하여 데이터베이스에서 삭제
	 * @param groupManage GroupManage
	 * @return String
	 * @exception Exception
	 */
	@RequestMapping(value="/sec/gmt/EgovGroupDelete.do")
	public String deleteGroup(@ModelAttribute("groupManage") GroupManage groupManage, 
                             SessionStatus status, 
                             Model model) throws Exception {
		egovGroupManageService.deleteGroup(groupManage);
		status.setComplete();
		model.addAttribute("message", egovMessageSource.getMessage("success.common.delete"));
		return "forward:/sec/gmt/EgovGroupList.do";
	}

	/**
	 * 불필요한 그룹정보 목록을 화면에 조회하여 데이터베이스에서 삭제
	 * @param groupIds String
	 * @param groupManage GroupManage
	 * @return String
	 * @exception Exception
	 */   
	@RequestMapping(value="/sec/gmt/EgovGroupListDelete.do")
	public String deleteGroupList(@RequestParam("groupIds") String groupIds,
			                      @ModelAttribute("groupManage") GroupManage groupManage, 
	                               SessionStatus status, 
	                               Model model) throws Exception {
    	String [] strGroupIds = groupIds.split(";");
    	for(int i=0; i<strGroupIds.length;i++) {
    		groupManage.setGroupId(strGroupIds[i]);
    		egovGroupManageService.deleteGroup(groupManage);
    	}
		status.setComplete();
		model.addAttribute("message", egovMessageSource.getMessage("success.common.delete"));
		return "forward:/sec/gmt/EgovGroupList.do";
	}
	
    /**
	 * 그룹팝업 화면 이동
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping("/sec/gmt/EgovGroupSearchView.do")
    public String selectGroupSearchView()
            throws Exception {
        return "/sec/gmt/EgovGroupSearch";
    }   
	    
	/**
	 * 시스템사용 목적별 그룹 목록 조회
	 * @param groupManageVO GroupManageVO
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping(value="/sec/gmt/EgovGroupSearchList.do")
	public String selectGroupSearchList(@ModelAttribute("groupManageVO") GroupManageVO groupManageVO, 
                                   ModelMap model) throws Exception {
    	
    	//csh 페이징 모듈화
    	PaginationInfo paginationInfo= (PaginationInfo) pageInfoUtil.makePaginationInfo(groupManageVO);
    	groupManageVO = (GroupManageVO) pageInfoUtil.makeObjectVO(paginationInfo, groupManageVO);
		
		groupManageVO.setGroupManageList(egovGroupManageService.selectGroupList(groupManageVO));
        model.addAttribute("groupList", groupManageVO.getGroupManageList());
        
        int totCnt = egovGroupManageService.selectGroupListTotCnt(groupManageVO);
		paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);
        model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));

        return "/sec/gmt/EgovGroupSearch";
	}
    
    /**
     * 사용자 그룹관리 jqGrid 리스트
     * @param response
     * @param groupManageVO
     * @return groupList
     */
    @RequestMapping(value="/jqGridGroupList")
    @ResponseBody
    public JsonObj selectJqGridGroupList(HttpServletResponse response, @ModelAttribute("postData") GroupManageVO groupManageVO) throws Exception {
	 
    	groupManageVO.setFirstIndex((groupManageVO.getPage() - 1) * groupManageVO.getRows());
    	
    //	System.out.println("firstIndex " + groupManageVO.getFirstIndex());
    	
		List<Map<String, Object>> resultList = new ArrayList<Map<String, Object>>();
		HashMap<String, Object> tempMap = new HashMap<String, Object>();
		
		//총 레코드 수
		int totalRecords = 0;
		//총 페이지 수
		int totalCount = 0;
		
		try {
			List<GroupManageVO> groupList= egovGroupManageService.selectJqGroupList(groupManageVO);
			
			for(int i=0 ; i< groupList.size(); i++) {
				
				tempMap.put("groupId", groupList.get(i).getGroupId());
				tempMap.put("groupNm", groupList.get(i).getGroupNm());
				tempMap.put("groupDc", groupList.get(i).getGroupDc());
				tempMap.put("groupCreatDe", groupList.get(i).getGroupCreatDe());
				
				resultList.add(tempMap);
				
				tempMap = new HashMap<String, Object>();
			}
			
			//총 레코드 갯수를 구한다
			totalRecords = egovGroupManageService.selectJpGroupTotRecords(groupManageVO);
			
			//총 페이지 수를 구한다
			totalCount = (totalRecords/groupManageVO.getRows());
			//나머지 값이 0이 아닐시 총페이지수를 +1 해준다
			if(totalRecords % groupManageVO.getRows() > 0) totalCount ++;

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		JsonObj jsonObj = new JsonObj();
		
		jsonObj.setRows(resultList);
		jsonObj.setPage(groupManageVO.getPage());
		jsonObj.setTotal(totalCount);
		jsonObj.setRecords(totalRecords);
		
		return jsonObj;
		
    }
    
    @RequestMapping(value="/jqGridGroupUpdate")
    @ResponseBody
    public void updateJqGridGroup(HttpServletResponse response, @RequestParam(value="id") String id, @RequestParam(value="cellName") String cellName, @RequestParam(value="cellValue") String cellValue) throws IOException {
    	Map<String, Object> map = new HashMap<String, Object>();
    	map.put("id", id);
    	map.put("cellName", cellName);
    	map.put("cellValue", cellValue);
    	try {
			egovGroupManageService.updateJqGroup(map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
    
    @RequestMapping(value="/jqGridGroupInsert")
    @ResponseBody
    public void insertJqGridGroup(HttpServletResponse response, @ModelAttribute("postdata") GroupManage groupManage) throws Exception{
    	try {
    	//	System.out.println("#####groupNm####" + groupManage.getGroupNm());
    		egovGroupManageService.insertJqGroup(groupManage);
    	}catch(Exception e ) {
    		// TODO Auto-generated catch block
    		e.printStackTrace();
    	}
    	
    }
    
	@RequestMapping(value="/jqGridGroupDelete")
    @ResponseBody
    public Map<String, Object> deleteJqGridGroup(HttpServletResponse response, @RequestParam("data") String data) {
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("result", "success");
    	try {
    		egovGroupManageService.deleteJqGroup(data);
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    	return result;
    }
}