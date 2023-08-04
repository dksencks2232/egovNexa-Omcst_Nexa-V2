let formElement;
let PATH = "/sym/mnu/mcm";

$(function(){	
	formElement = document.querySelector("form[name='menuCreatManageForm']");
	let errorMsg = document.querySelector("input[name='resultMsg']").value;
	if(!cf_isEmpty(errorMsg)) { alert(errorMsg); }
});

/* ********************************************************
 * 최초조회 함수
 ******************************************************** */
function fMenuCreatManageSelect(){ 
    formElement.action = `${BASE_URL}${PATH}/EgovMenuCreatManageSelect.do`;
    formElement.submit();
}

/* ********************************************************
 * 페이징 처리 함수
 ******************************************************** */
function linkPage(pageNo){
    formElement.pageIndex.value = pageNo;
    formElement.action = `${BASE_URL}${PATH}/EgovMenuCreatManageSelect.do`;
    formElement.submit();
}

/* ********************************************************
 * 조회 처리 함수
 ******************************************************** */
function selectMenuCreatManageList() { 
    formElement.pageIndex.value = 1;
    formElement.action = `${BASE_URL}${PATH}/EgovMenuCreatManageSelect.do`;
    formElement.submit();
}

/* ********************************************************
 * 메뉴생성 화면 호출
 ******************************************************** */
function selectMenuCreat(vAuthorCode) {
    formElement.authorCode.value = vAuthorCode;
    
    var $dialog = $('<div id="modalPan"></div>')
	// .html('<iframe style="border: 0px; " src="' + "<c:url value='/sym/mnu/mcm/EgovMenuCreatSelect.do'/>?authorCode=" + vAuthorCode + '" width="100%" height="100%"></iframe>')
	.html(`<iframe style="border: 0px; " src="/sym/mnu/mcm/EgovMenuCreatSelect.do?authorCode=${vAuthorCode}" width="100%" height="100%"></iframe>`)
	.dialog({
    	autoOpen: false,
        modal: true,
        width: 850,
        height: 900,
        title: "템플릿 목록"
	});
    $(".ui-dialog-titlebar").hide();
	$dialog.dialog('open');
}

function deleteMenu(vAuthorCode) {
	if (confirm(`[ ${vAuthorCode} ] 의 메뉴를 정말 ${MSG.DELETE}`)) {
		formElement.action = `${BASE_URL}${PATH}/EgovMenuCreatDelete.do`;
	    formElement.authorCode.value = vAuthorCode;
		formElement.submit();
	}	
}

/**********************************************************
 * 모달 종료 버튼
 ******************************************************** */
function fn_egov_modal_remove() {
	$('#modalPan').remove();
}


