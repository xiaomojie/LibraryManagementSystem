<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="user" class="model.userTable"></jsp:useBean>
<jsp:useBean id="changepassword" class = "service.changePassword"></jsp:useBean>
<jsp:setProperty property="*" name="user"/>
<%
if(changepassword.valiUser(user))
{
   out.print("密码修改成功！");     
}else{
   out.print("密码修改失败！");    
}
%>
</body>
</html>