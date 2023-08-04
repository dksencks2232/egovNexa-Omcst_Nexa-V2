<%--
  Class Name : EgovCcmCmmnClCodeList.jsp
  Description : EgovCcmCmmnClCodeList 화면
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2009.04.01   이중호              최초 생성
     2011.08.31   JJY       경량환경 버전 생성
 
    author   : 공통서비스 개발팀 이중호
    since    : 2009.04.01
--%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>내부업무 사이트 > 내부시스템관리 > 분류코드관리</title>
<script type="text/javaScript" language="javascript">
<!--
/* ********************************************************
 * 페이징 처리 함수
 ******************************************************** */
function linkPage(pageNo){
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = "<c:url value='/sym/ccm/ccc/EgovCcmCmmnClCodeList.do'/>";
    document.listForm.submit();
}
/* ********************************************************
 * 조회 처리 
 ******************************************************** */
function fnSearch(){
    document.listForm.pageIndex.value = 1;
    document.listForm.submit();
}
/* ********************************************************
 * 등록 처리 함수 
 ******************************************************** */
function fnRegist(){
    location.href = "<c:url value='/sym/ccm/ccc/EgovCcmCmmnClCodeRegist.do'/>";
}
/* ********************************************************
 * 수정 처리 함수
 ******************************************************** */
function fnModify(){
    location.href = "";
}
/* ********************************************************
 * 상세회면 처리 함수
 ******************************************************** */
function fnDetail(clCode){
    var varForm              = document.all["Form"];
    varForm.action           = "<c:url value='/sym/ccm/ccc/EgovCcmCmmnClCodeDetail.do'/>";
    varForm.clCode.value     = clCode;
    varForm.submit();
}
/* ********************************************************
 * 삭제 처리 함수
 ******************************************************** */
function fnDelete(){
    // 
}
//-->
</script>
</head>

<body>
<noscript>자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

    <!-- Skip navigation -->
    <a href="#contents" class="skip_navi">본문 바로가기</a>

    <div class="wrap">
        <div class="container">
            <div class="sub_layout">
                <div class="sub_in">
                    <div class="layout">
                        <div class="content_wrap">
                            <div id="contents" class="content">
                                 

								<form name="listForm" action="<c:url value='/sym/ccm/ccc/EgovCcmCmmnClCodeList.do'/>" method="get">

                                
                                
                                <!-- 검색조건 -->
                                <div class="condition">
                                    <label class="item f_select" for="sel1">
                                        <select id="sel1" name="searchCondition" title="검색조건" class="select">
                                            <option selected="" value="">선택하세요</option>
                                            <option value='1' <c:if test="${searchVO.searchCondition == '1'}">selected="selected"</c:if>>분류코드</option>
                                            <option value='2' <c:if test="${searchVO.searchCondition == '2'}">selected="selected"</c:if>>분류코드명</option>
                                         </select>
                                    </label>
                                    <span class="item f_search">
                                        <input class="f_input w_500" name="searchKeyword" title="검색어" type="text" value="${searchVO.searchKeyword}" maxlength="35" id="searchKeyword" >
                                        <button class="btn"  type="submit" onclick="fnSearch(); return false;"><spring:message code='button.inquire' /></button><!-- 조회 -->
                                    </span>
                                    <%-- <span class="ml20">
                                    	<button class="btn btn_gray_46 w_100"  type="submit" onclick="fnSearch(); return false;"><spring:message code='button.inquire' /></button><!-- 조회 -->
                                    </span> --%>
                                </div>
                                <!--// 검색조건 -->
                                
                                <div class="al_r mt20 mb20">
                                	<a href="#LINK" class="item btn btn_blue_46 w_100" onclick="fnRegist(); return false;"><spring:message code='button.create' /></a><!-- 등록 -->
                                </div>

                                <!-- 게시판 -->
                                <div class="board_list">
                                    <table summary="분류코드, 분류코드명, 사용여부를 조회하는 공통분류코드 목록 테이블이다.">
                                    	<caption>공통분류코드 목록</caption>
                                        <colgroup>
                                            <col style="width: 80px;">
                                            <col style="width: auto;">
                                            <col style="width: auto;">
                                            <col style="width: auto;">
                                        </colgroup>
                                        <thead>
                                            <tr>
                                                <th scope="col">순번</th>
                                                <th scope="col">분류코드</th>
                                                <th scope="col">분류코드명</th>
                                                <th scope="col">사용여부</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	
                                        	<c:if test="${fn:length(resultList) == 0}">
                                        		<tr>
                                        			<td colspan=4><spring:message code="common.nodata.msg" /></td>
                                        		</tr>
                                        	</c:if>
                                        	
                                        	<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
                                            <tr>
                                                <td><c:out value="${(searchVO.pageIndex - 1) * searchVO.pageSize + status.count}"/></td>
                                                <td><a href="#LINK" class="lnk" onclick="javascript:fnDetail('${resultInfo.clCode}');">${resultInfo.clCode}</a></td>
                                                <td><a href="#LINK" class="lnk" onclick="javascript:fnDetail('${resultInfo.clCode}');">${resultInfo.clCodeNm}</a></td>
                                                <td>
                                                	<c:if test="${resultInfo.useAt == 'Y'}">사용</c:if>
                                                	<c:if test="${resultInfo.useAt == 'N'}">미사용</c:if>
                                                </td>
                                            </tr>
                                            </c:forEach>
                                            
                                        </tbody>
                                    </table>
                                </div>

								<!-- 페이지 네비게이션 시작 -->
                                <div class="board_list_bot">
                                    <div class="paging" id="paging_div">
                                        <ul>
                                            <ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="linkPage" />
                                        </ul>
                                    </div>
                                </div>
                                <!-- //페이지 네비게이션 끝 -->
                                <!--// 게시판 -->
                                
                                <input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
                                
                                </form>

								<form name="Form" method="get" action="<c:url value='/sym/ccm/ccc/EgovCcmCmmnClCodeDetail.do'/>">
									<input type=hidden name="clCode">
								</form>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


    </div>
    
</body>
</html>