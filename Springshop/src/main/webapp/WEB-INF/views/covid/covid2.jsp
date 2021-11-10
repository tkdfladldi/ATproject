<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<div style="width: 900px; height: 470px;">
		<!--차트가 그려질 부분-->
		<canvas id="myChart"></canvas>
	</div>
 			<select id="select">
 				<option>---</option>
 				<option value="20211110">1일</option>
 				<option value="20211103">7일</option>
 				<option value="20211010">30일</option>
 			</select>
 			<button type="button"  id="searchBtn">검색</button>
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
        var firstLabel = [];   
        var date = new Date();  
        var month= date.getMonth() +1;  
        var day  = date.getDate();  
        var year = date.getFullYear(); 
        
        var YMD = year+''+month+''+day;
        $(function() {
			$('#searchBtn').click(function() {
				var sel = $("#select").val();
					selCovid(sel);
				
			})
		})
        
        
         $(document).ready(function(){
        	 selCovid(YMD);
         });
        	function selCovid(selNum) { 
        		var sel = selNum;
        		 console.log(sel);
        		 console.log(YMD);
        		 
    		$.ajax({
    		    type : 'GET',
    		    url : "http://openapi.data.go.kr/openapi/service/rest/Covid19/getCovid19InfStateJson?serviceKey=S9rBaFio8QGz%2BFEnx2IHDcUggYJvdFMcEm%2Bc%2BPm8hhfuH%2BFRO9etq27vzdFKqrvvEHzibwKdl%2BwqGaOPyUkj1A%3D%3D&pageNo=1&numOfRows=10&startCreateDt="+sel+"&endCreateDt="+YMD,
    		    dataType: "json",
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
    		    	if(chk == false){
    		    		html += '<tr><td id="h">'+data.decideCnt+'</td>';
    		    		html += '<td >'+data.clearCnt+'</td>';
    		    		html += '<td>'+data.examCnt+'</td>';
    		    		html += '<td>'+data.deathCnt+'</td>';
    		    		html += '<td>'+data.careCnt+'</td>';
    		    		html += '<td>'+data.resutlNegCnt+'</td>';
    		    		html += '<td>'+data.accExamCnt+'</td>';
    		    		html += '<td>'+data.accExamCompCnt+'</td>';
    		    		html += '<td>'+data.accDefRate+'</td>'; 
    		    		html += '<td>'+data.stateDt+'</td></tr>'; 
    		    		var context = document
    		            .getElementById('myChart')
    		            .getContext('2d');
    		     	   var myChart = new Chart(context, {
    		            type: 'line', // 차트의 형태
    		            data: { // 차트에 들어갈 데이터
    		                labels: [
    		                    //x 축
    		                	
    		                ],
    		                datasets: [
    		                    { //데이터
    		                        label: 'Covid', //차트 제목
    		                        fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
    		                        data: [
    		                        	 //x축 label에 대응되는 데이터 값
    		                        ],
    		                        backgroundColor: [
    		                            //색상
    		                            'rgba(255, 99, 132, 0.2)',
    		                            'rgba(54, 162, 235, 0.2)',
    		                            'rgba(255, 206, 86, 0.2)',
    		                            'rgba(75, 192, 192, 0.2)',
    		                            'rgba(153, 102, 255, 0.2)',
    		                            'rgba(255, 159, 64, 0.2)'
    		                        ],
    		                        borderColor: [
    		                            //경계선 색상
    		                            'rgba(255, 99, 132, 1)',
    		                            'rgba(54, 162, 235, 1)',
    		                            'rgba(255, 206, 86, 1)',
    		                            'rgba(75, 192, 192, 1)',
    		                            'rgba(153, 102, 255, 1)',
    		                            'rgba(255, 159, 64, 1)'
    		                        ],
    		                        borderWidth: 1 //경계선 굵기
    		                    }/* ,
    		                    {
    		                        label: 'test2',
    		                        fill: false,
    		                        data: [
    		                            8, 34, 12, 24
    		                        ],
    		                        backgroundColor: 'rgb(157, 109, 12)',
    		                        borderColor: 'rgb(157, 109, 12)'
    		                    } */
    		                ]
    		            },
    		            options: {
    		                scales: {
    		                    yAxes: [
    		                        {
    		                            ticks: {
    		                                beginAtZero: true
    		                            }
    		                        }
    		                    ]
    		                }
    		            }
    		        });
    		    	}
    		    	if(chk == true){
	    		    	for(var i = 0; i < data.length; i++){
	    		    		html += '<tr><td>'+data[i].decideCnt+'</td>';
	    		    		html += '<td>'+data[i].clearCnt+'</td>';
	    		    		html += '<td>'+data[i].examCnt+'</td>';
	    		    		html += '<td>'+data[i].deathCnt+'</td>';
	    		    		html += '<td>'+data[i].careCnt+'</td>';
	    		    		html += '<td>'+data[i].resutlNegCnt+'</td>';
	    		    		html += '<td>'+data[i].accExamCnt+'</td>';
	    		    		html += '<td>'+data[i].accExamCompCnt+'</td>';
	    		    		html += '<td>'+data[i].accDefRate+'</td>'; 
	    		    		html += '<td>'+data[i].stateDt+'</td></tr>'; 
	    		    		firstLabel.push(data[i].deathCnt);
	    		    		var context = document
	    		            .getElementById('myChart')
	    		            .getContext('2d');
	    		     	   var myChart = new Chart(context, {
	    		            type: 'line', // 차트의 형태
	    		            data: { // 차트에 들어갈 데이터
	    		                labels: [
	    		                
	    		               		 
	    		                    //x 축
	    		                	
	    		                ],
	    		                datasets: [
	    		                    { //데이터
	    		                        label: 'Covid', //차트 제목
	    		                        fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
	    		                        data: [
	    		                        	    //x축 label에 대응되는 데이터 값
	    		                        ],
	    		                        backgroundColor: [
	    		                            //색상
	    		                            'rgba(255, 99, 132, 0.2)',
	    		                            'rgba(54, 162, 235, 0.2)',
	    		                            'rgba(255, 206, 86, 0.2)',
	    		                            'rgba(75, 192, 192, 0.2)',
	    		                            'rgba(153, 102, 255, 0.2)',
	    		                            'rgba(255, 159, 64, 0.2)'
	    		                        ],
	    		                        borderColor: [
	    		                            //경계선 색상
	    		                            'rgba(255, 99, 132, 1)',
	    		                            'rgba(54, 162, 235, 1)',
	    		                            'rgba(255, 206, 86, 1)',
	    		                            'rgba(75, 192, 192, 1)',
	    		                            'rgba(153, 102, 255, 1)',
	    		                            'rgba(255, 159, 64, 1)'
	    		                        ],
	    		                        borderWidth: 1 //경계선 굵기
	    		                    }/* ,
	    		                    {
	    		                        label: 'test2',
	    		                        fill: false,
	    		                        data: [
	    		                            8, 34, 12, 24
	    		                        ],
	    		                        backgroundColor: 'rgb(157, 109, 12)',
	    		                        borderColor: 'rgb(157, 109, 12)'
	    		                    } */
	    		                ]
	    		            },
	    		            options: {
	    		                scales: {
	    		                    yAxes: [
	    		                        {
	    		                            ticks: {
	    		                                beginAtZero: true
	    		                            }
	    		                        }
	    		                    ]
	    		                }
	    		            }
	    		        });
	    		     	 
	    		    	}
    		    	}
    		    	$("#list").append(html);
    		    	var dataset = myChart.data.datasets[0].data;
    		    	var dataLabel = myChart.data.labels;
    		    	for(var i=0; i<firstLabel.length; i++){
    		    		dataLabel.push(firstLabel[i]); 
    		    	       console.log(dataLabel);
    		    	    }
    		    }
    		})
    	};	 
        </script>