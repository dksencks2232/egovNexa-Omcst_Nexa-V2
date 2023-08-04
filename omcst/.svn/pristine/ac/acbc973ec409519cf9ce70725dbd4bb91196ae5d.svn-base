<%--
  Class Name : EgovGroupSearch.jsp
  Description : EgovGroupSearch Search 화면
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
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>그룹 정보</title>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="<c:url value='/'/>css/base.css">
	<link rel="stylesheet" href="<c:url value='/'/>css/layout.css">
	<link rel="stylesheet" href="<c:url value='/'/>css/component.css">
	<link rel="stylesheet" href="<c:url value='/'/>css/page.css">
	<script src="<c:url value='/'/>js/jquery-1.11.2.min.js"></script>
	<script src="<c:url value='/'/>js/ui.js"></script>
	<script src="<c:url value='/'/>js/jquery.js"></script>
	<script src="<c:url value='/'/>js/jqueryui.js"></script>
	<link rel="stylesheet" href="<c:url value='/'/>css/jqueryui.css">
<base target="_self">
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<script defer src="<c:url value='/js/business/projectInsert.js' />"></script>
<validator:javascript formName="ProjectVO" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javaScript" language="javascript" defer="defer">
$(function(){
	$('.jbFixed').remove();
});
function fn_egov_init_date(){
	
	$("#projectBegineDate").datepicker(
	        {dateFormat:'yy-mm-dd'
	         , showOn: 'button'
	         , buttonImage: '<c:url value='/images/ico_calendar.png'/>'
	         , buttonImageOnly: true
	         
	         , showMonthAfterYear: true
	         , showOtherMonths: true
		     , selectOtherMonths: true
		     , monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
				
	         , changeMonth: true // 월선택 select box 표시 (기본은 false)
	         , changeYear: true  // 년선택 selectbox 표시 (기본은 false)
	         , showButtonPanel: true // 하단 today, done  버튼기능 추가 표시 (기본은 false)
	});

	$("#projectEndDate").datepicker( 
	        {dateFormat:'yy-mm-dd'
	         , showOn: 'button'
	         , buttonImage: '<c:url value='/images/ico_calendar.png'/>'
	         , buttonImageOnly: true
	         
	         , showMonthAfterYear: true
	         , showOtherMonths: true
		     , selectOtherMonths: true
		     , monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
				
	         , changeMonth: true // 월선택 select box 표시 (기본은 false)
	         , changeYear: true  // 년선택 selectbox 표시 (기본은 false)
	         , showButtonPanel: true // 하단 today, done  버튼기능 추가 표시 (기본은 false)
	});
}
	        function fn_egov_cancel_popup() {
	        	parent.fn_egov_modal_remove();
	        }
</script>

</head>

<body onload="fn_egov_init_date();">
	<form:form modelAttribute="projectVO" name="projectVO" method="post" action="cop/bbs/SelectBBSMasterInfs.do">
	
	<!-- 그룹 조회 팝업 -->
    <div class="popup POP_GROUP_SEARCH">
        <div class="pop_inner">
            <div class="pop_header">
                <h1>프로젝트 등록</h1>
                <button type="button" class="close"  onclick="fn_egov_cancel_popup(); return false;">닫기</button>
            </div>
			
            <div class="pop_container">
                <div class="board_view2">
                
                                    <table summary="프로젝트 등록 팝업">
                                        <colgroup>
                                            <col style="width: 190px;">
                                            <col style="width: 190px;">
                                            <col style="width: 190px;">
                                            <col style="width: auto;">
                                        </colgroup>
                                        <tr>
                                            <td class="lb">
                                                <label for="projectNm"><spring:message code="omcst.business.pjNm" /></label><!-- 게시판명 -->
                                                <span class="req">필수</span>
                                            </td>
                                            <td colspan="3">
                                                <form:input id="projectNm" class="f_txt w_full" Placeholder="프로젝트명 입력" title="프로젝트명 입력" path="projectNm" />
                                                <br/><form:errors path="projectNm" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="clientNm"><spring:message code="omcst.business.ctNm" /></label><!-- 게시판명 -->
                                                <span class="req">필수</span>
                                            </td>
                                            <td colspan="3">
                                            	<span class="f_search2 w_150">
	                                                <form:input id="clientNm" name="clientNm" class="f_txt w_full" readonly="true" Placeholder="고객사 입력" title="고객사 입력" path="clientNm" />
	                                                <br/><form:errors path="clientNm" />
	                                                <button type="button" class="btn" onclick="javascript:fncSearchClientPop()">조회</button>
                                                </span>
                                            </td>
                                        </tr>
										<tr>
	                                         <td class="lb">
                                                <label for=""><spring:message code="omcst.business.pjBgnde" /></label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>                                     
                                               	<input type="text" class="f_date" name="projectBegineDate" id="projectBegineDate"  maxlength="10" value="${projectVO.projectBegineDate}" title="시작일자입력" />
                                               	<form:errors path="projectBegineDate" />
                                            </td>
                                            <td class="lb">
                                                <label for=""><spring:message code="omcst.business.pjEndde" /></label>
                                                <span class="req">필수</span>
                                            </td>                           
                                            <td>
                                               	<input type="text" class="f_date" name="projectEndDate" id="projectEndDate" maxlength="10" value="${projectVO.projectEndDate}" title="종료일자입력" >
                                                <form:errors path="projectEndDate" />   
                                            </td>
										<tr>
										<tr>
                                            <td class="lb">
                                                <label for="projectLeader"><spring:message code="omcst.business.pjLd" /></label><!-- 게시판명 -->
                                                <span class="req">필수</span>
                                            </td>
                                            <td colspan="3">
                                                <form:input id="projectLeader" name="projectLeader" class="f_txt w_full" Placeholder="책임자 입력" title="책임자 입력" path="projectLeader" />
                                                <br/><form:errors path="projectLeader" />
                                            </td>
                                        </tr>
<%--                                         <tr>
                                            <td class="lb">
                                                <label for="projectStaffList">팀원</label><!-- 게시판명 -->
                                            </td>
                                            <td colspan="3">
                                                <form:input id="projectStaffList" name="projectStaffList" class="f_txt w_full" Placeholder="팀원 입력" title="팀원 입력" path="projectStaffList" />
                                            </td>
                                        </tr> --%>
                                    </table>
                                </div>
            </div>
            
        </div>
    </div>
    <!--// 그룹 조회 팝업 -->
    
    <input type="hidden" name="groupId"/>
	<input type="hidden" name="groupIds"/>
	<input type="hidden" name="pageIndex" value="<c:out value='${groupManageVO.pageIndex}'/>"/>
	<input type="hidden" name="searchCondition"/>
	
	</form:form>
    
</body>
</html>
