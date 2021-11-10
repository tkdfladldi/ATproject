<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>SpringShop</title>
        <link href="/resources/login.css/styles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="login.js/scripts.js"></script>
         <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    </head>
     	<script>
     	
          	 $(document).ready(function(){
         		$("#submit").on("click", function(){
         			
         			if($("#title").val()==""){
         				alert("제목을 입력해주세요.");
         				$("#title").focus();
         				return false;
         			}
         			if($("#content").val()==""){
         				alert("내용을 입력해주세요");
         				$("#content").focus();
         				return false;
         			}
         			if($("#file").val()==""){
         				alert("이미지를 업로드해주세요");
         				$("#file").focus();
         				return false;
         			}
         		});
         	})
     	</script> 
     <c:if test="${member != null}">
    <body class="bg-primary">
     <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav" style="background: black;">
            <div class="container">
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars ms-1"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav text-uppercase ms-auto py-4 py-lg-0">
                        <li class="nav-item"><a class="nav-link" href="/notice">notice</a></li>
                        <li class="nav-item"><a class="nav-link" href="/gallery">갤러리</a></li>
                        <li class="nav-item"><a class="nav-link" href="/">메인페이지</a></li>
                        <li class="nav-item"><a class="nav-link" href="/covid">covid</a></li>
                         <li class="nav-item"><a class="nav-link" href="/memberUpdate">회원수정</a></li>
                        <li class="nav-item"><a class="nav-link" href="/logOut">로그아웃</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-5">
                                <div class="card shadow-lg border-0 rounded-lg mt-5" style="top: 60px;">
                                	<form  action="/insertGallery" method="post"  enctype="multipart/form-data">
                                    <div class="card-header"><input style="height: 70px; width: 500px;"id="title" name="title" placeholder="갤러리 제목"/></div>
                                    
                                    <div class="card-body">
                                    
                                       
                                            <div class="form-floating mb-3">
                                                <textarea class="form-control" style="height: 250px;" rows="23" name="content" id="content" placeholder="갤러리 내용을 입력해주세요." ></textarea>
                                                <label style="color: gray;" for="inputEmail">갤러리 내용</label>
                                            </div>
                                            
                                            <div class="d-flex align-items-center justify-content-between mt-4 mb-0">
                                            	
                                              	<input type="file" id="file" name="file" value="사진업로드">
                                                <button class="btn btn-primary" type="submit" id="submit">확인</button>
                                            </div>
                                      </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
        </div>
        </c:if>
           
<c:if test="${member == null}">
	<h2>로그인이 필요합니다.</h2>
</c:if>
     
    </body>
</html>