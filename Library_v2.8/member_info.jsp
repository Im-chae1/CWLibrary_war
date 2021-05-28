<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="user.User"%>
<%@ page import="user.UserDAO"%>
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
		String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	if (userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 해주세요.')");
		script.println("location.href = 'login.jsp'");
		script.println("</script>");
	}

	User user = new UserDAO().getUser(userID);
	if (!userID.equals(user.getUserID())) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('권한이 없습니다.')");
		script.println("location.href='login.jsp'");
		script.println("</script>");
	}
	%>
	<!-- header -->
	<header>
		<div>
			<ul class="list-unstyled list-inline text-right">
				<li>
					<a href="member_info.jsp"><%=userID%></a>
				</li>
				<li>|</li>
				<li>
					<a href="logoutAction.jsp">로그아웃</a>
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
								<a href="bbs.jsp">문의</a>
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
			<div class="jumbotron" style="padding-top: 20px;">
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="3" style="background-color: #eeeeee; text-align: center;">회원정보</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td style="width: 20%;">아이디</td>
							<td colspan="2"><%=user.getUserID()%></td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td colspan="2"><%=user.getUserPassword()%></td>
						</tr>
						<tr>
							<td>성명</td>
							<td colspan="2"><%=user.getUserName()%></td>
						</tr>
						<tr>
							<td>휴대폰</td>
							<td colspan="2"><%=user.getUserTel()%></td>
						</tr>
						<tr>
							<td>이메일</td>
							<td colspan="2"><%=user.getUserEmail()%></td>
						</tr>
						<tr>
							<td>성별</td>
							<td colspan="2"><%=user.getUserGender()%></td>
						</tr>
					</tbody>
				</table>
				<div style="float: right">
					<a href="member_update.jsp?userID=<%=userID%>" class="btn btn-danger">수정</a>
					<a onclick="return confirm('정말로 탈퇴하시겠습니까?')" href="member_deleteAction.jsp?userID=<%=userID%>" class="btn btn-danger">탈퇴</a>
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