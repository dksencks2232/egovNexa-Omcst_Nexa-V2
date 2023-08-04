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

<script type="text/javascript" src="<c:url value='/js/EgovCalPopup.js'/>" ></script>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="yearVacationVO" staticJavascript="false" xhtml="true" cdata="false"/>

<script type="text/javascript">

    function fn_regist_yearVacation() {
    	
        if (!validateYearVacationVO(document.yearVacationVO)){
            return false;
        }
        
        let nowdaycnt =$('input[name=nowdaycnt]').val();
        let vcDayCnt = $('input[name=vcDayCnt]').val();
         
        if(parseInt(vcDayCnt)>parseInt(nowdaycnt)){
        	alert("신청일수는 잔여일수보다 클수 없습니다.");
        	return false;
        }
        
	
        if (confirm('<spring:message code="common.regist.msg" />')) {
            document.yearVacationVO.action = "<c:url value='/vacationInfo'/>";
            document.yearVacationVO.method='post';
            document.yearVacationVO.submit();
        }
    }
    
    function fn_select_yearVacationList() {
        document.yearVacationVO.action = "<c:url value='/vacation'/>";
        document.yearVacationVO.method='get';
        document.yearVacationVO.submit();
    }
    
    /* ********************************************************
     * 달력
     ******************************************************** */
    function fn_egov_init_date(){
    	
    	$("#vcBgnDe").datepicker(
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

    	$("#vcEndDe").datepicker( 
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

<title>사내업무 > 알림정보 > <c:out value='${bdMstr.bbsNm}'/></title>

</head>



<body onload="fn_egov_init_date();">
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<input type="hidden" name="nowdaycnt" value="<c:out value='${vcday.nowdaycnt}'/>" />
    <!-- Skip navigation -->
    <a href="#contents" class="skip_navi">본문 바로가기</a>

    <div class="wrap">
        <div class="container">
            <div class="sub_layout">
                <div class="sub_in">
                    <div class="layout">
                        <div class="content_wrap">
                            <div id="contents" class="content">
                                 

								<form:form modelAttribute="yearVacationVO" name="yearVacationVO" method="post" enctype="multipart/form-data" >

				                	<input type="hidden" name="vcId" value="<c:out value='${vc.vcId}'/>" />
				                	<%-- <input type="hidden" name="tmplatId" value="<c:out value='${bdMstr.tmplatId}'/>" /> --%>
	                                
	                                <div class="board_view2">
	                                    <table>
	                                        <colgroup>
	                                            <col style="width: 150px;">
	                                            <col style="width: 190px;">
	                                            <col style="width: 150px;">
	                                            <col style="width: auto;">
                                        	</colgroup>
	                                        <tr>
	                                        	<td class="lb">
	                                        		<label for=""><spring:message code="omcst.vacation.vcType" /></label>
	                                        		<span class="req">필수</span>
	                                        	</td>
	                                        	<td colspan="3">  
	                                        		<label class="item f_select">                                      		
	                                        			<select class="select" name="vcType" id="vcType">
		                                        			<option value="COM031-01">연차</option>
		                                        			<option value="COM031-02">반차</option>
		                                        			<option value="COM031-03">리플래쉬</option>
		                                        		</select>
	                                        		</label>
	                                        	</td>
	                                        </tr>
	                                        <tr>
	                                            <td class="lb">
                                                <label for=""><spring:message code="omcst.vacation.vcBgnde" /></label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>                                     
                                               	<input type="text" class="f_date" name="vcBgnde" id="vcBgnDe"  maxlength="10" value="${yearVacationVO.vcBgnde}" title="시작일자입력" />
                                               	<br/><form:errors path="vcBgnde" />
                                            </td>
                                            <td class="lb">
                                                <label for=""><spring:message code="omcst.vacation.vcEndde" /></label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                            	<input type="text" class="f_date" name="vcEndde" id="vcEndDe" maxlength="10" value="${yearVacationVO.vcEndde}" title="종료일자입력" >
                                                <br/><form:errors path="vcEndDe" />                                            
                                            </td>
										<tr>
                                           	<td class="lb">
                                           		<label for=""><spring:message code="omcst.vacation.vcDayCnt" /></label>
                                               	<span class="req">필수</span>
                                           	</td>
                                            <td colspan="3">
                                                <input type="text" class="f_date" name="vcDayCnt" id="vcDayCnt" maxlength="4" value="${yearVacationVO.vcDayCnt}" title="신청일수" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">                                                
                                                <br/><form:errors path="vcDayCnt" />
                                            </td>                                            
                                        </tr>
	                                        <tr>
	                                           	<td class="lb">
	                                           		<label for="" class="display_n"><spring:message code="omcst.vacation.vcDayLft" /></label>
	                                           	</td>
	                                            <td colspan="3">
	                                            	<span class="m_display_ib">잔여일수</span>
	                                                <span><c:out value="${vcday.nowdaycnt}"/></span>
	                                            </td>                                            
	                                        </tr>
	                                    </table>
	                                </div>
	
									<!-- 목록/저장버튼  -->
	                                <div class="board_view_bot">
	                                    <div class="left_col btn3">
	                                    </div>
	                                    <div class="right_col btn1">
	                                       	<a href="#LINK" class="btn btn_blue_46 w_100" onclick="javascript:fn_regist_yearVacation(); return false;"><spring:message code="button.save" /></a><!-- 저장 -->
	                                        <a href="#LINK" class="btn btn_gray_46 w_100" onclick="javascript:fn_select_yearVacationList(); return false;"><spring:message code="button.list" /></a><!-- 목록 -->
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
    
<div class="search-all search-list">
	<div class="search-table">
		<div class="search-cell">
			<div class="search-wrap-con">
				<div class="search-wrap">
					<div class="search-tit">
						<h2>결재자 검색</h2>
						<div class="search-close">
							<span>X</span>
						</div>
					</div>
					<div class="search-con">
						<div class="condition">
							<form name="frm" action="/cop/bbs/selectBoardList.do" method="post" class="display_fcc">          
								<label class="label">부서명</label>	
								<label class="item f_select" for="sel1">
								    <select  title="검색조건 선택">
								        <option value="0">직접선택</option>
								        <option value="1">SI사업부</option>
								        <option value="2">SI사업부</option>
								    </select>
								</label>
								<span class="item f_search">
									<label class="label va_in">사원명</label>
								    <input class="f_input w_500" type="text" value="" maxlength="35" title="검색어 입력">
								</span>
								<span class="ml10">
									<button class="btn btn_gray_46 w_100" >검색</button><!-- 검색 -->
								</span>
							</form>
						</div>
						<div class="board_list">
	                        <table>
	                            <colgroup>
	                                <col style="width: 80px;">
	                                <col style="width: auto;">
	                                <col style="width: 150px;">
	                                <col style="width: 150px;">
	                                <col style="width: 150px;">
	                            </colgroup>
	                            <thead>
	                                <tr>
	                                    <th scope="col">선택</th>
	                                    <th scope="col">회사</th>
	                                    <th scope="col">부서</th>
	                                    <th scope="col">직급</th>
	                                    <th scope="col">사원명</th>
	                                </tr>
	                            </thead>
	                            <tbody>
	                                <tr>
	                                    <td>
	                                        <span class="f_chk_only">
	                                            <input type="checkbox" name="">
	                                        </span>
	                                    </td>
	                                    <td>(주)오픈마인즈</td>
	                                    <td>SI사업부</td>
	                                    <td>대표이사</td>
	                                    <td>운영자</td>
	                                </tr>
	                                <tr>
	                                    <td colspan="5">결재자를 검색 해주세요</td>
	                                </tr>
	                            </tbody>
	                        </table>
	                    </div>
	                    <div class="al_c mt20">
	                    	<button class="btn btn_blue_46 w_100" >저장</button><!-- 검색 -->
	                    	<button class="btn btn_red_46 w_100 search-close" >취소</button><!-- 검색 -->
	                    </div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<script>

//결재자팝업
	$(document).on("click", '.search-icon', function(e) {
		e.preventDefault();
		var $this = $(this);
		var $popupOpen = $('.search-list').show();
	});
	
	$('.search-close').on('click' , function(){
		$(this).parents('.search-all').hide()
	});


</script>

  
</body>
</html>

