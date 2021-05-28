<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="admin.AdminDAO"%>
<%@ page import="admin.Admin"%>
<%@ page import="user.UserDAO"%>
<%@ page import="user.User"%>
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
	if (adminID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 해주세요.')");
		script.println("location.href = 'admin_login.jsp'");
		script.println("</script>");
	}
	
	Admin admin = new AdminDAO().getAdmin(adminID);
	if (!adminID.equals(admin.getAdminID())) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('권한이 없습니다.')");
		script.println("location.href='admin_login.jsp'");
		script.println("</script>");
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
	<div class="container">
		<div class="row">
			<%
				UserDAO userDAO = new UserDAO();
			ArrayList<User> userList = userDAO.getUserList();
			%>
			<h3>회원 목록</h3>
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">아이디</th>
						<th style="background-color: #eeeeee; text-align: center;">성명</th>
						<th style="background-color: #eeeeee; text-align: center;">휴대폰</th>
						<th style="background-color: #eeeeee; text-align: center;">성별</th>
					</tr>
				</thead>
				<%
					for (User user : userList) {
				%>
				<tbody>
					<tr>
						<td>
							<a href="admin_meminfo.jsp?userID=<%=user.getUserID()%>"><%=user.getUserID()%></a>
						</td>
						<td><%=user.getUserName()%></td>
						<td><%=user.getUserTel()%></td>
						<td><%=user.getUserGender()%></td>
					</tr>
				</tbody>
				<%
					}
				%>
			</table>
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