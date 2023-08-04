$(function(){
	
	let cnames = ['그룹ID', '그룹명','설명', '등록일자'];
	
	$("#jqGrid").jqGrid({
		url:`${BASE_URL}/jqGridGroupList`,
		datatype: "json",
		mtype: "POST",
        colNames: cnames,
        loadtext : "로딩중...",
        styleUI: 'Foundation',
        colModel:[
        	
                  {name:'groupId',index:'groupId', editable:false, width:300, key:true, align:"center"},
                  {name:'groupNm',index:'groupNm', editable:true, eidttype:'text', editoptions:{maxlength:10}, editrules:{custom:true, custom_func:mycheck}, width:300, align:"center"},
                  {name:'groupDc',index:'groupDc', editable:true, edittype:'text', editoptions:{maxlength:30},  width:300},
                  {name:'groupCreatDe',index:'groupCreatDe', editable:false, width:300, align:"center"},
                  
                  ],
        autowidth: true,  
        height: 480,
        rowNum: 10,  //보여줄 행의 개수 설정
        rowList: [10,20,30],  //한 화면에 보여줄 rowNum의 수를 조절 가능하도록 설정
        gridview :true,
        pager: '#jqGridPager',  //페이징 처리한 태그의 id값
        rownumbers  : true, //자동으로 번호부여
        sortable: true,
        /*  viewsortcols: [true,'vertical',true],*/
        sortname : 'groupCreatDe',
        sortorder : 'desc',
        loadonce: false,
        emptyrecords: "데이터가 없습니다.", 
        viewrecords : true,
        headertitles: true,
        caption:"사용자그룹관리",
        multiselect:true,
        multiboxonly:true,
        
        cellEdit:true, //그리드 수정가능
        cellSubmit: 'remote', //input focus out시 변경된 데이터 저장
        cellurl: `${BASE_URL}/jqGridGroupUpdate`, //update url..
        
        beforeSubmitCell:function(rowid, cellname, value){ //update전 실행
        	
        	return {"id":rowid, "cellName":cellname, "cellValue":value};
        	
        }
        
      
        
	});
	$("#jqGrid").jqGrid('navGrid','#jqGridPager',{edit:false,add:false,del:false,search:false});
});

//사용자 그룹추가 펑션
const gridFunc = {
		
	addRow: function(){
		const options ={
			modal : true,
			width : 400,
			url: `${BASE_URL}/jqGridGroupInsert`,
			mtype: 'POST',
			addCaption: "사용자그룹추가",
			cloaseAfterAdd: true,
			recreateForm: true, // 대화상자가 활성화 될때 마다 form 이 다시 생성된다
			reloadAfterSumit:true, //서버 ajax후 그리드 데이터 다시 로드
		
			beforeSubmit: function(postdata, formid){
				if(cf_isEmpty(postdata.groupNm.trim())){
					return[false,"그룹명은 필수 입력사항 입니다."]
				}
				if(postdata.groupNm.length > 10){
					return[false, "그룹명은 10자리를 넘을 수 없습니다."];
				}
				
				if(postdata.groupDc.length > 30){
					return[false, "설명은 30자리를 넘을 수 없습니다."];
				}
				return [true, ' '];
			}
		}
		$("#jqGrid").jqGrid('editGridRow', "new", options);
	},
	
	deleteRow: function(){
		
		let id = $("#jqGrid").getGridParam('selarrrow'); // 멀티셀렉트에 선택된 행만 가져오기
		let data = ""
			
		for(let i=0; i< id.length; i++){
			
			let rowdata = $("#jqGrid").getRowData(id[i]);
			
			if(i == 0){
				data += rowdata.groupId
			}else{
				data += ';' + rowdata.groupId;
			}
				
		}
		
		if(id.length < 1){
			alert("삭제할 data를 선택하세요");
			return false;
		}else if(confirm("총 "+ id.length +"개의 data를 삭제하시겠습니까?")){
			$.ajax({
				url: `${BASE_URL}/jqGridGroupDelete`,
				dataType: 'json',
				type: 'POST',
				data: {data: data},
				success: function(data){
					console.log(data.result);
					getGridData(); //grid Reload
				},
				error: function(jqXHR, textStatus, errorThrown){
					console.log(jqXHR);
					console.log(textStatus);
					console.log(errorThrown);
				}
				
			});
			
		}
		return false;
			
	}
	
}

function press(event) {

    if (event.keyCode==13) {
    	fn_select_groupList();
    }
}

function fn_select_groupList(){
	
	let searchCnd = $("#searchCnd").val();
	let searchWrd = ($("#searchWrd").val()).trim();
	let postData = {'searchCnd' : searchCnd, 'searchWrd': searchWrd}
		
	$("#jqGrid").jqGrid("clearGridData", true);
		
	$("#jqGrid").setGridParam({
		dataType : "json",
		postData : postData,
		loadComplete :  function(data){
			
		}
	}).trigger('reloadGrid');
		
}

function getGridData(){
	$("#jqGrid").trigger('reloadGrid');
}

let mycheck = function(val, nm, valref){
	
	let value = val.trim();
	
	if(cf_isEmpty(value)){
		return [false, "그룹명은 필수 입력사항 입니다."];
	}else{
		return [true, ""];
	}
}


