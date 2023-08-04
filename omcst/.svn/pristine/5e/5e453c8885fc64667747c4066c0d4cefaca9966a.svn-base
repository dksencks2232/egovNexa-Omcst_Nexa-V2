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
		   		document.listForm.action = "<c:url value='/admin/updateSignVacation'/>";
		   		document.listForm.method='post';
		        document.listForm.submit();
       		}
	    }
	}
	
	/* ********************************************************
     * 달력
     ******************************************************** */
     $(function() {

    		$('#vPeriod').daterangepicker({
    		      autoUpdateInput: false,
    		      locale: {
    	          	cancelLabel: 'Clear',
    	          	"separator": " ~ ",                     // 시작일시와 종료일시 구분자
    		        "format": 'YYYY-MM-DD',     // 일시 노출 포맷
    		        "applyLabel": "확인",                    // 확인 버튼 텍스트
    		        "cancelLabel": "취소",                   // 취소 버튼 텍스트
    		        "daysOfWeek": ["일", "월", "화", "수", "목", "금", "토"],
    		        "monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"]
    		      },
    		      	timePicker: false,                        // 시간 노출 여부
    	  	        showDropdowns: true,                     // 년월 수동 설정 여부
    	  	        autoApply: false,                         // 확인/취소 버튼 사용여부
    	  	        timePicker24Hour: true,                  // 24시간 노출 여부(ex> true : 23:50, false : PM 11:50)
    	  	        timePickerSeconds: true,                 // 초 노출 여부
    	  	        singleDatePicker: 2,                   // 하나의 달력 사용 여부
    		});

    		$('#vPeriod').on('apply.daterangepicker', function(ev, picker) {
    		      $(this).val(picker.startDate.format('YYYY-MM-DD') + ' ~ ' + picker.endDate.format('YYYY-MM-DD'));
    		      $('#searchBgnde').val(picker.startDate.format('YYYY-MM-DD'));
    		      $('#searchEndde').val(picker.endDate.format('YYYY-MM-DD'));
    		});

    		$('#vPeriod').on('cancel.daterangepicker', function(ev, picker) {
    		    $(this).val('');
    		});

    });
</script>
<style type="text/css">

img {
    border: 0;
    vertical-align: middle;
}
</style>
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
                                 <!-- Location -->
                               
                                
                                <form name="listForm" action="<c:url value='/admin/vacationCheck'/>" method="get">
                                	<input name="checkVcIdForAsk" type="hidden" />
                                	<input name="forSign" type="hidden" />
                                	<input type="hidden" name="searchBgnde" id="searchBgnde" value="${searchVO.searchBgnde}" title="시작일자입력" readonly />
		                            <input type="hidden" name="searchEndde" id="searchEndde" value="${searchVO.searchEndde}" title="종료일자입력" readonly />
                                	
                                <!-- 검색조건 -->
                                <div class="condition2">
                                	<div class="con2_wrap">
                                		<div>
		                                	<label for="occurDate" class="item mr10">연차일정</label>
		                                    <input type="text" name="vPeriod" id="vPeriod" class="f_date w_300"  value="<c:if test ='${not empty searchVO.searchBgnde}'><c:out value='${searchVO.searchBgnde}'/> ~ <c:out value='${searchVO.searchEndde}'/></c:if>" title="연차일정입력" readonly />
	                                	</div>
	                                	<div>
	                                    	<span class="lb ml20">결재상태</span>
		                                    <label class="item f_select">
		                                        <select class="select" name="searchVcStatus" id="searchVcStatus" title="진행상태">
		                                        	<option value="">결재상태</option>
		                                        	<option value="VC02" <c:if test="${searchVO.searchVcStatus eq 'VC02' }">selected="selected"</c:if>>신청</option>
		                                            <option value="VC03" <c:if test="${searchVO.searchVcStatus eq 'VC03' }">selected="selected"</c:if>>승인</option>
		                                            <option value="VC04" <c:if test="${searchVO.searchVcStatus eq 'VC04' }">selected="selected"</c:if>>반려</option>
		                                        </select>
		                                    </label>
	                                    </div>
	                                    <div>
		                                    <label for="usernm" class="lb ml20">기안자</label>                                    
		                                    <input class="f_txt mr20" type="text" style="width: 100px;" name="searchEmplNm" id="searchEmplNm" value="${searchVO.searchEmplNm}" title="기안자">                                    
	                                    </div>
	                                    <button type="submit" class="item btn btn_gray_46 w_100" onclick="fn_">조회</button>   
                                    </div>                              
                                </div>
                                <!--// 검색조건 -->
                                
                                <div class="display_fc mt20 mb10">
	                                <div>
	                                    <p class="font-w700 mb0">대기 <span class="f_color_g"><c:out value="${yearVacationVO.apply}"/></span> / 승인 <span class="f_color_b"><c:out value="${yearVacationVO.pass}"/></span> / 반려 <span class="f_color_r"><c:out value="${yearVacationVO.deny}"/></span></p>
	                                </div>
	                                <div class="btn_area">
	                                    <a href="#LINK" class="item btn btn_blue_46 w_100" onclick="javascript:fn_updateYearVacation('VC03'); return false;">승인</a>
	                                    <a href="#LINK" class="item btn btn_red_46 w_100" onclick="javascript:fn_updateYearVacation('VC04'); return false;">반려</a>
	                                </div>
                                </div>

                                <!-- 게시판 -->
                                <div class="board_list">
                                    <table>
                                        <colgroup>
                                        	<col style="width: 50px;">
                                        	<col style="width: 80px;">
                                            <col style="width: 80px;">
                                            <col style="width: 100px;">                                            
                                            <col style="width: 200px;">
                                            <col style="width: 100px;">
                                            <col style="width: 100px;">
                                            <col style="width: 100px;">
                                        </colgroup>
                                        <thead>
                                            <tr>
                                            	<th scope="col">
                                                    <span class="f_chk_only chkAll">
                                                        <input name="checkAll" type="checkbox" title="Check All" onclick="javascript:fn_checkAll();"/>
                                                    </span>
                                                </th>
                                                <th scope="col">기안자</th>
                                            	<th scope="col">연차구분</th>                                                
                                                <th scope="col">기안일</th>
                                                <th scope="col">연차일정</th>                                                                                                
                                                <th scope="col">연차일수</th>
                                                <th scope="col">결재일자</th>                                                
                                                <th scope="col">결재상태</th>
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
                                                <td><c:out value="${r.emplNm}" /></td>
                                            	<td><c:out value="${r.vcTypeNm}"/></td>
                                            	<td><c:out value="${r.frstRegistPnttm}"/></td>
                                            	<td><c:out value="${r.vcBgnde}"/> ~ <c:out value="${r.vcEndde}"/></td>                                                
                                                <td><c:out value="${r.vcDayCnt}"/></td>
                                                <c:choose>	                                                	
	                                                <c:when test="${r.vcStatus eq 'VC03' or r.vcStatus eq 'VC04'}">			<!-- 승인  -->
	                                                	<td><c:out value="${r.lastUpdtPnttm}"/></td>
	                                                </c:when>
	                                                <c:otherwise>
                                                		<td>-</td>
                                                	</c:otherwise>
                                                </c:choose>	
                                                <td><c:out value="${r.vcStatusNm}"/></td>
                                            </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                
                                <!-- 페이지 네비게이션 시작 -->
                                <div class="board_list_bot">
                                    <div class="paging" id="paging_div">
                                        <ul>
                                            <ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_select_noticeList" />
                                        </ul>
                                    </div>
                                </div>
                                <!-- //페이지 네비게이션 끝 -->
                                
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