<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="connection.ConnectDB"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type"
			content="text/html; charset=ISO-8859-1">
		<link rel="stylesheet" type="text/css" href="../css/style_button.css" />
		<title></title>
		<style type="text/css">
</style>

	</head>
	<jsp:include page="../isReader.jsp"></jsp:include>
	<body>
		<%
			Connection conn = new ConnectDB().getdbConn();
			PreparedStatement ps = conn
					.prepareStatement("select * from [b-category] ");
			ResultSet rs = ps.executeQuery();
		%>
		<center>
			<form method="post" action="reader_actionbookInfo.jsp">
				<table>
					<tr
						style="float: left; margin-top: 5px; font-size: 20px; padding: 10px">
						<td>
							图书名
						</td>
						<td>
							<input type="text" name="book_name">
						</td>
						<td>
							作者
						</td>
						<td>
							<input type="text" name="author">
						</td>
						<td>
							出版社
						</td>
						<td>
							<input type="text" name="publishing">
						</td>
						<td>
							类别
						</td>
						<td>
							<select name="category_id">
								<option value="%">
									全部
								</option>
								<%
									while (rs.next()) {
								%>
								<option value="<%=rs.getString("category_id")%>"><%=rs.getString("category")%></option>
								<%
									}
								%>
							</select>
						</td>
						<td>
							<center>
								<input class="btn" type="submit" value="提交">
							</center>
						</td>
					</tr>
				</table>
			</form>
		</center>
		<hr />

	</body>
</html>