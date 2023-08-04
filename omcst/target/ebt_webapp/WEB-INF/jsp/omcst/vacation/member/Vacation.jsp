<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>


<script type="text/javascript" src="<c:url value='/js/vacation/member/vacation.js'/>" ></script>


<style type="text/css">

img {
    border: 0;
    vertical-align: middle;
}
</style>


<%--연차구분--%>
<c:set var='yearsVacationCode' value='<%= egovframework.omcst.common.service.CodeCacheService.getCode("COM031") %>' />
<%--결재상태--%>
<c:set var='vacationStatusCode' value='<%= egovframework.omcst.common.service.CodeCacheService.getCode("COM030") %>' />
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
                                <form name="listForm" action="<c:url value='/vacation'/>" method="get">
                                	<input name="checkVcIdForAsk" type="hidden" />
                                	<input name="nowdaycnt" type="hidden" value="<c:out value='${yearVacationVO.nowdaycnt}'/>"/>
                                	<input name="checkVcIdForDel" type="hidden" />
                                	<input type="hidden" name="searchBgnde" id="searchBgnde" value="<c:out value='${yearVacationVO.searchBgnde}'/>" />
			                        <input type="hidden" name="searchEndde" id="searchEndde" value="<c:out value='${yearVacationVO.searchEndde}'/>" /> 
	                                
	                                <!-- 검색조건 -->
	                                <div class="condition2">
	                                	<div class="con2_wrap">
		                                	<div>
			                                	<label class="item">휴가구분</label>
			                                	<label class="item f_select ml10">
			                                        <select name="searchVcType" id="searchVcType" title="구분">
			                                        	<option value="">구분</option>
			                                        	<c:forEach var="yvcode" items="${yearsVacationCode}" varStatus="status">
			                                        		<option value="<c:out value="${yvcode.code}"/>"<c:if test="${searchVO.searchVcType == yvcode.code}"> selected="selected"</c:if>><c:out value="${yvcode.codeNm}"/></option>
			                                        	</c:forEach>
				                                    </select>
			                                    </label>
		                                    </div>
		                                	<div>
			                                	<label for="occurDate" class="item mr10">휴가일정</label>
			                                    <input type="text" name="vPeriod" id="vPeriod" class="f_date w_300"  value="<c:if test ='${not empty yearVacationVO.searchBgnde}'><c:out value='${yearVacationVO.searchBgnde}'/> ~ <c:out value='${yearVacationVO.searchEndde}'/></c:if>" title="휴가일정입력" readonly />
		                                	</div>
		                                	<div>             
			                                	<label class="item ml20">결재상태</label>                                    
			                                    <label class="item f_select ml10">
			                                        <select name="searchVcStatus" id="searchVcStatus" title="진행상태">
			                                        	<option value="">진행상태</option>
			                                        	<c:forEach var="vscode" items="${vacationStatusCode}" varStatus="status">
			                                        		<option value="<c:out value="${vscode.code}"/>"<c:if test="${searchVO.searchVcStatus == vscode.code}">selected="selected"</c:if>><c:out value="${vscode.codeNm}"/></option>
			                                        	</c:forEach>
			                                        </select>
			                                    </label>
		                                    </div>
		                                    <!-- <button type="submit" class="item btn btn_blue_46 w_100">조회 -->
		                                    <a href="#LINK" class="item btn btn_gray_46 w_100" onclick="javascript:fn_searchYearVacation(); return false;">조회</a>        
	                                    </div>                                                       
	                                </div>
	                                <!--// 검색조건 -->
									
	                                <div class="btn_area al_r">
	                                	
										<a href='#LINK' class="item btn btn_blue_46 w_100" onclick="javascript:fn_insertYearvacation(); return false;">휴가신청</a>
	                                    <a href="#LINK" class="item btn btn_red_46 w_100" onclick="javascript:fn_updateYearVacation('DEL'); return false;">삭제</a>
	                                    <p class="font-w700 mb10" align="left">생성 <span class="f_color_g"><c:out value="${yearVacationVO.totaldaycnt}"/></span> / 사용 <span class="f_color_b"><c:out value="${yearVacationVO.usedaycnt}"/></span> / 잔여 <span class="f_color_r"><c:out value="${yearVacationVO.nowdaycnt}"/></span></p>
	                                </div>
									
	                                <!-- 게시판 -->
	                                <div class="board_list">
	                                    <table>
	                                        <colgroup>
	                                        	<col style="width: 50px;">
	                                        	<col style="width: 100px;">
	                                            <col style="width: 150px;">
	                                            <col style="width: 200px;">                                            
	                                            <col style="width: 100px;">
	                                            <col style="width: 100px;">		<!-- 120 -->
	                                            <col style="width: 100px;">		<!-- 100 -->
	                                            <col style="width: 100px;">		<!-- 100 -->
	                                        </colgroup>
	                                        <thead>
	                                            <tr>
	                                            	<th scope="col">
	                                                    <span class="f_chk_only chkAll">
	                                                        <input name="checkAll" data-chk-only-name="delYn" type="checkbox" title="Check All" />
	                                                    </span>
	                                                </th>
	                                            	<th scope="col">휴가분류</th>
	                                            	<th scope="col">신청자</th>                                            	                                                
	                                                <th scope="col">휴가일정</th>
	                                                <th scope="col">일수</th>                                                                                                
	                                                <th scope="col">진행상태</th>                                                
	                                                <th scope="col">결재자</th>
	                                                <th scope="col">결재일자</th>
	                                            </tr>
	                                        </thead>
	                                        <tbody>
	                                        	<c:forEach var="r" items="${list}" varStatus="status">
                                        		<tr>
                                        			<td>
                                        			<c:choose>
                                        				<c:when test="${r.vcStatus == 'VC03' || r.vcStatus == 'VC04'}">
                                        				<span class="f_chk_off">
                                        					<input type="checkbox" name="delYn" title="Check <c:out value="${status.count}"/>" disabled />
                                        					<input type="hidden" name="checkId" value="<c:out value='${r.vcId}'/>"/>
                                        				</span>
                                        				</c:when>
                                        				<c:otherwise>
	                                                    <span class="f_chk_only">
	                                                        <input type="checkbox" name="delYn" title="Check <c:out value="${status.count}"/>" />
	                                                        <input type="hidden" name="checkId" value="<c:out value='${r.vcId}'/>"/>
	                                                    </span>
	                                                    </c:otherwise>
	                                                </c:choose>
	                                                </td>
	                                                <td><c:out value="${r.vcTypeNm}" /></td>
	                                            	<td><a href="" class="lnk"><c:out value="${r.emplNm}"/></a></td>
	                                            	<td><c:out value="${r.vcBgnde}"></c:out> ~ <c:out value="${r.vcEndde}"/></td>
	                                            	<td><c:out value="${r.vcDayCnt}"/></td>                                                
	                                                <td><c:out value="${r.vcStatusNm}"/></td>                                                	
                                               		<c:choose>	                                                	
	                                                	<c:when test="${r.vcStatus == 'VC03' || r.vcStatus == 'VC04'}">			<!-- 승인  -->
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
