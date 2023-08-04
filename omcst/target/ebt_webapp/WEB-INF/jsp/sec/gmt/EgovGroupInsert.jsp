<%--
  Class Name : EgovAuthorInsert.jsp
  Description : EgovAuthorInsert 화면
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2009.02.01    lee.m.j              최초 생성
     2011.08.31   JJY       경량환경 버전 생성
 
    author   : 공통서비스 개발팀 lee.m.j
    since    : 2009.02.01
--%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>

<c:set var="registerFlag" value="${empty groupManageVO.groupId ? 'INSERT' : 'UPDATE'}"/>
<c:set var="registerFlagName" value="${empty groupManageVO.groupId ? '그룹 등록' : '그룹 수정'}"/>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="groupManage" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javascript" src="<c:url value='/js/sec/gmt/egovGroupEdit.js' />" ></script>

<div class="wrap">
    <div class="container">
        <div class="sub_layout">
            <div class="sub_in">
                <div class="layout">        
                    <div class="content_wrap">
                        <div id="contents" class="content">
                          

							<form:form modelAttribute="groupManage" method="post" >

                            
                            <div class="board_view2">
                                <table summary="그룹을 수정하는 테이블입니다.그룹 ID,그룹 명,설명,등록일자 정보를 담고 있습니다.">
                                    <colgroup>
                                        <col style="width: 190px;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tr>
                                        <td class="lb">
                                            <label for="groupId">그룹ID</label>
                                        </td>
                                        <td>
                                            <input name="groupId" id="groupId" class="f_txt" type="text" value="<c:out value='${groupManage.groupId}'/>" title="그룹 ID" placeholder="그룹 ID"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="lb">
                                            <label for="groupNm">그룹명</label>
                                            <span class="req">필수</span>
                                        </td>
                                        <td>
                                            <input name="groupNm" id="groupNm" class="f_txt" type="text" value="<c:out value='${groupManage.groupNm}'/>" title="그룹명" maxLength="50" placeholder="그룹명" />
                                            &nbsp;<form:errors path="groupNm" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="lb">
                                            <label for="groupDc">설명</label>
                                        </td>
                                        <td>
                                            <input name="groupDc" id="groupDc" class="f_txt w_full" type="text" value="<c:out value='${groupManage.groupDc}'/>" title="설명" maxLength="50" placeholder="설명"/>
                                        </td>
                                    </tr>
                                </table>
                            </div>

				<!-- 목록/저장버튼  -->
                            <div class="board_view_bot">
                                <div class="left_col btn3">
                                	<c:if test="${registerFlag == 'UPDATE'}">
                                		<a href="#LINK" class="btn btn_red_46 w_100" onclick="javascript:fncGroupDelete()"><spring:message code='button.delete' /></a><!-- 삭제 -->
                                	</c:if>
                                </div>

                                <div class="right_col btn1">
                                	<c:if test="${registerFlag == 'INSERT'}">
                                    	<a href="#LINK" class="btn btn_blue_46 w_100" onclick="javascript:fncGroupInsert()"><spring:message code='button.save' /></a><!-- 저장 -->
                                    </c:if>
                                    <c:if test="${registerFlag == 'UPDATE'}">
                                		<a href="#LINK" class="btn btn_red_46 w_100" onclick="javascript:fncGroupUpdate()"><spring:message code='button.save' /></a><!-- 삭제 -->
                                	</c:if>
                                    <a href="#LINK" class="btn btn_gray_46 w_100" onclick="javascript:fncSelectGroupList()"><spring:message code='button.list' /></a><!-- 목록 -->
                                </div>
                            </div>
                            <!-- // 목록/저장버튼 끝  -->
                            
                            <!-- 검색조건 유지 -->
				<c:if test="${registerFlag == 'UPDATE'}">
					<input type="hidden" name="searchCondition" value="<c:out value='${groupManageVO.searchCondition}'/>"/>
					<input type="hidden" name="searchKeyword" value="<c:out value='${groupManageVO.searchKeyword}'/>"/>
					<input type="hidden" name="pageIndex" value="<c:out value='${groupManageVO.pageIndex}'/>"/>
				</c:if>
				
				</form:form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>