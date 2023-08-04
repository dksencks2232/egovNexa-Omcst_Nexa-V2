<%--
  Class Name : EgovBoardMstrRegist.jsp
  Description : 게시판 생성 화면
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2009.03.12   이삼섭              최초 생성
     2009.06.26   한성곤          2단계 기능 추가 (댓글관리, 만족도조사)
     2011.08.31   JJY       경량환경 버전 생성
 
    author   : 공통서비스 개발팀 이삼섭
    since    : 2009.03.12
--%>
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


<script type="text/javascript" src="<c:url value='/js/EgovBBSMng.js' />"></script>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="boardMaster" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javascript">

	<!-- 파일첨부가능여부 필수항목 (*) span 표시 제어-->
	window.onload = function(){
		var fileAtchBtnChk = document.querySelector("#fileAtchBtnGroup");
		fileAtchBtnChk.addEventListener("change", stateChk);
	}

	function stateChk(element){
		var changedBtn = element.target;
		var reqTarget = document.getElementById("postAtchFileNumReq");
		if((changedBtn.id == "rdo3") && changedBtn.checked){
			reqTarget.style.display = "block";
		}else {
			reqTarget.style.display = "none"
		}
	}

    function fn_egov_regist_brdMstr(){
        if (!validateBoardMaster(document.boardMaster)){
            return false;
        }
        
        let trgetId = document.boardMaster.trgetId.value;
        
        <!-- 파일첨부가능여부 확인항목 추가-->
    	var fileAtchPosblAtYn = document.getElementById("rdo3");
    	if(fileAtchPosblAtYn.checked){
    		var fileAtchNum = document.getElementById("posblAtchFileNumber");
    		if(0 == fileAtchNum.value ){
    			alert('첨부가능파일 숫자를 선택해주세요.');
    			return false;
    		}
    	}
    	
        if (!trgetId){
        	alert('커퓨니티/동호회 정보는 필수입력 사항입니다.');
        	return false;
        }

        if (confirm('<spring:message code="common.regist.msg" />')) {
            form = document.boardMaster;
            form.action = "<c:url value='/cop/bbs/insertBBSMasterInf.do'/>";
            form.submit();
        }
        

    }
    
    function fn_egov_select_brdMstrList(){
        form = document.boardMaster;
        form.action = "<c:url value='/cop/bbs/SelectBBSMasterInfs.do'/>";
        form.submit();  
    }
    
    function fn_egov_inqire_tmplatInqire(){
    	
        var $dialog = $('<div id="modalPan"></div>')
    	.html('<iframe style="border: 0px; " src="' + "<c:url value='/cop/com/selectTemplateInfsPop.do'/>" +'" width="100%" height="100%"></iframe>')
    	.dialog({
        	autoOpen: false,
            modal: true,
            width: 1050,
            height: 950,
            title: "템플릿 목록"
    	});
        $(".ui-dialog-titlebar").hide();
    	$dialog.dialog('open');
    }
    
    function fn_egov_returnValue(retVal){
    	if(retVal != null){
            var tmp = retVal.split("|");
            document.getElementById("tmplatId").value = tmp[0];
            document.getElementById("tmplatNm").value = tmp[1];
        }
    	
    	fn_egov_modal_remove();
	}

    /**********************************************************
     * 모달 종료 버튼
     ******************************************************** */
    function fn_egov_modal_remove() {
    	$('#modalPan').remove();
    }
    
    function fn_egov_selectTargetType(obj){
    	let retVal;
    	let _strType = obj.value;
    	
    	if (_strType == 'CMMNTY') {
            retVal = fn_egov_inqire_cmmnty();
        } else if (_strType == 'CLUB') {
            retVal = fn_egov_inqire_club();
        } else if (_strType == '') {
            retVal = "|";
        } else {
            retVal = "SYSTEM_DEFAULT_BOARD"+"|"+"시스템 활용";
        }
                
        if (retVal != null) {
            let tmp = retVal.split("|");
            document.boardMaster.trgetId.value = tmp[0];
            document.boardMaster.trgetNm.value = tmp[1];
        }
    }

</script>

<title>내부업무 사이트 > 내부서비스관리 > 게시판템플릿관리</title>

</head>

<body>
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
                                 

								<form:form modelAttribute="boardMaster" name="boardMaster" method="post" action="cop/bbs/SelectBBSMasterInfs.do">
								
								<input type="hidden" name="pageIndex"  value="<c:out value='${searchVO.pageIndex}'/>"/>

                                
                                
                                <div class="board_view2">
                                    <table summary="게시판명,게시판소개,게시판 유형,게시판 속성,답장가능여부,파일첨부가능여부, .. 입니다">
                                        <colgroup>
                                            <col style="width: 190px;">
                                            <col style="width: auto;">
                                        </colgroup>
                                        <tr>
                                            <td class="lb">
                                                <label for="bbsNm"><spring:message code="cop.bbsNm" /></label><!-- 게시판명 -->
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <form:input id="" class="f_txt w_full" Placeholder="게시판명입력" title="게시판명입력" path="bbsNm" />
                                                <br/><form:errors path="bbsNm" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="bbsIntrcn"><spring:message code="cop.bbsIntrcn" /></label><!-- 게시판소개 -->
                                                <span class="req">필수</span>
                                            </td>
                                            <td >
                                                <form:textarea id="" class="f_txtar w_full h_80" Placeholder="게시판소개입력" title="게시판소개입력" path="bbsIntrcn" cols="30" rows="10" />
                                                <br/><form:errors path="bbsIntrcn" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                            	<label for="bbsTyCode"><spring:message code="cop.bbsTyCode" /></label><!-- 게시판 유형 -->
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <label class="f_select" for="bbsTyCode">
                                                    <form:select path="bbsTyCode" id="bbsTyCode" name="bbsTyCode" title="게시판유형선택">
                                                        <form:option value='' label="게시판유형" selected="selected" />
                                                        <form:options items="${typeList}" itemValue="code" itemLabel="codeNm"/>
                                                    </form:select>
                                                </label>
                                                <br/><form:errors path="bbsTyCode" />
                                            </td>
                                        </tr>
                                        <tr>
                                        	<td class="lb">
                                            	<label for="bbsAttrbCode"><spring:message code="cop.bbsAttrbCode" /></label><!-- 게시판 속성 -->
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <label class="f_select" for="bbsAttrbCode">
                                                    <form:select path="bbsAttrbCode" id="bbsAttrbCode" name="bbsAttrbCode" title="게시판속성선택">
                                                        <form:option value='' label="게시판속성" selected="selected" />
                                                        <form:options items="${attrbList}" itemValue="code" itemLabel="codeNm"/>
                                                    </form:select>
                                                </label>
                                                <br/><form:errors path="bbsAttrbCode" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                            	<label class="display_n"><spring:message code="cop.replyPosblAt" /></label><!-- 답장가능여부 -->
                                                <span class="req">필수</span>
                                            </td>
                                            <td class="rdoSet"><!-- 2개이상 radio 있을때 필요 -->
                                            	<span class="m_display_ib">답장가능여부</span>
                                                <form:radiobutton path="replyPosblAt" id="rdo1" name="aa" value="Y" checked="checked" />
                                                <spring:message code="button.possible" /><!-- 가능 -->
                                                <form:radiobutton path="replyPosblAt" id="rdo2" class="ml20" name="aa" value="N"  />
                                                <spring:message code="button.impossible" /><!-- 불가능 -->
                                            </td>
                                            
                                        </tr>
                                        <tr>
                                        	<td class="lb">
                                            	<label class="display_n"><spring:message code="cop.fileAtchPosblAt" /></label><!-- 파일첨부가능여부 -->
                                                <span class="req">필수</span>
                                            </td>
                                            <td class="rdoSet" id="fileAtchBtnGroup"><!-- 2개이상 radio 있을때 필요 -->
                                            	<span class="m_display_ib">파일첨부가능</span>
                                                <form:radiobutton path="fileAtchPosblAt" id="rdo3" name="bb" value="Y" onclick="document.boardMaster.posblAtchFileNumber.disabled='';" checked="checked" />
                                                <spring:message code="button.possible" /><!-- 가능 -->
                                                <form:radiobutton path="fileAtchPosblAt" id="rdo4" class="ml20" name="bb" value="N" onclick="document.boardMaster.posblAtchFileNumber.disabled='disabled';" />
                                                <spring:message code="button.impossible" /><!-- 불가능 -->
                                                <br/><form:errors path="fileAtchPosblAt" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                            	<label for="posblAtchFileNumber"><spring:message code="cop.posblAtchFileNumber" /></label><!-- 첨부가능파일 숫자 -->
                                            	<span class="req" id="postAtchFileNumReq">필수</span>
                                            </td>
                                            <td>
                                                <label class="f_select" for="posblAtchFileNumber">
                                                    <form:select path="posblAtchFileNumber" id="posblAtchFileNumber" name="posblAtchFileNumber" title="첨부가능파일 숫자선택" >
                                                        <form:option value="0" label="첨부가능파일" selected="selected" />
                                                        <form:option value="1">1개</form:option>
                                                        <form:option value="2">2개</form:option>
                                                        <form:option value="3">3개</form:option>
                                                    </form:select>
                                                </label>
                                                <br/><form:errors path="posblAtchFileNumber" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="tmplatNm"><spring:message code="cop.tmplatId" /></label><!-- 템플릿정보 -->
                                            </td>
                                            <td>
                                                <span class="f_search2 w_350">
                                                    <form:input path="tmplatNm" id="tmplatNm" name="" readonly="true" title="템플릿정보입력" value="게시판 기본템플릿" />
                                                    <form:hidden path="tmplatId" id="tmplatId" value="TMPLAT_BOARD_DEFAULT" />
<!--                                                     <button type="button" class="btn" onclick="fn_egov_inqire_tmplatInqire(); return false;">조회</button> -->
                                                </span>
                                                <br/><form:errors path="tmplatId" />
                                            </td>
                                        </tr>
                                     <!-- 20230412 csh 게시판 사용관리 기능 추가-->
                                     	<tr>
                                     		<td class="lb">
                                     			 <label for="trgetType"><spring:message code="cop.trgetNm" /></label><!-- 커뮤니티 / 동호회명 -->
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <label class="f_select" for="qestnrTrget">
                                                    <select name="trgetType" class="select" title="" onchange="fn_egov_selectTargetType(this)">
                                                        <option selected value=''>선택하세요</option>
                                                        <option value="SYSTEM" >시스템</option>
                                                    </select>
                                                </label>
                                                <input type="hidden" name="trgetId" value="" />
                                                <input type="text" class="f_txt w_500 ml10" name="trgetNm" value="" title="" readOnly />
                                                <br/><form:errors path="trgetId" />
                                            </td>
                                     	</tr>
                                        
                                        <!-- 2009.06.26 : 2단계 기능 추가  -->
			                            <c:if test="${addedOptions == 'true'}">
			                            	<tr>
			                                	<th class="lb"><label for="option">추가 선택사항</label></th>
				                                <td >
				                                    <form:select path="option" title="추가선택사항선택" >
				                                    	<form:option value="" label="미선택" />
				                                    	<form:option value='comment'>댓글</form:option>
				                                    	<form:option value='stsfdg'>만족도조사</form:option>
				                                   </form:select>
				                                </td>
			                            	</tr>
			                            </c:if>
			                            <!-- // 2009.06.26 : 2단계 기능 추가 끝  -->
                                        
                                    </table>
                                </div>

								<!-- 목록/저장버튼  -->
                                <div class="board_view_bot">
                                    <div class="left_col btn3">
                                    </div>

                                    <div class="right_col btn1">
                                        <a href="#LINK" class="btn btn_blue_46 w_100" onclick="javascript:fn_egov_regist_brdMstr(); return false;"><spring:message code="button.save" /></a><!-- 저장 -->
                                        <a href="#LINK" class="btn btn_gray_46 w_100" onclick="javascript:fn_egov_select_brdMstrList(); return false;"><spring:message code="button.list" /></a><!-- 목록 -->
                                    </div>
                                </div>
                                <!-- // 목록/저장버튼 끝  -->
                                
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