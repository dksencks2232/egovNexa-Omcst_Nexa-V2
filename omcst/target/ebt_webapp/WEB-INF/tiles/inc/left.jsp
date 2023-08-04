<%--
  Class Name : left.jsp
  Description : 좌메뉴화면(include)
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
<script type="text/javascript" src="<c:url value='/js/inc/left.js' />"></script>

<div class="page_cover"></div>
<div id="menubar">
	<div class="fold_area tabled animate"  style="padding-left: 24px;" >
		<div class="table-cell vertical-middle" style="padding-right: 36px;">
			<!-- <a href="/ebt_webapp/uat/uia/actionMain.do" class="logo_icon_menu"> -->
			<a href="<c:url value='/'/>uat/uia/actionMain.do" class="logo_icon_menu">
				<img src="<c:url value='/'/>images/omcstlogo.png" alt="오픈마인즈">
			</a>
		</div>
		<a class="_tooltip_btn side_bar_btn" href="#" role="button" id="toggle_button">
			<span class="fold_button left">
				<i class="fa fa-bars"></i>
			</span>
		</a>
	</div>
	<div class="nano has-scrollbar">
		<div class="nano-content" tabindex="0" >
			<div class="al_c m_login">
			<%
					LoginVO loginVO = (LoginVO)session.getAttribute("LoginVO");
					if(loginVO == null){
			%>
				<div class="m_logout">
				<p>로그인 해주세요.</p>
				<div class="txt_btn_wrap">
					<button type="button" class="btn_grn" onclick="location.href='/uat/uia/egovLoginUsr.do'"><span>로그인</span></button>
				</div>
			</div>
			<% } else { %>
					<c:set var="loginName" value="<%= loginVO.getName()%>"/>
					<c:set var="creatDt" value="<%= loginVO.getCreatDt()%>"/>
					${loginName} 님의 최종접속정보는 
					<span class="d">${creatDt} 입니다.</span>
					<a href="<c:url value='/uat/uia/actionLogout.do'/>" class="btn btn_blue_15 w_90 mt20">로그아웃</a>
			<% } %>
			</div>
			<div class="menubar-scroll-panel" >
			  <div id="targetMenu"  class="flex-shrink-0 p-3 menu-wrap">
		
			  </div>
			</div>
			<div class="nano-pane">
				<div class="nano-slider"></div>
			</div>
		</div>
	</div>
</div>

