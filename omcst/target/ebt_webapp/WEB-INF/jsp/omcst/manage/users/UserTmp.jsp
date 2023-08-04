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
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>




<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>내부업무 사이트 > 내부시스템관리 > 사용자등록관리</title>
<script defer src="<c:url value='/js/manage/users.js' />"></script>
<script>
/* ********************************************************
 * 체크박스 선택유저 삭제 처리
 ******************************************************** */
function fn_deleteCheckUserTmp() {
    let checkField = document.listForm.checkField;
    let id = document.listForm.checkId;
    
    let checkAbId = document.listForm.checkAbId;
    
    let checkedIds = "";
    let checkedAbIds = "";
    let checkedCount = 0;
    if(checkField) {
        if(checkField.length > 1) {
            for(let i=0; i < checkField.length; i++) {
                if(checkField[i].checked) {
                    checkedIds += ((checkedCount==0? "" : ",") + id[i].value);
                    checkedAbIds += ((checkedCount==0? "" : ",") + checkAbId[i].value);
                    checkedCount++;
                }
            }
        } else {
            if(checkField.checked) {
                checkedIds = id.value;
                checkedAbIds = checkAbId.value;
            }
        }
    }
    if(checkedIds.length > 0) {
		let message = document.getElementById('sMessage').value;
        //alert(message);
        if(confirm(message)){
            document.listForm.checkedIdForDel.value=checkedIds;
            document.listForm.checkedAbIdForDel.value=checkedAbIds;            
            document.listForm.action = ctx+'/userDeleteTmp';
           	document.listForm.submit();
        }
    }
}

function fn_selectUserAbsnceReg(userId, regYn) {
	let ctx = sessionStorage.getItem("contextpath");

    if(regYn == 'N') {
        //if(confirm("등록된 사용자부재 정보가 없습니다. 등록페이지로 이동하시겠습니까?")) {
            location.replace(ctx+'/addViewUserAbsnce?userId='+userId);
        //} else {
        //    return;
        //}
    }
    document.listForm.userId.value = userId;
    document.listForm.action = ctx+'/getUserAbsnceTmp';
    document.listForm.submit();     
}


function fn_linkPage2(pageNo){
	let ctx = sessionStorage.getItem("contextpath");
	document.listForm.pageIndex.value = pageNo;	
    document.listForm.action = ctx+'/userManage';
    document.listForm.submit();
}


</script>
</head>
<body>

<%--사용자상태코드--%>
<c:set var='emplyrSttusCode' value='<%= egovframework.omcst.common.service.CodeCacheService.getCode("COM013") %>' />

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
                                 

								<form name="listForm" action="<c:url value='/userManage'/>" method="get">
								
								<input name="selectedId" type="hidden" />
								<input name="checkedIdForDel" type="hidden" />
								<input name="checkedAbIdForDel" type="hidden" />								
								                              						
                                <!-- 검색조건 -->
                                <div class="condition2">
									<span class="lb mr10">가입상태 : </span>
                                    <label class="item f_select" for="sbscrbSttus">
                                        <select name="sbscrbSttus" id="sbscrbSttus" title="검색조건1-사용자상태">
                                            <option value="0" <c:if test="${empty userSearchVO.sbscrbSttus || userSearchVO.sbscrbSttus == '0'}">selected="selected"</c:if> >상태(전체)</option>
                                            	<c:forEach var="escode" items="${emplyrSttusCode}" varStatus="status">
                                                	<option value="<c:out value="${escode.code}"/>" <c:if test="${userSearchVO.sbscrbSttus == escode.code}"> selected="selected"</c:if>><c:out value="${escode.codeNm}"/></option>
                                                </c:forEach>
                                        </select>
                                    </label>
                                    <span class="lb mr10" style='margin-left:20px'>검색어구분 : </span>
                                    <label class="item f_select" for="searchCondition">
                                        <select name="searchCondition" id="searchCondition" title="검색조건2-검색어구분">
                                            <option value="0" <c:if test="${userSearchVO.searchCondition == '0'}">selected="selected"</c:if> >아이디</option>
                                            <option value="1" <c:if test="${empty userSearchVO.searchCondition || userSearchVO.searchCondition == '1'}">selected="selected"</c:if> >사용자명</option>
                                        </select>
                                    </label>

                                    <span class="item f_search">
                                        <input class="f_input w_200" name="searchKeyword" title="검색어" type="text" value="<c:out value="${userSearchVO.searchKeyword}"/>" />
                                        <!-- 
                                        <button class="btn" type="submit" onclick="javascript:fn_search(); return false;"><spring:message code='button.inquire' /></button>
                                         -->
                                        <!-- 조회 -->                                        
                                    </span>
                                    <%-- <span class="ml10">
                                    	<button class="btn btn_blue_46 w_100" type="submit" onclick="javascript:fn_search(); return false;"><spring:message code='button.inquire' /></button><!-- 조회 -->
                                    </span> --%>

                                	
                                	
                                	
									<input type="hidden" name="userId">
									<input type="hidden" name="pageIndex" value="<c:if test="${empty userSearchVO.pageIndex }">1</c:if><c:if test="${!empty userSearchVO.pageIndex }"><c:out value='${userSearchVO.pageIndex}'/></c:if>">
                                	
                                    <span class="lb mr10"  style='margin-left:20px'>부재여부 : </span>
                                    <label class="item f_select" for="selAbsnceAt">
                                        <select id="selAbsnceAt" name="selAbsnceAt">
    		                                <option value="A" <c:if test="${userSearchVO.selAbsnceAt eq 'A'}">selected</c:if>>전체</option>
    		                                <option value="Y" <c:if test="${userSearchVO.selAbsnceAt eq 'Y'}">selected</c:if>>Y</option>
    		                                <option value="N" <c:if test="${userSearchVO.selAbsnceAt eq 'N'}">selected</c:if>>N</option>
    	                                </select>
                                    </label>

                                    <a  style='margin-left:20px' href="<c:url value='#'/>" class="item btn btn_gray_46 w_100" onclick="javascript:fn_search(); return false;">조회</a><!-- 조회 -->                                	
                                </div>
                                <!--// 검색조건 -->								
								<div class="board_list_top" style="top-margin:15px">
									<div class="left_col">
	                                	<div class="list_count">
	                                 		<span>사용자수</span>
	                                 		<strong><c:out value="${paginationInfo.totalRecordCount}"/></strong>
	                                 	</div>
	                            	</div>
	                            	<div class="al_r">
										<a href="#LINK" class="item btn btn_red_46 w_100" onclick="javascript:fn_deleteCheckUserTmp(); return false;"><spring:message code="button.delete" /></a><!-- 삭제 -->
	                                    <a href="<c:url value='/userManageInfo'/>" class="item btn btn_blue_46 w_100" onclick="fn_addUserView(); return false;"><spring:message code="button.create" /></a><!-- 등록 -->
									</div>
                                </div>
								
                                <!-- 게시판 -->
                                <div class="board_list">
                                    <table summary="사용자 목록을 제공한다.">
                                    	<caption>사용자목록</caption>
                                        <colgroup>
                                            <col style="width: 80px;">
                                            <col style="width: 100px;">
                                            <col style="width: 100px;">
                                            <col style="width: 190px;">
                                            <col style="width: 100px;">
                                            <col style="width: 100px;">
                                            <col style="width: 150px;">
                                            <col style="width: 100px;">

                                            <col style="width: 110px;;">
                                            <col style="width: 110px;">
                                            <!-- 
                                            <col style="width: 110px;">
                                             -->
                                            <col style="width: 190px;">
                                        </colgroup>
                                        <thead>
                                            <tr>
                                            	<th scope="col" onclick="event.cancelBubble = true;">
                                                    <span class="f_chk_only chkAll">
                                                        <input name="checkAll" type="checkbox" title="Check All" onclick="javascript:fn_checkAll();"/>
                                                    </span>
                                                </th>
                                                <th scope="col">아이디</th>
                                                <th scope="col">사용자명</th>                                                
                                                <th scope="col">입사일</th>
                                                <th scope="col">부서</th>
                                                <th scope="col">이메일</th>
                                                <th scope="col">전화번호</th>
                                                <th scope="col">가입상태</th>

                                                <th scope="col">부재여부변경</th>
                                                <th scope="col">부재여부</th>
                                                <!-- 
                                                <th scope="col">부재등록여부</th>
                                                 -->
                                                <th scope="col">부재변경일시</th>

                                            </tr>
                                        </thead>
                                        <tbody>
                                        
                                        	<c:if test="${fn:length(resultList) == 0}">
                                        	<tr>
                                        		<td colspan="12" >자료가 없습니다. 다른 검색조건을 선택해주세요</td>
                                        	</tr>
                                        	</c:if>
	
                                            <c:forEach var="result" items="${resultList}" varStatus="status">
                                            <tr onclick="javascript:fn_seelctUser('<c:out value="${result.userTy}"/>:<c:out value="${result.uniqId}"/>'); return false;" onmouseover="this.style.background='#F2F2F2'" onmouseout="this.style.background='white'">
                                                <td>
                                                    <span class="f_chk_only" onclick="event.cancelBubble = true;">
                                                        <input name="checkField" title="Check <c:out value="${status.count}"/>" type="checkbox"/>
                                                        <input name="checkId" type="hidden" value="<c:out value='${result.userTy}'/>:<c:out value='${result.uniqId}'/>"/>
                                                        <input name="checkAbId" type="hidden" value="<c:out value='${result.userId}'/>"/>
                                                    </span>
                                                </td>
                                                <td><c:out value="${result.userId}"/></td>
                                                <td>
                                                	<c:out value="${result.userNm}"/>
	                                                <!-- 
	                                                <a href="<c:url value='/userView'/>?selectedId=<c:out value="${result.uniqId}"/>" class="lnk">
	                                                	
	                                                </a>
	                                                 -->
                                                </td>                                                
                                                <td><c:out value="${result.joinDate}"/></td>
                                                <td><c:out value="${result.orgnztNm}"/></td>
                                                <td><c:out value="${result.emailAdres}"/></td>
                                                <td>
                                                	<c:out value="${result.areaNo}"/>
                                                	<c:if test="${result.areaNo ne ''}">)</c:if>
                                                	<c:out value="${result.middleTelno}"/>
                                                	<c:if test="${result.middleTelno ne ''}">-</c:if>
                                                	<c:out value="${result.endTelno}"/></td>
                                                <td>
                                                	<c:forEach var="escode" items="${emplyrSttusCode}" varStatus="status">
                                                		<c:if test="${result.sttus == escode.code}"><c:out value="${escode.codeNm}"/></c:if>
                                                	</c:forEach>
                                                </td>

                                                <td>
                                                	<c:if test="${result.regYn eq 'N'}" >
                                                		<a href="" class="btn btn_blue_46 w_100" onclick="event.cancelBubble = true;fn_selectUserAbsnceReg('<c:out value="${result.userId}"/>', '<c:out value="${result.regYn}"/>'); return false;">등록</a>
													</c:if>                                                		
                                                	<c:if test="${result.regYn ne 'N'}" >
														<a href="" class="btn btn_skyblue_h46 w_100" onclick="event.cancelBubble = true;fn_selectUserAbsnceReg('<c:out value="${result.userId}"/>', '<c:out value="${result.regYn}"/>'); return false;">수정</a>                                                	                                                	
                                                	</c:if>	
                                                </td>
                                                <td>
                                                	<c:if test="${result.regYn eq 'Y'}" >
	                                                	<c:if test="${result.userAbsnceAt eq 'Y'}" ><c:out value="Y"/></c:if>
	                                                	<c:if test="${result.userAbsnceAt eq 'N'}" ><c:out value="N"/></c:if>
	                                                </c:if>	
                                                </td>
                                                <!-- 
                                                <td>                                                	
                                                	<c:if test="${result.regYn eq 'Y'}" ><c:out value="Y"/></c:if>
                                                	<c:if test="${result.regYn eq 'N'}" ><c:out value="N"/></c:if>
                                                </td>
                                                 -->
                                                
                                                <td>                                                 
													<fmt:formatDate value="${result.lastUpdtPnttm}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/> <br/>
												</td>       
                                            </tr>
                                            
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>

								<!-- 페이지 네비게이션 시작 -->
								<%-- <c:if test="${!empty userAbsnceVO.pageIndex }"> --%>
								<c:if test="${!empty userSearchVO.pageIndex }">								
                                <div class="board_list_bot">
                                    <div class="paging" id="paging_div">
                                        <ul>
                                            <ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_linkPage2" />
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