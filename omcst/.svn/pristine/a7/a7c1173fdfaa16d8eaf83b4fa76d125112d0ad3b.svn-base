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
let PARKING_MAP = null;
let GEOCODER = new kakao.maps.services.Geocoder();

// 기본값 서울특별시
let CENTER_COORDS = { lat : "37.566761128870546", lng : "126.97862963872868"};

$(function(){
	fn_initPage();
	fn_initEvent();
	fn_getParkingCoords();
	$("#parkingMap").hide();
});

function fn_initPage(){
	fn_createMap(fn_callbackMap);
}

function fn_initEvent(){
	$("#bjdCode").change(function(){
		// fn_changeCenterCoords();
	});	

	$("#mapBtn").click(function(){
		if($("#parkingMap").is(':visible')) {
			$("#parkingMap").hide();
		} else {
			$("#parkingMap").show();
		}	
	});		
}

function fn_createMap(callback){
	//지도를 담을 영역의 DOM 레퍼런스
	let container = document.getElementById('parkingMap'); 
	
	//지도를 생성할 때 필요한 기본 옵션
	let options = { 
		center: new kakao.maps.LatLng(CENTER_COORDS.lat, CENTER_COORDS.lng), //지도의 중심좌표.
		level: 6 //지도의 레벨(확대, 축소 정도) 															 
	};
	PARKING_MAP = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
	callback("MAP");
}


function fn_callbackMap(sId){
	switch(sId){
		case "MAP":
			/*kakao.maps.event.addListener(PARKING_MAP, 'center_changed', function() {
				var message =  `<p>중심 좌표는 위도: ${PARKING_MAP.getCenter().getLat()}, 경도: ${PARKING_MAP.getCenter().getLng()}`;
			    document.getElementById('result').innerHTML = message;
				
			});	*/			
			break;
			
		case "MARKER":
			break;
			
		default:
			break;
	}	
}

function fn_getParkingCoords(){
	// 마커를 표시할 위치와 title 객체 배열입니다 
	let trList = $('tbody').children('tr');
	for(let obj of trList) {
		GEOCODER.addressSearch($(obj).find("td[data-col='ADDR']")[0].innerText, function(result, status) {
			if (status === kakao.maps.services.Status.OK) {
				fn_markerConfig(result[0].y,result[0].x,obj);
			}
		});		
	}
}


function fn_markerConfig(lat,lng,obj){
	// console.log(lat);
	// console.log(lng);
	// console.log(obj);
	
	let tdTag = $(obj).find("td[data-col='PAY_NM']")[0];
	
	let oData = {};
		oData.title = $(obj).find("td[data-col='PARKING_NAME']")[0].innerText;
		oData.latlng = new kakao.maps.LatLng(lat,lng);
		oData.payYn = $(tdTag).data('code');
	
	fn_drawMarkerTest(oData);
}

function fn_drawMarkerTest(oData){
	// 마커 이미지의 이미지 주소입니다
	let freeImageSrc = "/images/freeParking.png"; 
	let tollImageSrc = "/images/tollParking.png";  
	   
    // 마커 이미지의 이미지 크기 입니다
    let imageSize = new kakao.maps.Size(34, 35); 
    
    // 마커 이미지를 생성합니다    
	let imageSrc = oData.payYn == 'Y' ? tollImageSrc : freeImageSrc;
    let markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
    
    // 마커를 생성합니다
    let marker = new kakao.maps.Marker({
        map		 : PARKING_MAP, // 마커를 표시할 지도
        position : oData.latlng, // 마커를 표시할 위치
        title 	 : oData.title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
        image 	 : markerImage, // 마커 이미지 
		clickable: true // 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다
    });

	// 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
	var iwContent = '<div style="padding:5px;">Hello World!</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
	    iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
	
	// 인포윈도우를 생성합니다
	var infowindow = new kakao.maps.InfoWindow({
	    content   : iwContent,
	    removable : iwRemoveable
	});
	
	// 마커에 클릭이벤트를 등록합니다
	kakao.maps.event.addListener(marker, 'click', function() {
		infowindow.open(PARKING_MAP, marker);  // 마커 위에 인포윈도우를 표시합니다
	});
}

function fn_linkPage(pageNo){
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action ='/parkingLotDataApi';
    document.listForm.submit();
}


function fn_search(){
	document.listForm.pageIndex.value = 1;
	document.listForm.method = 'get';
	document.listForm.action = '/parkingLotDataApi';
	document.listForm.submit();			
}

function fn_focusMap(e){
	GEOCODER.addressSearch(e.innerText, function(result, status) {
		if (status === kakao.maps.services.Status.OK) {
			PARKING_MAP.setCenter(new kakao.maps.LatLng(result[0].y, result[0].x));
			PARKING_MAP.setLevel(3);
			$("#parkingMap").show();			
		}
	});		
}