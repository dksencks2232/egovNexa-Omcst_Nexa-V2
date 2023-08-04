<%--
  Class Name : EgovGroupManage.jsp
  Description : EgovGroupManage List 화면
  Modification Information

      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2009.02.01    lee.m.j              최초 생성
     2011.08.31   JJY       경량환경 버전 생성

    author   : 공통서비스 개발팀 lee.m.j
    since    : 2009.02.01
--%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="egovframework.com.cmm.LoginVO" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<link rel="stylesheet" href="<c:url value='/'/>jqGrid-master/css/ui.jqgrid.css">
<link rel="stylesheet" href="<c:url value='/'/>jqGrid-master/css/addons/ui.multiselect.css">

<script type="text/javascript" src="<c:url value='/jqGrid-master/js/i18n/grid.locale-kr.js' />" ></script>
<script type="text/javascript" src="<c:url value='/jqGrid-master/js/i18n/grid.locale-en.js' />" ></script>
<script type="text/javascript" src="<c:url value='/jqGrid-master/js/ui.multiselect.js' />" ></script>
<script type="text/javascript" src="<c:url value='/jqGrid-master/js/grid.base.js' />" ></script>
<script type="text/javascript" src="<c:url value='/jqGrid-master/js/jquery.jqGrid.min.js' />" ></script>
<script type="text/javascript" src="<c:url value='/jqGrid-master/js/jquery.tablednd.js' />" ></script>
<script type="text/javascript" src="<c:url value='/jqGrid-master/js/jquery.contextmenu.js' />" ></script>

<script type="text/javascript" src="<c:url value='/js/sec/gmt/egovGroupManage.js' />" ></script>
    <div class="wrap">
        <div class="container">
            <div class="sub_layout">
                <div class="sub_in">
                    <div class="layout"> 
                        <div class="content_wrap">
                            <div id="contents" class="content">	
	                            <div style="text-align: center;">
									   <label class="item f_select ml20" for="sel1">
									      <select name="searchCnd" id="searchCnd" title="검색조건 선택">
									        	<option value="">전체</option>
									        	<option value="GROUP_ID">그룹ID</option>
									        	<option value="GROUP_NM">그룹명</option>
									        	<option value="GROUP_DC">설명</option>
									      </select>
									   </label>
									   <span class="item f_search">
									      <input class="f_input w_500" id="searchWrd" name="searchWrd" type="text" maxlength="35" onkeypress="press(event);" title="검색어 입력">
									      <button class="btn btn_46" type="submit" onclick="fn_select_groupList(); return false;">
									         <spring:message code='button.inquire' />
									      </button>
									   </span>
								</div>						
	                             <div class="btn_area al_l">
					              <button class="item btn btn_blue_46 w_100" onclick="javascript:gridFunc.addRow();">추가</button>
					              <button class="item btn btn_red_46 w_100" onclick="javascript:gridFunc.deleteRow();">삭제</button>
					            </div>

                            	<div class="row">
									<div>
										<table id="jqGrid"></table>
										<div id="jqGridPager"></div>
									</div>	                            	
                            	</div>
								
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>