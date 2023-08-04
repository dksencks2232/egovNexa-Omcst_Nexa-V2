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
                                
                                
                                <form name="listForm" action="<c:url value='/admin/vacationInfo'/>" method="get">
                                	
                                	<input name="checkVcIdForAsk" type="hidden" />
                                	<input name="mvDay" type="hidden" />
                                	<input name="forSign" type="hidden" />
                                	<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
	                                
	                                <!-- 검색조건 -->
	                                <div class="condition2">
	                                	<div class="con2_wrap">
	                                		<%-- <div>
			                                	<label for="occurDate" class="item mr10">입사일</label>
			                                    <input type="text" name="searchBgnde" id="searchBgnde" class="f_date" maxlength="10" value="${searchVO.searchBgnde}" title="시작일자입력" readonly />&nbsp; ~ &nbsp;
			                                    <input type="text" name="searchEndde" id="searchEndde" class="f_date" maxlength="10" value="${searchVO.searchEndde}" title="종료일자입력" readonly />
											</div> --%>
											<div>
												<span class="lb ml20 mr10">부서명</span>
			                                    <label class="item f_select">
			                                        <select class="select" name="searchVcStatus" id="searchVcStatus" title="부서명">
			                                        	<option value="">부서</option>
			                                        	<c:forEach var="org" items="${orgnztId_result}" varStatus="status">
				                                        	<option value='<c:out value="${org.code}"/>' <c:if test="${searchVO.searchVcStatus == org.code}"> selected="selected"</c:if> ><c:out value="${org.codeNm}"/></option>
			                                        	</c:forEach>
			                                        </select>
			                                    </label>
		                                    </div>
		                                    <div>
			                                    <label for="usernm" class="lb ml20 mr10">사원명</label>                                    
			                                    <input class="f_txt mr20" type="text" style="width: 100px;" name="searchEmplNm" id="searchEmplNm" value="${searchVO.searchEmplNm}" title="사용자명">                                    
		                                    </div>
		                                    <button type="submit" class="item btn btn_gray_46 w_100" onclick="fn_">조회</button>    
	                                    </div>                                
	                                </div>
	                                <!--// 검색조건 -->
	
	                                <div class="btn_area al_r">
	                                    <a href="#LINK" class="item btn btn_blue_46 w_100 search-icon">수정</a>
	                                </div>
	
	                                <!-- 게시판 -->
	                                <div class="board_list">
	                                    <table>
	                                        <colgroup>
	                                        	<col style="width: 80px;">
	                                        	<col style="width: 100px;">
	                                            <col style="width: 100px;">
	                                            <col style="width: 150px;">                                            
	                                            <col style="width: 120px;">
	                                            <col style="width: 120px;">
	                                            <col style="width: 120px;">
	                                        </colgroup>
	                                        <thead>
	                                            <tr>
	                                            	<th scope="col">
	                                                    <span class="f_chk_only chkAll">
	                                                        <input name="checkAll" type="checkbox" title="Check All" onclick="javascript:fn_checkAll();"/>
	                                                    </span>
	                                                </th>
	                                                <th scope="col">사원명</th>
	                                            	<th scope="col">부서</th>                                                
	                                                <th scope="col">입사일</th>
	                                                <th scope="col">생성연차</th>                                                                                                
	                                                <th scope="col">사용연차</th>
	                                                <th scope="col">잔여연차</th>                                                
	                                            </tr>
	                                        </thead>
	                                        <tbody>
	                                        	<c:if test="${fn:length(list)==0}">
	                                        		<td colspan="7"> 자료가 없습니다. 다른 검색조건을 선택해주세요</td>
	                                        	</c:if>
	                                        	<c:forEach var="result" items="${list}" varStatus="status">
	                                       		<tr>
	                                       			<td>
	                                                    <span class="f_chk_only">
	                                                        <input type="checkbox" name="checkField" title="Check <c:out value="${status.count}"/>" />
	                                                        <input type="hidden" name="checkVcId" value="<c:out value='${result.emplNo}'/>"/>
	                                                    </span>
	                                                </td>
	                                                <td><c:out value="${result.emplNm}"/></td>
	                                            	<td><c:out value="${result.orgnztNm}"/></td>
	                                            	<td><c:out value="${result.joinDate}"/></td>
	                                            	<td><c:out value="${result.totaldaycnt}"/></td>                                                
	                                                <td><c:out value="${result.usedaycnt}"/></td>
	                                                <td><c:out value="${result.nowdaycnt}"/></td>
	                                            </tr>
	                                            </c:forEach>
	                                        </tbody>
	                                    </table>
	                                </div>
                                </form>
                                <!-- 페이지 네비게이션 시작 -->
								<c:if test="${!empty searchVO.pageIndex }">
                                <div class="board_list_bot">
                                    <div class="paging" id="paging_div">
                                        <ul>
                                            <ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_linkPage" />
                                        </ul>
                                    </div>
                                </div>
                                </c:if>
                                <!-- //페이지 네비게이션 끝 -->
                                <!--// 게시판 -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
    
<div class="search-all search-list">
	<div class="search-table w_700">
		<div class="search-cell">
			<div class="search-wrap-con">
				<div class="search-wrap">
					<div class="search-tit">
						<h2>연차수정</h2>
						<div class="search-close">
							<span>X</span>
						</div>
					</div>
					<div class="search-con">
						<div class="al_c">
							<input id="mvDay" type="text" placeholder="연차 일수를 입력해주세요" class="f_txt w_500" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" />
						</div>
	                    <div class="al_c mt20">
	                    	<button class="btn btn_blue_46 w_100 search-save" >저장</button><!-- 검색 -->
	                    	<button class="btn btn_red_46 w_100 search-close" >취소</button><!-- 검색 -->
	                    </div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>    
    
<script>

//팝업
	$(document).on("click", '.search-icon', function(e) {
		if($('input:checkbox[name="checkField"]').is(':checked')){
			e.preventDefault();
			let $this = $(this);
			let $popupOpen = $('.search-list').show();
		}else{
			alert('선택한 대상이 없습니다.')
			return false;
		}
	});
	
	$('.search-close').on('click' , function(){
		$(this).parents('.search-all').hide()
	});
	
	$('.search-save').on('click' , function(){
		let mvday= $('#mvDay').val();
		
		if(mvday =="" || mvday ==null){
			alert("연차 일수를 입력해주세요");
			return false;
		}
		
		fn_updateCheckUser(mvday);
		
		$(this).parents('.search-all').hide()
	});
	
	function fn_updateCheckUser(day) {
		let checkField = document.listForm.checkField;
		let id = document.listForm.checkVcId;
		let checkedIds = "";
		let checkedCount = 0;
		
		if(checkField) {
			if(checkField.length > 1) {
		   		for(let i=0; i < checkField.length; i++) {
		    		if(checkField[i].checked) {
		            	checkedIds += ((checkedCount==0? "" : ",") + id[i].value);
		           		checkedCount++;
		           	}
		    	}
			} else {
			  	if(checkField.checked) {
			    	checkedIds = id.value;
			  	}
			}
		}
		
		if(checkedIds.length > 0 ){
			
			if(confirm('<spring:message code="common.update.msg" />')){
				document.listForm.checkVcIdForAsk.value=checkedIds;
				document.listForm.mvDay.value=day;
				document.listForm.action = "<c:url value='/admin/vacationUpdate'/>";
				document.listForm.method='post'; 
		        document.listForm.submit();
			}
		}
		
	}

</script>
    
</body>
</html>