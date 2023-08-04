<%--
  Class Name : UserAbsnceList.jsp
  Description : UserAbsnceList 화면
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2009.07.01   lee.m.j            최초 생성
     2011.08.31   JJY       경량환경 버전 생성
 
    author   : 공통서비스 개발팀 lee.m.j
    since    : 2009.07.01
--%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<title>내부업무 사이트 > 내부시스템관리 > 사용자부재관리</title>

<script defer src="<c:url value='/js/manage/userAbsnce.js' />" ></script>

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
                                <div class="condition2">
                                	
                                	<form name="listForm" action="<c:url value='/userAbsnceList'/>" method="get">
                                	
									<input type="hidden" name="userId">
									<input type="hidden" name="pageIndex" value="<c:if test="${empty userAbsnceVO.pageIndex }">1</c:if><c:if test="${!empty userAbsnceVO.pageIndex }"><c:out value='${userAbsnceVO.pageIndex}'/></c:if>">
									<input type="hidden" name="searchCondition" value="1">
                                	
                                    <span class="lb mr10">사용자 명 : </span>
                                    <input id="searchKeyword" class="f_txt mr20" name="searchKeyword" type="text" value="<c:out value="${userAbsnceVO.searchKeyword}"/>" title="검색" onkeypress="fn_press();" >

                                    <span class="lb mr10">부재여부 : </span>
                                    <label class="item f_select" for="selAbsnceAt">
                                        <select id="selAbsnceAt" name="selAbsnceAt">
    		                                <option value="A" <c:if test="${userAbsnceVO.selAbsnceAt eq 'A'}">selected</c:if>>전체</option>
    		                                <option value="Y" <c:if test="${userAbsnceVO.selAbsnceAt eq 'Y'}">selected</c:if>>Y</option>
    		                                <option value="N" <c:if test="${userAbsnceVO.selAbsnceAt eq 'N'}">selected</c:if>>N</option>
    	                                </select>
                                    </label>

                                    <a href="<c:url value='/userAbsnceList'/>" class="item btn btn_gray_46 w_100" onclick="javascript:fn_selectUserAbsnceList('1'); return false;">조회</a><!-- 조회 -->
                                	
                                	</form>
                                	
                                </div>
                                <!--// 검색조건 -->

                                <!-- 게시판 -->
                                <div class="board_list">
                                    <table summary="사용자부재정보에 대한 목록을 제공한다.">
                                    	<caption>사용자부재 관리</caption>
                                        <colgroup>
                                            <col style="width: auto;">
                                            <col style="width: auto;">
                                            <col style="width: auto;">
                                            <col style="width: auto;">
                                            <col style="width: auto;">
                                        </colgroup>
                                        <thead>
                                            <tr>
                                                <th scope="col">사용자 ID</th>
                                                <th scope="col">사용자명</th>
                                                <th scope="col">부재여부</th>
                                                <th scope="col">등록여부</th>
                                                <th scope="col">등록일시</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        
                                        	<c:if test="${empty userAbsnceList}">
                                        		<tr>
                                        			<td colspan="5">검색된 값이 없습니다.</td>
                                        		</tr>
                                        	</c:if>
                                        	
                                        	<c:forEach var="userAbsnce" items="${userAbsnceList}" varStatus="status">
                                            <tr>
                                                <td>
                                                	<form name="item" method="get" action="<c:url value='/getUserAbsnce'/>">
                                                		<input type="hidden" name="userId" value="<c:out value="${userAbsnce.userId}"/>">
                                                		<input type="hidden" name="selAbsnceAt" value="<c:out value="${userAbsnceVO.selAbsnceAt}"/>">
                                                		<input type="hidden" name="pageIndex" value="<c:out value='${userAbsnceVO.pageIndex}'/>">
                                                		<input type="hidden" name="searchCondition" value="<c:out value='${userAbsnceVO.searchCondition}'/>">
                                                		<input type="hidden" name="searchKeyword" value="<c:out value="${userAbsnceVO.searchKeyword}"/>">
                                                		<c:out value="${userAbsnce.userId}"/>
                                                		<a href="" class="btn btn_blue_30 w_70" onclick="fn_selectUserAbsnce('<c:out value="${userAbsnce.userId}"/>', '<c:out value="${userAbsnce.regYn}"/>'); return false;">등록</a>
                                                    </form>
                                                </td>
                                                <td><c:out value="${userAbsnce.userNm}"/></td>
                                                <td>
                                                	<c:if test="${userAbsnce.userAbsnceAt eq 'Y'}" ><c:out value="Y"/></c:if>
                                                	<c:if test="${userAbsnce.userAbsnceAt eq 'N'}" ><c:out value="N"/></c:if>
                                                </td>
                                                <td>
                                                	<c:if test="${userAbsnce.regYn eq 'Y'}" ><c:out value="Y"/></c:if>
                                                	<c:if test="${userAbsnce.regYn eq 'N'}" ><c:out value="N"/></c:if>
                                                </td>
                                                <td><c:out value="${userAbsnce.lastUpdusrPnttm}"/></td>
                                            </tr>
                                            </c:forEach>
                                            
                                        </tbody>
                                    </table>
                                </div>

								<!-- 페이지 네비게이션 시작 -->
								<c:if test="${!empty userAbsnceVO.pageIndex }">
                                <div class="board_list_bot">
                                    <div class="paging" id="paging_div">
                                        <ul>
                                            <ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_linkPage" />
                                        </ul>
                                    </div>
                                </div>
                                </c:if>
                                <!-- //페이지 네비게이션 끝 -->
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