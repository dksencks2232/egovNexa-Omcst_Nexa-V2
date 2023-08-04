<%--
  Class Name : EgovFindPwd.jsp
  Description : 사용자 비밀번호 초기화 화면
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2023.04.05  khi              최초 생성 
    author   : khi
    since    : 2023.04.05  
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!-- 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 -->
<!DOCTYPE html>

<html>
<head>
	<%--패스워드 힌트목록 코드 --%>
	<c:set var='passwordHint' value='<%= egovframework.omcst.common.service.CodeCacheService.getCode("COM022") %>' />

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

<title>로그인 로그 상세</title>
</head>

<script type="text/javascript">

/* ********************************************************
 * 취소처리
 ******************************************************** */
function fn_egov_goBack_popup(){
	$('#modalPan').remove();
	window.history.back();
}
function fn_egov_cancel_popup() {
	$('#modalPan').remove();
	location.href = "/userModify?menuId=9030000";
}

$(function(){
	$('.footer').hide();
	$('.location').hide();
    var $dialog = $('<div id="modalPan"></div>')
//	.html('<iframe style="border: 0px; " src="' + "<c:url value='/sym/log/clg/InqireLoginLog.do?logId='/>" + logId +'" width="100%" height="100%"></iframe>')
	.html('<iframe style="border: 0px; " src="' + '<c:url value="/userConfirm"/>" width="100%" height="100%"></iframe>')
	.dialog({
    	autoOpen: false,
        modal: true,
        width: 850,
        height: 470
	});
    $(".ui-dialog-titlebar").hide();    
	$(".ui-dialog-content").css('overflow','hidden');        
	$dialog.dialog('open');
});
</script>