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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>내부업무 사이트 > 내부시스템관리 > 사용자등록관리</title>
<script defer src="<c:url value='/js/manage/users.js' />"></script>

	

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
                                 <!-- Location -->

                                <div class="col-xl-4 col-lg-5 col-md-6 welcome">
									<div class="welcome-icon">
										<h1><i class="fa fa-check-circle" aria-hidden="true"></i></h1>
										<h2>회원가입이 완료 되었습니다.</h2>
										<p>모든 회원가입절차가 완료 되었습니다.</p>
										<p>로그인 후 모든 서비스를 이용할 수 있습니다.</p>
										<div class="welcome-btn">
											<a href="#">로그인</a>
										</div>
									</div>
									
								</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>