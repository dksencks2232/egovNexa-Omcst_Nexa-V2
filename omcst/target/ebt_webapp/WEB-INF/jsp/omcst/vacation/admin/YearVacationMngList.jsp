<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

	
<title>내부업무 사이트 > 샘플화면(기능별 생성)</title>

<script type="text/javascript" src="<c:url value='/js/EgovCalPopup.js'/>" ></script>
<script type="text/javaScript" language="javascript" defer="defer">
	
	
	$(document).ready(function(){
		fn_init();
	});
	
	function fn_init(){
		$.each($('input:checkbox[name=checkField]'), function(idx, item){
		    if($(item).data('status') == 'VC03' || $(item).data('status') == 'VC04' || $(item).data('status') == 'VC01'){
		        $(item).attr('disabled', 'true');
		        $(item).addClass('f_chk_off');
		        $(item).parent().removeClass('f_chk_only');		        
		    }		    
		});
		
	}



	function fn_searchYearVacation(){
		document.listForm.action = "<c:url value='/omcst/yearVacationMng/selectListYearVacation.do'/>";
		document.listForm.submit();		
	}

	function fn_checkAll() {
	    var checkField = document.listForm.checkField;
	    if(document.listForm.checkAll.checked) {
	        if(checkField) {
	            if(checkField.length > 1) {
	                for(var i=0; i < checkField.length; i++) {
	                    checkField[i].checked = true;
	                }
	            } else {
	                checkField.checked = true;
	            }
	        }
	    } else {
	        if(checkField) {
	            if(checkField.length > 1) {
	                for(var j=0; j < checkField.length; j++) {
	                    checkField[j].checked = false;
	                }
	            } else {
	                checkField.checked = false;
	            }
	        }
	    }
	}

	function fn_updateYearVacation(btnType) {
	    var checkField = $('input[name="checkField"]');
	    var id = $('input[name="checkVcId"]');
	    
	    var checkedIds = "";
	    var checkedCount = 0;
	    
	    if(checkField) {
	        if(checkField.length > 0) {
	            for(var i=0; i < checkField.length; i++) {
	                if(checkField[i].checked) {
	                    checkedIds += ((checkedCount==0? "" : ",") + id[i].value);
	                    checkedCount++;
	                }
	            }
	        }
	    }
	    
	    if(checkedCount <= 0){
	    	alert('선택한 대상이 없습니다.');
	    	return;
	    }

	    if(checkedIds.length > 0) {
	    	var title = '승인';
	    	if('VC04' == btnType){
	    		title = '반려';	    		
	    	}
       		if(confirm("선택한 신청건을 " + title + " 처리 하시겠습니까?")){
        		document.listForm.checkVcIdForAsk.value = checkedIds;
        		document.listForm.forSign.value = btnType;        		
		   		document.listForm.action = "<c:url value='/omcst/yearVacationMng/updateSignYearVacation.do'/>";
		        document.listForm.submit();
       		}
	    }
	}
	
	/* ********************************************************
     * 달력
     ******************************************************** */
    function fn_egov_init_date(){
    	
    	$("#searchBgnde").datepicker(
    	        {dateFormat:'yy-mm-dd'
    	         , showOn: 'button'
    	         , buttonImage: '<c:url value='/images/ico_calendar.png'/>'
    	         , buttonImageOnly: true
    	         
    	         , showMonthAfterYear: true
    	         , showOtherMonths: true
    		     , selectOtherMonths: true
    		     , monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
    				
    	         , changeMonth: true // 월선택 select box 표시 (기본은 false)
    	         , changeYear: true  // 년선택 selectbox 표시 (기본은 false)
    	         , showButtonPanel: true // 하단 today, done  버튼기능 추가 표시 (기본은 false)
    	});

    	$("#searchEndde").datepicker( 
    	        {dateFormat:'yy-mm-dd'
    	         , showOn: 'button'
    	         , buttonImage: '<c:url value='/images/ico_calendar.png'/>'
    	         , buttonImageOnly: true
    	         
    	         , showMonthAfterYear: true
    	         , showOtherMonths: true
    		     , selectOtherMonths: true
    		     , monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
    				
    	         , changeMonth: true // 월선택 select box 표시 (기본은 false)
    	         , changeYear: true  // 년선택 selectbox 표시 (기본은 false)
    	         , showButtonPanel: true // 하단 today, done  버튼기능 추가 표시 (기본은 false)
    	});
    }
</script>
<style type="text/css">

img {
    border: 0;
    vertical-align: middle;
}
</style>
</head>
<body onload="fn_egov_init_date();">
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
                                
                                
                                <form name="listForm" action="<c:url value='/omcst/yearVacationMng/selectListYearVacation.do'/>" method="post">
                                	<input name="checkVcIdForAsk" type="hidden" />
                                	<input name="forSign" type="hidden" />
                                
                                <!-- 검색조건 -->
                                <div class="condition2">
                                	<label for="occurDate" class="item mr10">연차기간</label>
                                    <input type="text" name="searchBgnde" id="searchBgnde" class="f_date" maxlength="10" value="${searchVO.searchBgnde}" title="시작일자입력" />&nbsp; ~ &nbsp;
                                    <input type="text" name="searchEndde" id="searchEndde" class="f_date" maxlength="10" value="${searchVO.searchEndde}" title="종료일자입력" >
                                	
                                    
                                    <label class="item f_select ml20">
                                        <select class="select" name="searchVcStatus" id="searchVcStatus" title="진행상태">
                                        	<option value="">진행상태</option>
                                        	<option value="VC01" <c:if test="${searchVO.searchVcStatus eq 'VC01' }">selected="selected"</c:if>>계획</option>
                                        	<option value="VC02" <c:if test="${searchVO.searchVcStatus eq 'VC02' }">selected="selected"</c:if>>신청</option>
                                            <option value="VC03" <c:if test="${searchVO.searchVcStatus eq 'VC03' }">selected="selected"</c:if>>승인</option>
                                            <option value="VC04" <c:if test="${searchVO.searchVcStatus eq 'VC04' }">selected="selected"</c:if>>반려</option>
                                        </select>
                                    </label>
                                    
                                    
                                    <label for="usernm" class="lb ml20">사용자명</label>                                    
                                    <input class="f_txt mr20" type="text" style="width: 100px;" name="searchEmplNm" id="searchEmplNm" value="${searchVO.searchEmplNm}" title="사용자명">                                    
                                    
                                    <button type="submit" class="item btn btn_gray_46 w_100" onclick="fn_">조회</button>                                    
                                </div>
                                <!--// 검색조건 -->

                                <div class="btn_area al_r">
                                    <a href="#LINK" class="item btn btn_blue_46 w_100" onclick="javascript:fn_updateYearVacation('VC03'); return false;">승인</a>
                                    <a href="#LINK" class="item btn btn_blue_46 w_100" onclick="javascript:fn_updateYearVacation('VC04'); return false;">반려</a>
                                </div>

                                <!-- 게시판 -->
                                <div class="board_list">
                                    <table>
                                        <colgroup>
                                        	<col style="width: 50px;">
                                        	<col style="width: 80px;">
                                            <col style="width: 100px;">
                                            <col style="width: auto;">                                            
                                            <col style="width: 50px;">
                                            <col style="width: 120px;">
                                            <col style="width: 100px;">
                                            <col style="width: 100px;">
                                            <col style="width: 120px;">
                                        </colgroup>
                                        <thead>
                                            <tr>
                                            	<th scope="col">
                                                    <span class="f_chk_only chkAll">
                                                        <input name="checkAll" type="checkbox" title="Check All" onclick="javascript:fn_checkAll();"/>
                                                    </span>
                                                </th>
                                                <th scope="col">휴가분류</th>
                                            	<th scope="col">신청자</th>                                                
                                                <th scope="col">연차일정</th>
                                                <th scope="col">일수</th>                                                                                                
                                                <th scope="col">계획일</th>
                                                <th scope="col">진행상태</th>                                                
                                                <th scope="col">결재자</th>
                                                <th scope="col">결재일자</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<c:forEach var="r" items="${list}" varStatus="status">
                                        		<tr>
                                        			<td>
	                                                    <span class="f_chk_only">
	                                                        <input type="checkbox" name="checkField" data-status="${r.vcStatus}" title="Check <c:out value='${status.count}'/>" />
	                                                        <input type="hidden" name="checkVcId" value="<c:out value='${r.vcId}'/>"/>
	                                                    </span>
	                                                </td>
	                                                <td><c:out value="${r.vcTypeNm}"></c:out></td>
	                                            	<td><a href="" class="lnk"><c:out value="${r.emplNm}"></c:out> </a></td>
	                                            	<td><c:out value="${r.vcBgnde}"></c:out> ~ <c:out value="${r.vcEndde}"></c:out> </td>
	                                            	<td><c:out value="${r.vcDayCnt}"></c:out></td>                                                
	                                                <td><c:out value="${r.frstRegistPnttm}"></c:out>  </td>
	                                                <td><c:out value="${r.vcStatusNm}"></c:out> </td>
	                                                <c:choose>	                                                	
	                                                	<c:when test="${r.vcStatus eq 'VC03' or r.vcStatus eq 'VC04'}">			<!-- 승인  -->
	                                                		<td><c:out value="${r.lastUpdusrNm}"></c:out></td>
	                                                		<td><c:out value="${r.lastUpdtPnttm}"></c:out> </td>
	                                                	</c:when>	                                                	
	                                                	<c:otherwise>
	                                                		<td>-</td>
	                                                		<td>-</td>
	                                                	</c:otherwise>
	                                                </c:choose>
	                                            </tr>
                                        	
                                        	</c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                
                                </form>

                                
                                <!--// 게시판 -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
    
</body>
</html>