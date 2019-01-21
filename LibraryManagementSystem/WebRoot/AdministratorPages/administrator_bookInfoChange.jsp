<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
<link rel="stylesheet" type="text/css" href="../css/style_button.css" />
</head>
<jsp:include page="../isAdministrator.jsp"></jsp:include>
<body>
<br/>
<center>
<%String book_id = request.getParameter("book_id"); %>
<form method = "post" action = "administrator_actionbookInfoChange.jsp">
<table bgColor="#c0c0c0">
<tr>
  <td colspan = "2" align="center" bgColor="#aedaaa" style=" width:400px; height:60px; font-size:35px;" >图书信息修改</td>
</tr>
<tr style=" width:100px; height:30px; font-size:20px;">
  <td>图书编号</td>
  <td><input type = "text" name = "book_id" style=" width:250px; height:25px;" value = <%=book_id %>></td>
</tr>
<tr style=" width:100px; height:30px; font-size:20px;">
  <td>图书名</td>
  <td><input type = "text" name = "book_name" style=" width:250px; height:25px;" ></td>
</tr>
<tr style=" width:100px; height:30px; font-size:20px;">
  <td>作者</td>
  <td><input type = "text" name = "author" style=" width:250px; height:25px;"></td>
</tr>
<tr style=" width:100px; height:30px; font-size:20px;">
  <td>出版社</td>
  <td><input type = "text" name = "publishing" style=" width:250px; height:25px;"></td>
</tr>
<tr style=" width:100px; height:30px; font-size:20px;">
  <td>类别</td>
  <td >
     <select name = "category_id" style=" width:150px; height:25px;">
        <option selected value = "ca01">计算机</option>
        <option value = "ca02">农林</option>
        <option value = "ca03">医学</option>
        <option value = "ca04">科普</option>
        <option value = "ca05">通信</option>
        <option value = "ca06">建筑</option>
        <option value = "ca07">其它</option>
     </select>
  </td>
</tr>
<tr style=" width:100px; height:30px; font-size:20px;">
  <td>单价</td>
  <td><input type = "number" min = 0.00 step = 0.01 name = "price" style=" width:150px; height:25px;"></td>
</tr>
 <% String datetime=new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime()); %> 
<tr style=" width:100px; height:30px; font-size:20px;">
  <td>入库日期</td>
  <td><input type = "date" name = "date_in" value=<%=datetime%>  style=" width:150px; height:25px;"></td>
</tr>
<tr style=" width:100px; height:30px; font-size:20px;">
  <td>入库数</td>
  <td><input type = "number" min = 0 name = "quantity_in" style=" width:150px; height:25px;"></td>
</tr>
<tr>
  <td  colspan = "2"><center>
  <input class="btn" type = "submit" value ="提交" style = "width:100px; height:30px;">
  </center>
  </td>
</tr>
</table>
</form>
</center>
</body>
</html>