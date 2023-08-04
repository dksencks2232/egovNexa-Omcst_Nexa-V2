/****************************************************************
 * 
 * 파일명 : join.js
 * 설  명 : 일반회원가입
 * 
 *    수정일      수정자     Version        Function 명
 * ------------    ---------   -------------  ----------------------------
 * 2023.03.14    kje       1.0             최초생성
 * 
 * 
 * **************************************************************/
const BASE_URL= sessionStorage.getItem("contextpath");

let isCheckedId = false;
const ID_REGEXP = /^[a-z0-9_]{5,20}$/;
const PASSWORD_REGEXP = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,20}$/;
const EMAIL_REGEXP = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;

let code;

let timer;
let isRunning = false;
let resultMsg = $('#mail-check-warn'); // 이메일 인증관련 메세지
let checkInput = $('.mail-check-input'); // 이메일 인증번호 입력하는곳 
let mberEmailAdres = $("[name='mberEmailAdres']"); // 이메일 인증확인용 변수

$(function(){
	
	const selectEmail = $("#selectEmail");
	const selboxDirect = $("#selboxDirect");
	const selectEmailWrapper = $("#select-email");
	const closeEmail = $("#close-email");
	
	closeEmail.hide();

	selectEmail.change(function() {
		if(selectEmail.val() === "myemail") {
			selboxDirect.show();
			closeEmail.show();
			selectEmail.hide();
			selectEmailWrapper.hide();
			selectEmail.val('');
		} else {
			selboxDirect.hide();
		}	
	});

	closeEmail.click(function(){
		selectEmail.find("option:eq(0)").prop("selected", true);
		selectEmail.show();
		selectEmailWrapper.show();
		closeEmail.hide();
		selboxDirect.hide();
		selboxDirect.val('');
	});
	
	$("#joinBtn").on("click", function () {
        fn_transaction("join");
	});
	
	$("#email_check").on("click", function () {
        fn_transaction("checkemail");
	});
	
	$("[name='mberId']").on("focusout", function () {
		$("#availableId").hide();
		$("#unavailableId").hide();
		if(fn_ValidationId($(this))) {
			isCheckedId = true;
			$("#availableId").show();
		} else {
			$("#unavailableId").show();
		}
	});
	
	$("[name='password']").on("focusout", function () {
		if(fn_ValidationPassword($(this))) {
			$("#checkPass").hide();
		} else {
			$("#checkPass").show();
		}
	});	
	
	$("[name='rePassword']").on("focusout", function () {
		if(fn_ValidationRePassword($(this))) {
			$("#checkRePass").hide();
		} else {
			$("#checkRePass").show();
		}
	});	
	
	$("[name='mberNm']").on("focusout", function () {
		if(!cf_requried_value($(this))) { 
			$("#checkMberNm").text("필수 정보입니다.");
			$("#checkMberNm").show();
		} else {
			$("#checkMberNm").hide();
		}
	});
	
});

// 인증번호 발송하고 타이머 함수 실행
function fn_sendAuthNum(){
    // 남은 시간
	let leftSec = 180,
	display = document.querySelector('#timer');
	// 이미 타이머가 작동중이면 중지
	if (isRunning){
	   clearInterval(timer);
	} else {
    	isRunning = true;
    }
     fn_startTimer(leftSec, display);
}
 
function fn_startTimer(count, display) {
        let minutes, seconds;
        timer = setInterval(function () {
        minutes = parseInt(count / 60, 10);
        seconds = parseInt(count % 60, 10);
 
        minutes = minutes < 10 ? "0" + minutes : minutes;
        seconds = seconds < 10 ? "0" + seconds : seconds;
 
        display.textContent = minutes + ":" + seconds;
 
        // 타이머 끝
        if (--count < 0) {
		     clearInterval(timer);
		     display.textContent = "";
		     isRunning = false;
			 resultMsg.html('인증시간(3분)이 초과되었습니다. 다시 시도해주세요.');
			 resultMsg.css('color','red');
		     checkInput.val('');
			 checkInput.attr('disabled',true);
        }else{
			$('.mail-check-input').blur(function () {
				let inputCode = $(this).val();
				
				if(inputCode == code){
					clearInterval(timer);
					resultMsg.html('인증번호가 일치합니다.');
					resultMsg.css('color','blue');
					$('#mail-Check-Btn').attr('disabled',true);
					$("[name='mberEmailAdres']").val(email);
					$("[name='preEmail']").attr('readonly',true);
					$("[name='postEmail']").attr('readonly',true);
				}else{
					resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요!.');
					resultMsg.css('color','red');
				}
			});
		}
    }, 1000);
}

function fn_ValidationId(target){
	isCheckedId = false;
	$("#unavailableId").text("");
	if(!cf_requried_value(target)) { 
		$("#unavailableId").text("필수 정보입니다.");
		return false; 
	}	
	if(!ID_REGEXP.test(target.val())) { 
		$("#unavailableId").text("5~20자의 영문 소문자, 숫자만 사용 가능합니다.");
		return false; 
	}
	if(!fn_transaction("duplicatedId")) { 
		$("#unavailableId").text("이미 사용중인 아이디입니다.");
		return false
	};
	return true;
}

function fn_ValidationPassword(target){
	$("#checkPass").text("");
	if(!cf_requried_value(target)) { 
		$("#checkPass").text("필수 정보입니다.");
		return false; 
	}	
	if(!PASSWORD_REGEXP.test(target.val())) { 
		$("#checkPass").text("8~20자 영문 대 소문자, 숫자를 사용하세요.");
		return false; 
	}	
	return true;
}

function fn_ValidationRePassword(target){
	$("#checkRePass").text("");
	if(!cf_requried_value(target)) { 
		$("#checkRePass").text("필수 정보입니다.");
		return false; 
	}	
	if($("[name='password']").val() != target.val()) { 
		$("#checkRePass").text("비밀번호가 일치하지 않습니다.");
		return false; 
	}	
	return true;
}

function fn_ValidationEmail(target){
	if(!EMAIL_REGEXP.test(target)) { 
		alert('잘못된 이메일 입니다.');
		return false; 
	}
	return true;
}

function fn_duplicatedEmail(email){
	let result = false;
	$.ajax({
		url: BASE_URL +'/duplicatedEmail',
		type: 'post',
		data: {email: email},
		async: false,
		success: function(data){
			result =  true;
		}
	});
	return result;
}


function fn_transaction(sId){
	switch(sId){
		case "duplicatedId" :
			let bResult = false;
			$.ajax({
			    url: BASE_URL+'/duplicatedId',
			    type: "POST",
			    async: false, 
			    data: { mberId : $("[name='mberId']").val() }, 
				success : function(data) {
					bResult = true;
			    }, 
			    error : function(xhr, status, error){
					// todo
			    }
			});						
			return bResult;
			break;
		case "join":
			// 이메일 인증확인
			if(mberEmailAdres.val() ==null || mberEmailAdres.val() ==''){
				alert('이메일 인증은 필수 입니다.');
				return false;
			}
			
			if(!validateMemberVO(document.memberVO)) { 
				return false;
			}
			
			let params = $("form").serialize();
		
			$.ajax({
			    url: BASE_URL+'/join',
			    type: "POST",
			    async: true, 
			    data: params, 
				success : function(data) {
					location.href= BASE_URL+'/welcome';
			    }, 
			    error : function(xhr, status, error){
					alert(xhr.responseText);
			    }
			});
		break;
		case "checkemail"://이메일 인증
			let postEmail =$("[name='postEmail']").val();
			
			if(postEmail == null){
				postEmail = $("#selboxDirect").val();
			}
			email =  $("[name='preEmail']").val() + '@' + postEmail ;// 이메일 주소값 얻어오기!
			//console.log('완성된 이메일 : ' + email); // 이메일 오는지 확인
			
			if(!fn_duplicatedEmail(email)){
				alert('이미 사용중이거나 중복된 이메일 입니다.');
				return false;
			}
			
			if(!fn_ValidationEmail(email)){
				return false;
			}
			
			$.ajax({
				type : 'post',
				url : BASE_URL+'/mailCheck',
				data: {"email" : email},
				dataType: 'Json',
				async: false, 
				success : function (data) {
					checkInput.attr('disabled',false);
					code = data;
					alert('인증번호가 전송되었습니다.');
					fn_sendAuthNum();
				}	
			});
		break;
			
		default:
			break;
	}
}

