let PREVIEW_MODE;
let PREFIX;

$(function(){	
	PREVIEW_MODE = $("input[name='preview']").val().trim().length == 0 ? false : true;
	PREFIX = $("input[name='prefix']").val();
});


function press(event) {
	if(PREVIEW_MODE) { return; }

    if (event.keyCode==13) {
        fn_egov_select_noticeList();
    }
}

function fn_egov_select_noticeList(pageNo='1') {
	if(PREVIEW_MODE) { return; }
	    
	document.frm.pageIndex.value = pageNo;
    document.frm.submit();  
}

function fn_sort(sort){
	if(PREVIEW_MODE) { return; }
	document.frm.sort.value = sort;
	document.frm.action= `${BASE_URL}/cop/bbs${PREFIX}/selectBoardList.do`;
	document.frm.method='get';
    document.frm.submit();
}

function fn_egov_addNotice() {
	if(PREVIEW_MODE) { return; }
		
    document.frm.action = `${BASE_URL}/cop/bbs${PREFIX}/addBoardArticle.do`;
    document.frm.submit();
}

function fn_egov_inqire_notice(nttId, bbsId) {
	if(PREVIEW_MODE) { return; }
	    
	document.subForm.nttId.value = nttId;
    document.subForm.bbsId.value = bbsId;
    document.subForm.action = `${BASE_URL}/cop/bbs${PREFIX}/selectBoardArticle.do`;
    document.subForm.submit();          
}

function fn_selectDetail(obj) {
	document.subForm.nttId.value 	= obj.dataset.nttid;
	document.subForm.authFlag.value = obj.dataset.auth;
    document.subForm.action 		= `${BASE_URL}/cop/bbs${PREFIX}/selectBoardArticle.do`;
    document.subForm.method			= 'get';
	document.subForm.submit(); 	
}
