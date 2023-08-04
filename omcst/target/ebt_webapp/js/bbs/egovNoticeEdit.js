
let PREFIX;
let ERROR_MSG;
let EDIT_MODE;

$(function(){	
	EDIT_MODE = cf_isEmpty($("input[name='nttId']").val()) ? "REGIST" : "UPDATE";
	PREFIX = $("input[name='prefix']").val();
	ERROR_MSG = $("input[name='errorMsg']").val();
	initEditor();
	if ($("input[name='fileAtchPosblAt']").val() == 'Y') {
		if(EDIT_MODE == "REGIST") {
			fileAttach();	
		} else if (EDIT_MODE == "UPDATE"){
			updateFileAttach();
		}
	}
});

function initEditor(){
	$('#summernote').summernote({
		height 		: 300, // 에디터 높이
		minHeight 	: null, // 최소 높이
		maxHeight 	: null, // 최대 높이
		focus 		: true, // 에디터 로딩후 포커스를 맞출지 여부
		lang 		: "ko-KR", // 한글 설정
		placeholder : '최대 2048자까지 쓸 수 있습니다', //placeholder 설정
		callbacks   : {
			onImageUpload : function(files, editor, welEditable) {
				// 파일 업로드(다중업로드를 위해 반복문 사용)
				for (var i = files.length - 1; i >= 0; i--) {
					uploadSummernoteImageFile(files[i], this);
				}
			},
			onPaste : function(e) {
				var clipboardData = e.originalEvent.clipboardData;
				if (clipboardData && clipboardData.items && clipboardData.items.length) {
					var item = clipboardData.items[0];
					if (item.kind === 'file' && item.type.indexOf('image/') !== -1) {
						e.preventDefault();
					}
				}
			}
		}
	});	
}

function uploadSummernoteImageFile(file, el) {
	let data = new FormData();
		data.append("file", file);
	$.ajax({
		url 		: `${BASE_URL}/uploadSummernoteImageFile.do`,
		type 		: "POST",
		enctype 	: 'multipart/form-data',
		data 		: data,
		cache 		: false,
		contentType : false,
		processData : false,
		success : function(data) {
			$(el).summernote('editor.insertImage', data["imgUrl"]);
		},
		error : function(e) {
			console.log(e);
		}
	});
}

function fn_egov_validateForm(obj) {
	return true;
}

function fn_egov_regist_notice() {
	if (!validateBoard(document.board)) {
		return;
	}

	if (confirm(ERROR_MSG)) {
		let sFixedAt = $("#fixedAt").is(":checked") ? "Y" : "N";
		$("#fixedAt").val(sFixedAt);
		document.board.action = EDIT_MODE == "REGIST" ? `/cop/bbs${PREFIX}/insertBoardArticle.do` : `/cop/bbs${PREFIX}/updateBoardArticle.do`;
		document.board.submit();
	}
}

function fn_egov_regist_gallery() {
	// 이미지 첨부 유효성 체크
	let imgArr = $('form[name=gallery]').find("img");
	if (imgArr.length == 0) {
		alert("갤러리 게시판의 경우 이미지 파일 첨부가 필수사항입니다.");
		return false;
	}

	// 첫번째 이미지를 썸네일로 지정
	$('input[name=thumbnailUrl]').val($(imgArr[0]).attr("src"));

	// 첨부한 이미지 목록 파라미터에 담기
	var imgUrlArr = [];
	for (var i = 0; i < imgArr.length; i++) {
		imgUrlArr[i] = $(imgArr[i]).attr("src");
	}

	$('input[name=imgUrlList]').val(imgUrlArr);

	if (confirm(ERROR_MSG)) {
		document.gallery.action = `/cop/bbs${PREFIX}/insertBoardGallery.do`;
		document.gallery.submit();
	}
}

function fn_egov_select_noticeList(formId) {
	var sUrl = `/cop/bbs${PREFIX}/selectBoardList.do`;
	if(formId == "board") {
		document.board.action = sUrl;
		document.board.submit();        		
	} else if (formId =="gallery") {
		document.gallery.action = sUrl;
		document.gallery.submit();        		
	}    
}

function fileAttach(){
	var maxFileNum = document.board.posblAtchFileNumber.value;
	if (maxFileNum == null || maxFileNum == "") { maxFileNum = 3; }
	var multi_selector = new MultiSelector(document.getElementById('egovComFileList'),maxFileNum);
		multi_selector.addElement(document.getElementById('egovComFileUploader'));	
}

function updateFileAttach(){
	let fileListCnt = document.board.fileListCnt.value;
	let existFileNum = cf_isEmpty(fileListCnt) ? 0 : fileListCnt;
    
	let fileNum = document.board.posblAtchFileNumber.value;
	let maxFileNum = cf_isEmpty(fileNum) ? 0 : fileNum;
    let uploadableFileNum = maxFileNum - existFileNum;

    if (uploadableFileNum < 0) { uploadableFileNum = 0; }
    
	if (uploadableFileNum != 0) {
        fn_egov_check_file('Y');
        var multi_selector = new MultiSelector( document.getElementById( 'egovComFileList' ), uploadableFileNum );
        	multi_selector.addElement( document.getElementById( 'egovComFileUploader' ) );
    } else {
        fn_egov_check_file('N');
    }	
}


function fn_egov_check_file(flag) {
    if (flag=="Y") {
        document.getElementById('file_upload_posbl').style.display = "block";
        document.getElementById('file_upload_imposbl').style.display = "none";          
    } else {
        document.getElementById('file_upload_posbl').style.display = "none";
        document.getElementById('file_upload_imposbl').style.display = "block";
    }
}