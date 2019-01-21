<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*"%>
<%@ page import="java.text.*"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/style_button.css" />
</head>
<jsp:include page="isAdministrator.jsp"></jsp:include>
<body>
<center>
<form method = "post" action = "administrator_actionbookReturn.jsp" style="margin-top:100px">
<table bgColor="#c0c0c0">
<tr>
  <td colspan = "2" align="center" bgColor="#aedaaa" style=" width:400px; height:60px; font-size:35px;" >图书归还</td>
</tr>
<tr style=" width:100px; height:30px; font-size:20px;">
  <td>读者编号</td>
  <td><input type = "text" name = "reader_id" style=" width:250px; height:25px;" ></td>
</tr>


<tr style=" width:100px; height:30px; font-size:20px;">
  <td>图书编号</td>
  <td><input type = "text" name = "book_id" style=" width:250px; height:25px;"></td>
</tr>

 <% String datetime=new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime()); %> 
<tr style=" width:100px; height:30px; font-size:20px;">
  <td>归还日期</td>
  <td><input type = "date" name = "date_borrow" value=<%=datetime%>></td>
</tr>
<tr>
  <td  colspan = "2"><center>
  <input class="btn" type = "submit" value ="归还" style = "width:100px; height:30px;">
  </center>
  </td>
</tr>
</table>
</form>
</center>
</body>
</html>