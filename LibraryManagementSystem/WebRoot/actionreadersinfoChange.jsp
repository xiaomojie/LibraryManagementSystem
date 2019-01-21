<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="service.AdministratorNewReaderService"%>
<%@page import="service.ReadersinfoChangeService"%>
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
<jsp:useBean id="reader" class = "model.ReaderInfoTable"></jsp:useBean>
<jsp:useBean id="newReaderService" class = "service.ReadersinfoChangeService"></jsp:useBean>
<jsp:setProperty property = "*" name = "reader"/>
<%
if(newReaderService.changeReadersInfo(reader)){
   out.print("读者信息修改成功");
}else{
   out.print("读者信息修改失败");
}
 %>

</body>
</html>