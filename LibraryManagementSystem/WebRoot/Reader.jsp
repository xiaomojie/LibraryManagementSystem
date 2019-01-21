<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="model.userTable"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>个人中心</title>
		<link rel="stylesheet" type="text/css" href="css/styleReader.css" />

	</head>
	<jsp:include page="isReader.jsp"></jsp:include>
	<body>
		<%
			userTable us = (userTable) session.getAttribute("user");
		%>
		<div class="syshead">
			<h2 class="left">
				读者个人中心
			</h2>
			<p class="right">
				<span>欢迎您！ </span><a href="javascript:void(0);" class="username"><%=us.getUsername()%></a>
				<a href="changePassword.jsp" class="changePassword"  target="reader_right">修改密码</a>
				<a class="outsys" title="退出系统" href="exist.jsp"> <img
						src="image/outsys.gif" width="16" height="16" alt="" />退出</a>
			</p>
		</div>
		<div class="content">
			<div class="sysleft">
				<ul class="menu">
					<li>
						<a class="current" href="">个人信息</a>
					</li>
					<li>
						<a href="ReaderPages/reader_bookInfo.jsp" target="reader_right">查询图书信息</a>
					</li>
					<li>
						<a href="ReaderPages/reader_borrowInfo.jsp" target="reader_right">查询借阅信息</a>
					</li>
				</ul>
			</div>
			<div class="sysright">
				<iframe width="1111px" height="1178px" src="ReaderPages/reader_right.jsp"
					name="reader_right" scrolling="no"></iframe>
			</div>
		</div>
	</body>

</html>