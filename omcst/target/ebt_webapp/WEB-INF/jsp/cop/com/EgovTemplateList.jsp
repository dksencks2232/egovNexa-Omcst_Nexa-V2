<%--
  Class Name : EgovTemplateList.jsp
  Description : 템플릿 목록화면
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2009.03.18   이삼섭              최초 생성
     2011.08.31   JJY       경량환경 버전 생성
 
    author   : 공통서비스 개발팀 이삼섭
    since    : 2009.03.18
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="egovframework.com.cmm.service.EgovProperties" %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<script type="text/javascript">
    function press(event) {
        if (event.keyCode==13) {
            fn_egov_select_tmplatInfo('1');
        }
    }

    function fn_egov_insert_addTmplatInfo(){    
        document.frm.action = "<c:url value='/cop/com/addTemplateInf.do'/>";
        document.frm.submit();
    }
    
    function fn_egov_select_tmplatInfo(pageNo){
        document.frm.pageIndex.value = pageNo; 
        document.frm.action = "<c:url value='/cop/com/selectTemplateInfs.do'/>";
        document.frm.submit();  
    }
    
    function fn_egov_inqire_tmplatInfor(tmplatId){
        document.frm.tmplatId.value = tmplatId;
        document.frm.action = "<c:url value='/cop/com/selectTemplateInf.do'/>";
        document.frm.submit();          
    }
</script>

<title>내부업무 사이트 > 내부서비스관리 > 게시판템플릿목록</title>
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
                                 
                                
                                <!-- 검색조건 -->
                                <div class="condition">
                                
                                	<form name="frm" action ="<c:url value='/cop/com/selectTemplateInfs.do'/>" method="post">
			                        
			                        <input type="hidden" name="tmplatId" value="" />
			                        <input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
                                
                                    <label class="item f_select" for="sel1">
                                        <select id="sel1" name="searchCnd" title="검색조건" class="select">
                                            <option value="0" <c:if test="${searchVO.searchCnd == '0'}">selected="selected"</c:if> >템플릿명</option>
                                            <option value="1" <c:if test="${searchVO.searchCnd == '1'}">selected="selected"</c:if> >템플릿구분</option>
                                         </select>
                                    </label>

                                    <span class="item f_search">
                                        <input class="f_input w_500" name="searchWrd" title="검색어" type="text" value='<c:out value="${searchVO.searchWrd}"/>' maxlength="35" onkeypress="press(event);">
                                    </span>
									 <span class="ml10">
                                        <button class="btn btn_gray_46 w_100" type="submit" onclick="javascript:fn_egov_select_tmplatInfo('1'); return false;"><spring:message code='button.inquire' /></button><!-- 조회 -->
                                    </span>
                                    
                                    
                                    </form>
                                    
                                </div>
                                <!--// 검색조건 -->
                                <div class="mt20 mb20 al_r">
                                	<a href="<c:url value='/cop/com/addTemplateInf.do'/>" class="item btn btn_blue_46 w_100" onclick="javascript:fn_egov_insert_addTmplatInfo(); return false;"><spring:message code="button.create" /></a><!-- 등록 -->
                                </div>

                                <!-- 게시판 -->
                                <div class="board_list">
                                    <table summary="번호,게시판 명,사용 커뮤니티 명,사용 동호회 명,등록일시,사용여부  목록입니다">
                                    	<caption>게시판 템플릿 목록</caption>
                                        <colgroup>
                                            <col style="width: 80px;">
                                            <col style="width: 150px;">
                                            <col style="width: 130px;">
                                            <col style="width: auto;">
                                            <col style="width: 100px;">
                                            <col style="width: 150px;">
                                        </colgroup>
                                        <thead>
                                            <tr>
                                                <th scope="col">번호</th>
                                                <th scope="col">템플릿명</th>
                                                <th scope="col">템플릿구분</th>
                                                <th scope="col">템플릿경로</th>
                                                <th scope="col">사용여부</th>
                                                <th scope="col">등록일자</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	
                                        	<c:if test="${fn:length(resultList) == 0}">
	                                        	<tr>
	                                        		<td colspan="6" ><spring:message code="common.nodata.msg" /></td>
	                                        	</tr>
                                        	</c:if>
                                        	
                                        	<c:forEach var="result" items="${resultList}" varStatus="status">
	                                            <tr>
	                                                <td><c:out value="${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}"/></td>
	                                                <td>
	                                                	<a href="<c:url value='/cop/com/selectTemplateInf.do'/>?tmplatId=<c:out value='${result.tmplatId}'/>" class="lnk">
	                                                		<c:out value="${result.tmplatNm}"/>
	                                                	</a>
	                                                </td>
	                                                <td><c:out value="${result.tmplatSeCodeNm}"/></td>
	                                                <td class="al"><c:out value="${result.tmplatCours}"/></td>
	                                                <td>
	                                                	<c:if test="${result.useAt == 'N'}"><spring:message code="button.notUsed" /></c:if>
	                                                	<c:if test="${result.useAt == 'Y'}"><spring:message code="button.use" /></c:if>
	                                                </td>
	                                                <td><c:out value="${result.frstRegisterPnttm}"/></td>
	                                            </tr>
                                            </c:forEach>
                                            
                                        </tbody>
                                    </table>
                                </div>

								<!-- 페이지 네비게이션 시작 -->
                                <div class="board_list_bot">
                                    <div class="paging" id="paging_div">
                                        <ul>
                                            <ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_select_tmplatInfo"  />
                                        </ul>
                                    </div>
                                </div>
                                <!-- //페이지 네비게이션 끝 --> 
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