function fn_searchYearVacation(){
	document.listForm.action = `${BASE_URL}/vacation`;
	document.listForm.submit();		
}
	
function fn_insertYearvacation(){
	document.listForm.action= `${BASE_URL}/vacationInfo`;
	document.listForm.submit();
}
	

function fn_updateYearVacation(btnType) {

    if(!cf_isChecked('delYn','checkVcIdForDel')) { return false; }
    
    if(confirm(MSG.DELETE)){
        document.listForm.action = `${BASE_URL}/deleteVacation`;
        document.listForm.method = 'post'
        document.listForm.submit();
    }
  
}
