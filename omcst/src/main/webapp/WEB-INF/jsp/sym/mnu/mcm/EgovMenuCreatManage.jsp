<%--
  Class Name : EgovMenuCreatManage.jsp
  Description : 메뉴생성관리 조회 화면
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2009.03.10    이용             최초 생성
     2011.08.31   JJY       경량환경 버전 생성
 
    author   : 공통서비스 개발팀 이용
    since    : 2009.03.10
--%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
  /* Image Path 설정 */
  String imagePath_icon   = "/images_old/egovframework/sym/mpm/icon/";
  String imagePath_button = "/images_old/egovframework/sym/mpm/button/";
%>
<script type="text/javascript" src="<c:url value='/js/sym/egovMenuCreatManage.js' />" ></script>

    <div class="wrap">
        <div class="container">
            <div class="sub_layout">
                <div class="sub_in">
                    <div class="layout">
                        <div class="content_wrap">
                            <div id="contents" class="content">
                                 

								<form name="menuCreatManageForm" action ="<c:url value='/sym/mpm/EgovMenuCreatManageSelect.do'/>" method="get">
								
								<input type="hidden" name="resultMsg" value="${resultMsg}"/>
								<input type="hidden" name="checkedMenuNoForDel"  />
								<input type="hidden" name="authorCode"  />
								<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>
                                
                                <!-- 검색조건 -->
                                <div class="condition2">
                                    <span class="item f_search">
                                        <input id="searchKeyword" class="f_input w_350" name="searchKeyword" type="text" value="" maxlength="60" title="검색조건"/>
                                        <button class="btn" type="submit" onclick="javascript:selectMenuCreatManageList(); return false;"><spring:message code='button.inquire' /></button>
                                    </span>
                                    <%-- <span>
                                    	<button class="btn btn_gray_46 w_100" type="submit" onclick="javascript:selectMenuCreatManageList(); return false;"><spring:message code='button.inquire' /></button><!-- 조회 -->
                                    </span> --%>
                                </div>
                                <!--// 검색조건 -->

                                <!-- 게시판 -->
                                <div class="board_list">
                                    <table summary="메뉴생성관리  목록화면으로 권한코드, 권한명, 권한설명, 메뉴생성여부, 메뉴생성으로 구성됨">
                                    	<caption>메뉴생성관리 목록</caption>
                                        <colgroup>
                                            <col style="width: auto;">
                                            <col style="width: auto;">
                                            <col style="width: auto;">
                                            <col style="width: auto;">
                                            <col style="width: auto;">
                                        </colgroup>
                                        <thead>
                                            <tr>
                                                <th scope="col">권한코드</th>
                                                <th scope="col">권한명</th>
                                                <th scope="col">권한설명</th>
                                                <th scope="col">메뉴관리</th>
                                                <th scope="col">메뉴삭제</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	
                                        	<c:if test="${empty list_menumanage}">
                                        		<tr>
                                        			<td colspan="5"><spring:message code="common.nodata.msg" /></td>
                                        		</tr>
                                        	</c:if>
                                        	
                                        	<c:forEach var="result" items="${list_menumanage}" varStatus="status">
                                            <tr>
                                                <td><c:out value="${result.authorCode}"/></td>
                                                <td><c:out value="${result.authorNm}"/></td>
                                                <td><c:out value="${result.authorDc}"/></td>
                                                <td>
                                                	<a href="#LINK'" class="lnk" onclick="selectMenuCreat('<c:out value="${result.authorCode}"/>'); return false;" >
														<c:choose>
														<c:when test="${result.chkYeoBu == 0}"> 메뉴생성 </c:when>
														<c:otherwise> 메뉴수정 </c:otherwise>
														</c:choose>                                                	
                                                	</a>
                                                </td>
												<td>
													<c:if test="${result.chkYeoBu > 0}">
														<a href="#LINK'" class="lnk" onclick="deleteMenu('<c:out value="${result.authorCode}"/>'); return false;" > 메뉴삭제 </a>
													</c:if>
                                                </td>                                                
                                            </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>

								<!-- 페이지 네비게이션 시작 -->
                                <div class="board_list_bot">
                                    <div class="paging" id="paging_div">
                                        <ul>
                                            <ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="linkPage"/>
                                        </ul>
                                    </div>
                                </div>
                                <!-- //페이지 네비게이션 끝 -->
                                <!--// 게시판 -->
                                
                                <input type="hidden" name="req_menuNo">
                                
                                </form>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


    </div>