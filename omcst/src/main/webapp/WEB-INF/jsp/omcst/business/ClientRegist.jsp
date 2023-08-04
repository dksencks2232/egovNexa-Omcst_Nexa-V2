<%--
  Class Name : EgovMenuRegist.jsp
  Description : 메뉴정보 등록 화면
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2009.03.10    이용             최초 생성
     2011.08.31   JJY       경량환경 버전 생성
 
    author   : 공통서비스 개발팀 이용
    since    : 2009.03.10
--%>
<%@ page contentType="text/html; charset=utf-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<script type="text/javascript" src="<c:url value="/validator.do" />"></script>
<%-- <validator:javascript formName="menuManageVO" staticJavascript="false" xhtml="true" cdata="false"/> --%>
<script type="text/javascript" src="<c:url value='/js/business/clientRegist.js'/>" ></script>
    <div class="wrap">
        <div class="container">
            <div class="sub_layout">
                <div class="sub_in">
                    <div class="layout">
                        <div class="content_wrap">
                            <div id="contents" class="content">
								<form:form id="listForm" name="listForm" method="get">
	                                <!-- 검색조건 유지 -->
									<input type="hidden" name="clientNo" value="">
										                                
	                                <div class="board_view2">
	                                    <table summary="메뉴 등록화면">
	                                        <colgroup>
	                                            <col style="width: 190px;">
	                                            <col style="width: auto;">
	                                        </colgroup>
	                                        <tr>
	                                            <td class="lb">
	                                            	<label>고객사구분</label><!-- 사용여부 -->
	                                                <span class="req">필수</span>
	                                            </td>
	                                            <td class="rdoSet"><!-- 2개이상 radio 있을때 필요 -->
                                                   <input type="radio" name="newAt" value="Y" <c:if test="${searchVO.newAt == 'Y'}"> checked="checked"</c:if> >
                                                   신규고객사
                                                   <input type="radio" name="newAt" value="N" <c:if test="${searchVO.newAt == 'N'}"> checked="checked"</c:if> >
                                                   기존고객사
	                                            </td>
	                                        </tr>	                                        
	                                        <tr>
	                                            <td class="lb">
	                                                <label for="clientNm">고객사명</label>
	                                                <span class="req">필수</span>
	                                            </td>
	                                            <td>
	                                            	<input type="text" name="clientNm" class="f_txt"/>
	                                                <label class="f_select item" for="CLIENTBOX" style="display: none;">
				                                    	<select data-code="CLIENTBOX" title="클라이언트">
				                                    		<!-- <option value="0">클라이언트</option> -->
				    					                </select>	                                                
	                                                </label>
	                                            </td>
	                                        </tr>
	                                        <tr>
	                                            <td class="lb">
	                                                <label for="clientNm">담당팀명</label>
	                                                <span class="req">필수</span>
	                                            </td>
	                                            <td>
	                                                <input type="text" name="clientSideDepartment" class="f_txt"/>
	                                            </td>
	                                        </tr>
	                                        <tr>
	                                            <td class="lb">
	                                                <label for="clientNm">담당자명</label>
	                                            </td>
	                                            <td>
	                                                <input type="text" name="clientSideManager" class="f_txt"/>
	                                            </td>
	                                        </tr>
	                                        <tr>
	                                            <td class="lb">
	                                                <label for="remark">비고</label>
	                                            </td>
	                                            <td>
	                                                <input type="text" name="remark" class="f_txt"/>
	                                            </td>
	                                        </tr>	                                        
	                                    </table>
	                                </div>
	
									<!-- 목록/저장버튼  -->
	                                <div class="board_view_bot">
	                                    <!-- <div class="left_col btn3"></div> -->
	
	                                    <div class="right_col btn1">
	                                        <a href="#LINK" class="btn btn_blue_46 w_100" onclick="fn_save()">
	                                        	<spring:message code="button.save" />
	                                        </a><!-- 저장 -->
	                                    </div>
	                                </div>
	                                <!-- // 목록/저장버튼 끝  -->
								</form:form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>