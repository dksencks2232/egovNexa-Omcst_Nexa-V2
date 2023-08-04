
function fncCheckAll() {
    var checkField = document.listForm.delYn;
    if(document.listForm.checkAll.checked) {
        if(checkField) {
            if(checkField.length > 1) {
                for(var i=0; i < checkField.length; i++) {
                    checkField[i].checked = true;
                }
            } else {
                checkField.checked = true;
            }
        }
    } else {
        if(checkField) {
            if(checkField.length > 1) {
                for(var j=0; j < checkField.length; j++) {
                    checkField[j].checked = false;
                }
            } else {
                checkField.checked = false;
            }
        }
    }
}


function fnSearchProjectList(pageNo){
    //document.listForm.searchCondition.value = "1";
    fnSearchConditionChk();
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = `${BASE_URL}/omcst/business/selectListProject.do`;
    document.listForm.submit();
}

function linkPage(pageNo){
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = `${BASE_URL}/omcst/business/selectListProject.do`;
    document.listForm.submit();
}

function fncSelectAuthorGroupPop() {

    if(true) {
        
        var $dialog = $('<div id="modalPan"></div>')
    	.html('<iframe style="border: 0px; " src="' + BASE_URL+'/omcst/business/InsertProject.do"' + '" width="100%" height="100%"></iframe>')
    	.dialog({
        	autoOpen: false,
            modal: true,
            width: 1100,
            height: 600
    	});
        $(".ui-dialog-titlebar").hide();
    	$dialog.dialog('open');
    } else {
        alert("그룹을 선택하세요.");
        return;
    }
}


function fnSearchConditionChk(){
	if($("#clientNo option:selected").val() == '0'){
		$("#clientNo").attr("disabled", true);
		$("#departmentNo").attr("disabled", true);
		$("#projectNo").attr("disabled", true);
	}
	if($("#departmentNo option:selected").val() == '0'){
		$("#departmentNo").attr("disabled", true);
		$("#projectNo").attr("disabled", true);
	}
	if($("#projectStatus option:selected").val() == '0'){
		$("#projectStatus").attr("disabled", true);
	}
}


function fnSearchSelectBoxInfo(searchCondition){
	console.log("send : "+searchCondition);
	let obj={
			"searchCondition" : searchCondition,
			"clientNo" : document.getElementById("clientNo").options[document.getElementById("clientNo").selectedIndex].value,
			"departmentNo" : document.getElementById("departmentNo").options[document.getElementById("departmentNo").selectedIndex].value
		};
	$.ajax({
        type: "post",
        url : "/omcst/business/SearchSelectBoxInfo.do",
        data : JSON.stringify(obj),
        contentType: "application/json",
        success : function (data){
        		console.log(data)
        		var target;
	        	switch (searchCondition){
	        		case 0:
	        			target = $("#departmentNo");
	        			fnRenewOptions(data, target, searchCondition, "담당팀");
	        			$()
	        			break;
	        		case 1:
	        			target = $("#projectNo");
	        			fnRenewOptions(data, target, searchCondition, "프로젝트명");
	        			break;
	        	}
        	}
        
	})
}

function fnRenewOptions(data, target, searchCondition, defaultOption){
	fnSetDefaultOption(target, searchCondition, defaultOption);
	for(var item of data){
		let addOption;
		switch (searchCondition){
			case 0:
				addOption = "<option value='"+item.departmentNo+"'>"+item.clientSideDepartment+"</option>";
				break;
			case 1:
				addOption = "<option value='"+item.projectNo+"'>"+item.projectNm+"</option>";
				break;
		}
		$(target).append(addOption);
	}
}

function fnSetDefaultOption(target, searchCondition, defaultOption){
	$(target).empty();
	$(target).append("<option value='0'>"+defaultOption+"</option>");
	if(0 == searchCondition){
		fnSetDefaultOption($("#projectNo"), searchCondition+1, "프로젝트명");
	}
}

function fnSetInitSearchOptions(){
	$("#clientNo").val("0").prop("selected", true);
	fnSetDefaultOption($("#departmentNo"), '', "담당팀");
	fnSetDefaultOption($("#프로젝트명"), '', "담당팀");
	$("#projectStatus").val("0").prop("selected", true);
	
	$("#projectBegineDate").val("");
	$("#projectEndDate").val("");
	$("#vPeriod").val("");
	$("#searchKeyword").text("");
	$("#searchKeyword").val("");
}

/**********************************************************
 * 모달 종료 버튼
 ******************************************************** */
function fn_egov_modal_remove() {
	$('#modalPan').remove();
}

function onSearchCondition() {
    document.listForm.searchKeyword.value = "";
    if(document.listForm.searchCondition.value == '3') {
        document.listForm.searchKeyword.readOnly = true;
    } else {
        document.listForm.searchKeyword.readOnly = false;
    }
}

function press() {

    if (event.keyCode==13) {
    	fnSearchProjectList('1');
    }
}

$(function() {

	$('#vPeriod').daterangepicker({
	      autoUpdateInput: false,
	      locale: {
          	cancelLabel: 'Clear',
          	"separator": " ~ ",                     // 시작일시와 종료일시 구분자
	        "format": 'YYYY-MM-DD',     // 일시 노출 포맷
	        "applyLabel": "확인",                    // 확인 버튼 텍스트
	        "cancelLabel": "취소",                   // 취소 버튼 텍스트
	        "daysOfWeek": ["일", "월", "화", "수", "목", "금", "토"],
	        "monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"]
	      },
	      	timePicker: false,                        // 시간 노출 여부
  	        showDropdowns: true,                     // 년월 수동 설정 여부
  	        autoApply: false,                         // 확인/취소 버튼 사용여부
  	        timePicker24Hour: true,                  // 24시간 노출 여부(ex> true : 23:50, false : PM 11:50)
  	        timePickerSeconds: true,                 // 초 노출 여부
  	        singleDatePicker: 2,                   // 하나의 달력 사용 여부
	});

	$('#vPeriod').on('apply.daterangepicker', function(ev, picker) {
	      $(this).val(picker.startDate.format('YYYY-MM-DD') + ' ~ ' + picker.endDate.format('YYYY-MM-DD'));
	      $('#projectBegineDate').val(picker.startDate.format('YYYY-MM-DD'));
	      $('#projectEndDate').val(picker.endDate.format('YYYY-MM-DD'));
	});

	$('#vPeriod').on('cancel.daterangepicker', function(ev, picker) {
	    $(this).val('');
	});

});