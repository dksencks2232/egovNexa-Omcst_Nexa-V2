<%--
  Class Name : EgovBoardMstrList.jsp
  Description : 게시판 속성 목록화면
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2009.03.12   이삼섭              최초 생성
     2011.08.31   JJY       경량환경 버전 생성
 
    author   : 공통서비스 개발팀 이삼섭
    since    : 2009.03.12
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>내부업무 사이트 > 내부서비스관리 > 게시판생성관리</title>

<script type="text/javascript" src="<c:url value='/js/EgovBBSMng.js' />"></script>
<script type="text/javascript">
    function press(event) {
        if (event.keyCode==13) {
            fn_egov_select_brdMstr('1');
        }
    }
    
    function fn_egov_insert_addBrdMstr(){   
        document.frm.action = "<c:url value='/cop/bbs/addBBSMaster.do'/>";
        document.frm.submit();
    }
    
    function fn_egov_select_brdMstr(pageNo){
        document.frm.pageIndex.value = pageNo; 
        document.frm.action = "<c:url value='/cop/bbs/SelectBBSMasterInfs.do'/>";
        document.frm.submit();  
    }
    
    function fn_egov_inqire_brdMstr(bbsId){
        document.frm.bbsId.value = bbsId;
        document.frm.action = "<c:url value='/cop/bbs/SelectBBSMasterInf.do'/>";
        document.frm.submit();          
    }
</script>

</head>

<body>
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

    <!-- Skip navigation -->
    <a href="#contents" class="skip_navi">본문 바로가기</a>

    <div class="wrap">
        <div class="container">
            <div class="sub_layout">
                <div class="sub_in">
                    <div class="layout">        
                        <div class="content_wrap">
                            <div id="contents" class="content">
                                
                                <!-- 검색조건 -->
                                <div class="condition">
                                	<form name="frm" action="<c:url value='/cop/bbs/SelectBBSMasterInfs.do'/>" method="get">
	                                	<input type="hidden" name="bbsId">
	                                	<input type="hidden" name="trgetId">
	                                	<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
	                                    <label class="item f_select" for="searchCnd">
	                                        <select id="searchCnd" name="searchCnd" title="검색유형선력">
	                                            <option value="0" <c:if test="${searchVO.searchCnd == '0'}">selected="selected"</c:if> >게시판명</option>
	                                            <option value="1" <c:if test="${searchVO.searchCnd == '1'}">selected="selected"</c:if> >게시판유형</option>
	                                         </select>
	                                    </label>
	
	                                    <span class="item f_search">
	                                        <input class="f_input w_500" title="검색값입력" id="searchWrd" name="searchWrd" type="text" value='<c:out value="${searchVO.searchWrd}" />' maxlength="35" onkeypress="press(event);">
	                                        <button class="btn" type="submit" onclick="fn_egov_select_brdMstr('1'); return false;"><spring:message code="button.inquire"/></button>
	                                    </span>
										<%-- <span class="ml10">
											<button class="btn btn_gray_46 w_100 mgl10" type="submit" onclick="fn_egov_select_brdMstr('1'); return false;"><spring:message code="button.inquire"/></button><!-- 조회 -->
										</span> --%>
                                    </form>
                                </div>
                                <!--// 검색조건 -->
                                
                                <div class="mt20 mb20 al_r">
                                	<!-- <a href="#" class="item btn btn_red_46 w_100">삭제</a>삭제 -->
                                   	<a href="<c:url value='/cop/bbs/addBBSMaster.do'/>" class="item btn btn_blue_46 w_100" onclick="fn_egov_insert_addBrdMstr(); return false;"><spring:message code="button.create"/></a><!-- 등록 -->
                                   	
                                </div>

                                <!-- 게시판 -->
                                <div class="board_list">
                                    <table summary="번호,게시판명,게시판유형,게시판속성,생성일,사용여부  목록입니다">
                                    	<caption>사용자목록관리</caption>
                                        <colgroup>
                                            <col style="width: 80px;">
                                            <col style="width: auto;">
                                            <col style="width: 150px;">
                                            <col style="width: 150px;">
                                            <col style="width: 150px;">
                                            <col style="width: 150px;">
                                        </colgroup>
                                        <thead>
                                            <tr>
                                                <th scope="col">번호</th>
                                                <th scope="col">게시판명</th>
                                                <th scope="col">게시판유형</th>
                                                <th scope="col">게시판속성</th>
                                                <th scope="col">생성일</th>
                                                <th scope="col">사용여부</th>
                                                <th scope="col">커뮤니티/동호회 정보</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<c:if test="${fn:length(resultList) == 0}">
                                        		<tr>
                                        			<td colspan="6"><spring:message code="common.nodata.msg" /></td>
                                        		</tr>
                                        	</c:if>
                                        	
                                        	<c:forEach var="result" items="${resultList}" varStatus="status">
	                                            <tr>
	                                                <td><c:out value="${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}"/></td>
	                                                <td style="text-align: left;">
	                                                	<a href="<c:url value='/cop/bbs/SelectBBSMasterInf.do'/>?bbsId=<c:out value='${result.bbsId}'/>" class="lnk">
	                                                		<c:out value="${result.bbsNm}"/>
	                                                	</a>
	                                                </td>
	                                                <td><c:out value="${result.bbsTyCodeNm}"/></td>
	                                                <td><c:out value="${result.bbsAttrbCodeNm}"/></td>
	                                                <td><c:out value="${result.frstRegisterPnttm}"/></td>
	                                                <td>
	                                                	<c:if test="${result.useAt == 'N'}"><spring:message code="button.notUsed" /></c:if>
	                                                	<c:if test="${result.useAt == 'Y'}"><spring:message code="button.use" /></c:if>
	                                                </td>
	                                                <td><c:out value="${result.trgetType}"/></td>
	                                            </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>

								<!-- 페이지 네비게이션 시작 -->
                                <div class="board_list_bot">
                                    <div class="paging" id="paging_div">
                                        <ul>
                                            <ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_select_brdMstr" />
                                        </ul>
                                    </div>
                                </div>
                                <!-- // 페이지 네비게이션 끝 --> 
                                <!--// 게시판 -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
</body>
</html>