
$(document).ready(function() {
	ajaxCl.ajaxCallFn();
});

let ajaxCl ={
	ajaxCallFn : function(){
				
		let baseMenuNo= $('#baseMenuNo').val()
				
		let url = "mainMenuList.ajax";
		let loginYn = document.getElementById("loginYn").value;
		
		//로그인시 메뉴 불러오기
		if(loginYn !=null && loginYn!=''){
			$.ajax({
				type : "POST",
				url : url,
				async : false,
				beforeSend : function(xhr){
							
				},
				success : function(result){
					let jsonRes = JSON.parse(result);
					$.each(jsonRes, function(i, item){
								
						if(item.upperMenuId == 0 ){
							let strMenu="";
								         strMenu   += '<ul class="list-unstyled ps-0">'
										               +'<li class="mb-1">'
													   +'<button id="b'+item.menuId+'" class="btn d-inline-flex align-items-center border-0 collapsed menu-btn"  data-bs-toggle="collapse" data-bs-target="#m'+item.menuId+'-collapse" aria-expanded="false">'
													   +item.menuNm+'</button>'
													   +'<div class="collapse menu-teb" id="m'+item.menuId+'-collapse">'
													   +'<ul id= "'+item.menuId+'" class="btn-toggle-nav list-unstyled fw-normal pb-1 small">'
													   +'</ul>'
													   +'</div>'
													   +'</li>'
													   +'</ui>'
							$("#targetMenu").append(strMenu);
						}else if(item.menuUrl == '/'){
									
							let strsubMenu1="";
								strsubMenu1 += '<li class="menu-sub-title"><h3>'+item.menuNm+'</h3></li>'
										
							let gMenuId = item.menuId+"G";
										
								if(gMenuId.indexOf('10000G') != -1){
									$("#"+item.upperMenuId).attr('id',item.menuId);
									$("#"+item.menuId).append(strsubMenu1);
								}else{
									let order= item.menuOrdr * 10000;
									let upperMenuId = item.upperMenuId+order;
									let premenuId= upperMenuId - 10000;
									$("#"+premenuId).attr('id',upperMenuId);
									$("#"+item.menuId).append(strsubMenu1);
								}						
											
						}else if(item.menuUrl != '/'){	 
									
							let strsubMenu2="";
							let numMenuId = item.menuId;
							let slicestr = numMenuId.toString();
							let sep="";
								slicestr = slicestr.substring(0,2);
								
								if("10"=== slicestr){
									sep="&";
								}else{
									sep="?";
								}
								
								strsubMenu2 +='<li id="'+item.menuId+'"><a href="'+BASE_URL+item.menuUrl+sep+'menuId='+item.menuId+'" class="d-inline-flex text-decoration-none rounded">'+item.menuNm+'</a></li>'
							$("#"+item.upperMenuId).append(strsubMenu2);
										
						}
					});
				},
				error : function(){
					alert("main menu 조회시 Error발생")
				}
						
			});
		}
				
		$('#b'+baseMenuNo).attr("aria-expanded", "true");
		$('#b'+baseMenuNo).attr("class", "btn d-inline-flex align-items-center border-0 menu-btn");
		$('#m'+baseMenuNo+'-collapse').attr("class", "menu-teb collapse show");
	}
			
}