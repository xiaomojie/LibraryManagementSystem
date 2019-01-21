<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="connection.ConnectDB"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>图书详细信息</title>
<link rel="stylesheet" type="text/css" href="css/style_button.css" />
</head>
<body>
      <br/><br/>
      <center>
      <table bgColor="#c0c0c0" style="text-align:center">
      <tr> <td colspan = "12" style = "font-size:30px" bgColor="#99aacc">图书详细信息</td></tr>
      <tr style = "font-size:25px" bgColor="#aedaaa" >
         <td style="height:40px;">图书编号</td>
         <td style=" height:40px;">图书名</td>
         <td style=" height:40px;">作者</td>
         <td style="  height:40px;">出版社</td>
         <td style="  height:40px;">类别号</td>
         <td style="  height:40px;">类别名</td>
         <td style="  height:40px;">单价</td>
         <td style="  height:40px;">入库日期</td>
         <td style="  height:40px;">入库数</td>
         <td style="  height:40px;">出借数</td>
         <td style="  height:40px;">遗失数</td>
         <td style="  height:40px;">修改</td>
         
      </tr>
<%
      String book_id=request.getParameter("id");
      Connection conn;
      String query = "select * from books,[b-category] where books.category_id = [b-category].category_id and book_id = ?";
      conn = new ConnectDB().getdbConn();
      PreparedStatement pstmt = conn.prepareStatement(query);
      pstmt.setString(1,book_id);
      ResultSet rs = pstmt.executeQuery();
      
      if(rs.next()){
      %>
       <tr style = "font-size:20px; height:30px"  >
             <td><%=rs.getString(1)%></td>
             <td><%=rs.getString(2)%></td>
             <td><%=rs.getString(3)%></td>
             <td><%=rs.getString(4)%></td>
             <td><%=rs.getString(5)%></td>
             <td><%=rs.getString(12)%></td>
             <td><%=rs.getString(6)%></td>
             <td><%=rs.getString(7)%></td>
             <td><%=rs.getString(8)%></td>
             <td><%=rs.getString(9)%></td>             
             <td><%=rs.getString(10)%></td>      
             <td>
						<a href = "administrator_bookInfoChange.jsp?book_id=<%=rs.getString(1)%> " style="text-decoration: none;">修改</a>
					</td>       
       </tr>
       </table>
       </center>
      <%
      }%>
</body>
</html>