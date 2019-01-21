<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="service.AdministratorBookIntoService"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type"
			content="text/html; charset=ISO-8859-1">
		<title>Insert title here</title>

	</head>
	<body>
		<br>
		<%
			request.setCharacterEncoding("UTF-8");
		%>
		<jsp:useBean id="newBook" class="model.BooksInfoTable"></jsp:useBean>
		<jsp:useBean id="newTableService"
			class="service.AdministratorBookIntoService"></jsp:useBean>
		<jsp:setProperty property="*" name="newBook" />
		<%
			if (newBook.getBook_name() == null || newBook.getAuthor() == null
					|| newBook.getPublishing() == null
					|| newBook.getPrice() < 0 || newBook.getDate_in() == null
					|| newBook.getQuantity_in() < 0) {
					out.print("输入的信息不能为空！");
			} else {
				if (newTableService.insertBook(newBook)) {
					out.print("图书入库成功");
				} else {
					out.print("图书入库失败");
				}
			}
		%>

	</body>
</html>