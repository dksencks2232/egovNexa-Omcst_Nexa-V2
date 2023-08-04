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
function fn_egov_cancel_popup() {
	parent.fn_egov_find_id_close();	
}

$(function(){
	$('.jbFixed').remove();
});

function fnSearch()
{
	if($('#userNm').val() == "")
	{
		alert('사용자명은 필수 입력 항목입니다.');
		return false;
	}
	/*
	if($('#mbtlnum').val() == "")
	{
		alert('핸드폰 번호는 필수 입력 항목입니다.');
		return false;
	}
	*/
	
	if($('#areaNo').val() == "" || $('#homemiddleTelno').val() == "" || $('#homeendTelno').val() == "")
	{
		alert('집전화 지역번호 항목은 필수 입력 항목입니다.');
		return false;
	}

	let obj={
		"userNm" : $('#userNm').val(),
		"areaNo" :  $('#areaNo').val(),
		"homemiddleTelno" :  $('#homemiddleTelno').val(),
		"homeendTelno" :  $('#homeendTelno').val()
		//"mbtlnum" : $('#mbtlnum').val() 핸드폰 번호
	};


	$.ajax({
	        type: "post",
	        url : "${pageContext.request.contextPath}/uat/uia/selectEgovFindId.do",
	        data : obj,
	        success : function (data){
	        	console.log(data);
	        	if(data != '')
	        	{
	        		alert('조회한 계정의 아이디는 '+data+' 입니다.')
	        	}
	        	else
	        	{
	        		alert('검색대상 결과 데이터가  존재하지 않습니다.');
	        	}
	        },
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
                <h1>사용자 아이디 찾기</h1>
                <button type="button" class="close" onclick="fn_egov_cancel_popup(); return false;">닫기</button>
            </div>

            <div class="pop_container">
                <div class="board_view2">
                    <table>
                        <colgroup>
                            <col style="width: 190px;">
                            <col style="width: auto;">
                        </colgroup>
                        <tr>
                            <td class="lb">
                                <span class="min">사용자명</span>
                                <span class="req">필수</span>
                            </td>
                            <td>
                             	<input class="f_input w_500" id="userNm" type="text" maxlength="35" title="아이디">
                            </td>
                        </tr>
                        <!--                         
                        <tr>
                            <td class="lb">
                                <span class="min">핸드폰번호</span>
                                <span class="req">필수</span>
                            </td>
                            <td>
                             	<input class="f_input w_500" id="mbtlnum" type="text" maxlength="35" title="아이디">
                            </td>
                        </tr>
                        -->
                        <tr>
                           <td class="lb">
                               <label for="areaNo">집전화<br>지역번호</label>
                               <span class="req">필수</span>
                           </td>
                           <td>
                               <input id="areaNo" class="f_txt w_70" maxlength="4" title="전화번호 첫번째" />
                               <span class="f_txt_inner mr5 ml5">-</span>
                               <input id="homemiddleTelno" class="f_txt w_70" maxlength="4" title="전화번호 두번째" />
                               <span class="f_txt_inner mr5 ml5">-</span>
                               <input id="homeendTelno" class="f_txt w_70" maxlength="4" title="전화번호 세번째" />
                           </td>
                        </tr>
                    </table>
                </div>
				<!-- 조회/취소버튼 -->
				<div class="board_view_bot">
                    <div class="right_col btn1">
    	             	<button class="btn btn_blue_46 w_100" type="submit" onclick="javascript:fnSearch(); return false;">조회</button><!-- 조회 -->
	                 	<button class="btn btn_red_46 w_100" type="submit" onclick="javascript:fn_egov_cancel_popup(); return false;">닫기</button><!-- 닫기 -->
	                </div>
				 </div>		                
                
            </div>
        </div>
    </div>
    <!--// 로그인 로그 정보 팝업 -->
    
    </form>
    
</body>
</html>

