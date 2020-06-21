<%@page import="com.ssafy.happyhouse.model.dto.UserInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<%
	UserInfo ui = (UserInfo) session.getAttribute("userinfo");
%>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>

<c:url value="/" var="root" />
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>HappyHouse</title>
<link rel="icon" type="image/x-icon" href="assets/img/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.12.1/js/all.js"
	crossorigin="anonymous"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/emailjs-com@2.4.1/dist/email.min.js">
	
</script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Varela+Round"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />
</head>
<body id="page-top">

	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-light fixed-top"
		id="mainNav">
		<div class="container">
			<a class="navbar-brand js-scroll-trigger" href="#page-top">HappyHouse</a>
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-toggle="collapse" data-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				Menu<i class="fas fa-bars"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="#page-top">Home</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="#projects">Search</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="#qna">QnA</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="#signup">Contact</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- Masthead-->
	<header class="masthead">
		<div class="container d-flex h-100 align-items-center">
			<div class="mx-auto text-center">
				<h1 class="mx-auto my-0 text-uppercase">HappyHouse</h1>
				<h2 class="text-white-50 mx-auto mt-2 mb-5">comfort,
					happiness... Everything is in SSAFY's HAPPYHOUSE</h2>
				<%
					if (ui == null) {
				%>
				<%
					if (request.getAttribute("msg") != null) {
				%>

				<h2><%=request.getAttribute("msg")%></h2>
				<%
					}
				%>
				<a class="btn btn-primary js-scroll-trigger" href="${root}mvlogin">Login</a>
				<%
					} else {// 로그인 결과
				%>
				<h5 class="text-white-50 mx-auto mt-2 mb-5"><%=ui.getId()%>
				님 로그인 되었습니다.</h5><br>
				<%@ include file="/WEB-INF/views/userInfo.jsp"%>

				<%
					}
				%>
			</div>
		</div>
	</header>
	<!-- About-->

	<!-- Projects-->
	<section class="projects-section bg-light" id="projects">

		<%
			if (ui == null) {
		%>

		<h1 align="center">
			<a href="${root}mvlogin">로그인을 해야 해당 정보를 볼 수 있습니다.</a>
		</h1>
		<%
			} else {// 로그인 결과
		%>

		<div align="center">
			<%@ include file="/WEB-INF/views/rank.jsp"%>
		</div>
		<%@ include file="/WEB-INF/views/map.jsp"%>
		<%
			}
		%>

	</section>

	<!--  QNA -->
	<section class="projects-section bg-light" id="qna">
		<%
			if (ui == null) {
		%>

		<h1 align="center">
			<a href="${root}mvlogin">로그인을 해야 QnA를 볼 수 있습니다.</a>
		</h1>
		<%
			} else {// 로그인 결과
		%>
		<h2 align="center">Q&A 게시판</h2>
		<div align="right"><%=ui.getId()%>님 로그인 되었습니다.<br>
			<%@ include file="/WEB-INF/views/userInfo.jsp"%>
		</div>
		<br>
		<%@ include file="/WEB-INF/views/qna/qnaList.jsp"%>

		<%
			}
		%>
	</section>


	<!-- Signup-->
	<section class="signup-section" id="signup">
		<div class="container">
			<div class="row">
				<div class="col-md-10 col-lg-8 mx-auto text-center">
					<i class="far fa-paper-plane fa-2x mb-2 text-white"></i>
					<h2 class="text-white mb-5">Subscribe to receive updates!</h2>
					<form class="form-inline d-flex">
						<input class="form-control flex-fill mr-0 mr-sm-2 mb-3 mb-sm-0"
							id="inputEmail" type="email" placeholder="Enter email address..." />
						<button class="btn btn-primary mx-auto" type="submit">Subscribe</button>
					</form>
				</div>
			</div>
		</div>
	</section>
	<!-- Contact-->
	<section class="contact-section bg-black">
		<div class="container">
			<div class="row">
				<div class="col-md-4 mb-3 mb-md-0">
					<div class="card py-4 h-100">
						<div class="card-body text-center">
							<i class="fas fa-map-marked-alt text-primary mb-2"></i>
							<h4 class="text-uppercase m-0">Address</h4>
							<hr class="my-4" />
							<div class="small text-black-50">(주)멀티캠퍼스 서울특별시 강남구 언주로 508
								10-17층</div>
						</div>
					</div>
				</div>
				<div class="col-md-4 mb-3 mb-md-0">
					<div class="card py-4 h-100">
						<div class="card-body text-center">
							<i class="fas fa-envelope text-primary mb-2"></i>
							<h4 class="text-uppercase m-0">Email</h4>
							<hr class="my-4" />
							<div class="small text-black-50">
								<a href="#!">ssafy@ssafy.com</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-4 mb-3 mb-md-0">
					<div class="card py-4 h-100">
						<div class="card-body text-center">
							<i class="fas fa-mobile-alt text-primary mb-2"></i>
							<h4 class="text-uppercase m-0">Phone</h4>
							<hr class="my-4" />
							<div class="small text-black-50">고객센터 02-3429-5041</div>
						</div>
					</div>
				</div>
			</div>
			<div class="social d-flex justify-content-center">
				<a class="mx-2" href="#!"><i class="fab fa-twitter"></i></a><a
					class="mx-2" href="#!"><i class="fab fa-facebook-f"></i></a><a
					class="mx-2" href="#!"><i class="fab fa-github"></i></a>
			</div>
		</div>
	</section>
	<!-- Footer-->
	<footer class="footer bg-black small text-center text-white-50">
		<div class="container">Copyright © SSAFY 2020</div>
	</footer>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
	<!-- Third party plugin JS-->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
</body>

</html>
