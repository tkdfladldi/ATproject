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
         			
         			if($("#userPw").val()==""){
         				alert("현재비밀번호를 입력해주세요.");
         				$("#userPw").focus();
         				return false;
         			}
         			if($("#userPwUpdate").val()==""){
         				alert("변경비밀번호를 입력해주세요.");
         				$("#userPwUpdate").focus();
         				return false;
         			}
         			if($("#userPwUpdate2").val()==""){
         				alert("변경비밀번호를 입력해주세요.");
         				$("#userPwUpdate2").focus();
         				return false;
         			}
         			
         			//세션 비밀번호와 입력한 비밀번호와 비교, 변경 비밀번와  변경 비밀번호2 확인 비교
         			var Password = $("#userPw").val();
         			
         			var userPwUpdate = $("#userPwUpdate").val();
         			var userPwUpdate2 = $("#userPwUpdate2").val();
         			
         			if(Password !== '${member.userPw}' ){	
         				alert("현재 비밀번호가 맞지않습니다.");
         				return false;
         			}
         			if(userPwUpdate !== userPwUpdate2){
         				alert("변경 비밀번호가 맞지않습니다.");
         				return false;
         			}
         			
         			
         		});
         	})
          	
     		var flag = "${Flag}"
     		if(flag == 'deleteN'){
     			alert("비밀번호가 맞지 않습니다.");
     		}
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
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">비밀번호 변경</h3></div>
                                    <div class="card-body">
                                    
                                       <form action="memberPwUpdate" method="post">
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="userPw"  type="password" placeholder="Password" />
                                                <label for="inputEmail">현재 비밀번호</label>
                                            </div>
                                            
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="userPwUpdate"  type="password" placeholder="Password" />
                                                <label for="inputPassword">변경 비밀번호</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="userPwUpdate2" name="userPw"  type="password" placeholder="Password" />
                                                <label for="inputPassword">변경 비밀번호 확인</label>
                                            </div>
                                            
                                            <div class="d-flex align-items-center justify-content-between mt-4 mb-0">
                                                <a class="small" href="/">취소</a>
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
           
     
    </body>
</html>