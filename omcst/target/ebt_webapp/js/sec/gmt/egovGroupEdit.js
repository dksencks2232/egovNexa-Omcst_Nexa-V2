
let oForm;

$(function(){	
	oForm = document.getElementById("groupManage");
});

function fncSelectGroupList() {
	oForm.action = `${BASE_URL}/sec/gmt/EgovGroupList.do`;
    oForm.submit();       
}

function fncGroupInsert() {
    if(!validateGroupManage(oForm)){ return; }
    if(confirm(MSG.REGIST)){ 
		oForm.action = `${BASE_URL}/sec/gmt/EgovGroupInsert.do`;
		oForm.submit(); 
	}
}

function fncGroupUpdate() {
    if(!validateGroupManage(oForm)){ return; }
    if(confirm(MSG.UPDATE)){ 
		oForm.action = `${BASE_URL}/sec/gmt/EgovGroupUpdate.do`;
		oForm.submit();  
	}
}

function fncGroupDelete() {
    if(confirm(MSG.DELETE)){ 
		oForm.action = `${BASE_URL}/sec/gmt/EgovGroupDelete.do`;
		oForm.submit(); 
	}
}