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
let CURRENT_YEAR = new Date().getFullYear();
let BG_COLOR_LIST = ["#F8D374","#FFA374","#FF9797","#DE6863","#BACD9D","#92AD65","#919E7D", "#8ED2CD","#82CFED","#7193BD","#5A7596","#6667AB","#9B9B9B","#636363"];

// 값이 없는 경우 최근 5개년 제공
let sFromYear = $("[name='sttsYearFrom']").val();
let sToYear = $("[name='sttsYearTo']").val();
let fromYear = sFromYear.trim().length == 0 ? CURRENT_YEAR - 5 : Number(sFromYear);
let toYear = sToYear.trim().length == 0 ? CURRENT_YEAR : Number(sToYear);

let CHART_TYPE = "";
	CHART_TYPE = "bar"; //default
let ODATA = {};
let YEAR_LIST = [];
let DATA_LIST = [];
let MY_CHART;
let myChart2;

$(function(){
	let viewType = $("[name='viewType']").val();
	setViewType(viewType);	

	$("#seleBtn").on("click", function () {
		fn_search();
	});	
	$("#tableBtn").on("click", function () {
		setViewType("TABLE");
	});
	$("#chartBtn").on("click", function () {
		setViewType("CHART");
	});
	
	$(".chart_type_btn").on("click", function () {
		CHART_TYPE = $(this).attr("id");
		//fn_setChartConfig();
		if(CHART_TYPE == 'linebar')
		{
		}
		else
		{		
			fn_setChartConfig();
		}		
		
	});
});

function setViewType(sType){
	switch(sType) {
		case "TABLE":
			$("#board_table").show();
	
			$("#board_chart").hide();
			$("#bar").hide();
			$("#line").hide();
			$("#pie").hide();
			$("#linebar").hide();
						
			$("[name='viewType']").val(sType);		
			break;
			
		case "CHART":
			$("#board_table").hide();
			
			$("#board_chart").show();	
			$("#bar").show();
			$("#line").show();
			$("#pie").show();
			$("#linebar").show();
						
			$("[name='viewType']").val(sType);
			fn_getChartData();		
			break;
			
		default:
			break;
	}
}
function fn_linkPage(pageNo){
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action ='/houseEmpDataApi';
    document.listForm.submit();
}

function fn_search(){
	if(fn_validation()) { 
		document.listForm.pageIndex.value = 1;
		document.listForm.method = 'post';
	    document.listForm.action = '/houseEmpDataApi';
		document.listForm.submit();			
	}
}

function fn_validation(){
	if($("#bjdCode").val().trim().length == 0) {
		alert("행정구역 코드를 선택해주세요");
		return false;
	}
	
	if(cf_isEmpty($("#sttsYearFrom").val()) || cf_isEmpty($("#sttsYearTo").val())) {
		alert("연도기간을 정확히 입력해주세요");
		return false;
	}
					
	return true;
}

function fn_getChartData() {
	let oData = { bjdCode 		: $("[name='bjdCode']").val(),
				  sttsYearFrom 	: $("[name='sttsYearFrom']").val(),
				  sttsYearTo 	: $("[name='sttsYearTo']").val()};
	$.ajax({
	    url		: `${BASE_URL}/houseEmpChartData`,
	    type	: "GET",
	    async	: false, // 동기식
	    data	: oData, 
		success : function(data) {
			fn_filterData(data);
	    }, 
	    error : function(xhr, status, error){
			// todo
	    }
	});			
}

function fn_filterData(dataArray){
	let dupArray = dataArray.filter(data => Number(data.STTS_YEAR) >= fromYear && Number(data.STTS_YEAR) <= toYear);
	let uniqueArray = [...new Set(dupArray.map(item => JSON.stringify(item)))].map(item => JSON.parse(item));
	fn_setChartConfig(uniqueArray);
}

function fn_setChartConfig(data = undefined){
	if(data != undefined) {
		YEAR_LIST = [];
		DATA_LIST = [];
		for(let obj of data) {
			YEAR_LIST.push(obj.STTS_YEAR);	
			DATA_LIST.push(obj.VCN_ST);
		}		
	}
	
	ODATA = {};
	ODATA.label = "빈집 수";
	ODATA.data = DATA_LIST;

	switch(CHART_TYPE) {
		case "bar":
		case "pie":
			ODATA.backgroundColor = BG_COLOR_LIST;
			break;
			
		case "line":
			ODATA.borderColor 	   = 'rgb(255, 99, 132)';
			ODATA.backgroundColor  = 'rgba(255, 99, 132,0.5)';
	        ODATA.pointStyle 	   = 'circle',
	        ODATA.pointRadius 	   = 10,
	        ODATA.pointHoverRadius = 15			
			break;
		
		default:
			break;
	}
	
	fn_createChart();
}

function fn_createChart(){
	if(MY_CHART !== undefined) { MY_CHART.destroy(); } //차트초기화
	if(myChart2 !== undefined) { myChart2.destroy(); } //차트초기화
	
	let chartArea = document.getElementById('myChart').getContext('2d');
	let bjdCode = $("[name='bjdCode']").val();
		
	MY_CHART = new Chart(chartArea, {
	    type: CHART_TYPE,
	    data: {
	        labels: YEAR_LIST,
	        datasets: [ODATA]
	    },

		options: {
			responsive: false,
			plugins: {
				title: {
					display:true,
					text:`${bjdCode} 빈집 현황`
				},		
				legend:true,
			}
		}
	});		
}
