
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta http-equiv="Content-Language" content="ko" >
	
	<!-- css -->
	<link rel="stylesheet" href="<c:url value='/'/>css/base.css">
	<link rel="stylesheet" href="<c:url value='/'/>css/component.css">
	<link rel="stylesheet" href="<c:url value='/'/>css/page.css">
	<link rel="stylesheet" href="<c:url value='/'/>css/layout.css">
	<link rel="stylesheet" href="<c:url value='/'/>css/mobiles.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" >
	<link rel="stylesheet" href="<c:url value='/'/>css/jqueryui.css">
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
	
	<!-- 20230407 join.jsp 타이일 제외로 인한 제이쿼리 추가 및 contextpath 설정 -->
	<script type="text/javaScript" language="javascript">
		sessionStorage.setItem("contextpath", "${pageContext.request.contextPath}");
	</script>
	<script src="<c:url value='/'/>js/jquery-1.11.2.min.js"></script>
	
	<script defer src="<c:url value='/js/common/Common.js' />"></script>
	<script defer src="<c:url value='/js/manage/join.js' />"></script>
	<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
	<validator:javascript formName="memberVO" staticJavascript="false" xhtml="true" cdata="false"/>
	<title>로그인</title>
</head>


<body>
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
    <div class="wrap">
 		<div class="container">
            <div class="sub_layout">
                <div class="sub_in">
                    <div class="layout">
                        <div class="content_wrap">
                            <div id="contents" class="content">
                                 <!-- Location -->
                               
								<div class="col-xl-4 col-lg-5 col-md-6 join">
									<div class="join-title">
										<h2>환영합니다</h2>
										<p>오픈마인즈 입니다.</p>
									</div>
									<div class="join-wrap">
										<form:form modelAttribute="memberVO" name="memberVO" method="post">
											<div>
												<div class="control-group form-group">
												  <div class="controls">
										              <div>
										              	  <label for="email-address">이메일</label>
											              <div class="input-group email-input">
												              <span class="email-input__local">
													              <label>	
														              <input class="form-control" name="preEmail" placeholder="이메일" size="1" class="form-control">
														              <input type="hidden" name="mberEmailAdres" />
														              <span class="form-control-blind">이메일 앞 주소 입력하기</span>
													              </label>
												              </span>
												              <span class="email-input__separator">@</span>
												              <span class="email-input__domain">
													              <label>
														              <select class="form-control" id="selectEmail" name="postEmail">
															              <option value="" disabled="">선택해주세요</option>
															              <option value="naver.com">naver.com</option>
															              <option value="hanmail.net">hanmail.net</option>
															              <option value="daum.net">daum.net</option>
															              <option value="gmail.com">gmail.com</option>
															              <option value="nate.com">nate.com</option>
															              <option value="hotmail.com">hotmail.com</option>
															              <option value="outlook.com">outlook.com</option>
															              <option value="icloud.com">icloud.com</option>
															              <option value="myemail">직접입력</option>
														              </select>
														              <span class="form-control-blind">이메일 도메인 선택하기</span>
													              </label>
																  <label>
													              	  <input class="form-control" id="selboxDirect" placeholder="입력해주세요" size="1" >
													              	  <span class="form-control-blind">이메일 도메인 입력하기</span>
																  </label>
																  <button class="email-input__domain__expand" id="close-email" aria-label="초기화" type="button" tabindex="-1">
																	  <svg class="icon" width="10" height="10"  style="fill: currentcolor;">
																	  	<path fill-rule="evenodd" d="M5 4L8.5.3l1 1.1L6.2 5l3.5 3.6-1 1L5 6.1 1.4 9.6l-1-1L3.9 5 .4 1.5l1.1-1L5 3.8z"></path>
																	  </svg>
																  </button>
													              <button class="email-input__domain__expand"  id="select-email" aria-label="초기화" type="button" tabindex="-1">
														              <svg class="icon" width="10" height="10" style="fill: currentcolor;">
														              	<path fill-rule="evenodd" d="M0 3l5 5 5-5z"></path>
														              </svg>
													              </button>
												              </span>
											              </div>
										              </div>
										              
												  </div>
												  <div class="al_c join-btn mt10">
												  	<div id="email_check">이메일 인증하기</div>
												  </div>
												  <div class="mail-check-box mt10">
												  	<input class="form-control mail-check-input" placeholder="인증번호 6자리를 입력해주세요!" disabled="disabled" maxlength="6">
												  	<div><span id="timer"></span></div>
												  </div>
													<span id="mail-check-warn"></span>
												</div>
											</div>							
											<div>
												<div class="control-group form-group">
												  <div class="controls">
										          	<label for="join_ID">아이디</label>
										          	<input type="text" class="form-control" name="mberId"/>
										            <div style="display:none; color:blue; " id="availableId" class="sft-info">* 사용 가능한 아이디입니다.</div>
										            <div style="display:none; color:red;" id="unavailableId" class="sft-info">* 사용 불가능한 아이디입니다.</div>
												  </div>
												</div>
											</div>
											<div>
												<div class="control-group form-group">
												  <div class="controls">
										              <label for="password">비밀번호</label>
										              <input type="password" class="form-control" name="password"/>
										              <div style="display:none; color:red;" class="sft-info" id="checkPass"></div>
												  </div>
												</div>
											</div>
											<div>
												<div class="control-group form-group">
												  <div class="controls">
										              <label for="re-password">비밀번호 확인</label>
										              <input type="password" class="form-control" name="rePassword"/>
										              <div style="display:none" id="repassCheck" class="sft-info">* 입력하신 비밀번호와 일치하지 않습니다.</div>
										              <div style="display:none; color:red;" id="checkRePass" class="sft-info"></div>
												  </div>
												</div>
											</div>
											
											<div>
												<div class="control-group form-group">
												  <div class="controls">
										              <label for="name">이름</label>
										              <input type="text" class="form-control" name="mberNm"/>
										              <div style="display:none; color:red;" class="sft-info" id="checkMberNm"></div>
												  </div>
												</div>
											</div>
											<!-- <div>
												<div class="control-group form-group">
												  <div class="controls">
										              <label for="phone-number">휴대폰번호</label>
										              <input type="tel" class="form-control" name="mbtlnum"/>
												  	  <div class="sft-info">'-' 없이 숫자만 입력하세요</div>	
												  </div>
												</div>
											</div> -->
										</form:form>
										<div class="al_c join-btn">
											<div id="joinBtn">가입하기</div>
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