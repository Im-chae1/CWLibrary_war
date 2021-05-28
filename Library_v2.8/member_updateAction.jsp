<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="user.User"%>
<%@ page import="user.UserDAO"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
	} else {
			if (request.getParameter("userPassword") == null || request.getParameter("userName") == null || request.getParameter("userTel") == null ||  request.getParameter("userEmail") == null ||  request.getParameter("userGender") == null
					|| request.getParameter("userPassword").equals("") || request.getParameter("userName").equals("") || request.getParameter("userTel").equals("") || request.getParameter("userEmail").equals("") || request.getParameter("userGender").equals("")) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안 된 사항이 있습니다.')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				UserDAO userDAO= new UserDAO();
				int result = userDAO.update(userID, request.getParameter("userPassword"), request.getParameter("userName"), request.getParameter("userTel"), request.getParameter("userEmail"), request.getParameter("userGender"));
				if (result == -1) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('회원정보 수정에 실패하였습니다.')");
					script.println("history.back()");
					script.println("</script>");
				}
				else {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href = 'main.jsp'");
					script.println("</script>");
				}
			}
		}
	%>
</body>
</html>