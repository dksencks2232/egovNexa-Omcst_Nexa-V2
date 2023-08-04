/**
 * 
 */


function fncSearchClientPop() {

    if(true) {
        
        var $dialog = $('<div id="modalPan"></div>')
    	.html('<iframe style="border: 0px; " src="' + BASE_URL+'/omcst/business/SelectClientListPop.do"' + '" width="100%" height="100%"></iframe>')
    	.dialog({
        	autoOpen: false,
            modal: true,
            width: 1000,
            height: 500
    	});
        $(".ui-dialog-titlebar").hide();
    	$dialog.dialog('open');
    } else {
        alert("그룹을 선택하세요.");
        return;
    }
}

function fn_egov_modal_remove() {
	$('#modalPan').remove();
}