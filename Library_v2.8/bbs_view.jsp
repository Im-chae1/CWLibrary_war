<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="bbs.BbsDAO"%>
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
	int bbsNum = 0;
	if (request.getParameter("bbsNum") != null) {
		bbsNum = Integer.parseInt(request.getParameter("bbsNum"));
	}
	if (bbsNum == 0) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 글입니다.')");
		script.println("location.href = 'bbs.jsp'");
		script.println("</script>");
	}
	Bbs bbs = new BbsDAO().getBbs(bbsNum);
	%>
	<!-- header -->
	<header>
		<div>
			<%
				if (userID == null) {
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
				<li>
					<a href="member_info.jsp"><%=userID%></a>
				</li>
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
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="3" style="background-color: #eeeeee; text-align: center;">문의사항</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 20%;">글 제목</td>
						<td colspan="2"><%=bbs.getBbsTitle().replace(" ", "&nbsp;").replace("<", "&lt;").replace("\n", "<br>")%></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td colspan="2"><%=bbs.getUserID()%></td>
					</tr>
					<tr>
						<td>작성일자</td>
						<td colspan="2"><%=bbs.getBbsDate().substring(0, 11) + bbs.getBbsDate().substring(11, 13) + "시"
		+ bbs.getBbsDate().substring(14, 16) + "분"%></td>
					</tr>
					<tr>
						<td>내용</td>
						<td colspan="2" style="min-height: 200px; text-align: left;"><%=bbs.getBbsContent().replace(" ", "&nbsp;").replace("<", "&lt;").replace("\n", "<br>")%></td>
					</tr>
				</tbody>
			</table>
			<a href="bbs.jsp" class="btn btn-primary">목록</a>
			<%
				if (userID != null && userID.equals(bbs.getUserID())) {
			%>
			<a href="bbs_update.jsp?bbsNum=<%=bbsNum%>" class="btn btn-primary">수정</a>
			<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="bbs_deleteAction.jsp?bbsNum=<%=bbsNum%>" class="btn btn-primary">삭제</a>
			<%
				}
			%>
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