<%--
  Class Name : EgovCcmCmmnDetailCodeList.jsp
  Description : EgovCcmCmmnDetailCodeList 화면
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
	

<title>내부업무 사이트 > 내부시스템관리 > 상세코드관리</title>
<script type="text/javaScript" language="javascript">
<!--
/* ********************************************************
 * 페이징 처리 함수
 ******************************************************** */
function linkPage(pageNo){
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = "<c:url value='/sym/ccm/cde/EgovCcmCmmnDetailCodeList.do'/>";
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
    location.href = "<c:url value='/sym/ccm/cde/EgovCcmCmmnDetailCodeRegist.do'/>";
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
function fnDetail(codeId, code){
    var varForm              = document.all["Form"];
    varForm.action           = "<c:url value='/sym/ccm/cde/EgovCcmCmmnDetailCodeDetail.do'/>";
    varForm.codeId.value     = codeId;
    varForm.code.value       = code;
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
                                 

								<form name="listForm" action="<c:url value='/sym/ccm/cde/EgovCcmCmmnDetailCodeList.do'/>" method="get">

                                
                                <!-- 검색조건 -->
                                <div class="condition">
                                    <label class="item f_select" for="sel1">
                                        <select id="sel1" name="searchCondition" class="select" title="searchCondition">
                                            <option selected="" value="">선택하세요</option>
                                            <option value='1' <c:if test="${searchVO.searchCondition == '1'}">selected="selected"</c:if>>코드ID</option>
                                            <option value='2' <c:if test="${searchVO.searchCondition == '2'}">selected="selected"</c:if>>코드</option>
                                            <option value='3' <c:if test="${searchVO.searchCondition == '3'}">selected="selected"</c:if>>코드명</option>
                                         </select>
                                    </label>
                                    <span class="item f_search">
                                        <input class="f_input w_500" name="searchKeyword" type="text" value="${searchVO.searchKeyword}" maxlength="35" id="searchKeyword">
                                        <button class="btn" type="submit" onclick="fnSearch(); return false;"><spring:message code='button.inquire' /></button><!-- 조회 -->
                                        
                                    </span>
                                    <%-- <span class="ml20">
                                    	<button class="btn btn_gray_46 w_100" type="submit" onclick="fnSearch(); return false;"><spring:message code='button.inquire' /></button><!-- 조회 -->
                                    </span> --%>

                                    
                                </div>
                                <!--// 검색조건 -->

								<div class="al_r mt20 mb20">
									<a href="#LINK" class="item btn btn_blue_46 w_100" onclick="fnRegist(); return false;"><spring:message code='button.create' /></a><!-- 등록 -->
								</div>
                                <!-- 게시판 -->
                                <div class="board_list">
                                    <table summary="코드ID, 코드, 코드명, 사용여부를 나타내는 공통상세코드 목록 테이블이다.">
                                    	<caption>공통상세코드 목록</caption>
                                        <colgroup>
                                            <col style="width: 80px;">
                                            <col style="width: auto;">
                                            <col style="width: auto;">
                                            <col style="width: auto;">
                                            <col style="width: auto;">
                                        </colgroup>
                                        <thead>
                                            <tr>
                                                <th scope="col">순번</th>
                                                <th scope="col">코드ID</th>
                                                <th scope="col">코드</th>
                                                <th scope="col">코드명</th>
                                                <th scope="col">사용여부</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	
                                        	<c:if test="${fn:length(resultList) == 0}">
                                        		<tr>
                                        			<td colspan=5><spring:message code="common.nodata.msg" /></td>
                                        		</tr>
                                        	</c:if>
                                        	
                                        	<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
                                            <tr>
                                                <td><c:out value="${(searchVO.pageIndex - 1) * searchVO.pageSize + status.count}"/></td>
                                                <td><a href="#LINK" class="lnk" onclick="javascript:fnDetail('${resultInfo.codeId}','${resultInfo.code}');">${resultInfo.codeId}</a></td>
                                                <td>${resultInfo.code}</td>
                                                <td>${resultInfo.codeNm}</td>
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
                                <!-- // 페이지 네비게이션 끝 -->
                                <!--// 게시판 -->
                                
                                <input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
                                
                                </form>
            
					            <form name="Form" action="" method="get" >
					                <input type=hidden name="codeId">
					                <input type=hidden name="code">
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