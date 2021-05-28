<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO"%>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<jsp:setProperty name="user" property="userName" />
<jsp:setProperty name="user" property="userTel" />
<jsp:setProperty name="user" property="userEmail" />
<jsp:setProperty name="user" property="userGender" />
<%
	request.setCharacterEncoding("UTF-8");
	UserDAO userDAO = new UserDAO();

	String userID = request.getParameter("userID");
	String userPassword = request.getParameter("userPassword");
	String userName = request.getParameter("userName");
	String userTel = request.getParameter("userTel");
	String userEmail = request.getParameter("userEmail");
	String userGender = request.getParameter("userGender");

	String response = null;

	int result = userDAO.join(user);
	if (result == -1) {
		response = "fault";
		
		out.println(response);
		out.flush();
	} else {
/* 		JSONArray jArray = new JSONArray(); // 배열 
		JSONObject jObject = new JSONObject(); // JSON내용을 담을 객체. 
		
		jObject.put("userID", userID);
		jObject.put("userPassword", userPassword);
		jObject.put("userName", userName);
		jObject.put("userTel", userTel);
		jObject.put("userEmail", userEmail);
		jObject.put("userGender", userGender);
		
		jArray.put(0, jObject); */
		response = "success";
		
		out.println(response);
		out.flush();
	}

%>