/****************************************************************
 * 
 * 파일명 : userAbsnce.js
 * 설  명 : 사용자부재
 * 
 *    수정일      수정자     Version        Function 명
 * ------------    ---------   -------------  ----------------------------
 * 2023.02.21    csh       1.0             최초생성
 * 
 * 
 * **************************************************************/

/* ********************************************************
 * 검색 처리 
 ******************************************************** */
function fn_selectUserAbsnceList(pageNo) {
    document.listForm.searchCondition.value = "1";
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = BASE_URL+'/userAbsnceList';
    document.listForm.submit();
}

/* ********************************************************
 * 등록 페이지 이동
 ******************************************************** */
function fn_selectUserAbsnce(userId, regYn) {
    if(regYn == 'N') {
        if(confirm("등록된 사용자부재 정보가 없습니다. 등록페이지로 이동하시겠습니까?")) {
            location.replace(BASE_URL+'/addViewUserAbsnce?userId='+userId);
        } else {
            return;
        }
    }
    document.listForm.userId.value = userId;
    document.listForm.action = BASE_URL+'/getUserAbsnce';
    document.listForm.submit();     
}



/* ********************************************************
 * 페이징 처리
 ******************************************************** */
function fn_linkPage(pageNo){
    document.listForm.searchCondition.value = "1";
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = BASE_URL+'/userAbsnceList';
    document.listForm.submit();
}

/* ********************************************************
 * 사용자명 검색
 ******************************************************** */
function fn_press() {

    if (event.keyCode==13) {
        fn_selectUserAbsnceList('1');
    }
}

/* ********************************************************
 * 목록 페이지로 이동
 ******************************************************** */
function fnc_selectUserAbsnceList() {
    let varFrom = document.getElementById("userAbsnce");
    varFrom.action = BASE_URL+'/userAbsnceList';
    varFrom.submit();       
}

/* ********************************************************
 * 등록 처리
 ******************************************************** */
function fnc_userAbsnceInsert() {

    let varFrom = document.getElementById("userAbsnce");
    varFrom.action = BASE_URL+'/addUserAbsnce';
	let message=document.getElementById('rMessage').value;
    if(confirm(message)){
        varFrom.submit();
    }
}

/* ********************************************************
 * 수정 처리
 ******************************************************** */
function fnc_userAbsnceUpdate() {
    let varFrom = document.getElementById("userAbsnce");
    varFrom.action = BASE_URL+'/updtUserAbsnce';
	let message=document.getElementById('uMessage').value
    if(confirm(message)){
        varFrom.submit();
    }
}

/* ********************************************************
 * 삭제 처리
 ******************************************************** */
function fnc_userAbsnceDelete() {
    let varFrom = document.getElementById("userAbsnce");
    varFrom.action = BASE_URL+'/removeUserAbsnce';
	let message=document.getElementById('dMessage').value
    if(confirm(message)){
        varFrom.submit();
    }
}


/*function fncCheckAll() {
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
}*/

/*function fncManageChecked() {

    var checkField = document.listForm.delYn;
    var checkId = document.listForm.checkId;
    var returnValue = "";
    var returnBoolean = false;
    var checkCount = 0;
    
    if(checkField) {
        if(checkField.length > 1) {
            for(var i=0; i<checkField.length; i++) {
                if(checkField[i].checked) {
                    checkCount++;
                    checkField[i].value = checkId[i].value;
                    if(returnValue == "")
                        returnValue = checkField[i].value;
                    else 
                        returnValue = returnValue + ";" + checkField[i].value;
                }
            }
            if(checkCount > 0) 
                returnBoolean = true;
            else {
                alert("선택된 사용자가 없습니다.");
                returnBoolean = false;
            }
        } else {
            if(document.listForm.delYn.checked == false) {
                alert("선택된 사용자가 없습니다.");
                returnBoolean = false;
            }
            else {
                returnValue = checkId.value;
                returnBoolean = true;
            }
        }
    } else {
        alert("조회된 결과가 없습니다.");
    }

    document.listForm.userIds.value = returnValue;
    return returnBoolean;
}*/

/*function fncInsertCheckId() {

    var checkedCounter = 0;
    var checkIds = document.listForm.delYn;
    var checkIdv = document.listForm.checkId;
    var checkRegYn = document.listForm.regYn;

    if(checkIds == null) { 
        alert("조회 후 등록하시기 바랍니다");
        return;
    } 
    else {

        for(var i=0; i<checkIds.length; i++) {
            if(checkIds[i].checked) {
                if(checkRegYn[i].value == 'Y') {
                    alert("이미 등록되어 있습니다.");
                    return false;;
                }                
                document.listForm.userId.value = checkIdv[i].value;
                checkedCounter++;
            }
        }

        if(checkedCounter > 1) {
            alert("등록대상 하나만 선택하십시오");
            return false;
        } else if(checkedCounter < 1) {
            alert("선택된 등록대상이  없습니다");
            return false;
        }

        return true;
    }
}*/

/*function fncAddUserAbsnceInsert() {
    if(fncInsertCheckId()) {
        document.listForm.action = "<c:url value='/addViewUserAbsnce'/>";
        document.listForm.submit();    
    }
}*/

/*function fncLoginUserAbsnceListDelete() {
    if(fncManageChecked()) {
        if(confirm('<spring:message code="common.delete.msg" />')) {
            document.listForm.action = "<c:url value='/removeUserAbsnceList'/>";
            document.listForm.submit();
        }
    }
}*/
