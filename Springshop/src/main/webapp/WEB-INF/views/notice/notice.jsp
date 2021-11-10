<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <table class="table">
  <thead>
    <tr>
      <th scope="col">작성자</th>
      <th scope="col">제목</th>
      <th scope="col">작성날짜</th>
    </tr>
  </thead>
  <tbody id="list"></tbody>
</table>
<div id="pageNav" style="text-align: center;"></div>
<script>
	var data = {};
	$(document).ready(function(){
		Search(1);
	});	
	function boardContent(bid) {
		
		location.href='/boardContent?Flag=MOD&bid='+bid;
	}
	function updateBoard(bid) {
			
			location.href='/boardContent?Flag=Update&bid='+bid;
		}
	function deleteBoard(bid) {
		data.bid = bid;
		$.ajax({
		    type : 'GET',
		    url : 'http://openapi.data.go.kr/openapi/service/rest/Covid19/getCovid19InfStateJson',
		    data : data,
		    error : function(error) {
		        alert("Error!");
		    },
		    success : function(value) {
		    	if(value >= 1){
			    	alert("삭제성공");
		    	}else{
		    		alert("삭제실패");
		    	}
		    	Search(1);
		    }
		})
	};
	function Search(selPage){
		data.curPage = selPage;
		data.pagePerCnt = 5;
		console.log(data);
		$.ajax({
		    type : 'POST',
		    url : '/notice/list',
		    data : data,
		    error : function(error) {
		        alert("Error!");
		    },
		    success : function(value) {
		    	console.log(value);
		    	var userId = "${member.userId}"
		    	console.log(userId);
		    	$("#list").children().remove();
		    	var list = value.list;
		    	var html = "";
		    	for (var i = 0; i < list.length; i++) {
		    		var regId = list[i].reg_id;
					html += '<tr><th scope="row">'+ list[i].reg_id +'</th>';
					html += '<td onclick="boardContent('+list[i].bid+');">'+ list[i].title +'</td>';
					html += '<td>'+ list[i].reg_date +'</td>';
					if(userId == regId){
						html += '<td><button class="btn btn-primary" type="button" onclick="updateBoard('+list[i].bid+')">수정</button> <button class="btn btn-primary" type="button" onclick="deleteBoard('+list[i].bid+')">삭제</button></td></tr>';
					}
				}
		    	$("#list").append(html);
		    	$("#pageNav").paging({
		    		pageSize : data.pagePerCnt,  
					PAGE_PER_CNT:  data.pagePerCnt, 
					currentPage: value.paging.CUR_PAGE,
					pageTotal: value.paging.TOTAL_CNT  
		    	});
		    }
		});
	}
	function goPage(selPage){
		Search(selPage);
	}
	 var flag = "${Flag}"
  		if(flag == 'updateBoard'){
  			alert("글 수정완료");
  	}
	
</script>