<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@page import="model.BooksInfoTable"%>
<%@page import="connection.ConnectDB"%> 
<%@page import="java.sql.Connection"%> 
<%@page import="java.sql.PreparedStatement"%> 
<%@page import="java.sql.ResultSet"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/style_button.css" />
</head>
<jsp:include page="islogin.jsp"></jsp:include>
<body>
<% Connection conn = new ConnectDB().getdbConn();
   PreparedStatement ps = conn.prepareStatement("select * from [b-category] ");
   ResultSet rs = ps.executeQuery();
%>
<center>
<form method = "post" action = "reader_actionbookInfo.jsp">
<table >
<tr style="float:left;
    margin-top:5px;
	font-size:20px;
	padding:10px">
  <td>图书名</td>
  <td><input type = "text" name = "book_name"></td>
  <td>作者</td>
  <td><input type = "text" name = "author" ></td>
  <td>出版社</td>
  <td><input type = "text" name = "publishing" ></td>
  <td>类别</td>
  <td >
     <select name = "category_id">
        <option value = "%">全部</option>
        <%while(rs.next()){%>
        <option value = "<%=rs.getString("category_id") %>"><%=rs.getString("category") %></option>
        <%} %>
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
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="booksInfoTable" class = "model.BooksInfoTable"></jsp:useBean>
<jsp:useBean id="bookInfoService" class = "service.ReaderBookInfoService"></jsp:useBean>
<jsp:setProperty property = "*" name = "booksInfoTable"/>
<%
List<BooksInfoTable> list;
list=bookInfoService.showBookInfo(booksInfoTable);
if(list.size()>0){
      %>
      <br/><br/>
      <center>
      <table bgColor="#c0c0c0" style="text-align:center">
      <tr> <td colspan = "7" style = "font-size:30px" bgColor="#99aacc">图书信息</td></tr>
      <tr style = "font-size:25px" bgColor="#aedaaa" >
         <td style=" width:150px; height:40px;">图书编号</td>
         <td style=" width:150px; height:40px;">书名</td>
         <td style=" width:150px; height:40px;">图书类别</td>
         <td style=" width:150px; height:40px;">作者</td>
         <td style=" width:150px; height:40px;">出版社</td>
         <td style=" width:150px; height:40px;">价格</td>
         <td style=" width:150px; height:40px;">库余量</td>
     </tr>
     <%
        Iterator<BooksInfoTable> iter = list.iterator();
        BooksInfoTable bookInfo;
        while(iter.hasNext()){
           bookInfo=iter.next();
           %>
           <tr style = "font-size:20px; height:30px">
             <td><%=bookInfo.getBook_id()%></td>
             <td><%=bookInfo.getBook_name()%></td>
             <td><%=bookInfo.getCategory_id()%></td>
             <td><%=bookInfo.getAuthor()%></td>
             <td><%=bookInfo.getPublishing()%></td>
             <td><%=bookInfo.getPrice()%></td>
             <td><%=bookInfo.getQuantity_in()%></td>				
           </tr>
           <% 
        }
      %>
     
     </table>
     </center>
      <% 
  }else{
      out.print("没有找到符合条件的书！"); 
  }
 %>

</body>
</html>