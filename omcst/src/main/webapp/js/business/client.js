
$(function() {
	
	$("#client, #department").on("click", function (e) {
	    fn_moveToAddScreen();
	});
});

function press() {
    if (event.keyCode==13) { fnSearchClientList(); }
}

function fnSearchClientList(pageNo = 1){
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = `${BASE_URL}/omcst/business/selectClientList.do`;
    document.listForm.submit();
}

function linkPage(pageNo){
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = `${BASE_URL}/omcst/business/selectClientList.do`;
    document.listForm.submit();
}

function fn_addDepartment(){
	searchFileNm();
	
}

function fn_addClient(){
	searchFileNm();
}

function fn_moveToAddScreen() {
	document.listForm.action = `${BASE_URL}/omcst/business/addClientData.do`;
    document.listForm.submit();
}