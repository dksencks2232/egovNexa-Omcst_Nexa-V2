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

<title>사용자 상세 및 수정</title>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script defer src="<c:url value='/js/fn_ZipSearch.js' />"></script>
<script defer src="<c:url value='/js/manage/users1.js' />"></script>

<script type="text/javascript" src="<c:url value='/js/EgovCalPopup.js'/>" ></script>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="userManageVO" staticJavascript="false" xhtml="true" cdata="false"/>
<script>
$(function(){
	$("#insttCode1").val($("#insttCode option:checked").text());
	$("#orgnztId1").val($("#orgnztId option:checked").text());
	$("#groupId1").val($("#groupId option:checked").text());
});
</script>
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
                                 
								
								<form:form modelAttribute="userManageVO" action="${pageContext.request.contextPath}/topUserUpdate" name="userManageVO" method="post" >
								
                                <div class="board_view2">
	                                <table>
                               			<colgroup>
                                            <col style="width: 160px;">
                                            <col style="width: auto;">
                                            <col style="width: 160px;">
                                            <col style="width: auto;">
                                        </colgroup>
                                        <tr>
                                            <td class="lb">
                                                <label for="emplyrId">사용자아이디</label>
                                            </td>
                                            <td>
                                                <form:input path="emplyrId" id="emplyrId" class="f_txt w_full" maxlength="20" readonly="true" />
                                                <form:errors path="emplyrId" />
                                                <form:hidden path="uniqId" />                                                
                                            </td>
                                            <td class="lb" >
                                                <label for="moblphonNo">핸드폰번호</label>
                                            </td>
                                            <td>
                                                <form:input path="moblphonNo" id="moblphonNo" title="핸드폰번호" class="f_txt w_300" maxlength="15" />
                                                <form:errors path="moblphonNo" />
                                            </td>
                                        </tr>
                                        <tr>
                                        	<td class="lb" >
                                                <label for="emplyrNm">이름</label>
                                            </td>
                                            <td>
                                                <form:input path="emplyrNm" id="emplyrNm" title="핸드폰번호" class="f_txt w_300" maxlength="15" />
                                                <form:errors path="emplyrNm" />

                                            </td>
                                            <td class="lb">
                                                <label for="insttCode">소속기관</label>
                                            </td>
                                            <td>
                                                <label class="f_select w_300" for="insttCode" style="display:none">
                                                    <form:select path="insttCode" id="insttCode" name="insttCode" title="소속기관">
	                                                    <form:option value="" label="선택하세요"/>
	                                                    <form:options items="${insttCode}" itemValue="code" itemLabel="codeNm"/>
                                                    </form:select>
                                                </label>
                                                <form:errors path="insttCode" />
                                                <input id="insttCode1" class="f_txt w_300" readOnly="true"/>
                                            </td>                                            
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                            	<label for="orgnztId">부서</label>
                                            </td>
                                            <td>
                                                <label class="f_select w_300" for="orgnztId"  style="display:none">
                                                    <form:select  class="f_select w_300 al_c" path="orgnztId" id="orgnztId" name="orgnztId" title="부서" style="pointer-events:none;">
	                                                    <form:option value="" label="선택하세요"/>
	                                                    <form:options items="${orgnztId_result}" itemValue="code" itemLabel="codeNm"/>
                                                    </form:select>
                                                </label>
                                                <form:errors path="orgnztId" />
                                                <input id="orgnztId1" class="f_txt w_300" readOnly="true"/>
                                            </td>    
                                            <td class="lb">
                                            	<label for="ofcpsNm">직급</label>
                                            </td>
                                            <td>
                                                <form:input path="ofcpsNm" id="ofcpsNm" title="직위명" class="f_txt w_300" maxlength="30" readonly="true" />
                                                <form:errors path="ofcpsNm" />
                                            </td>
                                        </tr>
                                        <tr>
                                        	<td class="lb" >
                                                <label for="emailAdres">이메일</label>
                                            </td>
                                            <td>
                                            	<form:input path="emailAdres" id="emailAdres" title="이메일주소" class="f_txt w_300" maxlength="50" />
                                                <form:errors path="emailAdres" />
                                            </td>
                                            <td class="lb">
                                                <label for="areaNo">집전화<br>지역번호</label>
                                            </td>
                                            <td>
                                                <form:input path="areaNo" id="areaNo" class="f_txt w_70" maxlength="4" title="전화번호 첫번째" />
                                                <span class="f_txt_inner mr5 ml5">-</span>
                                                <form:input path="homemiddleTelno" id="homemiddleTelno" class="f_txt w_70" maxlength="4" title="전화번호 두번째" />
                                                <span class="f_txt_inner mr5 ml5">-</span>
                                                <form:input path="homeendTelno" id="homeendTelno" class="f_txt w_70" maxlength="4" title="전화번호 세번째" />
                                                <form:errors path="areaNo" />
                                                <form:errors path="homemiddleTelno" />
                                                <form:errors path="homeendTelno" />
                                            </td>
                                        </tr>
                                        <tr>
                                        	<td class="lb" >
                                                <label for="joinDate">입사일</label>
                                            </td>
                                            <td>
                                                <form:input path="joinDate" id="joinDate" type="text" class="f_date" maxlength="10" readonly="true"/>
                                                <form:errors path="joinDate" />
                                            </td>
                                            <td class="lb">
                                                <label for="groupId">그룹아이디</label>
                                            </td>
                                            <td>
                                                <label class="f_select w_300" for="groupId" style="display:none">
                                                    <form:select path="groupId" id="groupId" name="groupId" title="그룹아이디" style="pointer-events:none;" >
	                                                    <form:option value="" label="선택하세요"/>
	                                                    <form:options items="${groupId_result}" itemValue="code" itemLabel="codeNm"/>
                                                    </form:select>
                                                </label>
                                                <form:errors path="groupId" />
                                                <input id="groupId1" class="f_txt w_300" readOnly="true"/>
                                                
                                            </td>
                                        </tr>
                                        <tr>
                                        	<td class="lb" >
                                                <label for="zip">우편번호</label>
                                            </td>
                                            <td>
                                                <span class="f_search2 w_150">
                                                    <form:input path="zip" id="zip" title="우편번호" maxlength="8" readonly="true" />
                                                    <form:errors path="zip" />
                                                    <button type="button" class="btn" onclick="execDaumPostcode();">조회</button>
                                                </span>
                                            </td>
                                            <td class="lb">
                                            	<label for="homeadres">기본주소</label>
                                            </td>
                                            <td>
                                            	<form:input path="homeadres" id="homeAdres" title="기본주소" class="f_txt w_full" maxlength="50" readonly="true"/>
                                                <form:errors path="homeadres" />
                                            </td>
                                        </tr>
                                        <tr>
                                        	<td class="lb">
                                                <label for="detailAdres">상세주소</label>
                                            </td>
                                            <td colspan="3">
                                                <form:input path="detailAdres" id="detailAdres" title="상세주소" class="f_txt w_full" maxlength="50" />
                                                <form:errors path="detailAdres" />
                                            </td>
                                        </tr>
	                                </table>
                                </div>

								<!-- 목록/저장버튼  -->
                                <div class="board_view_bot">
                                    <div class="right_col btn1">
                                        <a href="#LINK" class="btn btn_blue_46 w_100"onclick="JavaScript:fn_update(); return false;"><spring:message code="button.save" /></a><!-- 저장 -->
                                    </div>
                                </div>
                                <!-- // 목록/저장버튼 끝  -->
                               								
								<!-- 20230216 js파일에서 스프링 메세지 사용을 위해 추가 -->
						        <input type="hidden" id="resultMsg" value="${resultMsg}"/>
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