<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="connection.ConnectDB"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.sql.SQLException"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type"
			content="text/html; charset=ISO-8859-1">
		<title>Insert title here</title>

	</head>
	<body>
		<br>
		<%
			request.setCharacterEncoding("UTF-8");
		%>
		<jsp:useBean id="book" class="model.BorrowInfoTable"></jsp:useBean>

		<jsp:setProperty property="*" name="book" />
		<%
			try {
				Connection conn = new ConnectDB().getdbConn();
				PreparedStatement ps = conn
						.prepareStatement("insert into borrow values(?,?,?,?,NULL,'否')");
				PreparedStatement ps2 = conn
						.prepareStatement("declare @days int  exec @days=dbo.largest_borrow_days @ireader_id= ? select @days");
				ps2.setString(1, book.getReader_id());
				ResultSet rs2 = ps2.executeQuery();
				ps.setString(1, book.getReader_id());
				ps.setString(2, book.getBook_id());
				ps.setString(3, book.getDate_borrow());
				Calendar c = Calendar.getInstance();
				if (rs2.next()) {
					c.add(Calendar.MONTH, rs2.getInt(1) / 30);
					String datetime2 = new SimpleDateFormat("yyyy-MM-dd")
							.format(c.getTime());
					ps.setString(4, datetime2);
				} else {
					out.print("系统错误！");
				}

				ps.executeUpdate();
				out.print("借书成功！");
				ps2 = conn
						.prepareStatement("update books set quantity_out=quantity_out+1 where book_id = ?");
				ps2.setString(1, book.getBook_id());
				ps2.executeUpdate();
				rs2.close();
				ps.close();
				ps2.close();
				conn.close();
			} catch (SQLException e) {
				if (e.getMessage().equals(
								"INSERT 语句与 FOREIGN KEY 约束\"FK_borrow_books\"冲突。该冲突发生于数据库\"bookmis\"，表\"dbo.books\", column 'book_id'。")) {
				     out.print("借书失败！读者借阅的书一定要是系统所提供的书");
				}else {
				  out.print("借书失败！"+e.getMessage());
				}
				
			}
		%>

	</body>
</html>