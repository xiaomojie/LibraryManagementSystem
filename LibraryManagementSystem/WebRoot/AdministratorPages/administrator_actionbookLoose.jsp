<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="connection.ConnectDB"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.util.*"%>
<%@page import="model.BorrowInfoTable"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type"
			content="text/html; charset=ISO-8859-1">
		<title>Insert title here</title>
		<link rel="stylesheet" type="text/css" href="../css/style_button.css" />
	</head>
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
		<hr />
		<br>
		<%
			request.setCharacterEncoding("UTF-8");
		%>
		<jsp:useBean id="borrowInfoTable" class="model.BorrowInfoTable"></jsp:useBean>
		<jsp:useBean id="borrowInfoService"
			class="service.ReaderBorrowInfoService"></jsp:useBean>
		<jsp:setProperty property="*" name="borrowInfoTable" />
		<%
			List<BorrowInfoTable> list;
			list = borrowInfoService.getBorrowInfo(borrowInfoTable);
			if (list.size() > 0) {
		%>
		<br />
		<br />
		<center>
			<table bgColor="#c0c0c0" style="text-align: center">
				<tr>
					<td colspan="8" style="font-size: 30px" bgColor="#99aacc"><%=borrowInfoTable.getSelected()%></td>
				</tr>
				<tr style="font-size: 25px" bgColor="#aedaaa">
					<td style="width: 150px; height: 40px;">
						读者编号
					</td>
					<td style="width: 150px; height: 40px;">
						图书编号
					</td>
					<td style="width: 150px; height: 40px;">
						图书名
					</td>
					<td style="width: 150px; height: 40px;">
						作者
					</td>
					<td style="width: 150px; height: 40px;">
						图书类别
					</td>

					<td style="width: 150px; height: 40px;">
						借阅日期
					</td>
					<td style="width: 150px; height: 40px;">
						应还日期
					</td>
					<td style="width: 150px; height: 40px;">
						是否挂失
					</td>
				</tr>
				<%
					Iterator<BorrowInfoTable> iter = list.iterator();
						BorrowInfoTable borrowInfo;
						while (iter.hasNext()) {
							borrowInfo = iter.next();
				%>
				<tr style="font-size: 20px; height: 30px">
					<td><%=borrowInfoTable.getReader_id()%></td>
					<td><%=borrowInfo.getBook_id()%></td>
					<td><%=borrowInfo.getBook_name()%></td>
					<td><%=borrowInfo.getAuthor()%></td>
					<td><%=borrowInfo.getCategory()%></td>
					<td><%=borrowInfo.getDate_borrow()%></td>
					<td><%=borrowInfo.getDate_return()%></td>
					<td>
						<a href = "administrator_actionbookLooseDeal.jsp?reader_id=<%=borrowInfoTable.getReader_id()%>&book_id=<%=borrowInfo.getBook_id() %> " style="text-decoration: none;">挂失</a>
					</td>
				</tr>
				<%
					}
				%>

			</table>
		</center>
		<%
			} else {
				out.print("该读者当前没有借阅图书！");
			}
		%>

	</body>
</html>