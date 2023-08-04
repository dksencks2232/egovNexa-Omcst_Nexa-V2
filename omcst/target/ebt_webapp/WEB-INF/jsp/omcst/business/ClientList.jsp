<%--
  Class Name : EgovAuthorGroupManage.jsp
  Description : EgovAuthorGroupManage List 화면
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2009.03.23    lee.m.j              최초 생성
     2011.08.31   JJY       경량환경 버전 생성
 
    author   : 공통서비스 개발팀 lee.m.j
    since    : 2009.03.23
--%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script type="text/javascript" src="<c:url value='/js/business/client.js'/>" ></script>
    <div class="wrap">
        <div class="container">
            <div class="sub_layout">
                <div class="sub_in">
                    <div class="layout">
                        <div class="content_wrap">
                            <div id="contents" class="content">
								<form:form id="listForm" name="listForm" method="post">
									<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>
									
	 								<!-- 검색조건 -->
	                                <div class="condition2">
	                                    <span class="item f_search">
	                                        <input class="f_input w_500" title="검색값입력" name="searchKeyword" type="text" value='<c:out value="${searchVO.searchKeyword}" />' 
	                                        		placeholder="<spring:message code="common.keyword.msg"/>" onkeypress="press(event);">
	                                    </span>	                                    
	                                </div>
	                                <!--// 검색조건 -->
	
	
	                                <div class="board_list_top">
	                                    <div class="right_col">
											<a href='#LINK' class="item btn btn_blue_46 w_100" id="client">고객사 등록</a>                                 
	                                    </div>
	                                </div>
	
	                                <!-- 게시판 -->
	                                <div class="board_list">
	                                    <table summary="고객사목록을 조회하는 테이블입니다.">
	                                    	<caption>고객사목록</caption>
	                                        <colgroup>
	                                            <col style="width: auto;">
	                                            <col style="width: auto;">
	                                            <col style="width: auto;">
	                                            <col style="width: auto;">
	                                        </colgroup>
	                                        <thead>
	                                            <tr>
	                                                <th scope="col">고객사</th>
	                                                <th scope="col">담당팀</th>
	                                                <th scope="col">담당자</th>
	                                                <th scope="col">비고</th>
	                                            </tr>
	                                        </thead>
	                                        <tbody>
	                                        	
	                                        	<c:if test="${empty clientList}">
	                                        		<tr>
	                                        			<td colspan="8">검색결과가 없습니다.</td>
	                                        		</tr>
	                                        	</c:if>
	                                        	
	                                        	<c:forEach var="clientList" items="${clientList}" varStatus="status">
	                                            <tr>
	                                                <td><c:out value="${clientList.clientNm}"/></td>
	                                                <td><c:out value="${clientList.clientSideDepartment}"/></td>
	                                                <td><c:out value="${clientList.clientSideManager}"/></td>
	                                                <td><c:out value="${clientList.remark}"/></td>
	                                            </tr>
	                                            </c:forEach>
	                                            
	                                        </tbody>
	                                    </table>
	                                </div>
	
									<!-- 페이지 네비게이션 시작 -->
	 								<c:if test="${!empty searchVO.pageIndex }">
	                                <div class="board_list_bot">
	                                    <div class="paging" id="paging_div">
	                                        <ul>
	                                            <ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="linkPage" />
	                                        </ul>
	                                    </div>
	                                </div>
	                                </c:if>
	                                <!-- //페이지 네비게이션 끝 -->
	                                <!--// 게시판 -->
								</form:form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
