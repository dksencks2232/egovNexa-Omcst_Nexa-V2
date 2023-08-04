const BASE_URL = sessionStorage.getItem("contextpath");

$(function(){
	$(".m_meun").click(function() {
		 $("#menubar").toggle();
		 $(".page_cover").toggle();
	});
});

function fn_egov_modal_create(){
	
    var $dialog = $('<div id="modalPan"></div>')
	//.html('<iframe style="border: 0px; " src="' + "<c:url value='/EgovPageLink.do'/>?" + "link=main/sample_menu/Intro" +'" width="100%" height="100%"></iframe>')
	.html(`<iframe style="border: 0px; " src="/EgovPageLink.do?link=main/sample_menu/Intro" width="100%" height="100%"></iframe>`)
	.dialog({
    	autoOpen: false,
        modal: true,
        width: 1250,
        height: 950
	});
    $(".ui-dialog-titlebar").hide();
	$dialog.dialog('open');
}

/**********************************************************
 * 사용자 정보 변경 버튼
 ******************************************************** */
function fnUserModify()
{
	//location.href = "/userModify?menuId=9030000";
	location.href = "/userConfirmPop";
}
/**********************************************************
 * 모달 종료 버튼
 ******************************************************** */
function fn_egov_modal_remove() {
	$('#modalPan').remove();
}

function getLastLink(baseMenuNo){
	var tNode = new Array;
    for (var i = 0; i < document.menuListForm.tmp_menuNm.length; i++) {
        tNode[i] = document.menuListForm.tmp_menuNm[i].value;
        var nValue = tNode[i].split("|");
        //선택된 메뉴(baseMenuNo)의 하위 메뉴중 첫번재 메뉴의 링크정보를 리턴한다.
        if (nValue[1]==baseMenuNo) {
            if(nValue[5]!="dir" && nValue[5]!="" && nValue[5]!="/"){
                //링크정보가 있으면 링크정보를 리턴한다.
                return nValue[5];
            }else{
                //링크정보가 없으면 하위 메뉴중 첫번째 메뉴의 링크정보를 리턴한다.
                return getLastLink(nValue[0]);
            }
        }
    }
}

function goMenuPage(baseMenuNo){
	document.getElementById("baseMenuNo").value=baseMenuNo;
	//document.getElementById("link").value=getLastLink(baseMenuNo);
    //document.menuListForm.chkURL.value=url;

    document.menuListForm.action = `/${getLastLink(baseMenuNo).substring(1)}`;
    document.menuListForm.submit();
}

function actionLogout()
{
    document.selectOne.action = "/uat/uia/actionLogout.do";
    document.selectOne.submit();
    //document.location.href = "<c:url value='/j_spring_security_logout'/>";
}



