<%--
  Class Name : EgovMainImageUpdt.jsp
  Description : EgovMainImageUpdt 화면
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2009.07.01   lee.m.j            최초 생성
     2011.08.31   JJY       경량환경 버전 생성
 
    author   : 공통서비스 개발팀 lee.m.j
    since    : 2009.07.01
--%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<title>사용자부재 수정</title>
<script type="text/javascript" src="<c:url value='/js/EgovMultiFile.js'/>"></script>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="mainImage" staticJavascript="false" xhtml="true" cdata="false"/>
<script defer src="<c:url value='/js/manage/userAbsnce.js' />" ></script>

</head>

<body>
<noscript>자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>    
<body>

    <!-- Skip navigation -->
    <a href="#contents" class="skip_navi">본문 바로가기</a>

    <div class="wrap">
        <div class="container">
            <div class="sub_layout">
                <div class="sub_in">
                    <div class="layout">
                        <div class="content_wrap">
                            <div id="contents" class="content">
                                 

								<form:form modelAttribute="userAbsnce" action="${pageContext.request.contextPath}/addUserAbsnce" method="post">

                                <div class="board_view2">
                                    <table>
                                        <colgroup>
                                            <col style="width: 190px;">
                                            <col style="width: auto;">
                                        </colgroup>
                                        <tr>
                                            <td class="lb">
                                                <label for="userId">사용자ID</label>
                                            </td>
                                            <td>
                                                <input name="userId" id="userId" class="f_txt" title="사용자ID" type="text" value="<c:out value='${userAbsnce.userId}'/>" readonly>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="userNm">사용자명</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <input name="userNm" id="userNm" class="f_txt" title="사용자명" type="text" value="<c:out value='${userAbsnce.userNm}'/>" readonly>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                            	<label for="userAbsnceAt">부재여부</label>
                                            </td>
                                            <td>
                                                <label class="f_select" for="userAbsnceAt">
                                                    <select name="userAbsnceAt" id="userAbsnceAt" title="부재여부">
                                                        <option value="Y" <c:if test="${userAbsnce.userAbsnceAt == 'Y'}">selected</c:if> >Y</option>
                                                        <option value="N" <c:if test="${userAbsnce.userAbsnceAt == 'N'}">selected</c:if> >N</option>
                                                    </select>
                                                </label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="lastUpdusrPnttm">등록일시</label>
                                            </td>
                                            <td>
                                                <input name="lastUpdusrPnttm" id="lastUpdusrPnttm" class="f_txt" title="등록일시" type="text" value="<c:out value="${userAbsnce.lastUpdusrPnttm}"/>" maxLength="50" readonly>
                                            </td>
                                        </tr>
                                    </table>
                                </div>

								<!-- 목록/저장버튼  -->
                                <div class="board_view_bot">
                                    <div class="left_col btn3">
                                    	<a href="<c:url value='/removeUserAbsnce'/>?userId=<c:out value='${userAbsnceVO.userId}'/>&amp;selAbsnceAt=<c:out value='${userAbsnceVO.selAbsnceAt}'/>" class="btn btn_skyblue_h46 w_100" onclick="fnc_userAbsnceDelete(); return false;">
                                    		<spring:message code="button.delete" />
                                    	</a><!-- 삭제 -->
                                    </div>

                                    <div class="right_col btn1">
                                        <a href="#LINK" class="btn btn_blue_46 w_100" onclick="JavaScript:fnc_userAbsnceUpdate(); return false;"><spring:message code="button.save" /></a><!-- 저장 -->
                                        <a href="<c:url value='/userAbsnceList'/>?pageIndex=<c:out value='${userAbsnceVO.pageIndex}'/>&amp;searchKeyword=<c:out value="${userAbsnceVO.searchKeyword}"/>&amp;searchCondition=1&amp;selAbsnceAt=<c:out value="${userAbsnceVO.selAbsnceAt}"/>" class="btn btn_gray_46 w_100" onclick="fnc_selectUserAbsnceList(); return false;">
                                        	<spring:message code="button.list" />
                                        </a><!-- 목록 -->
                                    </div>
                                </div>
                                <!-- // 목록/저장버튼 끝  -->
                                
                                <!-- 검색조건 유지 -->
                                <input type="hidden" name="searchCondition" value="<c:out value='${userAbsnceVO.searchCondition}'/>">
                                <input type="hidden" name="searchKeyword" value="<c:out value='${userAbsnceVO.searchKeyword}'/>">
                                <input type="hidden" name="pageIndex" value="<c:out value='${userAbsnceVO.pageIndex}'/>">
                                <input type="hidden" name="selAbsnceAt" value="<c:out value='${userAbsnceVO.selAbsnceAt}'/>">
                                
                                <!-- 20230221 js파일에서 스프링 메세지 사용을 위해 추가 -->
						        <input type="hidden" id="uMessage" value="<spring:message code='common.update.msg' />"/>
						        <input type="hidden" id="dMessage" value="<spring:message code='common.delete.msg' />"/>
                                
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