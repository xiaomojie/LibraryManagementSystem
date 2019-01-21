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
			class="service.bookInfoChange"></jsp:useBean>
		<jsp:setProperty property="*" name="newBook" />
		<%
			
				if (newTableService.insertBook(newBook)==1) {
					out.print("图书信息修改成功");
				} else if(newTableService.insertBook(newBook)==0) {
					out.print("图书信息修改失败");
				}else{
				    out.print("入库数不能小于当前已借出图书量！");
				}
			
		%>

	</body>
</html>