<%--
  Class Name : EgovRoleInsert.jsp
  Description : EgovRoleInsert 화면
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2009.02.01    lee.m.j              최초 생성
     2011.08.31   JJY       경량환경 버전 생성
 
    author   : 공통서비스 개발팀 lee.m.j
    since    : 2009.02.01
--%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>

<c:set var="registerFlag" value="${empty roleManageVO.roleCode ? 'INSERT' : 'UPDATE'}"/>
<c:set var="registerFlagName" value="${empty roleManageVO.roleCode ? '롤 등록' : '롤 수정'}"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	
<title>내부업무 사이트 > 내부시스템관리 > 롤관리</title>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="roleManage" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javaScript" language="javascript">

function fncSelectRoleList() {
    var varFrom = document.getElementById("roleManage");
    varFrom.action = "<c:url value='/sec/rmt/EgovRoleList.do'/>";
    varFrom.submit();       
}

function fncRoleInsert() {

    var varFrom = document.getElementById("roleManage");
    varFrom.action = "<c:url value='/sec/rmt/EgovRoleInsert.do'/>";

    
    if(!validateRoleManage(varFrom)){           
        return;
    }else{
     	if(confirm('<spring:message code="common.regist.msg" />')){
            varFrom.submit();
     	}
    } 
    
}

function fncRoleUpdate() {
    var varFrom = document.getElementById("roleManage");
    varFrom.action = "<c:url value='/sec/rmt/EgovRoleUpdate.do'/>";

    if(!validateRoleManage(varFrom)){           
        return;
    }else{
        if(confirm('<spring:message code="common.update.msg" />')){
            varFrom.submit();
        }
    } 
}

function fncRoleDelete() {
    var varFrom = document.getElementById("roleManage");
    varFrom.action = "<c:url value='/sec/rmt/EgovRoleDelete.do'/>";
    if(confirm('<spring:message code="common.delete.msg" />')){
        varFrom.submit();
    }
}

</script>
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
                                 

								<form:form modelAttribute="roleManage" method="post" >


                                <div class="board_view2">
                                    <table summary="롤 등록 테이블입니다.롤 코드,롤 명,롤 패턴,설명,롤 타입,롤 Sort,등록일자의 정보를 담고 있습니다.">
                                        <colgroup>
                                            <col style="width: 190px;">
                                            <col style="width: auto;">
                                        </colgroup>
                                        <tr style="display:none">
                                            <td class="lb">
                                                <label for="roleCode">롤코드</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <input name="roleCode" id="roleCode" class="f_txt" type="text" value="<c:out value='${roleManage.roleCode}'/>" title="롤 코드"  Placeholder="롤코드"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="roleNm">롤명</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <input name="roleNm" id="roleNm" class="f_txt" type="text" value="<c:out value='${roleManage.roleNm}'/>" maxLength="50" title="롤명"  Placeholder="롤명"/>
                                                &nbsp;<form:errors path="roleNm" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="rolePtn">롤패턴</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <input name="rolePtn" id="rolePtn" class="f_txt" type="text" value="<c:out value='${roleManage.rolePtn}'/>" maxLength="50" title="롤패턴"  Placeholder="롤패턴"/>
                                                &nbsp;<form:errors path="rolePtn" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="roleDc">설명</label>
                                            </td>
                                            <td>
                                                <input name="roleDc" id="roleDc" class="f_txt w_full" type="text" value="<c:out value='${roleManage.roleDc}'/>" maxLength="50" title="설명"  Placeholder="설명"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                            	<label for="roleTyp">롤타입</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <label class="f_select" for="sel1">
                                                    <select id="sel1" name="roleTyp" title="롤타입">
                                                    	<c:forEach var="cmmCodeDetail" items="${cmmCodeDetailList}" varStatus="status">
                                                        	<option value="<c:out value='${cmmCodeDetail.code}'/>" <c:if test="${cmmCodeDetail.code == roleManage.roleTyp}">selected</c:if> ><c:out value="${cmmCodeDetail.codeNm}"/></option>
                                                        </c:forEach>
                                                    </select>
                                                </label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="roleSort">롤Sort</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <input name="roleSort" id="roleSort" class="f_txt" type="text" value="<c:out value='${roleManage.roleSort}'/>" maxLength="50" title="롤sort" Placeholder="롤Sort"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="roleCreatDe">등록일자</label>
                                            </td>
                                            <td>
                                                <input name="roleCreatDe" id="roleCreatDe" class="f_txt" type="text" value="<c:out value='${roleManage.roleCreatDe}'/>" maxLength="50" readonly="readonly" title="등록일자"  Placeholder="등록일자"/>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                
                                <!-- 목록/저장버튼  -->
                                <div class="board_view_bot">
                                    <div class="left_col btn3">
                                    	<c:if test="${registerFlag == 'UPDATE'}">
                                        	<a href="#LINK" class="btn btn_skyblue_h46 w_100" onclick="javascript:fncRoleDelete()"><spring:message code='button.delete' /></a><!-- 삭제 -->
                                        </c:if>
                                    </div>

                                    <div class="right_col btn1">
                                    	<c:if test="${registerFlag == 'INSERT'}">
                                        	<a href="#LINK" class="btn btn_blue_46 w_100" onclick="javascript:fncRoleInsert()"><spring:message code='button.save' /></a><!-- 저장 -->
                                        </c:if>
                                        <c:if test="${registerFlag == 'UPDATE'}">
                                        	<a href="#LINK" class="btn btn_blue_46 w_100" onclick="javascript:fncRoleUpdate()"><spring:message code='button.save' /></a><!-- 저장 -->
                                        </c:if>
                                        <a href="#LINK" class="btn btn_gray_46 w_100" onclick="javascript:fncSelectRoleList()"><spring:message code='button.list' /></a><!-- 목록 -->
                                    </div>
                                </div>
                                <!-- // 목록/저장버튼 끝  -->
                                
                                <!-- 검색조건 유지 -->
								<c:if test="${registerFlag == 'UPDATE'}">
									<input type="hidden" name="searchCondition" value="<c:out value='${roleManageVO.searchCondition}'/>"/>
									<input type="hidden" name="searchKeyword" value="<c:out value='${roleManageVO.searchKeyword}'/>"/>
									<input type="hidden" name="pageIndex" value="<c:out value='${roleManageVO.pageIndex}'/>"/>
								</c:if>
								
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