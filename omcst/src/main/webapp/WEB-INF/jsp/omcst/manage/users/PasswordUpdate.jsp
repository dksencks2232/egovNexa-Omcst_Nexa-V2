
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


<title>내부업무 사이트 > 내부시스템관리 > 사용자등록관리</title>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="passwordChgVO" staticJavascript="false" xhtml="true" cdata="false"/>
<script defer src="<c:url value='/js/manage/users.js' />"></script>

</head>
<body>
<noscript>자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

    <!-- Skip navigation -->
    <a href="#contents" class="skip_navi">본문 바로가기</a>

    <div class="wrap">
        <div class="container">
            <div class="sub_layout">
                <div class="sub_in">
                    <div class="layout">
        
                        <div class="content_wrap">
                            <div id="contents" class="content">
                                 

								<form name="passwordChgVO" method="post" action="${pageContext.request.contextPath}/passwordUpdate" >
								<!-- onsubmit="javascript:return FormValidation(document.passwordChgVO);" >  -->
								<!-- 상세정보 사용자 삭제시 prameter 전달용 input -->
								<input name="checkedIdForDel" type="hidden" />
								<!-- 검색조건 유지 -->
								<input type="hidden" name="searchCondition" value="<c:out value='${userSearchVO.searchCondition}'/>"/>
								<input type="hidden" name="searchKeyword" value="<c:out value='${userSearchVO.searchKeyword}'/>"/>
								<input type="hidden" name="sbscrbSttus" value="<c:out value='${userSearchVO.sbscrbSttus}'/>"/>
								<input type="hidden" name="pageIndex" value="<c:out value='${userSearchVO.pageIndex}'/>"/>


                                <div class="board_view2">
                                    <table>
                                        <colgroup>
                                            <col style="width: 190px;">
                                            <col style="width: auto;">
                                        </colgroup>
                                        <tr>
                                            <td class="lb">
                                                <label for="emplyrId">사용자아이디</label>
                                            </td>
                                            <td>
                                                <input name="emplyrId" id="emplyrId" class="f_txt" title="사용자아이디" type="text" value="<c:out value='${userManageVO.emplyrId}'/>" maxlength="20" readonly="readonly"/>
                                                <input name="uniqId" id="uniqId" title="uniqId" type="hidden" value="<c:out value='${userManageVO.uniqId}'/>"/>
                                                <input name="userTy" id="userTy" title="userTy" type="hidden" value="<c:out value='${userManageVO.userTy}'/>"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="oldPassword">기존 비밀번호</label>
                                            </td>
                                            <td>
                                                <input name="oldPassword" id="oldPassword" class="f_txt" title="기존 비밀번호" type="password" value="" maxlength="100" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="newPassword">비밀번호</label>
                                            </td>
                                            <td>
                                                <input name="newPassword" id="newPassword" class="f_txt" title="비밀번호" type="password" value="" maxlength="100" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="newPassword2">비밀번호확인</label>
                                            </td>
                                            <td>
                                                <input name="newPassword2" id="newPassword2" class="f_txt" title="비밀번호확인" type="password" value="" maxlength="100" />
                                            </td>
                                        </tr>
                                    </table>
                                </div>

								<!-- 목록/저장버튼  -->
                                <div class="board_view_bot">
                                    <div class="left_col btn3">
                                        <a href="#LINK" class="btn btn_skyblue_h46 w_100" onclick="javascript:document.passwordChgVO.reset();"><spring:message code="button.reset" /></a><!-- 초기화 -->
                                    </div>

                                    <div class="right_col btn1">
                                        <a href="#LINK" class="btn btn_blue_46 w_100" onclick="JavaScript:fn_passUpdate(); return false;"><spring:message code="button.save" /></a><!-- 저장 -->
                                        <a href="<c:url value='/userManage'/>" class="btn btn_gray_46 w_100" onclick="fn_listPage(); return false;"><spring:message code="button.list" /></a><!-- 목록 -->
                                    </div>
                                </div>
                                <!-- // 목록/저장버튼 끝  -->
                                
                                <!-- 20230217 페이지 진입시 처리결과 메세지 처리 -->
                                <c:choose>
                                	<c:when test="${!empty resultMsg}">
                                		<input type="hidden" id="resultMsg" value="<spring:message code='${resultMsg}' />"/>
                                	</c:when>
                                	<c:otherwise>
                                		<input type="hidden" id="resultMsg" value=""/>
                                	</c:otherwise>
                                </c:choose>
                                
                                <!-- 20230217 js파일에서 스프링 메세지 사용을 위해 추가 -->
						        <input type="hidden" id="pMessage" value="<spring:message code='fail.user.passwordUpdate2' />"/>
						        <input type="hidden" id="resultMsg" value=""/>
                                
                                </form>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


    </div>
    
</body>
</html>