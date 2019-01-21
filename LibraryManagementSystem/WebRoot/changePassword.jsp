<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.userTable" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
	<link rel="stylesheet" type="text/css" href="css/style_button.css" />
</head>
<jsp:include page="islogin.jsp"></jsp:include>
<body style="padding-top:100px">
<center>
<%userTable user = (userTable)session.getAttribute("user");%>
<form method = "post" action = "actoinChangePassword.jsp">
<table bgColor="#c0c0c0">
<tr>
  <td colspan = "2" align="center" bgColor="#aedaaa" style=" width:300px; height:45px; font-size:30px;" >修改密码</td>
</tr>
<tr style=" width:100px; height:30px; font-size:20px;">
  <td>账户名</td>
  <td><input type = "text"  readonly name = "userid" style=" height:25px;" value=<%=user.getUserid() %> ></td>
</tr>
<tr style=" width:100px; height:40px; font-size:20px;">
  <td>当前密码</td>
  <td><input type = "password" name = "userpassword" style=" height:25px;" ></td>
</tr>
<tr style=" width:100px; height:40px; font-size:20px;">
  <td>新密码</td>
  <td><input type = "password" name = "newpassword" style=" height:25px;" ></td>
</tr>
<tr style=" width:100px; height:40px; font-size:20px;">
  <td>确认密码</td>
  <td><input type = "password"  name = "renewpassword" style=" height:25px;" ></td>
</tr>
<tr>
  <td  colspan = "2"><center>
  <input type = "submit" class = "btn" value ="修改" style = "width:100px; height:30px;">
  </center>
  </td>
</tr>
</table>
</form>


</center>
</body>
</html>