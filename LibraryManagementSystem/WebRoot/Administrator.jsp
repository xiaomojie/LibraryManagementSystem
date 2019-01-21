<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="model.userTable"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>管理员中心</title>
		<link rel="stylesheet" type="text/css" href="css/styleReader.css" />

	</head>
	<jsp:include page="isAdministrator.jsp"></jsp:include>
	<body>
		<%
			userTable us = (userTable) session.getAttribute("user");
		%>
		<div class="syshead">
			<h2 class="left">
				管理员中心
			</h2>
			<p class="right">
				<span>欢迎您！ </span><a href="javascript:void(0);" class="username"><%=us.getUsername()%></a>
				<a href="changePassword.jsp" class="changePassword"
					target="Administrator_right">修改密码</a>
				<a class="outsys" title="退出系统" href="exist.jsp"> <img
						src="image/outsys.gif" width="16" height="16" alt="" />退出</a>
			</p>
		</div>
		<div class="content">
			<div class="sysleft">
				<ul class="menu">
					<li>
						<a href="AdministratorPages/administrator_bookInfo.jsp"
							target="Administrator_right">查询图书信息</a>
					</li>
					<li>
						<a href="AdministratorPages/administrator_readerInfo.jsp"
							target="Administrator_right">查询读者信息</a>
					</li>
					<li>
						<a href="AdministratorPages/administrator_bookInto.jsp"
							target="Administrator_right">图书入库</a>
					</li>
					<li>
						<a href="AdministratorPages/administrator_newReader.jsp"
							target="Administrator_right">办理借书证</a>
					</li>
					<li>
						<a href="AdministratorPages/administrator_bookBorrow.jsp"
							target="Administrator_right">图书借阅</a>
					</li>
					<li>
						<a href="AdministratorPages/administrator_bookReturn.jsp"
							target="Administrator_right">图书归还</a>
					</li>
					<li>
						<a href="AdministratorPages/administrator_overdue.jsp"
							target="Administrator_right">逾期未还处理</a>
					</li>
					<li>
						<a href="AdministratorPages/administrator_bookLoose.jsp"
							target="Administrator_right">图书挂失处理</a>
					</li>
					<li>
						<a href="AdministratorPages/administrator_readerCardLoose.jsp"
							target="Administrator_right">借书证挂失处理</a>
					</li>
				</ul>
			</div>
			<div class="sysright">
				<iframe width="1111px" height="1178px"
					src="AdministratorPages/Administrator_right.jsp"
					name="Administrator_right" scrolling="no"></iframe>
			</div>
		</div>
	</body>

</html>