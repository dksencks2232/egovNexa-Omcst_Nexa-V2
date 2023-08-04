
let formElement;
let editMode;

$(function(){	
	formElement = document.listForm;

	let authorCode = document.querySelector('[name=authorCode]').value;
	editMode = cf_isEmpty(authorCode) ? "REGIST" : "UPDATE";
	
	let errorMsg = document.querySelector('[name=error]').value;
	if(!cf_isEmpty(errorMsg)) { alert(errorMsg); }
});


function fncSelectAuthorList() {
    formElement.action = `${BASE_URL}/sec/ram/EgovAuthorList.do`;
    formElement.submit();       
}

function fncAuthorInsert() {
    formElement.action = `${BASE_URL}/sec/ram/EgovAuthorInsert.do`;

    if(!validateAuthorManage(formElement)){ return; }

    if(confirm(MSG.REGIST)){
		formElement.submit();
    }
}

function fncAuthorUpdate() {
    formElement.action = `${BASE_URL}/sec/ram/EgovAuthorUpdate.do`;

	if(!validateAuthorManage(formElement)){ return; }

    if(confirm(MSG.UPDATE)){
        formElement.submit();
    }
}

/*
function fncAuthorDelete() {
    formElement.action = `${BASE_URL}/sec/ram/EgovAuthorDelete.do`;
    if(confirm(MSG.DELETE)){
        formElement.submit();
    }
}
*/
