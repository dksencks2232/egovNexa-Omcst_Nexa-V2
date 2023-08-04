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
	
        if (confirm('<spring:message code="common.regist.msg" />')) {

            document.yearVacationVO.action = "<c:url value='/omcst/yearVacation/insertYearVacation.do'/>";
            document.yearVacationVO.submit();
        }
    }
    
    function fn_select_yearVacationList() {
        document.yearVacationVO.action = "<c:url value='/omcst/yearVacation/selectListYearVacation.do'/>";
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

<style type="text/css">
.ui-datepicker-trigger {
	margin-left: 10px;
	vertical-align: middle;
}
</style>

<body onload="fn_egov_init_date();">
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
                                               	<input type="text" class="f_date" name="vcBgnde" id="vcBgnDe"  maxlength="10" value="${yearVacationVO.searchBgnDe}" title="시작일자입력" />
                                               	<br/><form:errors path="vcBgnde" />
                                            </td>
                                            <td class="lb">
                                                <label for=""><spring:message code="omcst.vacation.vcEndde" /></label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                            	<input type="text" class="f_date" name="vcEndde" id="vcEndDe" maxlength="10" value="${yearVacationVO.searchEndDe}" title="종료일자입력" >
                                                <br/><form:errors path="vcEndDe" />                                            
                                            </td>
										<tr>
                                           	<td class="lb">
                                           		<label for=""><spring:message code="omcst.vacation.vcDayCnt" /></label>
                                               	<span class="req">필수</span>
                                           	</td>
                                            <td colspan="3">
                                                <input type="text" class="f_date" name="vcDayCnt" id="vcDayCnt" maxlength="4" value="${yearVacationVO.vcDayCnt}" title="신청일수" >                                                
                                                <br/><form:errors path="vcDayCnt" />
                                            </td>                                            
                                        </tr>
                                    </table>

                                    
                                </div>

								<!-- 목록/저장버튼  -->
                                <div class="board_view_bot">
                                    <div class="left_col btn3">
                                    </div>

                                    <div class="right_col btn1">
                                       	<a href="#LINK" class="btn btn_blue_46 w_100" onclick="javascript:fn_regist_yearVacation(); return fasle;"><spring:message code="button.save" /></a><!-- 저장 -->

                                        <a href="#LINK" class="btn btn_blue_46 w_100" onclick="javascript:fn_select_yearVacationList(); return false;"><spring:message code="button.list" /></a><!-- 목록 -->
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