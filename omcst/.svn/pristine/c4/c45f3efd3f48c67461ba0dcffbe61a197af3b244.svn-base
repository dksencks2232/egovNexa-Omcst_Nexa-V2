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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>사업관리 > 프로젝트관리</title>
<script type="text/javascript" src="<c:url value='/js/business/project.js'/>" ></script>

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
                                 

								<form:form id="listForm" name="listForm" action="<c:url value='/omcst/business/selectListProject.do'/>" method="get">

 
 								<input type="hidden" name="projectBegineDate" id="projectBegineDate" value="<c:out value='${projectVO.projectBegineDate}'/>" />
			                    <input type="hidden" name="projectEndDate" id="projectEndDate" value="<c:out value='${projectVO.projectEndDate}'/>" /> 
	                                
                                <!-- 검색조건 -->
                                <div class="condition2">
                                	<div class="con2_wrap">
                                    <label class="f_select item" for="clientNo">
                                    	<select id="clientNo" name="clientNo" title="클라이언트" onchange="fnSearchSelectBoxInfo(0)">
                                    		<option value="0">클라이언트</option>
											<c:forEach var="clientList" items="${clientList}" varStatus="status">
                                                 <option value="<c:out value="${clientList.clientNo}"/>" <c:if test="${clientList.clientNo == projectVO.clientNo}">selected</c:if> ><c:out value="${clientList.clientNm}"/></option>
                                            </c:forEach>
    					                </select>
                                    </label>
                                    <label class="f_select item" for="departmentNo">
                                    	<select id="departmentNo" name="departmentNo" title="담당팀" onchange="fnSearchSelectBoxInfo(1)">
                                    		<option value="0">담당팀</option>
                                    		<c:if test ='${not empty departmentList}'>
	                                    		<c:forEach var="departmentList" items="${departmentList}" varStatus="status">
	                                                 <option value="<c:out value="${departmentList.departmentNo}"/>" <c:if test="${departmentList.departmentNo == projectVO.departmentNo}">selected</c:if> ><c:out value="${departmentList.clientSideDepartment}"/></option>
	                                            </c:forEach>
                                            </c:if>
    					                </select>
                                    </label>
                                    <label class="f_select item" for="projectNo">
                                    	<select id="projectNo" name="projectNo" title="프로젝트명">
                                    		<option value="0">프로젝트명</option>
                                    		<c:if test ='${not empty projectNmList}'>
	                                    		<c:forEach var="projectNmList" items="${projectNmList}" varStatus="status">
	                                                 <option value="<c:out value="${projectNmList.projectNo}"/>" <c:if test="${projectNmList.projectNo == projectVO.projectNo}">selected</c:if> ><c:out value="${projectNmList.projectNm}"/></option>
	                                            </c:forEach>
                                            </c:if>
    					                </select>
                                    </label>
                                    <label class="f_select item" for="projectStatus">
                                    	<select id="projectStatus" name="projectStatus" title="상태">
    					                	<option value="0">상태</option>
    					                	<option value="PGST01" <c:if test="${'PGST01' == projectVO.projectStatus}">selected</c:if> >예정</option>
    					                	<option value="PGST02" <c:if test="${'PGST02' == projectVO.projectStatus}">selected</c:if> >진행중</option>
    					                	<option value="PGST03" <c:if test="${'PGST03' == projectVO.projectStatus}">selected</c:if> >완료</option>
    					                </select>
                                    </label>
                                    <label for="vPeriod" class="item mr10"></label>
		                                <input type="text" name="vPeriod" id="vPeriod" class="f_date w_200"  value="<c:if test ='${not empty projectVO.projectBegineDate}'><c:out value='${projectVO.projectBegineDate}'/> ~ <c:out value='${projectVO.projectEndDate}'/></c:if>" title="프로젝트기간입력" placeholder="프로젝트 기간" readonly />
                                    <span class="item f_search">
                                        <input class="f_input w_200" name="searchKeyword" id="searchKeyword" type="text" value="<c:out value='${projectVO.searchKeyword}'/>" title="검색" onkeypress="press();" placeholder="검색어 입력"/>
                                    </span>
                                    <span class="ml10">
                                    	<button class="btn btn_blue_46 w_100" type="submit" onclick="javascript:fnSearchProjectList('1');"><spring:message code='button.search' /></button><!-- 조회 -->
                                    	<button class="btn btn_gray_46 w_100" type="button" onclick="javascript:fnSetInitSearchOptions();">조건초기화</button>
                                    </span>
                                    </div>
                                </div>
                                <!--// 검색조건 -->


                                <div class="board_list_top">
                                    <div class="right_col">
                                    	<a href="#LINK" class="btn btn_red_46 w_100" >등록취소</a><!-- 등록취소 -->
                                        <a href="#LINK" class="btn btn_blue_46 w_100" onclick="javascript:fncSelectAuthorGroupPop()">프로젝트등록</a><!-- 권한등록 -->
                                    </div>
                                </div>

                                <!-- 게시판 -->
                                <div class="board_list">
                                    <table summary="프로젝트목록을 조회하는 테이블입니다.">
                                    	<caption>프로젝트목록</caption>
                                        <colgroup>
                                        	<col style="width: 50px;">
                                            <col style="width: auto;">
                                            <col style="width: auto;">
                                            <col style="width: auto;">
                                            <col style="width: auto;">
                                            <col style="width: auto;">
                                            <col style="width: auto;">
                                            <col style="width: auto;">
                                            <col style="width: auto;">
                                        </colgroup>
                                        <thead>
                                            <tr>
                                                 <th scope="col">
                                                    <span class="f_chk_only chkAll">
                                                        <input type="checkbox" name="checkAll" title="선택여부" onclick="javascript:fncCheckAll()">
                                                    </span>
                                                </th>
                                                <th scope="col">클라이언트</th>
                                                <th scope="col">담당팀</th>
                                                <th scope="col">담당자</th>
                                                <th scope="col">프로젝트명</th>
                                                <th scope="col">기간</th>
                                                <th scope="col">책임자</th>
                                                <th scope="col">인원</th>
                                                <th scope="col">상태</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	
                                        	<c:if test="${empty projectList}">
                                        		<tr>
                                        			<td colspan="8">검색결과가 없습니다.</td>
                                        		</tr>
                                        	</c:if>
                                        	
                                        	<c:forEach var="projectList" items="${projectList}" varStatus="status">
                                            <tr>
                                            	<td>
                                                    <span class="f_chk_only">
                                                        <input type="checkbox" name="delYn" title="선택" onclick="javascript:fncManageChecked()">
                                                        <input type="hidden" name="checkId" value="<c:out value="${projectList.projectNo}"/>"/>
                                                    </span>
                                                </td>
                                                <td><c:out value="${projectList.clientNm}"/></td>
                                                <td><c:out value="${projectList.clientSideDepartment}"/></td>
                                                <td><c:out value="${projectList.clientSideManager}"/></td>
                                                <td><c:out value="${projectList.projectNm}"/></td>
                                                <td><c:out value="${projectList.projectBegineDate}"/> ~ <c:out value="${projectList.projectEndDate}"/></td>
                                                <td><c:out value="${projectList.projectLeader}"/></td>
                                                <td><c:out value="${projectList.projectStaffCnt}"/></td>
                                                <td><c:out value="${projectList.projectStatus}"/></td>
                                            </tr>
                                            </c:forEach>
                                            
                                        </tbody>
                                    </table>
                                </div>

								<!-- 페이지 네비게이션 시작 -->
 								<c:if test="${!empty projectVO.pageIndex }">
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
                                
<!--                                 <input type="hidden" name="userId"/>
								<input type="hidden" name="userIds"/>
								<input type="hidden" name="authorCodes"/>
								<input type="hidden" name="regYns"/>
								<input type="hidden" name="mberTyCodes"/> -->
								<input type="hidden" name="pageIndex" value="<c:out value='${authorGroupVO.pageIndex}'/>"/>
								
								</form:form>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


    </div>
    
</body>
</html>