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
        <link href="resources/login.css/styles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="login.js/scripts.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        
    </head>
    <script type="text/javascript">
    var flag = "${Flag}"
 		if(flag == 'joinN'){
 			alert("입력하신 정보가 올바르지 않습니다.");
 		}
    
    $(document).ready(function(){
		$("#submit").on("click", function(){
			if($("#id").val()==""){
				alert("아이디를 입력해주세요.");
				$("#id").focus();
				return false;
			}
			if($("#Password").val()==""){
				alert("패스워드를 입력해주세요.");
				$("#Password").focus();
				return false;
			}
			if($("#PasswordChk").val()==""){
				alert("패스워드를 입력해주세요.");
				$("#PasswordChk").focus();
				return false;
			}
			if($("#name").val()==""){
				alert("성명을 입력해주세요.");
				$("#name").focus();
				return false;
			}
			if($("#email").val()==""){
				alert("이메일을 입력해주세요.");
				$("#email").focus();
				return false;
			}
			var idChkVal = $("#idChk").val();
			if(idChkVal == "N"){
				alert("중복확인 버튼을 눌러주세요.");
				return false;
			}
			
			var Password = $("#Password").val();
			var Password2 = $("#PasswordChk").val();
			if(Password !== Password2){
				alert("비밀번호가 맞지않습니다.");
				return false;
			}
			
		});
	})
	
    	
	function fn_idChk(){
			$.ajax({
				url : "/register/idChk",
				type : "post",
				dataType : "json",
				data : {"userId" : $("#id").val()},
				success : function(data){
					if(data == 1){
						$("#idChk").attr("value", "N");
						alert("중복된 아이디입니다.");
					}else if(data == 0){
						$("#idChk").attr("value", "Y");
						alert("사용가능한 아이디입니다.");
					}
				}
			})
		};
	
	
    	
    </script>
    
    
    
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
                         <li class="nav-item"><a class="nav-link" href="/login">로그인</a></li>
                        <li class="nav-item"><a class="nav-link" href="/covid">covid</a></li>
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
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">회원가입</h3></div>
                                    <div class="card-body">
                                    
                                        <form action="/register/insertUser" method="post">
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="id" type="text" name="userId" placeholder="name@example.com" />
                                                <label for="inputEmail">아이디</label>
                                                <button class="btn btn-primary" type="button" onclick="fn_idChk();" id="idChk" value="N">아이디 중복확인</button>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="Password" type="password" name="userPw" placeholder="Password" />
                                                <label for="inputPassword">패스워드</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="PasswordChk" type="password" name="PasswordChk" placeholder="Password" />
                                                <label for="inputPassword">패스워드 확인</label>
                                            </div>
                                             <div class="form-floating mb-3">
                                                <input class="form-control" id="name" type="text" name="userName" placeholder="Password" />
                                                <label for="inputPassword">성명</label>
                                            </div>
                                             <div class="form-floating mb-3">
                                                <input class="form-control" id="email" type="email" name="userEmail" placeholder="name@example.com" />
                                                <label for="inputPassword">이메일</label>
                                            </div>
                                            
                                            <div class="d-flex align-items-center justify-content-between mt-4 mb-0">
                                            	<button class="btn btn-primary" type="submit" id="submit">회원가입 확인</button>
                                                <a class="btn btn-primary" href="/">취소</a>
                                            </div>
                                        </form>
                                        
                                    </div>
                                    <div class="card-footer text-center py-3">
                                        <div class="small"><a href="/login">로그인</a></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
        </div>
    </body>
</html>
