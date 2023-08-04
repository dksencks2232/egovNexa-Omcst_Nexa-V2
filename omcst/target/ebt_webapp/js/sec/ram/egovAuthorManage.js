
let formElement;

$(function(){	
	formElement = document.listForm;
	formElement.searchCondition.value = "1"; 
	
	let errorMsg = document.querySelector('[name=error]').value;
	if(!cf_isEmpty(errorMsg)) { alert(errorMsg); }
});


function fncSelectAuthorList(pageNo = "1"){
    if(!editMode) { formElement.pageIndex.value = pageNo; }
    formElement.action = `${BASE_URL}/sec/ram/EgovAuthorList.do`;
    formElement.submit();
}

function fncSelectAuthor(author) {
    formElement.authorCode.value = author;
    formElement.action = `${BASE_URL}/sec/ram/EgovAuthor.do`;
    formElement.submit();     
}

function fncAddAuthorInsert() {
    location.replace(`${BASE_URL}/sec/ram/EgovAuthorInsertView.do`); 
}

function fncAuthorDeleteList() {
    if(!cf_isChecked('delYn','authorCodes')) { return; }
	if(!confirm(MSG.DELETE)) { return; }
	
    formElement.action = `${BASE_URL}/sec/ram/EgovAuthorListDelete.do`;
    formElement.submit();
}

function fncAddAuthorView() {
    formElement.action =  `${BASE_URL}/sec/ram/EgovAuthorUpdate.do`;
    formElement.submit();     
}

function fncSelectAuthorRole(author) {
    formElement.searchKeyword.value = author;
    formElement.action = `${BASE_URL}/sec/ram/EgovAuthorRoleList.do`;
    formElement.submit();     
}

function linkPage(pageNo){
    formElement.pageIndex.value = pageNo;
    formElement.action = `${BASE_URL}/sec/ram/EgovAuthorList.do`;
    formElement.submit();
}

function fncAuthorInsert() {
    var varFrom = document.getElementById("listForm");
    varFrom.action = `${BASE_URL}/sec/ram/EgovAuthorInsert.do`;

    if(!validateAuthorManage(varFrom)){ return; }

    if(confirm(MSG.REGIST)){
		varFrom.submit();
    }
}

function fncAuthorUpdate() {
    var varFrom = document.getElementById("listForm");
    varFrom.action = `${BASE_URL}/sec/ram/EgovAuthorUpdate.do`;

	if(!validateAuthorManage(varFrom)){ return; }

    if(confirm(MSG.UPDATE)){
        varFrom.submit();
    }
}

function fncAuthorDelete() {
    var varFrom = document.getElementById("listForm");
    varFrom.action = `${BASE_URL}/sec/ram/EgovAuthorDelete.do`;
    if(confirm(MSG.DELETE)){
        varFrom.submit();
    }
}

function press() {
    if (event.keyCode==13) { fncSelectAuthorList(); }
}
