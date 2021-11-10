<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <script>
        
        var data = {};
        
        $(document).ready(function(){
    		Search(1);
    	});
        function Search(selPage){
        	data.curPage = selPage;
        	data.pagePerCnt = 8;
        	console.log(data);
        	$.ajax({
        		type : 'POST',
        		url : '/gallery/list',
        		data : data,
        		error : function(error) {
					alert("Error !");
				},
				success : function(value) {
					console.log(value);
					var mapList = value.mapList;
					$("#list").children().remove();
					var html = "";
					var userId = "${member.userId}";
					for(var i = 0; i <mapList.length; i++){
						console.log(mapList[i].fakeName);
						html += '<div class="col mb-5">';
						html += '<div class="card h-100">';
						html += '<img class="card-img-top" src="/resources/file/'+mapList[i].fileName+'"/>'
						html += '<div class="card-body p-4">';
						html += '<div class="text-center">';
						html += '<h5 class="fw-bolder">'+mapList[i].title+'</h5></br>';
						html += ''+mapList[i].content+'';
						
						html += '</div> </div>';
						html += ' <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">';
						if(mapList[i].reg_id  == userId){
						html += ' <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="/galleryForm?Flag=Update&gid='+mapList[i].gid+'">수정</a>';
						html += ' <a onclick="deleteGallery('+mapList[i].gid+',\''+mapList[i].fileName+'\');" class="btn btn-outline-dark mt-auto">삭제</a></div>';
						}
						html += '</div>  </div>  </div>  </div>  </div>';
					}
					$("#list").append(html);
					$("#pageNav").paging({
			    		pageSize : data.pagePerCnt,  
						PAGE_PER_CNT:  data.pagePerCnt, 
						currentPage: value.paging.CUR_PAGE,
						pageTotal: value.paging.TOTAL_CNT,  
			    	});
				}
        	});
        	
        }
        function deleteGallery(gid,fileName) {
        	console.log(gid);
        	console.log(fileName);
        	data.fileName = fileName;
			data.gid  = gid;
			$.ajax({
        		type : 'POST',
        		url : '/deleteGallery',
        		data : data,
        		error : function(error) {
					alert("Error !");
				},
				success : function(result) {
					if(result >= 1){
				    	alert("삭제성공");
			    	}else{
			    		alert("삭제실패");
			    	}
			    	Search(1);
				}
			});
        }
        
        
        
        var flag = "${Flag}"
     		if(flag == 'insertY'){
     			alert("갤러리 저장완료");
     		}
        var flag = "${Flag}"
     		if(flag == 'insertN'){
     			alert("잘못된 형식입니다 저장실패.");
     		}
        
        function goPage(selPage){
    		Search(selPage);
    	}
        
        
		</script>
        <!-- Section-->
        <section class="py-5">
         <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center" id="list">
                		 
                		 			
                </div>
         </div>
         		<div id="pageNav" style="text-align: center;"></div>
        </section>
        
