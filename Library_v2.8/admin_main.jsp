<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width; initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>CW Library</title>
</head>
<body>
	<%
		String adminID = null;
		if (session.getAttribute("adminID") != null) {
			adminID = (String) session.getAttribute("adminID");
		}
	%>
	<!-- header -->
	<header>
		<div>
			<%
				if (adminID == null) {
			%>
			<ul class="list-unstyled list-inline text-right">
				<li>
					<a href="login.jsp">로그인</a>
				</li>
				<li>|</li>
				<li>
					<a href="join.jsp">회원가입</a>
				</li>
			</ul>
			<%
				} else {
			%>
			<ul class="list-unstyled list-inline text-right">
				<li>관리자 로그인</li>
				<li>|</li>
				<li>
					<a href="logoutAction.jsp">로그아웃</a>
				</li>
			</ul>
			<%
				}
			%>
		</div>
	</header>
	<!-- //header -->
	<!-- menubar -->
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-left" href="main.jsp">
					<img src="images/logo.png" height="80" alt="CW Library">
				</a>
			</div>

			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li style="padding: 15px; font-size: 22px">
						<a href="main.jsp">Home</a>
					</li>
					<li style="padding: 15px; font-size: 22px">
						<a href="#">추천도서</a>
					</li>
					<li class="dropdown" style="padding: 15px; font-size: 22px">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
							이용문의
							<span class="caret"></span>
						</a>
						<ul class="dropdown-menu">
							<li>
								<a href="#">문의</a>
							</li>
							<li>
								<a href="#">FAQ</a>
							</li>
						</ul>
					</li>
					<li class="dropdown" style="padding: 15px; font-size: 22px">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
							관리
							<span class="caret"></span>
						</a>
						<ul class="dropdown-menu">
							<li>
								<a href="#">도서</a>
							</li>
							<li>
								<a href="admin_memlist.jsp">회원</a>
							</li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- //menubar -->
	<!-- contents -->
	<!-- search -->
	<div class="text-center" style="background-image: url('images/searchBack.jpg'); background-size: cover; height: 350px;">
		<from class="form-inline" method="post" action="searchAction.jsp">
		<div class="input-group input-group-lg" style="padding-top: 150px">
			<input type="text" class="form-control" placeholder="검색어를 입력하세요 www" name="bookTitle" style="height: 65px; width: 450px;">
			<span class="input-group-btn">
				<button class="btn btn-default" type="submit" style="height: 65px">검색</button>
			</span>
		</div>
		</from>
	</div>
	<!-- //search -->
	<!-- recombooks -->
	<div class="container">
		<div>추천도서</div>
	</div>
	<!-- //recombooks -->
	<!-- //contents -->
	<!-- footer -->
	<footer>
		<div class="jumbotron text-center" style="margin-bottom: 0px;">
			<ul class="list-unstyle list-inline">
				<li>
					<a href="main.jsp">
						<img src="images/logo.png" alt="CW Library" height="100">
					</a>
				</li>
				<li>
					Tel : 010-6859-3223
					<br>
					Email : cehwon0606@dongguk.ac.kr
				</li>
			</ul>
		</div>
	</footer>
	<!-- //footer -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>