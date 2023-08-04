<%--
  Class Name : EgovIncHeader.jsp
  Description : 화면상단 Header (include)
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2011.08.31   JJY       경량환경 버전 생성
 
    author   : 실행환경개발팀 JJY
    since    : 2011.08.31 
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import ="egovframework.com.cmm.LoginVO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javaScript" language="javascript">
sessionStorage.setItem("contextpath", "${pageContext.request.contextPath}");
</script>
<script type="text/javascript" src="<c:url value='/js/inc/header.js' />"></script>

<!-- Header -->
<div class="header">
	<div class="jbFixed">
	    <div class="inner">
	        <div class="left_col">
	            <h1 class="logo"><a href="<c:url value='/'/>cmm/main/mainPage.do"><img src="/images/omcstlogo.png" alt="logo"></a></h1>
	        </div>
			<div class="right_col">
				<%
					LoginVO loginVO = (LoginVO)session.getAttribute("LoginVO");
					String role = (String)session.getAttribute("role");
					if(loginVO == null){
				%>
					<div class="top_menu">
			            <span class="t"><span>로그인정보 없음</span> &nbsp</span>
			            <span class="d">로그인후 사용하십시오</span>
			            <a href="<c:url value='/uat/uia/egovLoginUsr.do'/>" class="btn btn_blue_15 w_90">로그인</a>
			        </div>
				<% } else { %>
					<c:set var="loginName" value="<%= loginVO.getName()%>"/>
					<c:set var="creatDt" value="<%= loginVO.getCreatDt()%>"/>
					<c:set var="role" value="<%=role%>"/>
			        <div class="top_menu">			        
			            <span class="t"><span onclick="fnUserModify(); return false;" style="cursor: pointer;">${loginName} 님</span>의 최종접속정보는 </span>
			            <span class="d">${creatDt} 입니다.</span>
			            <a href="<c:url value='/uat/uia/actionLogout.do'/>" class="btn btn_blue_15 w_90">로그아웃</a>
			        </div>
		        <% } %>
		        <input type="hidden" id="loginYn" value="${loginName}"/>
		        <div class="m_meun">
		        </div>
			</div>     
	    </div>
    </div>
</div>
<!--// Header -->

<!-- Menu list -->
<form name="menuListForm" action="" method="post">
	<input type="hidden" id="testData" value="꽥" />
    <input type="hidden" id="baseMenuNo" name="baseMenuNo" value="<%=session.getAttribute("baseMenuNo")%>" />
    <input type="hidden" id="link" name="link" value="" />
    <div style="width:0px; height:0px;">
    <c:forEach var="result" items="${list_menulist}" varStatus="status" > 
        <input type="hidden" name="tmp_menuNm" value="${result.menuNo}|${result.upperMenuId}|${result.menuNm}|${result.relateImagePath}|${result.relateImageNm}|${result.chkURL}|" />
    </c:forEach>
    </div>
</form>