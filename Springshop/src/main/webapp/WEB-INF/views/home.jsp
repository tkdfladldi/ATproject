<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="ko">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>SpringShop</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="/resources/css/styles.css" rel="stylesheet" />
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="/resources/js/scripts.js"></script>
        <script src="/resources/js/jquery.ui.paging.js"></script>
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
    </head>
    <style>
    a{  text-decoration-line: none;
    
    }
    #pageNav{
    font-size: 25px;
    }
    </style>
  
    <body id="page-top">
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
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
                 <c:if test="${member == null}">
                        <li class="nav-item"><a class="nav-link" href="/login">로그인</a></li>
                 </c:if>
                 <c:if test="${member != null}">
                 		<li class="nav-item"><a class="nav-link" href="/memberUpdate">회원수정</a></li>
                        <li class="nav-item"><a class="nav-link" href="/logOut">로그아웃</a></li>
                  </c:if>
                    </ul>
                </div>
            </div>
        </nav>
        <header class="masthead">
            <div class="container" >
                <div class="masthead-subheading">Welcome To Our Studio!</div>
                <div class="masthead-heading text-uppercase">Spring Shop</div>
                <c:if test="${gallerycontent != null}">
                <a class="btn btn-primary btn-xl text-uppercase" href="/galleryForm?Flag=ADD">갤러리 등록</a>
                </c:if>
                <c:if test="${boardContent != null}">
                <a class="btn btn-primary btn-xl text-uppercase" href="/boardContent?Flag=ADD">글쓰기</a>
                </c:if>
            </div>
        </header>
        <jsp:include page="${content}" />
    </body>
	   <script>
		    var flag = "${Flag}"
		         		if(flag == 'loginY'){
		         			alert("로그인 성공");
		         		}
		    var flag = "${Flag}"
         		if(flag == 'deleteY'){
         			alert("회원탈퇴 완료");
         		}
		    var flag = "${Flag}"
         		if(flag == 'pwUpdateY'){
         			alert("비밀번호 변경완료");
         		}
		    var flag = "${Flag}"
         		if(flag == 'nameEmailUpdateY'){
         			alert("이름 및 이메일 변경완료");
         		}
		    var flag = "${Flag}"
         		if(flag == 'insertCont'){
         			alert("글 저장완료");
         		}
		    var flag = "${Flag}"
         		if(flag == 'updateY'){
         			alert("수정 완료");
         		}
		    var flag = "${Flag}"
         		if(flag == 'updateN'){
         			alert("수정 실패");
         		}
	    </script>
</html>