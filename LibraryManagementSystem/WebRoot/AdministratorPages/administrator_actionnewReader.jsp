<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="service.AdministratorNewReaderService"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="newReader" class = "model.ReaderInfoTable"></jsp:useBean>
<jsp:useBean id="newReaderService" class = "service.AdministratorNewReaderService"></jsp:useBean>
<jsp:setProperty property = "*" name = "newReader"/>
<%
if(newReaderService.createReaderInfo(newReader)){
   out.print("办理借书证成功");
}else{
   out.print("办理借书证失败");
}
 %>

</body>
</html>