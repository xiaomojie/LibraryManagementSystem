<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type"
			content="text/html; charset=ISO-8859-1">
		<title></title>
		<link rel="stylesheet" type="text/css" href="../css/style_button.css" />
	</head>
	<jsp:include page="../isAdministrator.jsp"></jsp:include>
	<body>
		<center>
			<form method="post" action="administrator_actionbookInfo.jsp">
				<table>
					<tr
						style="float: left; margin-top: 5px; font-size: 20px; padding: 10px">
						<td>
							<input type="radio" value="1" name="bookType" checked>
							馆藏图书
							<input type="radio" value="2" name="bookType">
							借阅图书
						</td>
						<td >
						    &nbsp
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