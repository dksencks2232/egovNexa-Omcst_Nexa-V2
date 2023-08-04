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
<c:set var="contextPath" value="<%= request.getContextPath()%>"/>
<c:set var='boardCode' value='<%= egovframework.omcst.common.service.CodeCacheService.getCode("COM037") %>' />
<c:if test="${anonymous == 'true'}">
   <c:set var="prefix" value="/anonymous"/>
</c:if>

<style type="text/css">
	.vrow-fixed {background-color: rgb(236 239 244); /* 50% transparent */}
	.vrow-fixed > .vrow-top:before{content:"\f005"; font-family:FontAwesome; margin-right:10px;} 
</style>

<script type="text/javascript" src="<c:url value='/js/bbs/egovNoticeList.js' />" ></script>
<div class="wrap">
   <div class="container">
      <div class="sub_layout">
         <div class="sub_in">
            <div class="layout">
               <div class="content_wrap">
                  <div id="contents" class="content">
                     <!-- 검색조건 -->
                     <div class="condition">
                        <form class="display_fcc" name="frm" action ="<c:url value='/cop/bbs${prefix}/selectBoardList.do'/>" method="get">
                           <input type="hidden" name="bbsId" 			value="<c:out value='${boardVO.bbsId}'/>" />
                           <input type="hidden" name="nttId"  			value="0" />
                           <input type="hidden" name="bbsTyCode" 		value="<c:out value='${brdMstrVO.bbsTyCode}'/>" />
                           <input type="hidden" name="bbsAttrbCode" 	value="<c:out value='${brdMstrVO.bbsAttrbCode}'/>" />
                           <input type="hidden" name="authFlag" 		value="<c:out value='${brdMstrVO.authFlag}'/>" />
                           <input type="hidden" name="sort" id="sort"	value="<c:out value='${searchVO.sort}'/>" /> 
                           <input type="hidden" name="pageIndex" 		value="<c:out value='${searchVO.pageIndex}'/>"/>
                           <input type="hidden" name="preview" 			value="<c:out value='${preview}'/>"/> 
                           <input type="hidden" name="prefix" 			value="<c:out value='${prefix}'/>"/> 	
                           <div>
                              <label class="item f_select ml20" for="sel1">
                                 <select name="searchCnd" id="searchCnd" title="검색조건 선택">
                                   	<option value="">전체</option>
                                   	<c:forEach var="code" items="${boardCode}" varStatus="status">
                                   		<option value="<c:out value="${code.code}"/>"<c:if test="${searchVO.searchCnd == code.code}"> selected="selected"</c:if>>
                                   			<c:out value="${code.codeNm}"/>
                                   		</option>
                                   	</c:forEach>
                                 </select>
                              </label>
                              <span class="item f_search">
                                 <input class="f_input w_500" name="searchWrd" type="text" value='<c:out value="${searchVO.searchWrd}"/>' maxlength="35" onkeypress="press(event);" title="검색어 입력">
                                 <button class="btn btn_46" type="submit" onclick="fn_egov_select_noticeList('1'); return false;">
                                    <spring:message code='button.inquire' />
                                 </button>
                              </span>
                           </div>
                        </form>
                     </div>
                     <!--// 검색조건 -->
                     <c:if test="${brdMstrVO.bbsAttrbCode eq 'BBSA02' || brdMstrVO.bbsTyCode eq 'BBST01' || role eq 'ROLE_ADMIN'}">
                        <div class="mt20 mb20 al_r">
                           <!-- <a href="#" class="item btn btn_red_46 w_100">삭제</a>삭제 -->
                           <a href="<c:url value='/cop/bbs${prefix}/addBoardArticle.do'/>?bbsId=<c:out value="${boardVO.bbsId}"/>" class="item btn btn_blue_46 w_100">
                           <spring:message code="button.create" />
                           </a><!-- 등록 -->
                        </div>
                     </c:if>
                     <c:choose>
                        <c:when test="${brdMstrVO.bbsAttrbCode == 'BBSA02'}">
                           <!-- 갤러리 게시판 시작 -->
                           <div class="board_list">
                              <div class="gallery-list-body">
                                 <c:if test="${fn:length(resultList) == 0}">
                                    <div class="nodata">
                                       <c:choose>
                                          <c:when test="${anonymous == 'true'}">
                                             <span colspan="4" >
                                                <spring:message code="common.nodata.msg" />
                                             </span>
                                          </c:when>
                                          <c:otherwise>
                                             <span colspan="5" >
                                                <spring:message code="common.nodata.msg" />
                                             </span>
                                          </c:otherwise>
                                       </c:choose>
                                    </div>
                                 </c:if>
                                 <c:forEach var="result" items="${resultList}" varStatus="status">
                                    <div class="gallery-item-box col_wd_25">
                                       <div class="gallery-item-wrap">
                                          <div class="gallery-item-img">
                                             <form name="subForm" method="get" action="<c:url value='/cop/bbs${prefix}/selectBoardArticle.do'/>">
                                                <c:choose>
                                                   <c:when test="${result.isExpired=='Y' || result.useAt == 'N'}">
                                                      <c:out value="${result.nttSj}" />
                                                   </c:when>
                                                   <c:otherwise>
                                                      <input type="hidden" name="bbsId" value="<c:out value='${result.bbsId}'/>" />
                                                      <input type="hidden" name="nttId"  value="
                                                      <c:out value="${result.nttId}"/>
                                                      " />
                                                      <input type="hidden" name="bbsTyCode" value="<c:out value='${brdMstrVO.bbsTyCode}'/>" />
                                                      <input type="hidden" name="bbsAttrbCode" value="<c:out value='${brdMstrVO.bbsAttrbCode}'/>" />
                                                      <input type="hidden" name="authFlag" value="<c:out value='${brdMstrVO.authFlag}'/>" />
                                                      <input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
                                                      <a href="javascript:;" class="lnk" onclick="this.parentNode.submit();">
                                                      <img width="100%" src="<c:out value='${result.thumbnailUrl}'/>" onerror="this.src='${contextPath}/images/no-image.png'" alt="<c:out value='${result.thumbnailUrl}'/>" /> 
                                                      </a>
                                                   </c:otherwise>
                                                </c:choose>
                                             </form>
                                          </div>
                                          <div class="gallery-title">
                                             <form class="text-over-hidden" name="subForm" method="get" action="<c:url value='/cop/bbs${prefix}/selectBoardArticle.do'/>">
                                                <input type="hidden" name="bbsId" value="<c:out value='${result.bbsId}'/>" />
                                                <input type="hidden" name="nttId"  value="<c:out value="${result.nttId}"/>" />
                                                <input type="hidden" name="bbsTyCode" value="<c:out value='${brdMstrVO.bbsTyCode}'/>" />
                                                <input type="hidden" name="bbsAttrbCode" value="<c:out value='${brdMstrVO.bbsAttrbCode}'/>" />
                                                <input type="hidden" name="authFlag" value="<c:out value='${brdMstrVO.authFlag}'/>" />
                                                <input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>	                        
                                                <a href="javascript:;" class="lnk" onclick="this.parentNode.submit();">
                                                   <c:out value="${result.nttSj}"/>
                                                </a>
                                             </form>
                                          </div>
                                          <div class="gallery-item-bottom">
                                             <div class="left-box">
                                                <div class="gallery-date">
                                                   <i class="fa fa-calendar" aria-hidden="true"></i>
                                                   <span>
                                                      <c:out value="${result.frstRegisterPnttm}"/>
                                                   </span>
                                                </div>
                                             </div>
                                             <div class="right-box">
                                                <span class="mb-hit mr10">
                                                   <i class="fa fa-user" aria-hidden="true"></i>
                                                   <span>
                                                      <c:if test="${anonymous != 'true'}">
                                                         <c:out value="${result.frstRegisterNm}"/>
                                                      </c:if>
                                                   </span>
                                                </span>
                                                <span class="mb-hit">
                                                   <i class="fa fa-eye" aria-hidden="true"></i>
                                                   <span>
                                                      <c:out value="${result.inqireCo}"/>
                                                   </span>
                                                </span>
                                             </div>
                                             <div class="clear"></div>
                                          </div>
                                       </div>
                                    </div>
                                 </c:forEach>
                              </div>
                           </div>
                           <!-- 갤러리 게시판 끝 -->
                        </c:when>
                        <c:otherwise>
							<form name="subForm">
							<div class="board_list">
							  <div class="board-article-list">
								 <div class="article-list">
								 	<input type="hidden" name="nttId"/>
								 	<input type="hidden" name="authFlag"/>
									<input type="hidden" name="bbsId" value="<c:out value='${brdMstrVO.bbsId}'/>" />
									<input type="hidden" name="bbsTyCode" value="<c:out value='${brdMstrVO.bbsTyCode}'/>" />
									<input type="hidden" name="bbsAttrbCode" value="<c:out value='${brdMstrVO.bbsAttrbCode}'/>" />
									<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>                                 
									<div class="list-table table">
									   <div class="vrow column head d-none d-md-flex">
										  <div class="vrow-inner">
											 <div class="vrow-top">
												<!-- <span class="vcol col-id">번호</span> -->
												<span class="vcol col-title">제목</span>
											 </div>
											 <div class="vrow-bottom">
												<span class="vcol col-author">작성자</span>
												<c:choose>
												   <c:when test="${searchVO.sort eq 'DESC' ||  empty searchVO.sort }">
													  <a href="#" class="lnk" onclick="fn_sort('ASC')"><span class="vcol col-time gg">작성일 ▼</span></a>
												   </c:when>
												   <c:otherwise>
													  <a href="#" class="lnk" onclick="fn_sort('DESC')"><span class="vcol col-time gg">작성일 ▲</span></a>
												   </c:otherwise>
												</c:choose>
												<span class="vcol col-view">조회수</span>
											 </div>
										  </div>
									   </div>
									   
									   <!-- 게시글 또는 검색 없을때  -->
									   <c:if test="${fn:length(fixedList) > 0}">
										   <c:forEach var="result" items="${fixedList}" varStatus="status">
											  <div class="vrow column">
												 <div class="vrow-inner vrow-fixed">
													<div class="vrow-top">
													   <span class="vcol col-title">
														  <span class="badges"></span>
														  <span class="title">
															 <span class="media-icon ion-ios-photos-outline"></span>
																<a data-nttid="${result.nttId}" data-auth="${brdMstrVO.authFlag}" href="javascript:;" class="lnk" onclick="fn_selectDetail(this);">
																   <c:out value="${result.nttSj}"/>
																</a>
														  </span>	
														  <span class="info"></span>
													   </span>
													</div>
													<div class="vrow-bottom">
													   <span class="vcol col-author">
														  <span class="user-info">
															 <c:if test="${anonymous != 'true'}">
																<span><c:out value="${result.frstRegisterNm}"/></span>
															 </c:if>
														  </span>
													   </span>
													   <span class="vcol col-time">
														  <time><c:out value="${result.frstRegisterPnttm}"/></time>
													   </span>
													   <span class="vcol col-view">
														  <c:out value="${result.inqireCo}"/>
													   </span>
													</div>
												 </div>
											  </div>
										   </c:forEach>
									   </c:if>
									   									   
									   <c:if test="${fn:length(resultList) == 0}">
										  <div class="nodata">
											 <c:choose>
												<c:when test="${brdMstrVO.bbsAttrbCode == 'BBSA01'}">
												   <span colspan="7">
													  <spring:message code="common.nodata.msg" />
												   </span>
												</c:when>
												<c:otherwise>
												   <c:choose>
													  <c:when test="${anonymous == 'true'}">
														 <span colspan="4" >
															<spring:message code="common.nodata.msg" />
														 </span>
													  </c:when>
													  <c:otherwise>
														 <span colspan="5" >
															<spring:message code="common.nodata.msg" />
														 </span>
													  </c:otherwise>
												   </c:choose>
												</c:otherwise>
											 </c:choose>
										  </div>
									   </c:if>
							
									   <c:forEach var="result" items="${resultList}" varStatus="status">
										  <div class="vrow column">
											 <div class="vrow-inner">
												<div class="vrow-top">
												   <span class="vcol col-title">
													  <span class="badges">
													  </span>
													  <span class="title">
														 <span class="media-icon ion-ios-photos-outline"></span>
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
																  <a data-nttid="${result.nttId}" data-auth="${brdMstrVO.authFlag}" href="javascript:;" class="lnk" onclick="fn_selectDetail(this);">
																	 <c:out value="${result.nttSj}"/>
																  </a>
																  <c:if test="${result.newContent=='Y'}"><span class="new_red">NEW</span></c:if>
															   </c:otherwise>
															</c:choose>
													  </span>
													  <span class="info"></span>
												   </span>
												</div>
												<div class="vrow-bottom">
												   <span class="vcol col-author">
													  <span class="user-info">
														 <c:if test="${anonymous != 'true'}">
															<span><c:out value="${result.frstRegisterNm}"/></span>
														 </c:if>
													  </span>
												   </span>
												   <span class="vcol col-time">
													  <time><c:out value="${result.frstRegisterPnttm}"/></time>
												   </span>
												   <span class="vcol col-view">
													  <c:out value="${result.inqireCo}"/>
												   </span>
												</div>
											 </div>
										  </div>
									   </c:forEach>
									</div>
								 </div>
							  </div>
							</div>
							</form>                        
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