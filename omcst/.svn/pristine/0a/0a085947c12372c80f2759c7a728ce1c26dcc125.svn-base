<%--
  Class Name : EgovCcmCmmnCodeList.jsp
  Description : EgovCcmCmmnCodeList 화면
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

<script type="text/javascript" src="<c:url value='/js/code/CommCodeMng.js' />"></script>

<div class="content_wrap">
    <div id="contents" class="content">
         

		<form name="listForm">

        
        <!-- 검색조건 -->
        <div class="condition">
            <label class="item f_select" for="searchCondition">
                <select name="searchCondition" title="검색조건" class="select" id="searchCondition" data-code="COM032">
                    <!-- <option value="SEL">선택</option>
                    <option value='ID'>코드ID</option>
                    <option value='NAME'>코드ID명</option> -->
                </select>
            </label>
            <span class="item f_search">
                <input class="f_input w_500" name="searchKeyword" title="검색어" type="text" value="${searchVO.searchKeyword}" maxlength="35" id="searchKeyword">
                <button class="btn" type="submit" id="searchBtn"><spring:message code='button.inquire' /></button><!-- 조회 -->
            </span>
            <a href="#LINK" class="item btn btn_blue_46 w_100" onclick="fnRegist(); return false;"><spring:message code='button.create' /></a><!-- 등록 -->
        </div>
        <!--// 검색조건 -->

        <!-- 게시판 -->
        <div class="board_list">
            <table summary="분류명, 코드ID, 코드ID명, 사용여부를 가지고있는 공통코드 목록 테이블이다.">
            	<caption>공통코드 목록</caption>
                <colgroup>
                    <col style="width: 80px;">
                    <col style="width: auto;">
                    <col style="width: auto;">
                    <col style="width: 150px;">
                    <col style="width: 150px;">
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col">순번</th>
                        <th scope="col">분류명</th>
                        <th scope="col">코드ID</th>
                        <th scope="col">코드ID명</th>
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
                        <td><a href="#LINK" class="lnk" onclick="javascript:fnDetail('${resultInfo.codeId}');">${resultInfo.clCodeNm}</a></td>
                        <td>${resultInfo.codeId}</td>
                        <td>${resultInfo.codeIdNm}</td>
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

<form name="Form" method="post" action="<c:url value='/sym/ccm/cca/EgovCcmCmmnCodeDetail.do'/>">
	<input type=hidden name="codeId">
</form>

                    </div>
                </div>