<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width; initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>CW Library</title>
</head>
<body>
	<!-- header -->
	<header>
		<div>
			<ul class="list-unstyled list-inline text-right">
				<li>
					<a href="login.jsp">로그인</a>
				</li>
				<li>|</li>
				<li>
					<a href="join.jsp">회원가입</a>
				</li>
			</ul>
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
							My Library
							<span class="caret"></span>
						</a>
						<ul class="dropdown-menu">
							<li>
								<a href="#">대출조회</a>
							</li>
							<li>
								<a href="member_info.jsp">개인정보관리</a>
							</li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- //menubar -->
	<!-- contents -->
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 10px; padding-bottom: 20px">
				<form method="post" action="admin_loginAction.jsp">
					<h3 style="text-align: center;">Login</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="아이디" name="adminID" maxlength="20">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호" name="adminPassword" maxlength="20">
					</div>
					<div>
						<input type="submit" class="bin btn-primary form-control" value="로그인">
					</div>
				</form>
				<hr>
				<div class="text-center">
					<a href="login.jsp">회원 로그인</a>
				</div>
			</div>
		</div>
	</div>
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