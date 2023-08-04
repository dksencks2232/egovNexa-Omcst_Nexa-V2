/* ********************************************************
 * 2023.02.14 KJE
 * 함수명				| cf_get_code
 * 기능				| 공통코드를 가져온다.
 * 매개변수1(array)	| 코드 조회 옵션 객체를 담은 배열
 	예시) let optionList 		= [];
			 optionList[0] 	= { codeId : "COM032", codeType : "ALL", clCode : "OMF" };		
 * 매개변수2(function)| 함수 실행 후 호출하는 콜백함수 (기본값 undefined)
 * 반환값				| DB에서 조회 한 공통코드 값
 ******************************************************** */
const ENG_UPPER_REGEX = /^[A-Z]+$/;

$(function(){	
	$("input[data-mask='engUpper']").keyup(function(e) {
		if(!ENG_UPPER_REGEX.test($(this).val())) { $(this).val("");}
    });	

	$(".chkAll").click(function(e) {
		let oCheckAll = $(this).children("input[type='checkbox']")[0];
		let sChkOnlyName = oCheckAll.dataset.chkOnlyName;
		if(cf_isEmpty(sChkOnlyName)) { return;	}
    	cf_CheckAll(oCheckAll, sChkOnlyName);
	});
	
	
	/* ********************************************************
     * 범위 달력
     ******************************************************** */
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
	      $('#searchBgnde').val(picker.startDate.format('YYYY-MM-DD'));
	      $('#searchEndde').val(picker.endDate.format('YYYY-MM-DD'));
	});

	$('#vPeriod').on('cancel.daterangepicker', function(ev, picker) {
	    $(this).val(''); 
	});
	
	
});

function cf_CheckAll(oCheckAll, sChkOnlyName) {
    let checkField = oCheckAll.closest("form")[sChkOnlyName];
	
    if(oCheckAll.checked) {
        if(checkField) {
            if(checkField.length > 1) {
            	
                for(let i=0; i < checkField.length; i++) {
                	
                	let disabled = checkField[i].disabled;
                	
                	if(!disabled){
                    	checkField[i].checked = true;
                	} 
                }
            } else {
                checkField.checked = true;
            }
        }
    } else {
        if(checkField) {
            if(checkField.length > 1) {
                for(let j=0; j < checkField.length; j++) {
                    checkField[j].checked = false;
                }
            } else {
                checkField.checked = false;
            }
        }
    }
}

function checkRegex(regex,value){
	return regex.text(value);
}

function cf_get_code(optionList = [], callback = undefined){
	if(!Array.isArray(optionList)) { return; } 
	if(optionList.length == 0) { return; }	
	
	let result = {};
	let params = {
		"options" : JSON.stringify(optionList)
	}
	
	$.ajax({
	    type 		: 'post',           
	    url 		: '/commonCode',  	
		traditional : true, 			
	    async		: false,
		data 		: params,
	    success : function(data) { 		
			result = data;
	    },
	    error : function(request, status, error) { 
	        console.log(error)
	    }
	}) 	
	
	if(typeof callback ==='function') { callback(result); } 
}

/* ********************************************************
 * 2023.02.14 KJE
 * 함수명				| cf_set_option
 * 기능				| 셀렉트 옵션 셋팅
 * 매개변수1(object)	| 옵션으로 사용할 코드 데이터
 * 반환값				| -
 ******************************************************** */
function cf_set_option(codeDataObj = {}) {
	if(Object.keys(codeDataObj).length == 0 ){ return; }
	
	let selectList = $("select");	
	
	if(selectList.length == 0) { return; }
	
	for(obj of selectList) {
		$(obj).empty(); // option 초기화
		
		let sCode 	  = $(obj).data("code");
		let aCodeData = codeDataObj[sCode];
		
		let selectedVal = $(obj).attr("name");
		
		if(aCodeData == undefined) {
			$(obj).append(`<option value=''>코드없음</option>`);			
		} else {
			for(data of aCodeData){
				$(obj).append(`<option value=${data.code}>${data.codeNm}</option>`);
			}
		}
		
		$(obj).children().eq(0).prop("selected", true);
	}	
}

function cf_requried_value(target = undefined){
	if(target != undefined) {
		if(target.val().trim().length > 0) {
			return true;
		} else {
			return false;
		}
	}
}


function cf_call_popup(sOption = {}){
	if(Object.keys(sOption).length == 0 ){ return; }
	let $dialog = $('<div id="modalPan"></div>')
		.html(`<iframe style="border: 0px;" src="${BASE_URL}/${sOption.url}" width="100%" height="100%"></iframe>`)
		.dialog({
	    	autoOpen: false,
	        modal: true,
	        width: sOption.width == undefined ? 600 : sOption.width,
	        height: sOption.height == undefined ? 450 : sOption.height
		});
    $(".ui-dialog-titlebar").hide();
	$dialog.dialog('open');	
}

function cf_isEmpty(str){
	if(str == '') {
		return true;
	} else if (str == undefined) {
		return true;
	} else if (str == 'undefined') {
		return true;
	} else if (str == null) {
		return true;
	} else if (str == 'null') {
		return true;
	}
	return false;
}

/* ********************************************************
 * 2023.04.06 KJE
 * 함수명				| cf_init_date
 * 기능				| 데이트피커 적용
 * 매개변수1(object)	| 데이트피커를 적용할 캘린더의 id (string)
 * 반환값				| -
 ******************************************************** */
function cf_init_date(calendarIdList = []){
	if(calendarIdList.length > 0) {
		for(id of calendarIdList) {
			let $calendarObj = $(`#${id}`);	
			$calendarObj.datepicker({
				   dateFormat:'yy-mm-dd'
		         , showOn: 'button'
		         , buttonImage: "/images/ico_calendar.png"
		         , buttonImageOnly: true
		         , showMonthAfterYear: true
		         , showOtherMonths: true
			     , selectOtherMonths: true
			     , monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
		         , changeMonth: true // 월선택 select box 표시 (기본은 false)
		         , changeYear: true  // 년선택 selectbox 표시 (기본은 false)
		         , showButtonPanel: true // 하단 today, done  버튼기능 추가 표시 (기본은 false)
			});
		}
	}
}

function fn_egov_trim(str) {
    if (str == null) {
        return '';
    }
    let count = str.length;
    let len = count;
    let st = 0;

    while ((st < len) && (str.charAt(st) <= ' ')) {
        st++;
    }
    
    while ((st < len) && (str.charAt(len - 1) <= ' ')) {
        len--;
    }
    
    return ((st > 0) || (len < count)) ? str.substring(st, len) : str;
}

function cf_isChecked(sCheckName=undefined, sReturnName='returnCode'){
	if(cf_isEmpty(sCheckName)) { return false; }
	
	let checkFieldList = document.querySelectorAll(`input[type='checkbox'][name=${sCheckName}]`);
	let checkIdList    = document.querySelectorAll("input[type='hidden'][name='checkId']");
	if(checkFieldList.length == 0 || checkIdList.length == 0) { 
		alert(MSG.NOCHECK);
		return false;  
	}

	let formElement   = checkFieldList[0].closest("form");
	let returnElement = formElement.querySelector(`input[name=${sReturnName}]`);
	
	let returnValue = "";
	let checkCount = 0;
	if(checkFieldList.length > 0) {
        for(let i = 0; i < checkFieldList.length; i++) {
			let checkField 	= checkFieldList[i];
			
			if(checkField.checked) {
                checkField.value = checkIdList[i].value;
				returnValue = cf_isEmpty(returnValue) ? checkField.value : `${returnValue};${checkField.value}`;                    
            	checkCount++;
			}
        }
    } 

	let returnBoolean = checkCount > 0 ? true : false;
	if(!returnBoolean) { alert(MSG.NOCHECK); return false;}
	returnElement.value = returnValue;
	return true;	
}

