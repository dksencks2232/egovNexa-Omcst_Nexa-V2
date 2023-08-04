<%--
  Class Name : EgovFindId.jsp
  Description : 사용자 아이디 찾기 화면
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
$(function(){
	$('.jbFixed').remove();
	$("#pwd").focus();
});
function fn_egov_goBack_popup()
{
	parent.fn_egov_goBack_popup();	
}
function fnConfirm()
{
	let obj={
			"pwd" : $('#pwd').val()
		};

	$.ajax({
        type: "post",
        url : "${pageContext.request.contextPath}/uat/uia/selectPwd.do",
        data : obj,
        success : function (data){
       		if(data == '1')
       		{
       			parent.fn_egov_cancel_popup();
       		}
       		else
       		{
       			alert('비밀번호를 확인해주세요.');
       			$("#pwd").focus();
       		}
        }
	})
}
</script>
<body>
<noscript>자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

	<form name="Form" method="post" action="#LINK" >
	
	<!-- 로그인 로그 정보 팝업 -->
    <div class="popup POP_LOGIN_LOG">
        <div class="pop_inner">
            <div class="pop_header">
                <h1>비밀번호 입력</h1>
                <button type="button" class="close" onclick="fn_egov_goBack_popup(); return false;">닫기</button>
            </div>

            <div class="pop_container">
                <div class="board_view2">
                    <table>
                        <colgroup>
                            <col style="width: auto;">
                        </colgroup>
                        <tr>
                            <td>
                             	<input class="f_input w_700" id="pwd" type="password" maxlength="35" title="비밀번호">
                            </td>
                        </tr>
                    </table>
                </div>
				<!-- 조회/취소버튼 -->
				<div class="board_view_bot">
                    <div class="right_col btn1">
    	             	<button class="btn btn_blue_46 w_100" type="submit" onclick="javascript:fnConfirm(); return false;">확인</button><!-- 조회 -->
	                </div>
				 </div>		                
                
            </div>
        </div>
    </div>
    <!--// 로그인 로그 정보 팝업 -->
    
    </form>
    
</body>
</html>

