<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.userTable" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
<link rel="stylesheet" type="text/css" href="../css/style_button.css" />
</head>
<jsp:include page="../isReader.jsp"></jsp:include>
<body>
<%userTable user = (userTable)session.getAttribute("user");%>
<center>
<form method = "post" action = "reader_actionborrowInfo.jsp">
<table >
<tr style="float:left;
    margin-top:5px;
	font-size:20px;
	padding:5px">
  <td>读者编号</td>
  <td><input type = "text"  readonly name = "reader_id" value=<%=user.getUserid() %> ></td>
  <td>借阅信息</td>
  <td>
     <select name = "selected" style=" width:180px; height:25px;">
        <option  value="当前借阅信息">当前借阅信息</option>
        <option value="六个月内借阅信息">六个月内借阅信息</option>
        <option value="一年内借阅信息">一年内借阅信息</option>
     </select>
  </td>
  <td ><center>
  <input class = "btn" type = "submit" value ="提交">
  </center>
</tr>
</table>
</form>
</center>
<hr/>
</body>
</html>