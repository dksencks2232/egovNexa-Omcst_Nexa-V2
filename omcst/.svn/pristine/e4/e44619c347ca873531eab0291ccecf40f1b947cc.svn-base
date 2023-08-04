	$(function(){
		var old_fn = $.datepicker._updateDatepicker;
		
		$.datepicker._updateDatepicker = function(sel1) {
		  old_fn.call(this, sel1);
		
		  var btnPane = $(this).datepicker("widget").find(".ui-datepicker-buttonpane");
		
		  $("<button type='button' class='ui-datepicker-clean ui-state-default ui-priority-primary ui-corner-all'>초기화</button>").appendTo(btnPane).click(function(e) {
		   	$.datepicker._clearDate(sel1.input);
		
		   	if($("#stDate").val() != "" && $('#edDate').val() == "")
		   	{	    		
		   		$('#edDate').val('');
		   	}	    	
		   	else if($("#stDate").val() == "" && $('#edDate').val() != "")
		   	{	    		
		   		$("#edDate").val('');
		   		//$('#latDate').val('');
		   	}
		   	else
		   	{	    	
		   	}
		  }) ;
		}
		
		$.datepicker._gotoToday = function(id) {
		   $(id).datepicker('setDate', new Date()).datepicker('hide').blur();
		};
		
		$("#stDate").datepicker(
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
			            var attDate = $('#stDate').val();
			            $('#latDate').datepicker('option', 'minDate', attDate);
			            $('img.ui-datepicker-trigger').css({'cursor':'pointer', 'margin-left':'5px', 'margin-bottom':'15px'});  //아이콘(icon) 위치
				   }	         
		});
		
		
		$("#edDate").datepicker(
		       {dateFormat:'yy-mm-dd'
		        , showOn: 'button'
		        , buttonImage: BASE_URL+'/images/ico_calendar.png'
		        , buttonImageOnly: true
				 , minDate: new Date($("#attDate").val())
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
			            var attDate = $('#attDate').val();
			            $('#edDate').datepicker('option', 'minDate', attDate);
			            $('img.ui-datepicker-trigger').css({'cursor':'pointer', 'margin-left':'5px', 'margin-bottom':'15px'});  //아이콘(icon) 위치
				   }	         

		        
		});
	    $('img.ui-datepicker-trigger').css({'cursor':'pointer', 'margin-left':'5px', 'margin-bottom':'15px'});  //아이콘(icon) 위치
        
	});
	
	function fn_search(){			    
//	    if($('#attDate').val() == "")
//	   	{
//	    	alert('출근일를 입력해주세요.');
//	   	}
//	    else
//	    {   
	    	document.antVO.action = BASE_URL+'/atnList';
	    	document.antVO.submit();
//	    }
	}
	
	function fn_checkIn(){
    	fn_transaction("/attendanceCheck.do", fn_search);
	}

	function fn_checkOut(){
		fn_transaction("/attendanceCheck2.do", fn_search);
 	}

	function fn_transaction(sUrl, callback){
		$.ajax({
    		url: BASE_URL + sUrl,
    		type: 'post',
    		data: {},
    		async: false,
    		success: function(data){
    			let dataObj = JSON.parse(data);
				alert(dataObj.message);
				if(dataObj.isSuccess) { callback();}
    		},
    		error:function(data){
				alert("시스템 오류입니다. 관리자에게 문의하세요");
    		}
    	});		
	}	
	
	function fn_uncheckedOut() {
	    var table = document.getElementById("attTable");
        var rows = table.getElementsByTagName("tr");
        var checkIds = "";

        for (let i = 1; i < rows.length; i++){
	        if( $("#fchkSpan"+i).attr("class") == "f_chk_only on" ){		       
		       checkIds += $("#checkId"+i).val()+",";
	        }	        
	        console.log("checkIds:: " + checkIds);
        }

        if(checkIds == ""){
	        alert("미퇴근처리 체크된 자료가 없습니다.");            
        }else{
	        checkIds = checkIds.substr(0, checkIds.length-1);
            $.ajax({
	    		url: BASE_URL + '/updateUncheckLat',
	    		type: 'post',
	    		data: {"latList" : checkIds},
                dataType: 'Json',
	    		async: false,
	    		success: function(data){
		            alert("미퇴근 처리 완료"); 	    			
		            fn_search();							
	    		},
	    		error:function(request,status,error){
		            console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					alert("시스템 오류입니다. 관리자에게 문의하세요");
	    		}
    	    });            
        }
 
	}	
