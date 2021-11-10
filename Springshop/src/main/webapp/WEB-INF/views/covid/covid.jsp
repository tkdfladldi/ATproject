<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div style="width: 900px; height: 470px;">
	<!--차트가 그려질 부분-->
	<canvas id="chart-bars"></canvas>
</div>
<select id="select">
	<option>---</option>
	<option value="1">1일</option>
	<option value="6">7일</option>
	<option value="29">30일</option>
</select>
<button type="button" id="searchBtn">검색</button>
<table class="table">


	<thead>
		<tr>
			<th scope="col">확진자 수</th>
			<th scope="col">격리해제 수</th>
			<th scope="col">검사진행 수</th>
			<th scope="col">사망자 수</th>
			<th scope="col">치료중 환자 수</th>
			<th scope="col">결과 음성 수</th>
			<th scope="col">누적 검사 수</th>
			<th scope="col">누적 검사 완료 수</th>
			<th scope="col">누적 확진률</th>
			<th scope="col">날짜</th>
		</tr>
	</thead>
	<tbody id="list"></tbody>
</table>


<script>
	
	var date = new Date();
	var calDate = new Date();
	var selectedDays = 1;

	var month = date.getMonth() + 1;
	var day = date.getDate();
	var year = date.getFullYear();

	var YMD = year + '' + month + '' + day;
	var calYMD = YMD;
	var getDateNumber = function(number) {
		if (number < 0) {
			return null;
		} else if (number < 10) {
			return '0' + number;
		} else {
			return number;
		}
	}

	$(function() {
		$('#searchBtn').click(
				function() {
					var sel = $("#select").val();

					selectedDays = Number(sel);

					calDate = new Date();
					calDate.setDate(calDate.getDate() - selectedDays);
					calYMD = calDate.getFullYear() + ''
							+ getDateNumber(calDate.getMonth() + 1) + ''
							+ getDateNumber(calDate.getDate());
					selCovid(sel);
				})
	})

	$(document).ready(function() {
		selCovid(YMD);
	});
	function selCovid(selNum) {
		var firstLabel = [];   
		var firstData = [];
		var sel = selNum;
		console.log(sel);
		console.log(YMD);

		$
				.ajax({
					type : 'GET',
					url : "http://openapi.data.go.kr/openapi/service/rest/Covid19/getCovid19InfStateJson?serviceKey=S9rBaFio8QGz%2BFEnx2IHDcUggYJvdFMcEm%2Bc%2BPm8hhfuH%2BFRO9etq27vzdFKqrvvEHzibwKdl%2BwqGaOPyUkj1A%3D%3D&pageNo=1&numOfRows=10&startCreateDt="
							+ calYMD + "&endCreateDt=" + YMD,
					dataType : "json",
					error : function(error) {
						alert("Error!");
						console.log(error);
					},
					success : function(data) {

						var data = data.response.body.items.item;
						console.log(data);
						$("#list").children().remove();
						var html = "";
						var chk = Array.isArray(data);
						if (chk == false) {
							html += '<tr><td id="h">' + data.deathCnt
									+ '</td>';
							html += '<td >' + data.clearCnt + '</td>';
							html += '<td>' + data.examCnt + '</td>';
							html += '<td>' + data.deathCnt + '</td>';
							html += '<td>' + data.careCnt + '</td>';
							html += '<td>' + data.resutlNegCnt + '</td>';
							html += '<td>' + data.accExamCnt + '</td>';
							html += '<td>' + data.accExamCompCnt + '</td>';
							html += '<td>' + data.accDefRate + '</td>';
							html += '<td>' + data.stateDt + '</td></tr>';

						}
						if (chk == true) {
							for (var i = 0; i < data.length; i++) {
								html += '<tr><td>' + data[i].deathCnt
										+ '</td>';
								html += '<td>' + data[i].clearCnt + '</td>';
								html += '<td>' + data[i].examCnt + '</td>';
								html += '<td>' + data[i].deathCnt + '</td>';
								html += '<td>' + data[i].careCnt + '</td>';
								html += '<td>' + data[i].resutlNegCnt + '</td>';
								html += '<td>' + data[i].accExamCnt + '</td>';
								html += '<td>' + data[i].accExamCompCnt
										+ '</td>';
								html += '<td>' + data[i].accDefRate + '</td>';
								html += '<td>' + data[i].stateDt + '</td></tr>';
								firstLabel.push(data[i].deathCnt);
								firstData.push(data[i].stateDt);
							}
							
							 var ctx = document.getElementById("chart-bars").getContext("2d");
							    var firstconfig = {
							             type: "line",
							             data: {
							               labels: [],
							               datasets: [{
							                 label: "코로나 확진자",
							                 tension: 0.4,
							                 borderWidth: 0,
							                 borderRadius: 4,
							                 borderSkipped: false,
							                 backgroundColor: "rgba(255, 255, 255, .8)",
							                 data: [],
							                 maxBarThickness: 6
							               }, ],
							             },
							             options: {
							               responsive: true,
							               maintainAspectRatio: false,
							               plugins: {
							                 legend: {
							                   display: false,
							                 }
							               },
							               interaction: {
							                 intersect: false,
							                 mode: 'index',
							               },
							               scales: {
							                 y: {
							                   grid: {
							                     drawBorder: false,
							                     display: true,
							                     drawOnChartArea: true,
							                     drawTicks: false,
							                     borderDash: [5, 5],
							                     color: 'rgba(255, 255, 255, .2)'
							                   },
							                   ticks: {
							                     suggestedMin: 0,
							                     suggestedMax: 500,
							                     beginAtZero: true,
							                     padding: 10,
							                     font: {
							                       size: 14,
							                       weight: 300,
							                       family: "Roboto",
							                       style: 'normal',
							                       lineHeight: 2
							                     },
							                     color: "#fff"
							                   },
							                 },
							                 x: {
							                   grid: {
							                     drawBorder: false,
							                     display: true,
							                     drawOnChartArea: true,
							                     drawTicks: false,
							                     borderDash: [5, 5],
							                     color: 'rgba(255, 255, 255, .2)'
							                   },
							                   ticks: {
							                     display: true,
							                     color: '#f8f9fa',
							                     padding: 10,
							                     font: {
							                       size: 14,
							                       weight: 300,
							                       family: "Roboto",
							                       style: 'normal',
							                       lineHeight: 2
							                     },
							                   }
							                 },
							               },
							             },
							           };
							    var dataLabel = firstconfig.data.labels;
							    var dataset = firstconfig.data.datasets[0].data;
							    for(var i=0; i<firstLabel.length; i++){
							        dataLabel.push(firstData[i]);
							        dataset.push(firstLabel[i]); 
							     }
							    new Chart(ctx, firstconfig);
						}
						$("#list").append(html);
					}
				})

			
	};
</script>