<%--
  Class Name : EgovProgramListRegist.jsp
  Description : 프로그램목록 등록 화면
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


<title>내부업무 사이트 > 내부시스템관리 > 프로그램목록관리</title>

<script type="text/javascript" src="<c:url value="/validator.do" />"></script>
<validator:javascript formName="progrmManageVO" staticJavascript="false" xhtml="true" cdata="false"/>
<script language="javascript1.2" type="text/javaScript">
<!--
/* ********************************************************
 * 입력 처리 함수
 ******************************************************** */
function insertProgramListManage(form) {
    if(confirm("<spring:message code="common.save.msg" />")){
        if(!validateProgrmManageVO(form)){          
            return;
        }else{
            form.action="<c:url value='/sym/prm/EgovProgramListRegist.do'/>";
            form.submit();
        }
    }
}
/* ********************************************************
 * 목록조회 함수
 ******************************************************** */
function selectList(){
    location.href = "<c:url value='/sym/prm/EgovProgramListManageSelect.do' />";
}

/* ********************************************************
 * focus 시작점 지정함수
 ******************************************************** */
 function fn_FocusStart(){
        var objFocus = document.getElementById('F1');
        objFocus.focus();
    }

 
<c:if test="${!empty resultMsg}">alert("${resultMsg}");</c:if>
-->

function prgmInputChange (){
	//입력값 변수
	var url = $("#inputUrl").val().trim();
	var urlInput = document.getElementById("inputUrl");
	var urlPath  = document.getElementById("inputPath");
	
	//정규식
    var regx = /\/.*/;
	
	//입력값 조정 변수
	var urlPrefix = "/" + url.split("/").slice(1,3).join("/") + "/";	
	
	//입력값 Null체크
	if(!inputValNullCheck(urlInput.value)){
		$("#inputPath").val("");
		return;
	}
	
	//추가 입력정규식
	if(regx.test(url)){
		$("#inputPath").val(url);
		return;
	}
	
	//올바르지 않은 입력값이 입력되었을 때
	if (!urlInput.checkValidity()) {
		alert("올바른 URL 형식이 아닙니다.");
		$("#inputUrl").val("");
		$("#inputPath").val("");
		$("#inputUrl").focus();
		return;
	}
	
	$("#inputPath").val(urlPrefix);
	console.log("저장경로입력:: " + $("#inputPath").val());
}

function inputValNullCheck(value){
	if (!value){
		return false;
	}
	return true;
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
                                 

								<form:form modelAttribute="progrmManageVO" action="/sym/prm/EgovProgramListRegist.do" method="post" >


                                <div class="board_view2">
                                    <table summary="프로그램목록 등록">
                                        <colgroup>
                                            <col style="width: 190px;">
                                            <col style="width: auto;">
                                        </colgroup>
                                        <tr>
                                            <td class="lb">
                                                <label for="progrmFileNm">프로그램파일명</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <form:input class="f_txt w_full" path="progrmFileNm" maxlength="50" id="F1" title="프로그램파일명" placeholder="프로그램파일명"/>
                                                <form:errors path="progrmFileNm" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="progrmKoreanNm">프로그램 한글명</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <form:input id="" class="f_txt w_full" path="progrmKoreanNm" maxlength="50" title="프로그램 한글명" placeholder="프로그램 한글명" value='${searchVO.bbsNm}'/>
                                                <form:errors path="progrmKoreanNm" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="URL">URL</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <form:input id="inputUrl" class="f_txt w_full" path="URL" maxlength="60" title="URL" placeholder="URL" pattern="^\/[a-z]+(\/[a-z]+/).*$" onchange="prgmInputChange()" value='${searchVO.provdUrl}'/>
                                                <form:errors path="URL" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="progrmStrePath" >저장경로</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <form:input id="inputPath" class="f_txt w_full" path="progrmStrePath" maxlength="60" value="" title="저장경로" placeholder="저장경로" readonly="true"/>
                                                <form:errors path="progrmStrePath" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="progrmDc">프로그램설명</label>
                                            </td>
                                            <td>
                                                <form:textarea id="" class="f_txtar w_full h_200" path="progrmDc" rows="10" cols="30" title="프로그램설명" placeholder="프로그램설명"/>
                                                <form:errors path="progrmDc" />
                                            </td>
                                        </tr>
                                    </table>
                                </div>

								<!-- 목록/저장버튼  -->
                                <div class="board_view_bot">
                                    <div class="left_col btn3">
                                    </div>

                                    <div class="right_col btn1">
                                        <a href="#LINK" class="btn btn_blue_46 w_100" onclick="javascript:insertProgramListManage(document.getElementById('progrmManageVO')); return false;"><spring:message code="button.save" /></a><!-- 저장 -->
                                        <a href="<c:url value='/sym/prm/EgovProgramListManageSelect.do'/>" class="btn btn_blue_46 w_100" onclick="selectList(); return false;"><spring:message code="button.list" /></a><!-- 목록 -->
                                    </div>
                                </div>
                                <!-- // 목록/저장버튼 끝  -->
                                
                                <!-- 검색조건 유지 -->
                                <input name="cmd" type="hidden" value="<c:out value='insert'/>"/>
                                
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