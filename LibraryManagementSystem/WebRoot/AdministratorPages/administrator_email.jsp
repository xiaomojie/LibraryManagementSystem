<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="mailClient.SendMail"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String book_name=new String(request.getParameter("book_name").getBytes("ISO-8859-1"),"utf-8");
String date_return = request.getParameter("date_return");
String email = request.getParameter("mail");
new SendMail(book_name,date_return,email);
 %>
 <script type="text/javascript">alert("邮件提醒成功！")</script>

</body>
</html>