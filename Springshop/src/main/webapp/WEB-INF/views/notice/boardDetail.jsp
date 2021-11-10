<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>SpringShop</title>
<link href="/resources/login.css/styles.css" rel="stylesheet" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
	crossorigin="anonymous"></script>
	  <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	crossorigin="anonymous"></script>
<script src="login.js/scripts.js"></script>
</head>
	<body class="bg-primary">
		<nav class="navbar navbar-expand-lg navbar-dark fixed-top"
			id="mainNav" style="background: black;">
			<div class="container">
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarResponsive"
					aria-controls="navbarResponsive" aria-expanded="false"
					aria-label="Toggle navigation">
					Menu <i class="fas fa-bars ms-1"></i>
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

		<sb-dashboard-tables _ngcontent-rgv-c1="" _nghost-rgv-c6="">
		<sb-card _ngcontent-rgv-c6="" _nghost-rgv-c7="">
		<div _ngcontent-rgv-c7="" class="card mb-4">
			<select _ngcontent-rgv-c16=""
				class="custom-select ng-untouched ng-pristine ng-valid"
				name="pageSize" style="width: auto"><option
					_ngcontent-rgv-c16="" value="0: 2">2 items per page</option>
				<option _ngcontent-rgv-c16="" value="1: 4">4 items per page</option>
				<option _ngcontent-rgv-c16="" value="2: 6">6 items per page</option></select>
		</div>
		</form>
		</sb-ng-bootstrap-table>
		</div>
		</div>
		</sb-card></sb-dashboard-tables>
		<sb-card _ngcontent-rgv-c1="" _nghost-rgv-c7="">
		
		
		<div _ngcontent-rgv-c7="" class="card mb-4" style="top: 7px;  ">
		
		
		
		<form action="/boardContent" method="post">
			<div _ngcontent-rgv-c1="" class="card-header">
				<input class="form-control" id="title" name="title" type="text" value="${board.title}" readonly/>
			</div>
			
			<div _ngcontent-rgv-c1="" class="card-body" style="height: 650px;">
					<textarea class="form-control" rows="23" name="content" id="content" placeholder="${board.content}" readonly></textarea>
			</div>
		</form>
		</div>
		
		</sb-card>
		</div>
	</body>

<script>

</script>

</body>
</html>
