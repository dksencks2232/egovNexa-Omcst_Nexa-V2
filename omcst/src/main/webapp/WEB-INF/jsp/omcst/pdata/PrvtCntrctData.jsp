<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<!DOCTYPE html>
<html>
<head>
<title>내부업무 사이트 > 샘플화면(기능별 생성)</title>

<script type="text/javascript" src="<c:url value='/js/EgovCalPopup.js'/>" ></script>
<script type="text/javaScript" language="javascript" defer>

	function fn_linkPage(pageNo){
	    document.listForm.pageIndex.value = pageNo;
	    document.listForm.action ="<c:url value='/prvtCntrctDataApi'/>";
	    document.listForm.submit();
	}
	
	function fn_search(){
	    document.listForm.pageIndex.value = 1;
	    document.listForm.action = "<c:url value='/prvtCntrctDataApi'/>";
	    document.listForm.submit();
	}
	
	/* ********************************************************
     * 달력
     ******************************************************** */
    function fn_egov_init_date(){
    	$("#searchBgnde").datepicker({
    			dateFormat:'yy-mm'
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
   	         , maxDate: 0
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
                                 
                                
                                <form name="listForm" action="<c:url value='/prvtCntrctDataApi'/>" method="get">
                                
                                <input name="pageIndex" type="hidden" value="<c:out value='${prvtCntrctSearchVO.pageIndex}'/>"/>

                                
                                <!-- 검색조건 -->
                                <div class="condition2">
                                	<label for="occurDate" class="item mr10">입찰공고일자</label>
                                    <input type="text" name="searchBgnde" id="searchBgnde" class="f_date" maxlength="10" value="${prvtCntrctSearchVO.searchBgnde}" title="검색월입력" readonly="true" />&nbsp;
                                	
                                    <button type="submit" class="item btn btn_gray_46 w_100" onclick="javascript:fn_search(); return false;">조회</button>                                    
                                </div>
                                <!--// 검색조건 -->


                                <!-- 게시판 -->
                                <div class="board_list">
                                    <table>
                                        <colgroup>
                                        	<col style="width: 120px;">
                                            <col style="width: 80px;">
                                            <col style="width: auto;">                                            
                                            <col style="width: 200px;">
                                            <col style="width: 120px;">
                                            <col style="width: 100px;">
                                            <col style="width: 100px;">
                                        </colgroup>
                                        <thead>
                                            <tr>
                                                <th scope="col">통합계약번호</th>
                                            	<th scope="col">업무구분</th>                                                
                                                <th scope="col">계약명</th>
                                                <th scope="col">계약기관</th>                                                                                                
                                                <th scope="col">금차계약금액</th>
                                                <th scope="col">계약방법</th> 
                                                <th scope="col">등록일시</th> 
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<c:if test="${fn:length(list) == 0}">
	                                        	<tr>
	                                        		<td colspan="7" >자료가 없습니다. 다른 검색조건을 선택해주세요</td>
	                                        	</tr>
                                        	</c:if>
                                        	
                                        	<c:forEach var="r" items="${list}" varStatus="status">
                                        		<tr>
	                                                <td><c:out value="${r.untyCntrctNo}"/></td>
	                                                <td><c:out value="${r.bsnsDivNm}"/></td>
	                                            	<td><a href='<c:out value="${r.cntrctDtlInfoUrl}"/>' class='lnk' target='_blank'><c:out value="${r.cntrctNm}"/> </a></td>
	                                            	<td><c:out value="${r.cntrctInsttNm}"/></td>                                                
	                                                <td><c:out value="${r.thtmCntrctAmt}"/></td>
	                                                <td><c:out value="${r.cntrctCnclsMthdNm}"/></td>
	                                                <td><c:out value="${r.rgstDt}"/></td>
	                                            </tr>
                                        	
                                        	</c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- 페이지 네비게이션 시작 -->
								<c:if test="${!empty prvtCntrctSearchVO.pageIndex }">
                                <div class="board_list_bot">
                                    <div class="paging" id="paging_div">
                                        <ul>
                                            <ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_linkPage" />
                                        </ul>
                                    </div>
                                </div>
                                </c:if>
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