<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="model.userTable"%>
<%@page import="service.userService"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<jsp:useBean id="user" class="model.userTable"></jsp:useBean>
		<jsp:useBean id="userService" class="service.userService"></jsp:useBean>
		<jsp:setProperty property="*" name="user" />
		<%
			if (userService.valiUser(user)) {
				session.setAttribute("user", user);
				user.setUsername(userService.getUsername());
				if (userService.getIdentity().equalsIgnoreCase("administrator")) {
					user.setIdentity("administrator");
		%>
		<jsp:forward page="Administrator.jsp"></jsp:forward>
		<%
			} else {
					user.setIdentity("reader");
		%>
		<jsp:forward page="Reader.jsp"></jsp:forward>
		<%
			}
			} else {
		%>
		<script type="text/javascript"> alert("登录失败"); window.location="login.jsp" </script>
		<%
			}
		%>
	</body>
</html>