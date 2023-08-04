/****************************************************************
 * 
 * 파일명 : CommCodeMng.js
 * 설  명 : 공통코드관리
 * 
 *    수정일      수정자     Version        Function 명
 * ------------    ---------   -------------  ----------------------------
 * 2009.03.10    이삼섭       1.0             최초생성
 * 
 * 
 * **************************************************************/

/* ********************************************************
 * 페이징 처리 함수
 ******************************************************** */
$(function(){
	fn_initCode();
	
	$('#searchBtn').click(function(){
  		fn_search();
	});
	
  	$('#registBtn').click(function(){
  		fn_regist();
	});	
});

function fn_initCode(){
	// select태그의 data-code와 맵핑되므로 동일하게 입력
	let optionList 		= [];
		optionList[0] 	= { codeId : "COM032", codeType : "ALL", clCode : "OMF" };
		cf_get_code(optionList, fn_codeCallback);
}	

function fn_codeCallback(codeData) {
	// 셀렉트박스 옵션 통적 생성
	cf_set_option(codeData); 
}

function linkPage(pageNo){
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = "./commCodeMng";
    document.listForm.submit();
}
/* ********************************************************
 * 조회 처리 
 ******************************************************** */
function fn_search(){
	let listForm = document.querySelector('[name=listForm]');
	listForm.setAttribute('action','./commCodeMng');
	listForm.setAttribute('method','get');
    document.listForm.pageIndex.value = 1;
    document.listForm.submit();
}
/* ********************************************************
 * 등록 처리 함수 
 ******************************************************** */
function fn_regist(){
    location.href = "<c:url value='/sym/ccm/cca/EgovCcmCmmnCodeRegist.do'/>";
}
/* ********************************************************
 * 수정 처리 함수
 ******************************************************** */
function fnModify(){
    location.href = "";
}
/* ********************************************************
 * 상세회면 처리 함수
 ******************************************************** */
function fnDetail(codeId){
    var varForm              = document.all["Form"];
    varForm.action           = "<c:url value='/sym/ccm/cca/EgovCcmCmmnCodeDetail.do'/>";
    varForm.codeId.value     = codeId;
    varForm.submit();
}
/* ********************************************************
 * 삭제 처리 함수
 ******************************************************** */
function fnDelete(){
    // 
}



