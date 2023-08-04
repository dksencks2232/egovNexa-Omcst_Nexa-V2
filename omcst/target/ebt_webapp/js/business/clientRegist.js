
$(function() {
	$("input:radio[name='newAt']:radio[value='Y']").prop('checked', true); 
	
	fn_getSelectBoxData();
	
 	$("input[name='newAt']").change(function(e){
		let sNewAt = $("input[name='newAt']:checked").val();
		fn_setComponent(sNewAt);		
    });
});

function fn_setComponent(sNewAt){
	switch(sNewAt){
		case "Y":
			$("input[name='clientNm']").css('display','block');
			$("label[for='CLIENTBOX']").css('display','none');
			break;
		
		case "N":
			$("input[name='clientNm']").css('display','none');
			$("label[for='CLIENTBOX']").css('display','block');
			break;
			
		default:
			break;
	}
}

function fn_getSelectBoxData(){
	$.ajax({
        type: "post",
        url : "/omcst/business/selectClientBoxInfo.do",
        data : {},
        contentType: "application/json",
        success : function (dataList){
			fn_setSelectBoxData(dataList);
        }
	})	
}

function fn_setSelectBoxData(dataList){
	let codeList = [];
	for(data of dataList) {
		let codeObj = {};
		codeObj.code   = data.clientNo;
		codeObj.codeNm = data.clientNm;
		codeList.push(codeObj);
	}
	
	let codeDataObj = { CLIENTBOX : codeList }
	cf_set_option(codeDataObj);	
}

function fn_save(){
	fn_saveValidation();
	var str = $('#listForm').serialize();	
	console.log(str);
	document.listForm.action = `${BASE_URL}/omcst/business/saveClientData.do`;
    document.listForm.submit();
}

function fn_saveValidation(){
	let isNewClient = $("input[name='newAt']:checked").val();
	switch(isNewClient) {
		case "Y":
			$("input[name='clientNo']").val("");
			break;
			
		case "N":	
			let seletedOptionElm = $("select[data-code='CLIENTBOX'] option:selected");
			$("input[name='clientNo']").val(seletedOptionElm.val());
			$("input[name='clientNm']").val(seletedOptionElm.text());
			break;
			
		default:
			break;
	}	
}

