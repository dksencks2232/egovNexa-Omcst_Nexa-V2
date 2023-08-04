<%--
  Class Name : EgovIncLeftmenu.jsp
  Description : 좌메뉴화면(include)
  Modification Information

      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2011.08.31   JJY       경량환경 버전 생성

    author   : 실행환경개발팀 JJY
    since    : 2011.08.31
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import ="egovframework.com.cmm.LoginVO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:out value="${param.id}"/>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" >
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" ></script>


<div id="menubar">
	<div class="fold_area tabled animate"  style="padding-left: 24px;" >
		<div class="table-cell vertical-middle" style="padding-right: 36px;">
			<a href="#" class="logo_icon_menu">
				<img src="<c:url value='/'/>images/omcstlogo.png" alt="오픈마인즈">
			</a>
		</div>
		<a class="_tooltip_btn side_bar_btn" href="#" role="button" id="toggle_button">
			<span class="fold_button left">
				<i class="fa fa-bars"></i>
			</span>
		</a>
	</div>
	<div class="nano has-scrollbar">
		<div class="nano-content" tabindex="0" >
			<div class="menubar-scroll-panel" >
				  <div class="flex-shrink-0 p-3 menu-wrap" >
				    <ul class="list-unstyled ps-0 accordion" id="accordion" >
				      <li class="mb-1">
				        <button  id="accordion1" class="btn d-inline-flex align-items-center border-0 collapsed menu-btn"  data-bs-toggle="collapse" data-parent="#accordion" data-bs-target="#home-collapse" aria-expanded="false">
				          <i class="fa fa-bullhorn mr20"></i>
				          알림정보
				        </button>
				        <div class="collapse menu-teb" aria-labelledby="accordion1" data-bs-parent="#accordion" id="home-collapse" >
				          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
				            <li><a href="/ebt_webapp/cop/bbs/selectBoardList.do?bbsId=BBSMSTR_AAAAAAAAAAAA" class=" d-inline-flex text-decoration-none active">공지사항</a></li>
				            <li><a href="/ebt_webapp/cop/bbs/selectBoardList.do?bbsId=BBSMSTR_CCCCCCCCCCCC" class=" d-inline-flex text-decoration-none">업무게시판</a></li>
				          </ul>
				        </div>
				      </li>
				      <li class="mb-1">
				        <button id="accordion2" class="btn d-inline-flex align-items-center border-0 collapsed menu-btn"  data-bs-toggle="collapse"  data-bs-target="#dashboard-collapse" aria-expanded="false">
				          <i class="fa fa-sitemap mr20"></i>
				          직급체계관리
				        </button>
				        <div class="collapse menu-teb" aria-labelledby="accordion2" data-bs-parent="#accordion" id="dashboard-collapse" >
				          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
				            <li><a href="/ebt_webapp/EgovPageLink.do?link=main/sample_menu/Sample" class=" d-inline-flex text-decoration-none">입퇴사정보 관리</a></li>
				            <li><a href="/ebt_webapp/EgovPageLink.do?link=main/sample_menu/Sample" class=" d-inline-flex text-decoration-none">직급정보 관리</a></li>
				            <li><a href="/ebt_webapp/EgovPageLink.do?link=main/sample_menu/Sample" class=" d-inline-flex text-decoration-none">직위정보 관리</a></li>
				          </ul>
				        </div>
				      </li>
				      <li class="mb-1">
				        <button id="accordion3" class="btn d-inline-flex align-items-center border-0 collapsed menu-btn"  data-bs-toggle="collapse" data-parent="#accordion" data-bs-target="#orders-collapse" aria-expanded="false">
				          <i class="fa fa-users mr20"></i>
				          진급관리
				        </button>
				        <div class="collapse menu-teb" aria-labelledby="accordion3" data-bs-parent="#accordion" id="orders-collapse">
				          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
				            <li><a href="/ebt_webapp/EgovPageLink.do?link=main/sample_menu/Sample" class=" d-inline-flex text-decoration-none">업무평가점수 관리</a></li>
				            <li><a href="/ebt_webapp/EgovPageLink.do?link=main/sample_menu/Sample" class=" d-inline-flex text-decoration-none">상벌정보 관리</a></li>
				          </ul>
				        </div>
				      </li>
				      <li class="mb-1">
				        <button id="accordion4" class="btn d-inline-flex align-items-center border-0 collapsed menu-btn"   data-bs-toggle="collapse" data-parent="#accordion" data-bs-target="#account-collapse" aria-expanded="false">
				          <i class="fa fa-child mr20"></i>
				          근태관리
				        </button>
				        <div class="collapse menu-teb" aria-labelledby="accordion4" data-bs-parent="#accordion" id="account-collapse">
				          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
							<li><a href="/ebt_webapp/EgovPageLink.do?link=main/sample_menu/Sample" class=" d-inline-flex text-decoration-none">출퇴근정보 관리</a></li>
				            <li><a href="/ebt_webapp/EgovPageLink.do?link=main/sample_menu/Sample" class=" d-inline-flex text-decoration-none">휴무정보 관리</a></li>
				            <li><a href="/ebt_webapp/EgovPageLink.do?link=main/sample_menu/Sample" class=" d-inline-flex text-decoration-none">연차정보 관리</a></li>
							<li><a href="/ebt_webapp/EgovPageLink.do?link=main/sample_menu/Sample" class=" d-inline-flex text-decoration-none rounded">출퇴근정보 관리</a></li>
				            <li><a href="/ebt_webapp/omcst/yearVacation/selectListYearVacation.do" class=" d-inline-flex text-decoration-none rounded">휴무정보 관리</a></li>
				            <li><a href="/ebt_webapp/EgovPageLink.do?link=main/sample_menu/Sample" class=" d-inline-flex text-decoration-none rounded">연차정보 관리</a></li>
						</ul>
				        </div>
				      </li>
				      <li class="mb-1">
				        <button id="accordion5" class="btn d-inline-flex align-items-center border-0 collapsed menu-btn" data-bs-toggle="collapse" data-parent="#accordion" data-bs-target="#admin-collapse" aria-expanded="false">
				          <i class="fa fa-address-card mr20"></i>
				          내부서비스관리
				        </button>
				        <div class="collapse menu-teb" aria-labelledby="accordion5" data-bs-parent="#accordion" id="admin-collapse">
				          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
				          	<li class="menu-sub-title"><h3>내부업무게시판관리</h3></li>
				            <li><a href="/ebt_webapp/cop/bbs/SelectBBSMasterInfs.do" class=" d-inline-flex text-decoration-none ">게시판생성관리</a>
				            <li><a href="/ebt_webapp/cop/com/selectBBSUseInfs.do" class=" d-inline-flex text-decoration-none ">게시판사용관리</a></li>
				            <li><a href="/ebt_webapp/cop/bbs/admin/selectBoardList.do?bbsId=BBSMSTR_AAAAAAAAAAAA" class=" d-inline-flex text-decoration-none">공지사항관리</a></li>
				            <li><a href="/ebt_webapp/cop/bbs/admin/selectBoardList.do?bbsId=BBSMSTR_CCCCCCCCCCCC" class=" d-inline-flex text-decoration-none">업무게시판관리</a></li>
				          	<li class="menu-sub-title"><h3>사용현황관리</h3></li>
				            <li><a href="/ebt_webapp/sym/log/clg/SelectLoginLogList.do" class=" d-inline-flex text-decoration-none">접속로그관리</a>
				            <li><a href="/ebt_webapp/sts/cst/selectConectStats.do" class=" d-inline-flex text-decoration-none">접속통계관리</a></li>
				            <li><a href="/ebt_webapp/uat/uap/selectLoginPolicyList.do" class=" d-inline-flex text-decoration-none">로그인정책관리</a></li>
				          </ul>
				        </div>
				      </li>
				      <li class="mb-1">
				        <button id="accordion6" class="btn d-inline-flex align-items-center border-0 collapsed menu-btn"  data-bs-toggle="collapse" data-parent="#accordion" data-bs-target="#indata-collapse" aria-expanded="false">
				          <i class="fa fa-industry mr20"></i>
				          내부시스템관리
				        </button>
				        <div class="collapse menu-teb" aria-labelledby="accordion6" data-bs-parent="#accordion" id="indata-collapse">
				          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
				          	<li class="menu-sub-title"><h3>사용자관리</h3></li>
				            <li><a href="/ebt_webapp/uss/umt/user/EgovUserManage.do" class=" d-inline-flex text-decoration-none ">사용자등록관리</a>
				            <li><a href="/ebt_webapp/uss/ion/uas/selectUserAbsnceListView.do" class=" d-inline-flex text-decoration-none ">사용자부재관리</a></li>
				          	<li class="menu-sub-title"><h3>사용자권한관리</h3></li>
				            <li><a href="/ebt_webapp/sec/ram/EgovAuthorList.do" class=" d-inline-flex text-decoration-none ">권한관리</a>
				            <li><a href="/ebt_webapp/sec/gmt/EgovGroupList.do" class=" d-inline-flex text-decoration-none ">사용자그룹관리</a></li>
				            <li><a href="/ebt_webapp/sec/rgm/EgovAuthorGroupList.do" class=" d-inline-flex text-decoration-none ">사용자별권한관리</a></li>
				            <li><a href="/ebt_webapp/sec/rmt/EgovRoleList.do" class=" d-inline-flex text-decoration-none ">롤관리</a></li>
				            <li class="menu-sub-title"><h3>메뉴관리</h3></li>
				            <li><a href="/ebt_webapp/sym/prm/EgovProgramListManageSelect.do" class=" d-inline-flex text-decoration-none ">프로그램목록관리</a>
				            <li><a href="/ebt_webapp/sym/mnu/mcm/EgovMenuCreatManageSelect.do" class=" d-inline-flex text-decoration-none ">메뉴생성관리</a></li>
				            <li><a href="/ebt_webapp/sym/mnu/mpm/EgovMenuManageSelect.do" class=" d-inline-flex text-decoration-none ">메뉴목록관리</a></li>
				            <li class="menu-sub-title"><h3>메뉴관리</h3></li>
				            <li><a href="/ebt_webapp/sym/ccm/ccc/EgovCcmCmmnClCodeList.do" class=" d-inline-flex text-decoration-none ">분류코드관리</a>
				            <li><a href="/ebt_webapp/sym/ccm/cca/EgovCcmCmmnCodeList.do" class=" d-inline-flex text-decoration-none ">공통코드관리</a></li>
				            <li><a href="/ebt_webapp/sym/ccm/cde/EgovCcmCmmnDetailCodeList.do" class=" d-inline-flex text-decoration-none ">상세코드관리</a></li>
				            <li><a href="/ebt_webapp/sym/ccm/zip/EgovCcmZipList.do" class=" d-inline-flex text-decoration-none ">우편번호관리</a></li>
				          </ul>
				        </div>
				      </li>
				    </ul>
				  </div>
			</div>
			<div class="nano-pane">
				<div class="nano-slider"></div>
			</div>
		</div>
	</div>
</div>

<script>

$(document).ready(function(){
	$('a').click(function(){
		if ('.menu-teb').hasClass("show") === true {
			$('.menu-teb').removeClass('show');
		} else {
			$(this).closest('.menu-teb').addClass('show');
		}
	});
});

</script>

