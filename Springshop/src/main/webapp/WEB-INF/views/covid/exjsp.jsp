<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<script>
var firstLabel = [];   
var firstData = [];
var SecondData = [];
var ThirdData = [];
var someday = new Date();   
 someday.setDate(someday.getDate() - 6); 
 var sYear = someday.getFullYear();   /
 var sMonth = ('0' + (someday.getMonth() + 1)).slice(-2);   

 var sDay = ('0' + someday.getDate()).slice(-2);
 var sDate = sYear + sMonth + sDay;
 console.log(sDate);
 var today = new Date();   //
 var eYear = today.getFullYear();
 var eMonth = ('0' + (today.getMonth() + 1)).slice(-2); 
 var eDay = ('0' + today.getDate()).slice(-2);
 var eDate = eYear + eMonth + eDay;
 console.log(eDate);
 console.log("=====================================");
 console.log(today.getMonth() + 1);
 console.log(('0' +(today.getMonth() + 1)).slice(-2));
//chart ajax
 $(function(){
    $.ajax({
        url:"http://openapi.data.go.kr/openapi/service/rest/Covid19/getCovid19InfStateJson?serviceKey=31wBfvoU%2BKRasdb%2F0TDuvPEI1B%2FTtuRmyBmo3vKNiBpWE8J1HS411o8k9NrQmfCXbLy0yu0UiWI0lMo39vFlRA%3D%3D&pageNo=1&numOfRows=10&startCreateDt="+sDate+"&endCreateDt="+eDate+""
       ,type:"GET" 
       ,dataType: "json"
       , success: function(data){
          console.log("open Api 사용중 test중입니다.");
          console.log("=====================================================================");
          var item = data.response.body.items.item;
          console.log(item);
          for (var i = 6; i >= 0; i--) {  
             firstLabel.push(item[i].stateDt);
             firstData.push(item[i].decideCnt);
             SecondData.push(item[i].deathCnt);
             ThirdData.push(item[i].careCnt);
          }
            console.log("ajax에서 출력 :::", firstLabel);
            console.log("ajax에서 출력 :::", firstData);
            setTimeout(function() {
               drawDecideCnt();
             }, 500);
          
         }
    });
 })
 //function ajax 끝
 function drawDecideCnt(){
      console.log("draw에서 출력 :::", firstLabel);
      console.log("draw에서 출력 :::", firstData);
     var ctx = document.getElementById("chart-bars").getContext("2d");
    var firstconfig = {
             type: "bar",
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
       dataLabel.push(firstLabel[i]);
       dataset.push(firstData[i]); 
    }
     new Chart(ctx, firstconfig);
</script>
</body>
</html>