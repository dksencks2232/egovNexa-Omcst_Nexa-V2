<%--
  Class Name : EgovNoticeRegist.jsp
  Description : 게시물  생성 화면
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2009.03.24   이삼섭              최초 생성
     2011.08.31   JJY       경량환경 버전 생성
 
    author   : 공통서비스 개발팀 이삼섭
    since    : 2009.03.24
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator"%>

<%-- <link href="<c:url value='${brdMstrVO.tmplatCours}' />" rel="stylesheet" type="text/css"> --%>
<link rel="stylesheet" href="<c:url value='/'/>summernote/summernote-lite.css"> 
<c:if test="${anonymous == 'true'}">
	<c:set var="prefix" value="/anonymous" />
</c:if>

<script type="text/javascript" src="<c:url value='/js/EgovMultiFile.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/EgovCalPopup.js'/>"></script>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<script type="text/javascript" src="<c:url value='/'/>summernote/summernote-lite.js"></script>
<script type="text/javascript" src="<c:url value='/'/>summernote/lang/summernote-ko-KR.js"></script>
<script type="text/javascript" src="<c:url value='/js/bbs/egovNoticeEdit.js' />" ></script>
<validator:javascript formName="board" staticJavascript="false" xhtml="true" cdata="false" />

<div class="container">
	<div class="sub_layout">
		<div class="sub_in">
			<div class="layout">
				<div class="content_wrap">
					<div id="contents" class="content">
						<input type="hidden" name="prefix" value="<c:out value='${prefix}'/>" />
						<c:choose>
							<c:when test="${bdMstr.bbsAttrbCode != 'BBSA02'}">
								<form:form modelAttribute="board" name="board" method="post" enctype="multipart/form-data">

									<input type="hidden" name="pageIndex" 			value="<c:out value='${searchVO.pageIndex}'/>" />
									<input type="hidden" name="bbsId" 				value="<c:out value='${bdMstr.bbsId}'/>" />
									<input type="hidden" name="bbsAttrbCode" 		value="<c:out value='${bdMstr.bbsAttrbCode}'/>" />
									<input type="hidden" name="bbsTyCode" 			value="<c:out value='${bdMstr.bbsTyCode}'/>" />
									<input type="hidden" name="replyPosblAt"	 	value="<c:out value='${bdMstr.replyPosblAt}'/>" />
									<input type="hidden" name="fileAtchPosblAt" 	value="<c:out value='${bdMstr.fileAtchPosblAt}'/>" />
									<input type="hidden" name="posblAtchFileNumber" value="<c:out value='${bdMstr.posblAtchFileNumber}'/>" />
									<input type="hidden" name="posblAtchFileSize" 	value="<c:out value='${bdMstr.posblAtchFileSize}'/>" />
									<input type="hidden" name="tmplatId" 			value="<c:out value='${bdMstr.tmplatId}'/>" />
									<input type="hidden" name="cal_url" 			value="<c:url value='/sym/cmm/EgovNormalCalPopup.do'/>" />
									<input type="hidden" name="authFlag" 			value="<c:out value='${bdMstr.authFlag}'/>" />

									<c:if test="${anonymous != 'true'}">
										<input type="hidden" name="ntcrNm" value="dummy">
										<!-- validator 처리를 위해 지정 -->
										<input type="hidden" name="password" value="dummy">
									</c:if>

									<c:if test="${bdMstr.bbsAttrbCode != 'BBSA01'}">
										<input name="ntceBgnde" type="hidden" value="10000101">
										<input name="ntceEndde" type="hidden" value="99991231">
									</c:if>

									<div class="board_view2">
										<table>
											<colgroup>
												<col style="width: 190px;">
												<col style="width: auto;">
											</colgroup>
											<tr>
												<td class="lb">
													<label for=""><spring:message code="cop.nttSj" /></label>
													<!-- 제목 --> 
													<span class="req">필수</span>
												</td>
												<td>
													<input id="nttSj" class="f_txt w_full" name="nttSj" type="text" value="" maxlength="60" Placeholder="제목을 입력해주세요"><br />
													<form:errors path="nttSj" />
												</td>											
											</tr>
											<c:if test="${bdMstr.bbsTyCode == 'BBST03'}">
												<tr>
													<td class="lb">
														<label for="">고정글</label>
													</td>												
													<td>
														<input id="fixedAt" name="fixedAt" type="checkbox"><br />
													</td>												
												</tr>
											</c:if>
											<tr>
												<td class="lb">
													<label for="qestnrPurps"><spring:message code="cop.nttCn" /></label>
													<!-- 글내용 -->
													<span class="req">필수</span>
												</td>
												<td>
													<textarea id="nttCn" name="nttCn" class="f_txtar w_full h_200" cols="30" rows="10" Placeholder="내용을 입력해주세요"></textarea> 
													<form:errors path="nttCn" />
												</td>
											</tr>

											<c:if test="${bdMstr.bbsAttrbCode == 'BBSA01'}">
												<tr>
													<td class="lb">
														<label for=""><spring:message code="cop.noticeTerm" /></label>
														<!-- 게시기간 --> 
														<span class="req">필수</span>
													</td>
													<td>
														<input name="ntceBgnde" type="hidden" value='<c:out value="${result.ntceBgnde}" />'> 
														<input type="text" name="searchBgnDe" id="searchBgnDe" class="f_date" maxlength="10" value="${searchVO.searchBgnDe}" title="시작일자입력" /> 
															~ 
														<input name="ntceEndde" type="hidden" value='<c:out value="${result.ntceEndde}" />'> 
														<input type="text" name="searchEndDe" id="searchEndDe" class="f_date" maxlength="10" value="${searchVO.searchEndDe}" title="종료일자입력">
														<br />
														<form:errors path="ntceBgndeView" /> <br /> <form:errors path="ntceEnddeView" />
													</td>
												</tr>
											</c:if>

											<!-- 파일첨부 시작 -->
											<c:if test="${bdMstr.fileAtchPosblAt == 'Y'}">
												<tr>
													<td class="lb"><label for="egovComFileUploader"><spring:message code="cop.atchFile" /></label></td>
													<td>
														<div class="board_attach2" id="file_upload_posbl">
															<input name="file_1" id="egovComFileUploader" type="file" />
															<div id="egovComFileList"></div>
														</div>
														<div class="board_attach2" id="file_upload_imposbl"></div> 
														<c:if test="${empty result.atchFileId}">
															<input type="hidden" id="fileListCnt" name="fileListCnt" value="0" />
														</c:if>
													</td>
												</tr>
											</c:if>
											<!-- /파일첨부 끝 -->
										</table>
									</div>

									<!-- 목록/저장버튼  -->
									<div class="board_view_bot">
										<div class="left_col btn3"></div>

										<div class="right_col btn1">
											<c:if test="${bdMstr.authFlag == 'Y'}">
												<!-- 저장 -->
												<a href="#LINK" class="btn btn_blue_46 w_100" onclick="javascript:fn_egov_regist_notice(); return false;">
													<spring:message code="button.save" />
												</a>
											</c:if>
											<!-- 목록 -->
											<a href="#LINK" class="btn btn_gray_46 w_100" onclick="javascript:fn_egov_select_noticeList('board'); return false;">
												<spring:message code="button.list" />
											</a>
										</div>
									</div>
									<!-- // 목록/저장버튼 끝  -->

								</form:form>
							</c:when>
							<c:otherwise>
								<form:form modelAttribute="gallery" name="gallery" method="post">

									<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>" />
									<input type="hidden" name="bbsId" value="<c:out value='${bdMstr.bbsId}'/>" />
									<input type="hidden" name="bbsAttrbCode" value="<c:out value='${bdMstr.bbsAttrbCode}'/>" />
									<input type="hidden" name="bbsTyCode" value="<c:out value='${bdMstr.bbsTyCode}'/>" />
									<input type="hidden" name="replyPosblAt" value="<c:out value='${bdMstr.replyPosblAt}'/>" />
									<input type="hidden" name="fileAtchPosblAt" value="<c:out value='${bdMstr.fileAtchPosblAt}'/>" />
									<input type="hidden" name="posblAtchFileNumber" value="<c:out value='${bdMstr.posblAtchFileNumber}'/>" />
									<input type="hidden" name="posblAtchFileSize" value="<c:out value='${bdMstr.posblAtchFileSize}'/>" />
									<input type="hidden" name="tmplatId" value="<c:out value='${bdMstr.tmplatId}'/>" />

									<input type="hidden" name="cal_url" value="<c:url value='/sym/cmm/EgovNormalCalPopup.do'/>" />
									<input type="hidden" name="authFlag" value="<c:out value='${bdMstr.authFlag}'/>" />
									<input type="hidden" name="thumbnailUrl" value="" />
									<input type="hidden" name="imgUrlList" value="" />

									<c:if test="${anonymous != 'true'}">
										<input type="hidden" name="ntcrNm" value="dummy">
										<input type="hidden" name="password" value="dummy">
									</c:if>

									<c:if test="${bdMstr.bbsAttrbCode != 'BBSA01'}">
										<input name="ntceBgnde" type="hidden" value="10000101">
										<input name="ntceEndde" type="hidden" value="99991231">
									</c:if>

									<h1 class="tit_1">알림정보</h1>

									<h2 class="tit_2">
										<c:out value='${bdMstr.bbsNm}' />
									</h2>

									<div class="board_view2">
										<table>
											<colgroup>
												<col style="width: 190px;">
												<col style="width: auto;">
											</colgroup>
											<tr>
												<td class="lb"><label for=""><spring:message code="cop.nttSj" /></label> <span class="req">필수</span></td>
												<td>
													<input id="nttSj" class="f_txt w_full" name="nttSj" type="text" value="" maxlength="60" Placeholder="제목을 입력해주세요"> <br />
													<form:errors path="nttSj" />
												</td>
											</tr>
										</table>

										<textarea id="summernote" name="nttCn"></textarea>
									</div>

									<!-- 목록/저장버튼  -->
									<div class="board_view_bot">
										<div class="left_col btn3"></div>

										<div class="right_col btn1">

											<a href="#LINK" class="btn btn_blue_46 w_100" onclick="javascript:fn_egov_regist_gallery(); return false;">
												<spring:message code="button.save" />
											</a> 
											<a href="#LINK" class="btn btn_gray_46 w_100" onclick="javascript:fn_egov_select_noticeList('gallery'); return false;">
												<spring:message code="button.list" />
											</a>
											<!-- 목록 -->
										</div>
									</div>
									<!-- // 목록/저장버튼 끝  -->

								</form:form>
							</c:otherwise>
						</c:choose>
						<input type="hidden" name="errorMsg" value="<spring:message code='common.regist.msg'/>" />
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>