<%--
  Class Name : EgovUserManage.jsp
  Description : 사용자관리(조회,삭제) JSP
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2009.03.03   JJY              최초 생성
     2011.08.31   JJY       경량환경 버전 생성
 
    author   : 공통서비스 개발팀 JJY
    since    : 2009.03.03
--%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<script type="text/javascript" src="<c:url value='/js/manage/attendance.js' />" ></script>

<div class="wrap">
 		<div class="container">
            <div class="sub_layout">
                <div class="sub_in">
                    <div class="layout">
                        <div class="content_wrap">
                            <div id="contents" class="content">
                                 

								<input name="selectedId" type="hidden" />
								<input name="checkedIdForDel" type="hidden" />
								<input name="pageIndex" type="hidden" value="<c:out value='${atnVO.pageIndex}'/>"/>

                                
                                <!-- 검색조건 -->
                                <div class="condition">
									<form:form modelAttribute="AtnVO" action="${pageContext.request.contextPath}/atnList" name="antVO" method="post" >								
										<label class="label va_in">시작일 : </label>
									    <form:input path="stDate" id="stDate" type="text" class="f_date" maxlength="10" placeholder="출근시작일" readOnly="true"/>
										<label class="label va_in">~</label>
										<label class="label va_in">종료일 : </label>
									    <form:input path="edDate"  id="edDate" type="text" class="f_date" maxlength="10" placeholder="출근종료일" readOnly="true"/>
		
		                                <label class="label va_in">구분: </label>	
                                        <label class="item f_select">
                                            <form:select path="status" id="status" name="status" title="출퇴근선택">
                                             	<form:option value=""  label="선택"/>
                                             	<form:option value="1" label="완료"/>
                                             	<form:option value="2" label="미완료"/>
                                            </form:select>
                                        </label>

										<span class="ml10">
											<a href="#LINK" class="btn btn_blue_46 w_100"onclick="JavaScript:fn_search(); return false;"><spring:message code="button.search" /></a><!-- 저장 -->
										</span>
									</form:form>
                                </div>
                                <!--// 검색조건 -->

								<div class="board_list_top">
									<div class="left_col">
	                                	<div class="list_count">
	                                 		<span>총건수:</span>
	                                 		<strong><c:out value="${paginationInfo.totalRecordCount}"/></strong>
	                                 	</div>
	                            	</div>
                                </div>
                                
                               <div class="btn_area al_r">
	                               	<a href='#LINK' class="item btn btn_blue_46 w_100" onclick="javascript:fn_checkIn(); return false;">출근</a>
	                                <a href="#LINK" class="item btn btn_red_46 w_100" onclick="javascript:fn_checkOut(); return false;">퇴근</a>
	                                <a id="checkAtt" href="#LINK" class="item btn btn_red_46 w_100" onclick="javascript:fn_uncheckedOut(); return false;">미퇴근처리</a>
                               </div>
	                                																
                                <!-- 게시판 -->
                                <div class="board_list" id="boardDiv">
                                    <table id="attTable" summary="사용자 목록을 제공한다.">
                                    	<caption>사용자목록</caption>
                                        <colgroup>
                                        	<col style="width: 50px;">
                                        	<col style="width: 100px;">
                                            <col style="width: 100px;">
                                            <col style="width: 100px;">
                                            <col style="width: 100px;">
                                        </colgroup>
                                        <thead>
                                            <tr>
                                            	<th scope="col">
                                                    <span id ="chkAll" class="f_chk_only chkAll">
                                                        <input name="checkAll" type="checkbox" title="Check All" onclick=""/>
                                                    </span>
                                                </th>
                                            	<th scope="col">구분</th>
                                                <th scope="col">출근일</th>
                                                <th scope="col">퇴근일</th>
                                                <th scope="col">퇴근체크여부</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        
                                        	<c:if test="${fn:length(resultList) == 0}">
                                        	<tr>
                                        		<td colspan="3" >자료가 없습니다. 다른 검색조건을 선택해주세요</td>
                                        	</tr>
                                        	</c:if>
	
                                            <c:forEach var="result" items="${resultList}" varStatus="status">
                                            <tr>
                                                <c:if test="${result.status eq '퇴근완료'}">
	                                                <td onclick="event.cancelBubble = true;">
	                                                    <span id="fchkSpan<c:out value="${status.count}"/>" class="f_chk_off" >
	                                                        <input id="checkField" name="checkField" title="Check <c:out value="${status.count}"/>" value="<c:out value='${result.status}'/>" type="checkbox"/>
	                                                        <input id="checkId<c:out value="${status.count}"/>" name="checkId" type="hidden" value="<c:out value='${result.attId}'/>"/>
	                                                    </span>
	                                                </td>                                                                                            	                                                
                                                </c:if>
                                                <c:choose>
	                                                <c:when test="${result.status eq '출근완료' && result.compareAttDate != result.nowDate}">
		                                                <td id="chkTd" onclick="event.cancelBubble = true;">                                                  
		                                                    <span id="fchkSpan<c:out value="${status.count}"/>" class="f_chk_only" >
		                                                        <input id="checkField" name="checkField" title="Check <c:out value="${status.count}"/>" value="<c:out value='${result.status}'/>" type="checkbox"/>
		                                                        <input id="checkId<c:out value="${status.count}"/>" name="checkId" type="hidden" value="<c:out value='${result.attId}'/>"/>
		                                                    </span>
		                                                </td>                                                                                            	                                                
	                                                </c:when>	                                                
	                                                <c:when test="${result.status eq '출근완료' && result.compareAttDate == result.nowDate}">
		                                                <td onclick="event.cancelBubble = true;">
		                                                    <span id="fchkSpan<c:out value="${status.count}"/>" class="f_chk_off" >
		                                                        <input id="checkField" name="checkField" title="Check <c:out value="${status.count}"/>" value="<c:out value='${result.status}'/>" type="checkbox"/>
		                                                        <input id="checkId<c:out value="${status.count}"/>" name="checkId" type="hidden" value="<c:out value='${result.attId}'/>"/>
		                                                    </span>
		                                                </td>                                                                                            	                                                
	                                                </c:when>                                                
                                                </c:choose>
                                            	<td><c:out value="${result.status}"/></td>
                                                <td><c:out value="${result.attDate}"/></td>
                                                <td><c:out value="${result.latDate}"/></td>
                                                <td><c:if test="${!empty result.latDate}"><c:out value="완료"/></c:if> <c:if test="${empty result.latDate}"><c:out value="미완료"/></c:if></td>
                                            </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>

								<!-- 페이지 네비게이션 시작 -->
								<%-- <c:if test="${!empty userAbsnceVO.pageIndex }"> --%>
								<c:if test="${!empty atnVO.pageIndex }">
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
                                
                                <!-- 20230216 페이지 진입시 처리결과 메세지 처리 -->
                                <c:choose>
                                	<c:when test="${!empty resultMsg}">
                                		<input type="hidden" id="resultMsg" value="<spring:message code='${resultMsg}' />"/>
                                	</c:when>
                                	<c:otherwise>
                                		<input type="hidden" id="resultMsg" value=""/>
                                	</c:otherwise>
                                </c:choose>
                                <!-- 20230216 유저 삭제시 메세지 -->
                                <input type="hidden" id="sMessage" value="<spring:message code='common.delete.msg' />"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>