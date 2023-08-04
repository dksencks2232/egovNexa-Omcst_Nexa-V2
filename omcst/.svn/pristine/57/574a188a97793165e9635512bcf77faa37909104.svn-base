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
<title>내부업무 사이트 > (기능별 생성)</title>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d363143092777e8d7605765853777369&libraries=services,clusterer,drawing"></script>
<script type="text/javascript" src="<c:url value='/js/EgovCalPopup.js'/>" ></script>
<script defer src="<c:url value='/js/common/Common.js' />"></script>
<script defer src="<c:url value='/js/pdata/parkingLotData.js' />"></script>
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
                                <form name="listForm">
                                <input name="pageIndex" type="hidden" value="<c:out value='${parkingLotDataSearchVO.pageIndex}'/>"/>
                                <!-- 검색조건 -->
                                <div class="condition2">
									<span class="lb ml20 mr10">행정구역</span>
									<label class="item f_select">
                                        <select class="select" name="bjdCode" id="bjdCode" title="행정구역">
											<%-- <option value="" <c:if test="${parkingLotDataSearchVO.bjdCode eq ''}">selected="selected"</c:if>>전체</option> --%>
											<c:forEach var="city" items="${seoulList}" varStatus="status">
                                                <option value="${city.key}" <c:if test="${parkingLotDataSearchVO.bjdCode eq city.key}">selected="selected"</c:if>>
                                                	${city.value}
                                                </option>
                                        	</c:forEach>			                                        	
                                        </select>			       
                                    </label>
                                	<span class="lb mr10">주차장 명 : </span>
                                    <input id="searchKeyword" class="f_txt mr20" name="searchKeyword" type="text" value="" title="검색" onkeypress="fn_press();" >

                                    <span class="lb mr10">유료여부 : </span>
                                    <label class="item f_select" for="selAbsnceAt">
                                        <select id="selAbsnceAt" name="selAbsnceAt">
    		                                <option value="A" selected>전체</option>
    		                                <option value="Y">Y</option>
    		                                <option value="N">N</option>
    	                                </select>
                                    </label>
                                    <button type="submit" class="item btn btn_gray_46 w_100" onclick="javascript:fn_search(); return false;">조회</button>                                    
                                </div>
                                <!--// 검색조건 -->
								<div id="mapBtn" class="btn btn_blue_46 w_100">지도</div>
							 	<div id="parkingMap" style="width:500px;height:400px;"></div>  
                                <!-- 게시판 -->
                                <div class="board_list">
                                    <table>
                                        <colgroup>
                                        	<col style="width: 150px;">
                                            <col style="width: 200px;">
                                            <col style="width: 70px;">                                            
                                            <col style="width: 70px;">
                                            <col style="width: 80px;">
                                            <col style="width: 80px;">
                                            <col style="width: 80px;">
                                            <col style="width: 80px;">
                                            <col style="width: 80px;">
                                            <%-- <col style="width: 80px;"> --%>
                                            <%-- <col style="width: 80px;"> --%>
                                        </colgroup>
                                        <thead>
                                            <tr>
                                                <th scope="col">주차장명</th>  
                                                <th scope="col">주소</th>  
                                                <th scope="col">주차장 종류명</th>  
                                                <th scope="col">유무료구분</th>  
                                                <th scope="col">야간무료개방여부</th>  
                                                <th scope="col">공휴일 유,무료 구분</th>  
                                                <th scope="col">기본 주차 요금</th>  
                                                <th scope="col">하루요금</th>  
                                                <th scope="col">총 주차면</th>  
                                                <!-- <th scope="col">현재 주차 차량수</th> -->  
                                                <!-- <th scope="col">위치정보</th>  --> 
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<c:if test="${fn:length(list) == 0}">
	                                        	<tr>
	                                        		<td colspan="7" >자료가 없습니다. 다른 검색조건을 선택해주세요</td>
	                                        	</tr>
                                        	</c:if>
                                        	
                                        	<c:forEach var="r" items="${list}" varStatus="status">
                                        		<tr data-row="${status.index}">
	                                                <td data-col="PARKING_NAME" data-code="${r.PARKING_CODE}">
	                                                	<c:out value="${r.PARKING_NAME}"/>
	                                                </td>  
	                                                <td data-col="ADDR" onclick="fn_focusMap(this);" style="color:blue; cursor:pointer;">
	                                                	<c:out value="${r.ADDR}"/>
	                                                </td>  
	                                                <td data-col="PARKING_TYPE_NM" data-code="${r.PARKING_TYPE}">
	                                                	<c:out value="${r.PARKING_TYPE_NM}"/>
	                                                </td>  
	                                                <td data-col="PAY_NM" data-code="${r.PAY_YN}">
	                                                	<c:out value="${r.PAY_NM}"/>
	                                                </td>  
	                                                <td data-col="NIGHT_FREE_OPEN_NM" data-code="${r.NIGHT_FREE_OPEN}">
	                                                	<c:out value="${r.NIGHT_FREE_OPEN_NM}"/>
	                                                </td>  
	                                                <td data-col="HOLIDAY_PAY_NM" data-code="${r.HOLIDAY_PAY_YN}">
	                                                	<c:out value="${r.HOLIDAY_PAY_NM}"/>
	                                                </td>  
	                                                <td data-col="RATES">
	                                                	<c:out value="${r.RATES}"/>
	                                                </td>  
	                                                <td data-col="DAY_MAXIMUM">
	                                                	<c:out value="${r.DAY_MAXIMUM}"/>
	                                                </td>  
	                                                <td data-col="CAPACITY">
	                                                	<c:out value="${r.CAPACITY}"/>
	                                                </td>  
	                                                <%-- <td data-col="CUR_PARKING"><c:out value="${r.CUR_PARKING}"/></td> --%>  
	                                                <%-- <td data-col="LATLNG"><c:out value="${r.LAT}"/>:<c:out value="${r.LNG}"/></td> --%>  
	                                            </tr>    
	                                   		</c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- 페이지 네비게이션 시작 -->
								<c:if test="${!empty parkingLotDataSearchVO.pageIndex }">
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
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>