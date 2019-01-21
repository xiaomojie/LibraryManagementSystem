<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
			<form method="post" action="administrator_actionbookLoose.jsp">
				<table>
					<tr
						style="float: left; margin-top: 5px; font-size: 20px; padding: 10px">
						<td>
							读者编号
						</td>
						<td>
							<input type="text" name="reader_id">
						</td>
						<td>
						&nbsp&nbsp&nbsp
							<input type="submit" value="查询" class="btn">
						</td>
					</tr>
				</table>
			</form>
		</center>
		<hr/>
	</body>
</html>