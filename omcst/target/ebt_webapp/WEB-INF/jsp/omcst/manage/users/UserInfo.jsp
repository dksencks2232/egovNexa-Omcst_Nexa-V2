<%--
  Class Name : EgovUserInsert.jsp
  Description : 사용자등록View JSP
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
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>내부업무 사이트 > 내부서비스관리 > 사용자등록관리</title>

<%--20230213 주소검색을 위한 script파일 추가 --%>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script defer src="<c:url value='/js/fn_ZipSearch.js' />"></script>
<script defer src="<c:url value='/js/manage/users.js' />"></script>

<script type="text/javascript" src="<c:url value='/js/EgovCalPopup.js'/>" ></script>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="userManageVO" staticJavascript="false" xhtml="true" cdata="false"/>

</head>
<body onload="fn_egov_init_date();">
<noscript>자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

<%--패스워드 힌트목록 코드 --%>
<c:set var='passwordHint' value='<%= egovframework.omcst.common.service.CodeCacheService.getCode("COM022") %>' />
<%--사용자상태코드--%>
<c:set var='emplyrSttusCode' value='<%= egovframework.omcst.common.service.CodeCacheService.getCode("COM013") %>' />
<%--소속기관코드--%>
<c:set var='insttCode' value='<%= egovframework.omcst.common.service.CodeCacheService.getCode("COM025") %>' />

<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
		<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
</div>

    <!-- Skip navigation -->
    <a href="#contents" class="skip_navi">본문 바로가기</a>

    <div class="wrap">
        <div class="container">
            <div class="sub_layout">
                <div class="sub_in">
                    <div class="layout">
                        <div class="content_wrap">
                            <div id="contents" class="content">
                                 
								
								<form:form modelAttribute="userManageVO" action="${pageContext.request.contextPath}/userInsert" name="userManageVO" method="post" >
								

                                <div class="board_view2">
	                                <div class="userinfo">
	                                	<div>
	                                		<div class="lb">
                                                <label for="emplyrId">사용자아이디</label>
                                                <span class="req">필수</span>
	                                		</div>
	                                		<div>
	                                			<span class="f_search2 w_200">
                                                    <input type="text" class="f_txt w_full"  maxlength="20" disabled="disabled" id="id_view" name="id_view" readonly="readonly" Placeholder="아이디를 입력해주세요">
                                                    <form:input path="emplyrId" id="emplyrId" title="사용자아이디" maxlength="20" type="hidden" />
                                                    <button type="button" class="btn" onclick="fn_IdCheck();">조회</button>
                                                </span>
                                                <span class="f_txt_inner ml10">(중복체크)</span>
                                                <form:errors path="emplyrId" />
                                            </div>
	                                		<div class="lb">
	                                			<label for="moblphonNo">핸드폰번호</label>
                                                <span class="req">필수</span>
	                                		</div>
	                                		<div>
	                                			<form:input path="moblphonNo" id="moblphonNo" title="핸드폰번호" class="f_txt w_300" maxlength="15" Placeholder="핸드폰 번호를 입력해주세요" />
                                                <form:errors path="moblphonNo" />
	                                		</div>
	                                	</div>
	                                	<div>
                                            <div class="lb">
                                                <label for="password">비밀번호</label>
                                                <span class="req">필수</span>
                                            </div>
                                            <div>
                                                <form:password path="password" id="password" title="비밀번호" class="f_txt w_300" maxlength="20" Placeholder="비밀번호를 입력해주세요"/>
                                                <form:errors path="password" />
                                            </div>
                                            <div class="lb">
                                                <label for="password2">비밀번호확인</label>
                                                <span class="req">필수</span>
                                            </div>
                                            <div>
                                                <input name="password2" id="password2" title="비밀번호확인" type="password" class="f_txt w_300" maxlength="20" Placeholder="비밀번호를 재입력해주세요"/>
                                            </div>
                                        </div>
                                        <div>
                                        	<div class="lb" >
                                        		<label for="passwordHint">비밀번호힌트</label>
                                                <span class="req">필수</span>
                                        	</div>
                                        	<div>
                                                <label class="f_select w_full" for="passwordHint">
                                                    <form:select path="passwordHint" id="passwordHint" name="passwordHint" title="비밀번호힌트">
	                                                    <form:option value="" label="선택하세요"/>
	                                                    <form:options items="${passwordHint}" itemValue="code" itemLabel="codeNm"/>
                                                    </form:select>
                                                </label>
                                                <form:errors path="passwordHint" />
                                            </div>
                                            <div class="lb">
                                                <label for="passwordCnsr">비밀번호정답</label>
                                                <span class="req">필수</span>
                                            </div>
                                            <div>
                                                <form:input path="passwordCnsr" id="passwordCnsr" title="비밀번호정답" class="f_txt w_full" maxlength="100" Placeholder="비밀번호 정답을 입력해주세요"/>
                                                <form:errors path="passwordCnsr" />
                                            </div>
                                        </div>
                                        <div>
                                        	<div class="lb" >
                                                <label for="emplyrNm">이름</label>
                                                <span class="req">필수</span>
                                            </div>
                                            <div>
                                            	<input name="emplyrNm" id="emplyrNm" title="사용자이름" type="text" class="f_txt w_300" value="" maxlength="15"  Placeholder="이름을 입력해주세요"/>
                                                <form:errors path="emplyrNm" />
                                            </div>
                                            <div class="lb">
                                                <label for="insttCode">소속기관</label>
                                            </div>
                                            <div>
                                                <label class="f_select w_300" for="insttCode">
                                                    <form:select path="insttCode" id="insttCode" name="insttCode" title="소속기관">
	                                                    <form:option value="" label="선택하세요"/>
	                                                    <form:options items="${insttCode}" itemValue="code" itemLabel="codeNm"/>
                                                    </form:select>
                                                </label>
                                                <form:errors path="insttCode" />
                                            </div>
                                        </div>
                                        <div>
                                            <div class="lb">
                                            	<label for="orgnztId">부서</label>
                                            	<span class="req">필수</span>
                                            </div>
                                            <div>
                                                <label class="f_select w_300" for="orgnztId">
                                                    <form:select  class="f_select w_300" path="orgnztId" id="orgnztId" name="orgnztId" title="부서">
	                                                    <form:option value="" label="선택하세요"/>
	                                                    <form:options items="${orgnztId_result}" itemValue="code" itemLabel="codeNm"/>
                                                    </form:select>
                                                </label>
                                                <form:errors path="orgnztId" />
                                            </div>    
                                            <div class="lb">
                                            	<label for="ofcpsNm">직급</label>
                                            </div>
                                            <div>
                                                <form:input path="ofcpsNm" id="ofcpsNm" title="직위명" class="f_txt w_300" maxlength="30" Placeholder="직급을 입력해주세요"/>
                                                <form:errors path="ofcpsNm" />
                                            </div>
                                        </div>
                                        <div>
                                        	<div class="lb" >
                                                <label for="emailAdres">이메일</label>
                                            </div>
                                            <div>
                                            	<form:input path="emailAdres" id="emailAdres" title="이메일주소" class="f_txt w_300" maxlength="50"  Placeholder="이메일을 입력해주세요"/>
                                                <form:errors path="emailAdres" />
                                            </div>
                                            <div class="lb">
                                                <label for="areaNo">집전화<br>지역번호</label>
                                            </div>
                                            <div>
                                                <form:input path="areaNo" id="areaNo" title="areaNo" class="f_txt w_70" maxlength="5"  Placeholder="010"/>
                                                <span class="f_txt_inner mr5 ml5" title="전화번호 첫번째">-</span>
                                                <form:input path="homemiddleTelno" title="homemiddleTelno" id="homemiddleTelno" class="f_txt w_70" maxlength="5" />
                                                <span class="f_txt_inner mr5 ml5">-</span>
                                                <form:input path="homeendTelno" title="homeendTelno" id="homeendTelno" class="f_txt w_70" maxlength="5" />
                                            </div>
                                        </div>
                                        <div>
                                            <div class="lb">
                                                <label for="offmTelno">사무실<br>전화번호</label>
                                            </div>
                                            <div>
                                                <form:input path="offmTelno" id="offmTelno" title="사무실전화번호" class="f_txt w_300" maxlength="15"  Placeholder="사무실전화번호를 입력해주세요"/>
                                                <form:errors path="offmTelno" />
                                            </div>
                                            <div class="lb">
                                                <label for="fxnum">팩스번호</label>
                                            </div>
                                            <div>
                                                <form:input path="fxnum" id="fxnum" title="팩스번호" class="f_txt w_300" maxlength="15"  Placeholder="팩스번호를 입력해주세요"/>
                                                <form:errors path="fxnum" />
                                            </div>
                                        </div>
                                        <div>
                                        	<div class="lb" >
                                                <label for="joinDate">입사일</label>
                                                <span class="req">필수</span>
                                            </div>
                                            <div>
                                                <form:input path="joinDate" id="joinDate" type="text" class="f_date" maxlength="10"  Placeholder="입사일"  readonly="true"/>
                                                <form:errors path="joinDate" />
                                            </div>
                                        	<div class="lb" >
                                                <label for="retire">퇴사일</label>
                                                <!-- 
                                                <span class="req">필수</span>
                                                 -->
                                            </div>
                                            <div>
                                            	<!-- 
                                                <form:input path="retire" id="retire" type="text" class="f_date" maxlength="10"  Placeholder="입사일"/>
                                                <form:errors path="retire" />
                                                 -->
                                            </div>
                                        </div>
                                        <div>
                                        	<div class="lb" >
                                                <label for="emplyrSttusCode">사용자상태<br>코드</label>
                                                <span class="req">필수</span>
                                            </div>
                                            <div>
                                                <label class="f_select w_300" for="emplyrSttusCode">
                                                    <form:select path="emplyrSttusCode" id="emplyrSttusCode" name="emplyrSttusCode" title="사용자상태코드">
	                                                    <form:option value="" label="선택하세요"/>
	                                                    <form:options items="${emplyrSttusCode}" itemValue="code" itemLabel="codeNm"/>
                                                    </form:select>
                                                </label>
                                                <form:errors path="emplyrSttusCode" />
                                            </div>
                                            <div class="lb">
                                                <label for="groupId">그룹아이디</label>
                                                <span class="req">필수</span>
                                            </div>
                                            <div>
                                                <label class="f_select w_300" for="groupId">
                                                    <form:select path="groupId" id="groupId" name="groupId" title="그룹아이디">
	                                                    <form:option value="" label="선택하세요"/>
	                                                    <form:options items="${groupId_result}" itemValue="code" itemLabel="codeNm"/>
                                                    </form:select>
                                                </label>
                                                <form:errors path="groupId" />
                                            </div>
                                        </div>
                                        <div>
                                        	<div class="lb" >
                                                <label for="zip">우편번호</label>
                                            </div>
                                            <div>
                                                <span class="f_search2 w_150">
                                                    <form:input path="zip" id="zip" title="우편번호" maxlength="8" readonly="true"  Placeholder="우편번호"/>
                                                    <form:errors path="zip" />
                                                    <button type="button" class="btn" onclick="execDaumPostcode();">조회</button>
                                                </span>
                                            </div>
                                            <div class="lb">
                                            	<label for="homeadres">기본주소</label>
                                            </div>
                                            <div>
                                            	<form:input path="homeadres" id="homeAdres" title="기본주소" class="f_txt w_full" maxlength="50" readonly="true"  Placeholder="기본주소를 입력해주세요"/>
                                                <form:errors path="homeadres" />
                                            </div>
                                        </div>
                                        <div>
                                        	<div class="lb">
                                                <label for="detailAdres">상세주소</label>
                                            </div>
                                            <div>
                                                <form:input path="detailAdres" id="detailAdres" title="상세주소" class="f_txt w_full" maxlength="50"  Placeholder="상세주소를 입력해주세요"/>
                                                <form:errors path="detailAdres" />
                                            </div>
                                        </div>
	                                </div> 
                                </div>

								<!-- 목록/저장버튼  -->
                                <div class="board_view_bot">
                                    <div class="left_col btn3">
                                        <a href="#LINK" class="btn btn_skyblue_h46 w_100" onclick="javascript:document.userManageVO.reset();"><spring:message code="button.reset" /></a><!-- 초기화 -->
                                    </div>

                                    <div class="right_col btn1">
                                        <a href="#LINK" class="btn btn_blue_46 w_100"onclick="JavaScript:fn_insert(); return false;"><spring:message code="button.save" /></a><!-- 저장 -->
                                        <a href="<c:url value='/userManage'/>" class="btn btn_blue_46 w_100"onclick="fn_listPage(); return false;"><spring:message code="button.list" /></a><!-- 목록 -->
                                    </div>
                                </div>
                                <!-- // 목록/저장버튼 끝  -->
                               
                               <!-- 검색조건 유지 -->
						        <input type="hidden" name="searchCondition" value="<c:out value='${userSearchVO.searchCondition}'/>"/>
						        <input type="hidden" name="searchKeyword" value="<c:out value='${userSearchVO.searchKeyword}'/>"/>
						        <input type="hidden" name="sbscrbSttus" value="<c:out value='${userSearchVO.sbscrbSttus}'/>"/>
						        <input type="hidden" name="pageIndex" value="<c:out value='${userSearchVO.pageIndex}'/><c:if test="${userSearchVO.pageIndex eq null}">1</c:if>"/>
						        
						        <!-- 20230216 js파일에서 스프링 메세지 사용을 위해 추가 -->
						        <input type="hidden" id="pMessage" value="<spring:message code='fail.user.passwordUpdate2' />"/>
						        <input type="hidden" id="resultMsg" value=""/>
                                </form:form>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>