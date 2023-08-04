<%--
  Class Name : IdCheck.jsp
  Description : 아이디중복확인
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2009.03.03   JJY              최초 생성
     2011.08.31   JJY       경량환경 버전 생성
 
    author   : 공통서비스 개발팀 JJY
    since    : 2009.03.03
--%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<titile>ID중복확인</titile>
	<meta charset="UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="<c:url value='/'/>css/base.css">
	<link rel="stylesheet" href="<c:url value='/'/>css/layout.css">
	<link rel="stylesheet" href="<c:url value='/'/>css/component.css">
	<link rel="stylesheet" href="<c:url value='/'/>css/page.css">
	<link rel="stylesheet" href="<c:url value='/'/>css/mobiles.css">
	<script src="<c:url value='/'/>js/jquery-1.11.2.min.js"></script>
	<script src="<c:url value='/'/>js/ui.js"></script>
	<script src="<c:url value='/'/>js/jquery.js"></script>
	<script src="<c:url value='/'/>js/jqueryui.js"></script>
	<link rel="stylesheet" href="<c:url value='/'/>css/jqueryui.css">
<base target="_self">
<script defer src="<c:url value='/js/manage/users.js' />"></script>

</head>
<body>

	<form name="checkForm" action ="<c:url value='/idCheck'/>">

    <!-- 아이디중복확인 팝업 -->
    <div class="popup POP_DUPID_CONF">
        <div class="pop_inner">
            <div class="pop_header">
                <h1>아이디 중복확인</h1>
                <button type="button" class="close" onclick="fn_close(); return false;">닫기</button>
            </div>

            <div class="pop_container">
                <div class="box_1">
                    <label for="mid">사용할 아이디</label>
                    <input type="hidden" name="resultId" value="<c:out value="${checkId}"/>" />
                    <input type="hidden" name="usedCnt" value="<c:out value="${usedCnt}"/>" />
                    <input id="mid" class="f_txt2 ml15" type="text" name="checkId" title="선택여부" value="<c:out value="${checkId}"/>" maxlength="20" />
                </div>

                <p class="result">
                    <!-- 결과 : 중복확인을 실행하십시오. -->
                    결과 : 
                    <c:choose>
                    	<c:when test="${usedCnt eq -1}">
                    		&nbsp; 중복확인을 실행하십시오
                    	</c:when>
                    	<c:when test="${usedCnt eq 0}">
                    		<span>${checkId}</span> 는 사용가능한 아이디입니다.
                    	</c:when>
                    	<c:otherwise>
                    		<span>${checkId}</span> 는 사용할수 없는 아이디입니다.
                    	</c:otherwise>
                    </c:choose>
                </p>

                <div class="btn_area al_c pt20">
                    <a href="#LINK" class="btn btn_gray_46 w_100 display_ib" onclick="javascript:fn_checkId(); return false;"><spring:message code="button.inquire" /></a><!-- 조회하기 -->
                    <a href="#LINK" class="btn btn_blue_46 w_100 display_ib" onclick="javascript:fn_returnId(); return false;"><spring:message code="button.use" /></a><!-- 사용하기 -->
                </div>
            </div>
        </div>
    </div>
    <!--// 아이디중복확인 팝업 -->
    
    <!-- 20230217 js파일에서 스프링 메세지 사용을 위해 추가 -->
    <input type="hidden" id="resultMsg" value=""/>
    </form>

</body>
</html>