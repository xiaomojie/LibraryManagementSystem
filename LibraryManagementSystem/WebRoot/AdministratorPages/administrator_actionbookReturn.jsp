<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="connection.ConnectDB"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
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
				if (book.getReader_id() != null && book.getBook_id() != null) {
					Connection conn = new ConnectDB().getdbConn();
					PreparedStatement ps = conn
							.prepareStatement("update borrow set returned='是',loss='否' where reader_id=? and book_id=?");
					ps.setString(1, book.getReader_id());
					ps.setString(2, book.getBook_id());
					ps.executeUpdate();
					PreparedStatement ps2 = conn
							.prepareStatement("update books set quantity_out=quantity_out-1 where book_id = ?");
					ps2.setString(1, book.getBook_id());
					ps2.executeUpdate();
					out.print("还书成功！");
					

					ps.close();
					ps2.close();
					conn.close();
				}else{
				out.print("请输入读者编号和图书编号");
				}
			} catch (SQLException e) {
				out.print("还书失败！"+e.getMessage());
			}
		%>

	</body>
</html>