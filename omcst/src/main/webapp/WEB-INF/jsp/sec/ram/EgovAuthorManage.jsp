<%--
  Class Name : EgovAuthorManage.jsp
  Description : EgovAuthorManage List 화면
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2009.03.01    lee.m.j              최초 생성
     2011.08.31   JJY       경량환경 버전 생성
 
    author   : 공통서비스 개발팀 lee.m.j
    since    : 2009.03.01
--%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script type="text/javascript" src="<c:url value='/js/sec/ram/egovAuthorManage.js' />" ></script>
    <div class="wrap">
        <div class="container">
            <div class="sub_layout">
                <div class="sub_in">
                    <div class="layout">
                        <div class="content_wrap">
                            <div id="contents" class="content">

								<form:form id="listForm" name="listForm" action="<c:url value='/sec/ram/EgovAuthorList.do'/>" method="get">
								
                                <!-- 검색조건 -->
                                <div class="condition2">
                                    <!-- <span class="lb mr10">권한 명 : </span> -->
                                    <span class="item f_search">
                                        <input id="searchKeyword" class="f_input w_500" placeholder="검색어를 입력하세요" name="searchKeyword" type="text" value="<c:out value='${authorManageVO.searchKeyword}'/>" title="검색" onkeypress="press();" />
                                        <button class="btn" type="submit" onclick="javascript:fncSelectAuthorList('1')" style="selector-dummy:expression(this.hideFocus=false);"><spring:message code='button.inquire' /></button><!-- 조회 -->
                                    </span>
                                </div>
                                <!--// 검색조건 -->

                                <div class="board_list_top">
                                    <div class="left_col">
                                    </div>

                                    <div class="right_col">
                                        <a href="#LINK" class="btn btn_red_46 w_100" onclick="javascript:fncAuthorDeleteList()" style="selector-dummy:expression(this.hideFocus=false);"><spring:message code='button.delete' /></a><!-- 삭제 -->
                                        <a href="#LINK" class="btn btn_blue_46 w_100" onclick="javascript:fncAddAuthorInsert()" style="selector-dummy:expression(this.hideFocus=false);"><spring:message code='button.create' /></a><!-- 등록 -->
                                    </div>
                                </div>

                                <!-- 게시판 -->
                                <div class="board_list">
                                    <table summary="권한관리에  관한 테이블입니다.권한ID,권한 명,설명, 등록일자, 롤 정보의 내용을 담고 있습니다.">
                                    	<caption>사용자목록관리</caption>
                                        <colgroup>
                                            <col style="width: 80px;">
                                            <col style="width: auto;">
                                            <col style="width: auto;">
                                            <col style="width: auto;">
                                            <col style="width: auto;">
                                            <col style="width: 80px;">
                                        </colgroup>
                                        <thead>
                                            <tr>
                                                <th scope="col">
                                                    <span class="f_chk_only chkAll">
                                                        <input type="checkbox" name="checkAll" title="선택여부" onclick="javascript:fncCheckAll()">
                                                    </span>
                                                </th>
                                                <th scope="col">권한코드</th>
                                                <th scope="col">권한명</th>
                                                <th scope="col">설명</th>
                                                <th scope="col">등록일자</th>
                                                <th scope="col">롤정보</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        
                                        	<c:if test="${empty authorList}">
                                        		<tr>
                                        			<td colspan="6"><spring:message code="common.nodata.msg" /></td>
                                        		</tr>
                                        	</c:if>
                                        	
                                        	<c:forEach var="author" items="${authorList}" varStatus="status">
                                            <tr>
                                                <td>
                                                    <span class="f_chk_only">
                                                        <input type="checkbox" name="delYn" title="선택">
                                                        <input type="hidden" name="checkId" value="<c:out value="${author.authorCode}"/>" />
                                                    </span>
                                                </td>
                                                <td>
                                                    <a href="#LINK" class="lnk" onclick="javascript:fncSelectAuthor('<c:out value="${author.authorCode}"/>')">
                                                    	<c:out value="${author.authorCode}"/>
                                                    </a>
                                                </td>
                                                <td><c:out value="${author.authorNm}"/></td>
                                                <td><c:out value="${author.authorDc}"/></td>
                                                <td><c:out value="${author.authorCreatDe}"/></td>
                                                <td>
                                                    <a href="#LINK" class="btn btn_blue_30 w_70" onclick="javascript:fncSelectAuthorRole('<c:out value="${author.authorCode}"/>')">
                                                    	이동
                                                    </a>
                                                </td>
                                            </tr>
                                            </c:forEach>
                                            
                                        </tbody>
                                    </table>
                                </div>

								<!-- 페이지 네비게이션 시작 -->
								<c:if test="${!empty authorManageVO.pageIndex }">
                                <div class="board_list_bot">
                                    <div class="paging" id="paging_div">
                                        <ul>
                                            <ui:pagination paginationInfo = "${paginationInfo}"  type="image" jsFunction="linkPage" />
                                        </ul>
                                    </div>
                                </div>
                                </c:if>
                                <!-- //페이지 네비게이션 끝 -->
                                <!--// 게시판 -->
          						<input type="hidden" name="error" value="${error}"></input>
                                <input type="hidden" name="authorCode"/>
                                <input type="hidden" name="authorCodes"/>
                                <input type="hidden" name="pageIndex" value="<c:out value='${authorManageVO.pageIndex}'/>"/>
                                <input type="hidden" name="searchCondition"/>
                                
                                </form:form>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


    </div>