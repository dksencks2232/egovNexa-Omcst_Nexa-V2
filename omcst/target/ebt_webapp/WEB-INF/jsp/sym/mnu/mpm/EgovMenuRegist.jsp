<%--
  Class Name : EgovMenuRegist.jsp
  Description : 메뉴정보 등록 화면
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2009.03.10    이용             최초 생성
     2011.08.31   JJY       경량환경 버전 생성
 
    author   : 공통서비스 개발팀 이용
    since    : 2009.03.10
--%>
<%@ page contentType="text/html; charset=utf-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<c:url var="ImgUrl" value="/images"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	

<title>내부업무 사이트 > 내부시스템관리 > 메뉴목록관리</title>

<script src="<c:url value='/'/>js/jqueryui.js"></script>
<script type="text/javascript" src="<c:url value="/validator.do" />"></script>
<validator:javascript formName="menuManageVO" staticJavascript="false" xhtml="true" cdata="false"/>
<script language="javascript1.2" type="text/javaScript">
<!--
/* ********************************************************
 * 입력처리 함수
 ******************************************************** */
function insertMenuManage(form) {
    if(!validateMenuManageVO(form)){            
        return;
    }else{
    	if(confirm("<spring:message code="common.save.msg" />")){
         form.action="<c:url value='/sym/mnu/mpm/EgovMenuRegistInsert.do'/>";
         form.submit();
    	}
    }
}

/* ********************************************************
 * 파일목록조회  함수
 ******************************************************** */
function searchFileNm() {
	
    document.all.tmp_SearchElementName.value = "progrmFileNm";
    
    var $dialog = $('<div id="modalPan"></div>')
	.html('<iframe style="border: 0px; " src="' + "<c:url value='/sym/prm/EgovProgramListSearch.do'/>" +'" width="100%" height="100%"></iframe>')
	.dialog({
    	autoOpen: false,
        modal: true,
        width: 1100,
        height: 1000
	});
    $(".ui-dialog-titlebar").hide();
	$dialog.dialog('open');
}

function fn_egov_returnValue(retVal){
	
	if(document.all.progrmFileNm_view){
		document.all.progrmFileNm_view.value = retVal;
		$("input[name='progrmFileNm']").val(retVal);
    }
	
	fn_egov_modal_remove();
}

/**********************************************************
 * 모달 종료 버튼
 ******************************************************** */
function fn_egov_modal_remove() {
	$('#modalPan').remove();
}

/* ********************************************************
 * 목록조회  함수
 ******************************************************** */
function selectList(){
    location.href = "<c:url value='/sym/mnu/mpm/EgovMenuManageSelect.do'/>";
}
/* ********************************************************
 * 파일명 엔터key 목록조회  함수
 ******************************************************** */
function press() {
    if (event.keyCode==13) {
        searchFileNm();    // 원래 검색 function 호출
    }
}
<c:if test="${!empty resultMsg}">alert("${resultMsg}");</c:if>
-->
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
                                 

								<form:form modelAttribute="menuManageVO" name="menuManageVO" method="post" action="${pageContext.request.contextPath}/sym/mnu/mpm/EgovMenuRegistInsert.do">

                                <div class="board_view2">
                                    <table summary="메뉴 등록화면">
                                        <colgroup>
                                            <col style="width: 190px;">
                                            <col style="width: auto;">
                                        </colgroup>
                                        <tr>
                                            <td class="lb">
                                                <label for="menuNo">메뉴번호</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <form:input id="" class="f_txt" path="menuNo" maxlength="10" title="메뉴No" Placeholder="메뉴번호"/>
                                                <form:errors path="menuNo" />
                                            </td>
                                            
                                        </tr>
                                        <tr>
                                        	<td class="lb">
                                                <label for="menuOrdr">메뉴순서</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <form:input id="" class="f_txt" path="menuOrdr" maxlength="10" title="메뉴순서" Placeholder="메뉴순서" />
                                                <form:errors path="menuOrdr" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="menuNm">메뉴명</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <form:input id="" class="f_txt" path="menuNm" maxlength="30" title="메뉴명"  Placeholder="메뉴명"/>
                                                <form:errors path="menuNm" />
                                            </td>
                                        </tr>
                                        <tr>
                                        	<td class="lb">
                                                <label for="upperMenuId">상위메뉴번호</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <form:input id="" class="f_txt" path="upperMenuId" maxlength="10" title="상위메뉴No" Placeholder="상위메뉴번호"/>
                                                <form:errors path="upperMenuId" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="progrmFileNm">프로그램파일명</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <span class="f_search2 w_500">
                                                    <input id="progrmFileNm_view" type="text" name="progrmFileNm_view" disabled="disabled" readonly="readonly"  Placeholder="프로그램파일명검색">
                                                    <form:input type="hidden" name="progrmFileNm" path="progrmFileNm" maxlength="60" title="프로그램파일명" />
                                                    <form:errors path="progrmFileNm" />
                                                    <button type="button" class="btn" onclick="javascript:searchFileNm(); return false;"><spring:message code='button.inquire' /></button><!-- 조회 -->
                                                </span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                            	<label for="useYn">사용여부</label>
                                            </td>
                                            <td>
                                                <label class="f_select" for="useYn">
                                                    <select name="useYn" id="useYn" title="사용여부">
                                                        <option value="Y" <c:if test="${menuManageVO.useYn == 'Y'}">selected</c:if> >Y</option>
                                                        <option value="N" <c:if test="${menuManageVO.useYn == 'N'}">selected</c:if> >N</option>
                                                    </select>
                                                </label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="">메뉴설명</label>
                                            </td>
                                            <td>
                                                <form:textarea id="" class="f_txtar w_full h_200" path="menuDc" rows="10" cols="30" title="메뉴설명" Placeholder="메뉴설명"/>
                                                <form:errors path="menuDc"/>
                                            </td>
                                        </tr>
                                    </table>
                                </div>

								<!-- 목록/저장버튼  -->
                                <div class="board_view_bot">
                                    <div class="left_col btn3">
                                    </div>

                                    <div class="right_col btn1">
                                        <a href="#LINK" class="btn btn_blue_46 w_100" onclick="javascript:insertMenuManage(document.getElementById('menuManageVO')); return false;"><spring:message code="button.save" /></a><!-- 저장 -->
                                        <a href="<c:url value='/sym/mnu/mpm/EgovMenuManageSelect.do'/>" class="btn btn_gray_46 w_100" onclick="javascript:selectList(); return false;"><spring:message code="button.list" /></a><!-- 목록 -->
                                    </div>
                                </div>
                                <!-- // 목록/저장버튼 끝  -->
                                
                                <!-- 검색조건 유지 -->
								<input type="hidden" name="tmp_SearchElementName" value="">
								<input type="hidden" name="tmp_SearchElementVal" value="">
								<input name="cmd" type="hidden" value="<c:out value='insert'/>">
								
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