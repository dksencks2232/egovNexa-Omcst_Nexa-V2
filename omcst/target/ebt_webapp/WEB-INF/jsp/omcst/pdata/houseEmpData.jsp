<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy" var="currentYear"/>
<c:set var="minYear" value="2015" />

<!DOCTYPE html>
<html>
<head>
<title>내부업무 사이트 > 샘플화면(기능별 생성)</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<script src="<c:url value='/'/>js/jquery-1.11.2.min.js"></script>
	<script src="<c:url value='/'/>js/ui.js"></script>
	<script src="<c:url value='/'/>js/jquery.js"></script>
	<script src="<c:url value='/'/>js/jqueryui.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/chart.js@3.5.1/dist/chart.min.js"></script>
	<script defer src="<c:url value='/js/common/Common.js' />"></script>	
	<script type="text/javascript" src="<c:url value='/js/EgovCalPopup.js'/>" ></script>
	<script defer src="<c:url value='/js/pdata/houseEmpData.js' />"></script>
	<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@2.0.0"></script>
	
<style type="text/css">
	img {
	    border: 0;
	    vertical-align: middle;
	}
	.myChart {
		width: 100% !important;
		height: 50% !important;
	}	
	
</style>
<script>
function arrayMax(arr) {
	  // 배열의 요소가 무조건 존재할 경우 max = arr[0]로 변경 가능
	  var len = arr.length, max = -Infinity;
	  while (len--) {
	    if (arr[len] > max) {
	      max = arr[len];
	    }
	  }
	  return max;
	};
	
	$(function(){
		$('#linebar').click(function(){
			if(MY_CHART !== undefined) { MY_CHART.destroy(); } //차트초기화
			
			let dataList = [10, 200, 130, 350];
			let yMaxRange = arrayMax(dataList)+50;

			Chart.register(ChartDataLabels);
			const ctx2 = document.getElementById('myChart').getContext('2d');
			const layoutOptions =  {
				    padding: {
				        top: 30  // Add 30 pixels of padding to top of chart.
				    }
				};
			
			myChart2 = new Chart(ctx2, {
			    data: {
			        datasets: [{
			            type: 'bar',
			            label: '바차트',
			            data: dataList,
			            datalabels: {
			              // display labels for this specific dataset
			              display: false
			            },            

			            backgroundColor: [
			                'rgba(219, 52, 77, 0.2)',
			                'rgba(54, 162, 235, 0.2)',
			                'rgba(255, 206, 86, 0.2)',
			                'rgba(75, 192, 192, 0.2)',
			            ],
			            borderColor: [
			                'rgba(255, 99, 132, 1)',
			                'rgba(54, 162, 235, 1)',
			                'rgba(255, 206, 86, 1)',
			                'rgba(75, 192, 192, 1)',
			            ],
			            borderWidth: 1
			            
			        }, {
			            type: 'line',
			            label: '라인차트',

			            data: dataList,
			      			backgroundColor: 'rgba(153, 255, 153, 1)',
			      			borderColor: 'rgba(153, 255, 153, 1)',
			        }],
			        labels: ['샘플1', '샘플2', '샘플3', '샘플4'],

			    },
			    options: {
			        layout: layoutOptions,
			        scales: {
	    					y: { // [y 축 관련 설정] 
	    						min: 0, // [y 축 데이터 설정 0 ~ 30 까지 제한]
	    						max: yMaxRange,
	    						grid: { // [y 축 데이터 시트 배경 선색 표시]
	    							drawBorder: false,
	    							color: function(context) {
	    								if (context.tick.value >= 20) {
	    									return 'rgba(0, 0, 255, 0.2)'; // 파랑
	    								}
	    								else if (context.tick.value < 20 && context.tick.value >= 10) {
	    									return 'rgba(255, 0, 0, 0.2)'; // 빨강
	    								}
	    								else {
	    									return 'rgba(0, 0, 0, 0.2)'; // 검정색
	    								}    								
	    							}
	    						},
	    						ticks: {
	    							//color: '#911', // [y 축 폰트 색상 설정]
	    							font: { // [y축 폰트 스타일 변경]
	    								family: 'Comic Sans MS',
	    								size: 15,
	    								//weight: 'bold',
	    								lineHeight: 1.2,   
	    							} 
	    						}
	    					},
			              x: {
			                ticks: {
			                  color: 'black',       
			                   maxRotation: 45,
			                   minRotation: 45, 
   								font: { // [y축 폰트 스타일 변경]
									family: 'Comic Sans MS',
									size: 15,
									//weight: 'bold',
									lineHeight: 1.2,   
								}			              
			                }
			              }
			        
			        },
			        plugins: {
			            legend: { display: true },
			            datalabels: { anchor: 'end', align: 'top' }
			        }
			    }
			});			
		});
		
	});
</script>

</head>
<body>
<noscript>자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

    <!-- Skip navigation -->
    <a href="#contents" class="skip_navi">본문 바로가기</a>

    <div class="wrap">
        <div class="container">
            <div class="sub_layout">
                <div class="sub_in">
                    <div class="layout">
                        <div class="content_wrap">
                            <div id="contents" class="content">
                            	<form name="listForm" method="get">                            	
									<input name="viewType" type="hidden" value="<c:out value='${houseEmpDataSearchVO.viewType}'/>"/>                            	
	                                <input name="pageIndex" type="hidden" value="<c:out value='${houseEmpDataSearchVO.pageIndex}'/>"/>
									<div class="condition2">
	                                	<div class="con2_wrap">
											<div>
												<span class="lb ml20 mr10">행정구역</span>
												<label class="item f_select">
			                                        <select class="select" name="bjdCode" id="bjdCode" title="행정구역">
														<option value="" <c:if test="${houseEmpDataSearchVO.bjdCode eq ''}">selected="selected"</c:if>>선택</option>			                                        	
			                                        	<c:forEach var="city" items="${cityList}" varStatus="status">
			                                                <option value="${city.key}" <c:if test="${houseEmpDataSearchVO.bjdCode eq city.key}">selected="selected"</c:if>>
			                                                	${city.value}
			                                                </option>
			                                        	</c:forEach>			                                        	
			                                        </select>			       
			                                    </label>
		                                    </div>
		                                    &nbsp
	                                		<div>
			                                	<label for="occurDate" class="item mr10">연도기간</label>
												<label class="item f_select">
													<select name="sttsYearFrom" id="sttsYearFrom">         
														<fmt:formatDate value="${now}" pattern="yyyy" var="currentYear"/>
														<c:forEach begin="0" end="${currentYear - minYear}" var="year" step="1">
															<option value="${currentYear-year}" <c:if test="${houseEmpDataSearchVO.sttsYearFrom eq currentYear-year}">selected="selected"</c:if>>
																${currentYear-year}
															</option>
														</c:forEach>
													</select>		       
			                                    </label>			                                	
			                                    <%-- <input type="text" name="sttsYearFrom" id="sttsYearFrom" class="f_date" maxlength="4" value="<c:out value='${houseEmpDataSearchVO.sttsYearFrom}'/>" title="시작일자입력"> --%>
			                                    &nbsp; ~ &nbsp;
												<label class="item f_select">
													<select name="sttsYearTo" id="sttsYearTo">         
														<c:forEach begin="0" end="${currentYear - minYear}" var="year" step="1">
															<option value="${currentYear-year}" <c:if test="${houseEmpDataSearchVO.sttsYearTo eq currentYear-year}">selected="selected"</c:if>>
																${currentYear-year}
															</option>
														</c:forEach>
													</select>			       
			                                    </label>			                                    
			                                    <%-- <input type="text" name="sttsYearTo" id="sttsYearTo" class="f_date" maxlength="4" value="<c:out value='${houseEmpDataSearchVO.sttsYearTo}'/>" title="종료일자입력"> --%>
											</div>
		                                    <div id="seleBtn" class="item btn btn_gray_46 w_100">조회</div>    
	                                    </div>                                
		                            </div>     
		                            <p>*차트 클릭 시 차트로 데이터 제공, 테이블 클릭 시 테이블로 데이터 제공</p>       
		                            
		                           <div class="mt20 mb20 al_r">
		                           		<div id="linebar" class="btn btn_blue_46 w_100 chart_type_btn" style="display:none;">라인&막대</div>
		                           		<div id="bar" class="btn btn_blue_46 w_100 chart_type_btn" style="display:none;">막대</div>
		                           		<div id="line" class="btn btn_blue_46 w_100 chart_type_btn" style="display:none;">라인</div>
		                           		<div id="pie" class="btn btn_blue_46 w_100 chart_type_btn" style="display:none;">파이</div>
		                           		
		                           		<div id="chartBtn" class="btn btn_blue_46 w_100">차트</div>
										<div id="tableBtn" class="btn btn_blue_46 w_100">테이블</div>	 
	                                </div>                    
	                                                           
	                                <!--// 검색조건 -->
	                                <!-- 게시판 -->
	                                <div class="board_list" id="board_table">
	                                    <table>
	                                        <colgroup>
	                                        	<col style="width: auto;">
	                                            <col style="width: auto;">
	                                            <col style="width: auto;">                                            
	                                            <col style="width: auto;">
	                                            <col style="width: auto;">
	                                        </colgroup>
	                                        <thead>
	                                            <tr>
	                                                <th scope="col">행정구역코드</th>
	                                            	<th scope="col">연도</th>                                                
	                                                <th scope="col">전체주택</th>
	                                                <th scope="col">빈집수</th>                                                                                                
	                                                <th scope="col">빈집비율</th>
	                                            </tr>
	                                        </thead>
	                                        <tbody>
	                                        	<c:if test="${fn:length(list) == 0 && fn:length(houseEmpDataSearchVO.bjdCode) != 0}">
		                                        	<tr>
		                                        		<td colspan="7" >자료가 없습니다. 다른 검색조건을 선택해주세요</td>
		                                        	</tr>
	                                        	</c:if>
	                                        	<c:forEach var="r" items="${list}" varStatus="status">
                                        			<tr>
		                                                <td><c:out value="${cityList[r.BJD_CDE]}"/></td>
		                                                <td><c:out value="${r.STTS_YEAR}"/></td>
		                                            	<td><fmt:formatNumber value="${r.HSE_TOT}" pattern="#,###"/> </td>                                                
														<td><fmt:formatNumber value="${r.VCN_ST}" pattern="#,###"/> </td>
		                                                <td><c:out value="${r.VCN_RT}"/></td>
		                                            </tr>	                                        		
	                                        	</c:forEach>
	                                        </tbody>
	                                    </table>
		                                <!-- 페이지 네비게이션 시작 -->
										<c:if test="${!empty houseEmpDataSearchVO.pageIndex}">
			                                <div class="board_list_bot mt40">
			                                    <div class="paging" id="paging_div">
			                                        <ul>
			                                            <ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_linkPage" />
			                                        </ul>
			                                    </div>
			                                </div>
		                                </c:if>	     
		                                <!-- //페이지 네비게이션 끝 -->                               
	                                </div>
	                                <div class="board_list" id="board_chart">
										<canvas id="myChart" class="myChart" width="2000" height="1000"></canvas>
	                                </div>                                
                                </form>
                                <!--// 게시판 -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>