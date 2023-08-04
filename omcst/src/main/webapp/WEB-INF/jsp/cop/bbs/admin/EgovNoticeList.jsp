<%--
  Class Name : EgovNoticeList.jsp
  Description : 게시물 목록화면
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2009.03.19   이삼섭              최초 생성
     2011.08.31   JJY       경량환경 버전 생성
 
    author   : 공통서비스 개발팀 이삼섭
    since    : 2009.03.19
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="egovframework.com.cmm.service.EgovProperties" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="ImgUrl" value="/images_old/egovframework/cop/bbs/"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<c:if test="${anonymous == 'true'}"><c:set var="prefix" value="/anonymous"/></c:if>
<script type="text/javascript" src="<c:url value='/js/EgovBBSMng.js' />" ></script>
<c:choose>
<c:when test="${preview == 'true'}">
<script type="text/javascript">
<!--
    function press(event) {
    }

    function fn_egov_addNotice() {
    }
    
    function fn_egov_select_noticeList(pageNo) {
    }
    
    function fn_egov_inqire_notice(nttId, bbsId) {      
    }
//-->
</script>
</c:when>
<c:otherwise>
<script type="text/javascript">
<!--
    function press(event) {
        if (event.keyCode==13) {
            fn_egov_select_noticeList('1');
        }
    }

    function fn_egov_addNotice() {
        document.frm.action = "<c:url value='/cop/bbs${prefix}/admin/addBoardArticle.do'/>";
        document.frm.submit();
    }
    
    function fn_egov_select_noticeList(pageNo) {
        document.frm.pageIndex.value = pageNo;
        document.frm.action = "<c:url value='/cop/bbs${prefix}/admin/selectBoardList.do'/>";
        document.frm.submit();  
    }
    
    function fn_egov_inqire_notice(nttId, bbsId) {
        document.subForm.nttId.value = nttId;
        document.subForm.bbsId.value = bbsId;
        document.subForm.action = "<c:url value='/cop/bbs${prefix}/admin/selectBoardArticle.do'/>";
        document.subForm.submit();
    }
//-->
</script>
</c:otherwise>
</c:choose>
<title>내부업무 사이트 > 내부서비스관리 > 내부업무게시판관리 > <c:out value="${brdMstrVO.bbsNm}"/>관리</title>

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
                                
                                	<form name="frm" action ="<c:url value='/cop/bbs${prefix}/admin/selectBoardList.do'/>" method="post">
                                	
	                                	<input type="hidden" name="bbsId" value="<c:out value='${boardVO.bbsId}'/>" />
										<input type="hidden" name="nttId"  value="0" />
										<input type="hidden" name="bbsTyCode" value="<c:out value='${brdMstrVO.bbsTyCode}'/>" />
										<input type="hidden" name="bbsAttrbCode" value="<c:out value='${brdMstrVO.bbsAttrbCode}'/>" />
										<input type="hidden" name="authFlag" value="<c:out value='${brdMstrVO.authFlag}'/>" />
										<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
	                                	
	                                    <label class="item f_select" for="sel1">
	                                        <select name="searchCnd" id="searchCnd" title="검색조건 선택">
	                                            <option value="0" <c:if test="${searchVO.searchCnd == '0'}">selected="selected"</c:if> >제목</option>
	                                            <option value="1" <c:if test="${searchVO.searchCnd == '1'}">selected="selected"</c:if> >내용</option>
	                                            <option value="2" <c:if test="${searchVO.searchCnd == '2'}">selected="selected"</c:if> >작성자</option>
	                                        </select>
	                                    </label>
	                                    <span class="item f_search">
	                                        <input class="f_input w_500" name="searchWrd" type="text" value='<c:out value="${searchVO.searchWrd}"/>' maxlength="35" onkeypress="press(event);" title="검색어 입력">
	                                    </span>
	                                    <span class="ml10">
	                                    	<button class="btn btn btn_gray_46 w_100" type="submit" onclick="fn_egov_select_noticeList('1'); return false;"><spring:message code='button.inquire' /></button><!-- 조회 -->
	                                    </span>
                                    </form>
                                </div>
                                <!--// 검색조건 -->
                                
                                <div class="mt20 mb20 al_r">
                                	<a href="<c:url value='/cop/bbs${prefix}/admin/addBoardArticle.do'/>?bbsId=<c:out value="${boardVO.bbsId}"/>" class="item btn btn_blue_46 w_100"><spring:message code="button.create" /></a><!-- 등록 -->
                                </div>
                      	<c:choose>
	                       	<c:when test="${brdMstrVO.bbsAttrbCode == 'BBSA02'}">
	                       		<!-- 갤러리 게시판 시작 -->
                                <div class="board_list">
                                	<div class="gallery-list-body">
                                	<c:if test="${fn:length(resultList) == 0}">
	                                <div class="nodata">
		                              	<c:choose>
		                                	<c:when test="${anonymous == 'true'}">
		                               			<span colspan="4" ><spring:message code="common.nodata.msg" /></span>
		                              		</c:when>
		                              		<c:otherwise>
		                              			<span colspan="5" ><spring:message code="common.nodata.msg" /></span>
		                              		</c:otherwise>
		                              	</c:choose>
	                             	</div>
	                              	</c:if>
	                                  <c:forEach var="result" items="${resultList}" varStatus="status">
                                		<div class="gallery-item-box col_wd_25">
	                                		<div class="gallery-item-wrap">
		                                		<div class="gallery-item-img">
		                                		<form name="subForm" method="post" action="<c:url value='/cop/bbs${prefix}/admin/selectBoardArticle.do'/>">
			                                		<c:choose>
														<c:when test="${result.isExpired=='Y' || result.useAt == 'N'}">
															<c:out value="${result.nttSj}" />
													</c:when>
													<c:otherwise>
										                <input type="hidden" name="bbsId" value="<c:out value='${result.bbsId}'/>" />
														<input type="hidden" name="nttId"  value="<c:out value="${result.nttId}"/>" />
														<input type="hidden" name="bbsTyCode" value="<c:out value='${brdMstrVO.bbsTyCode}'/>" />
														<input type="hidden" name="bbsAttrbCode" value="<c:out value='${brdMstrVO.bbsAttrbCode}'/>" />
														<input type="hidden" name="authFlag" value="<c:out value='${brdMstrVO.authFlag}'/>" />
														<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
				                                		<a href="javascript:;" class="lnk" onclick="this.parentNode.submit();">
					                                		<c:import url="/cmm/fms/selectImageFileInfs.do" charEncoding="utf-8">
			                                                	<c:param name="atchFileId" value="${result.atchFileId}" />
			                                                	<c:param name="limitYn" value="Y" />
			                                                </c:import>
				                                		</a>
				                                	</c:otherwise>
										            </c:choose>
										        </form>
		                                		</div>
		                                		<div class="gallery-title">
		                                		<form name="subForm" method="post" action="<c:url value='/cop/bbs${prefix}/admin/selectBoardArticle.do'/>">
		                                			<input type="hidden" name="bbsId" value="<c:out value='${result.bbsId}'/>" />
													<input type="hidden" name="nttId"  value="<c:out value="${result.nttId}"/>" />
													<input type="hidden" name="bbsTyCode" value="<c:out value='${brdMstrVO.bbsTyCode}'/>" />
													<input type="hidden" name="bbsAttrbCode" value="<c:out value='${brdMstrVO.bbsAttrbCode}'/>" />
													<input type="hidden" name="authFlag" value="<c:out value='${brdMstrVO.authFlag}'/>" />
													<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>	                        
													<a href="javascript:;" class="lnk" onclick="this.parentNode.submit();"><c:out value="${result.nttSj}"/></a>
												</form>
		                                		</div>
		                                	
		                                		<div class="gallery-item-bottom">
			                                		<div class="left-box">
				                                		<div class="gallery-date">
				                                			<span><c:out value="${result.frstRegisterPnttm}"/></span>
				                                		</div>
			                                		</div>
			                                		<div class="right-box">
			                                			<span class="mb-hit">
					                                		<span>작성자:
					                                			<c:if test="${anonymous != 'true'}">
						                                        	<c:out value="${result.frstRegisterNm}"/>
						                                    	</c:if>
					                                		</span>
				                                		</span>
				                                		<span class="mb-hit">
					                                		<span>조회수: <c:out value="${result.inqireCo}"/> </span>
				                                		</span>
			                                		</div>
			                                		<div class="clear"></div>
		                                		</div>
	                                		</div>
                                		</div>
                                	</c:forEach>
                                </div>
                             </div>
	                       	</c:when>
	                       	<c:otherwise>
                                <!-- 게시판 -->
                                <div class="board_list">
                                    <table summary="번호, 제목, 게시시작일, 게시종료일, 작성자, 작성일, 조회수  입니다">
                                    	<caption>게시물 목록</caption>
                                        <colgroup>
                                            <col style="width: 80px;">
                                            <col style="width: auto;">
                                            <c:if test="${brdMstrVO.bbsAttrbCode == 'BBSA01'}">
                                            	<col style="width: 80;">
                                            	<col style="width: 80;">
                                            </c:if>
                                            <c:if test="${anonymous != 'true'}">
                                            	<col style="width: 100px;">
                                            </c:if>
                                            <col style="width: 120px;">
                                            <col style="width: 100px;">
                                        </colgroup>
                                        <thead>
                                            <tr>
                                                <th scope="col">번호</th>
                                                <th scope="col">제목</th>
                                                <c:if test="${brdMstrVO.bbsAttrbCode == 'BBSA01'}">
                                                	<th scope="col">게시시작일</th>
                                                	<th scope="col">게시종료일</th>
                                                </c:if>
                                                <c:if test="${anonymous != 'true'}">
                                                	<th scope="col">작성자</th>
                                                </c:if>
                                                <th scope="col">작성일</th>
                                                <th scope="col">조회수</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        
                                        	<c:if test="${fn:length(resultList) == 0}">
                                        		<tr>
                                        			<c:choose>
                                        				<c:when test="${brdMstrVO.bbsAttrbCode == 'BBSA01'}">
                                        					<td colspan="7"><spring:message code="common.nodata.msg" /></td>
                                        				</c:when>
	                                        			<c:otherwise>
	                                        				<c:choose>
	                                        					<c:when test="${anonymous == 'true'}">
	                                        						<td colspan="4" ><spring:message code="common.nodata.msg" /></td>
	                                        					</c:when>
	                                        					<c:otherwise>
	                                        						<td colspan="5" ><spring:message code="common.nodata.msg" /></td>
	                                        					</c:otherwise>
	                                        				</c:choose>
	                                        			</c:otherwise>
                                        			</c:choose>
                                        		</tr>
                                        	</c:if>
                                        	
                                        	<c:forEach var="result" items="${resultList}" varStatus="status">
                                            <tr>
                                                <td><c:out value="${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageSize + status.count)}"/></td>
                                                <td class="al">
                                                	<form name="subForm" method="post" action="<c:url value='/cop/bbs${prefix}/admin/selectBoardArticle.do'/>">
                                               		<c:if test="${result.replyLc!=0}">
                                               			<c:forEach begin="0" end="${result.replyLc}" step="1">
                                               				&nbsp;
                                               			</c:forEach>
                                               			<img src="<c:url value='/'/>images/ico_reply.png" alt="reply arrow">
                                               		</c:if>
                                               		<c:choose>
										                <c:when test="${result.isExpired=='Y' || result.useAt == 'N'}">
										                    <c:out value="${result.nttSj}" />
										                </c:when>
										                <c:otherwise>
		                                                	<input type="hidden" name="bbsId" value="<c:out value='${result.bbsId}'/>" />
									                        <input type="hidden" name="nttId"  value="<c:out value="${result.nttId}"/>" />
									                        <input type="hidden" name="bbsTyCode" value="<c:out value='${brdMstrVO.bbsTyCode}'/>" />
									                        <input type="hidden" name="bbsAttrbCode" value="<c:out value='${brdMstrVO.bbsAttrbCode}'/>" />
									                        <input type="hidden" name="authFlag" value="<c:out value='${brdMstrVO.authFlag}'/>" />
									                        <input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
									                        
									                        <a href="javascript:;" class="lnk" onclick="parentNode.submit();"><c:out value="${result.nttSj}"/></a>
                                                		</c:otherwise>
			            							</c:choose>
                                                	</form>
                                                </td>
                                                <c:if test="${brdMstrVO.bbsAttrbCode == 'BBSA01'}">
                                                	<td><c:out value="${result.ntceBgnde}"/></td>
                                                	<td><c:out value="${result.ntceEndde}"/></td>
                                                </c:if>
                                                <c:if test="${anonymous != 'true'}">
                                                	<td><c:out value="${result.frstRegisterNm}"/></td>
                                                </c:if>
                                                <td><c:out value="${result.frstRegisterPnttm}"/></td>
                                                <td><c:out value="${result.inqireCo}"/></td>
                                            </tr>
                                            </c:forEach>
                                            
                                        </tbody>
                                    </table>
                                </div>
								</c:otherwise>
							</c:choose>
								<!-- 페이지 네비게이션 시작 -->
                                <div class="board_list_bot">
                                    <div class="paging" id="paging_div">
                                        <ul>
                                            <ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_select_noticeList" />
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