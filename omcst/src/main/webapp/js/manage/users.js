/****************************************************************
 * 
 * 파일명 : users.js
 * 설  명 : 사용자등록
 * 
 *    수정일      수정자     Version        Function 명
 * ------------    ---------   -------------  ----------------------------
 * 2023.02.17    csh       1.0             최초생성
 * 
 * 
 * **************************************************************/

$(function(){
	fn_processingMessage();
});

/* ********************************************************
 * 페이지 진입시 처리결과 메세지 
 ******************************************************** */
function fn_processingMessage(){
	if(document.getElementById('resultMsg').value){
		let resultMsg = document.getElementById('resultMsg').value;
		alert(resultMsg);
	}
}

/* ********************************************************
 * 체크박스 전체선택 / 해제
 ******************************************************** */
function fn_checkAll() {
    let checkField = document.listForm.checkField;
    if(document.listForm.checkAll.checked) {
        if(checkField) {
            if(checkField.length > 1) {
                for(let i=0; i < checkField.length; i++) {
                    checkField[i].checked = true;
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

/* ********************************************************
 * 체크박스 선택유저 삭제 처리
 ******************************************************** */
function fn_deleteCheckUser() {
    let checkField = document.listForm.checkField;
    let id = document.listForm.checkId;
    let checkedIds = "";
    let checkedCount = 0;
    if(checkField) {
        if(checkField.length > 1) {
            for(let i=0; i < checkField.length; i++) {
                if(checkField[i].checked) {
                    checkedIds += ((checkedCount==0? "" : ",") + id[i].value);
                    checkedCount++;
                }
            }
        } else {
            if(checkField.checked) {
                checkedIds = id.value;
            }
        }
    }
    if(checkedIds.length > 0) {
		let message = document.getElementById('sMessage').value;
        //alert(message);
        if(confirm(message)){
            document.listForm.checkedIdForDel.value=checkedIds;
            document.listForm.action = BASE_URL+'/userDelete';
           	document.listForm.submit();
        }
    }
}

/* ********************************************************
 * 유저 삭제 처리
 ******************************************************** */
function fn_deleteUser(checkedIds) {
	let message = document.getElementById('sMessage').value;
    if(confirm(message)){
       document.userManageVO.checkedIdForDel.value=checkedIds;
       document.userManageVO.action = BASE_URL+'/userDelete';
       document.userManageVO.submit(); 
    }
}

/* ********************************************************
 * 유저 상세 페이지 이동
 ******************************************************** */
function fn_seelctUser(id) {
    document.listForm.selectedId.value = id;
    array = id.split(":");
    if(array[0] == "") {
    } else {
        userTy = array[0];
        userId = array[1];    
    }
    document.listForm.selectedId.value = userId;
    document.listForm.action = BASE_URL+'/userView';
    document.listForm.submit();
}

/* ********************************************************
 * 유저 추가 페이지 이동
 ******************************************************** */
function fn_addUserView() {
    document.listForm.action = BASE_URL+'/userManageInfo';
    document.listForm.submit();
}

/* ********************************************************
 * 페이징 처리 
 ******************************************************** */
function fn_linkPage(pageNo){
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = BASE_URL+'/userManage';
    document.listForm.submit();
}

/* ********************************************************
 * 검색 처리 
 ******************************************************** */
function fn_search(){
    document.listForm.pageIndex.value = 1;
    document.listForm.action = BASE_URL+'/userManage';
    document.listForm.submit();
}

/* ********************************************************
 * idCheck 팝업
 ******************************************************** */
function fn_IdCheck(){ 
    let $dialog = $('<div id="modalPan"></div>')
	.html('<iframe style="border: 0px; " src="' + BASE_URL+'/idCheckView?"' + '" width="100%" height="100%"></iframe>')
	.dialog({
    	autoOpen: false,
        modal: true,
        width: 600,
        height: 450
	});
    $(".ui-dialog-titlebar").hide();
	$dialog.dialog('open');
}
function showModalDialogCallback(retVal) {
    if(retVal) {
        document.userManageVO.emplyrId.value = retVal;
        document.userManageVO.id_view.value = retVal;
        
        fn_egov_modal_remove();
    }
}

/**********************************************************
 * 모달 종료 버튼
 ******************************************************** */
function fn_egov_modal_remove() {
	$('#modalPan').remove();
}

/* ********************************************************
 * 달력
 ******************************************************** */
function fn_egov_init_date(){
     var old_fn = $.datepicker._updateDatepicker;

	 $.datepicker._updateDatepicker = function(sel1) {
	   old_fn.call(this, sel1);

	   var btnPane = $(this).datepicker("widget").find(".ui-datepicker-buttonpane");

	   $("<button type='button' class='ui-datepicker-clean ui-state-default ui-priority-primary ui-corner-all'>초기화</button>").appendTo(btnPane).click(function(e) {
	    	$.datepicker._clearDate(sel1.input);

	    	if($("#joinDate").val() != "" && $('#retire').val() == "")
	    	{	    		
	    		$('#retire').val('');
	    	}	    	
	    	else if($("#joinDate").val() == "" && $('#retire').val() != "")
	    	{	    		
	    		$("#joinDate").val(''); 
	    		$('#retire').val('');
	    	}
	    	else
	    	{	    	
	    	}
	   }) ;
	}

	$.datepicker._gotoToday = function(id) {
	    $(id).datepicker('setDate', new Date()).datepicker('hide').blur();
	};
	
	$("#joinDate").datepicker(
	        {dateFormat:'yy-mm-dd'
	         , showOn: 'button'
	         , buttonImage: BASE_URL+'/images/ico_calendar.png'
	         , buttonImageOnly: true	         
	         , showMonthAfterYear: true
	         , showOtherMonths: true
		     , selectOtherMonths: true
		     , monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
		     , monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
		     , dayNames: ['일', '월', '화', '수', '목', '금', '토']
		     , dayNamesShort: ['일', '월', '화', '수', '목', '금', '토']
		     , dayNamesMin: ['일', '월', '화', '수', '목', '금', '토']
		     , weekHeader: "주"
		     , yearSuffix: '년'				
			 , currentText: "오늘"				
	         , changeMonth: true // 월선택 select box 표시 (기본은 false)
	         , changeYear: true  // 년선택 selectbox 표시 (기본은 false)
	         , showButtonPanel: true // 하단 today, done  버튼기능 추가 표시 (기본은 false)
	         , closeText: '닫기'
			 , onSelect: function(dateString) {
		            var joinDate = $('#joinDate').val();
		            $('#retire').datepicker('option', 'minDate', joinDate);
			   }	         
	});


	$("#retire").datepicker(
	        {dateFormat:'yy-mm-dd'
	         , showOn: 'button'
	         , buttonImage: BASE_URL+'/images/ico_calendar.png'
	         , buttonImageOnly: true
			 , minDate: new Date($("#joinDate").val())
	         , showMonthAfterYear: true
	         , showOtherMonths: true
		     , selectOtherMonths: true
		     , monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
		     , monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
		     , dayNames: ['일', '월', '화', '수', '목', '금', '토']
		     , dayNamesShort: ['일', '월', '화', '수', '목', '금', '토']
		     , dayNamesMin: ['일', '월', '화', '수', '목', '금', '토']
		     , weekHeader: "주"
		     , yearSuffix: '년'				
			 , currentText: "오늘"				
	         , changeMonth: true // 월선택 select box 표시 (기본은 false)
	         , changeYear: true  // 년선택 selectbox 표시 (기본은 false)
	         , showButtonPanel: true // 하단 today, done  버튼기능 추가 표시 (기본은 false)
	         , closeText: '닫기'

	});
}

/* ********************************************************
 * 목록 페이지로 이동
 ******************************************************** */
function fn_listPage(){
    document.userManageVO.action = BASE_URL+'/userManage'; 
    document.userManageVO.submit();
}

/* ********************************************************
 * 유저 입력 처리
 ******************************************************** */
function fn_insert(){
    if(validateUserManageVO(document.userManageVO)){
        if(document.userManageVO.password.value != document.userManageVO.password2.value){
			let message=document.getElementById('pMessage').value;
            alert(message);
            return false;
        }
        document.userManageVO.submit();
    }
}

/* ********************************************************
 * id 중복 체크 처리
 ******************************************************** */
function fn_checkId(){
	if(document.checkForm.checkId.value==""){
		alert("중복조회할 아이디를 입력하십시오.");
		document.checkForm.focus();
        return false;
	}
	if(fn_checkNotKorean(document.checkForm.checkId.value)){
		document.checkForm.submit();
    }else{
    	alert("한글은 사용할 수 없습니다.");
        return false;
    }
}

/* ********************************************************
 * id 중복 체크 결과
 ******************************************************** */
function fn_returnId(){
	var retVal="";
    if (document.checkForm.usedCnt.value == 0){
	    retVal = document.checkForm.resultId.value;
	    parent.showModalDialogCallback(retVal);
    }else if (document.checkForm.usedCnt.value == 1){
        alert("이미사용중인 아이디입니다.");
        return false;
    }else{
    	alert("먼저 중복확인을 실행하십시오");
        return false;
    }
}

/* ********************************************************
 * id 중복 체크 페이지 닫기
 ******************************************************** */
function fn_close(){
    var retVal="";
    parent.showModalDialogCallback(retVal);
    parent.fn_egov_modal_remove();
}

/* ********************************************************
 * id 한글사용 금지 validator
 ******************************************************** */
function fn_checkNotKorean(koreanStr){                  
    for(var i=0;i<koreanStr.length;i++){
        var koreanChar = koreanStr.charCodeAt(i);
        if( !( 0xAC00 <= koreanChar && koreanChar <= 0xD7A3 ) && !( 0x3131 <= koreanChar && koreanChar <= 0x318E ) ) { 
        }else{
            //hangul finding....
            return false;
        }
    }
    return true;
}

/* ********************************************************
 * 패스워드 변경 페이지 이동
 ******************************************************** */
function fn_passwordMove(){
    document.userManageVO.action = BASE_URL+'/userPasswordUpdate';
    document.userManageVO.submit();
}

/* ********************************************************
 * 유저 정보 수정 처리
 ******************************************************** */
function fn_update(){
//    if(validateUserManageVO(document.userManageVO)){
        document.userManageVO.submit();
//    }
}

/* ********************************************************
 * 유저 패스워드 수정 처리
 ******************************************************** */
function fn_passUpdate(){
    if(validatePasswordChgVO(document.passwordChgVO)){
        if(document.passwordChgVO.newPassword.value != document.passwordChgVO.newPassword2.value){
			let message=document.getElementById('pMessage').value;
            alert(message);
            return false;
        }
        document.passwordChgVO.submit();
    }
}
