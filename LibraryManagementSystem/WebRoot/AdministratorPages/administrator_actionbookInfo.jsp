<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@page import="model.BooksInfoTable;"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type"
			content="text/html; charset=ISO-8859-1">
		<title>Insert title here</title>
		<link rel="stylesheet" type="text/css" href="../css/style_button.css" />
	</head>
	<jsp:include page="../islogin.jsp"></jsp:include>
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
						<td>
							&nbsp 图书名
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
		<%
			request.setCharacterEncoding("UTF-8");
		%>

		<jsp:useBean id="booksInfoTable" class="model.BooksInfoTable"></jsp:useBean>
		<jsp:useBean id="bookInfoService"
			class="service.AdministratorBookInfoService"></jsp:useBean>
		<jsp:setProperty property="*" name="booksInfoTable" />
		<%
			List<BooksInfoTable> list;
			list = bookInfoService.showBookInfo(booksInfoTable);
			if (list.size() > 0) {
		%>
		<br />
		<br />
		<center>
			<table bgColor="#c0c0c0" style="text-align: center">
				<%
					if (booksInfoTable.getBookType().equals("1")) {
				%>
				<tr>
					<td colspan="7" style="font-size: 30px" bgColor="#99aacc">
						馆藏图书信息
					</td>
				</tr>
				<%
					} else {
				%>
				<tr>
					<td colspan="7" style="font-size: 30px" bgColor="#99aacc">
						借阅图书信息
					</td>
				</tr>
				<%
					}
				%>
				<tr style="font-size: 25px" bgColor="#aedaaa">
					<td style="width: 150px; height: 40px;">
						图书编号
					</td>
					<td style="width: 150px; height: 40px;">
						书名
					</td>
					<td style="width: 150px; height: 40px;">
						作者
					</td>
					<td style="width: 150px; height: 40px;">
						出版社
					</td>
					
				</tr>
				<%
					Iterator<BooksInfoTable> iter = list.iterator();
						BooksInfoTable bookInfo;
						int i = 0;
						while (iter.hasNext()) {
							bookInfo = iter.next();
							i++;
				%>
				<tr style="font-size: 20px; height: 30px"
					onclick="itemClick('<%=bookInfo.getBook_id()%>');">
					<td><%=bookInfo.getBook_id()%></td>
					<td><%=bookInfo.getBook_name()%></td>
					<td><%=bookInfo.getAuthor()%></td>
					<td><%=bookInfo.getPublishing()%></td>
					
				</tr>

				<%
					}
				%>
			</table>
		</center>
		<%
			} else {
				out.print("没有找到符合条件的书！");
			}
		%>
		<script>
 function itemClick(book_id) {
   window.open ('administrator_bookDetailInfo.jsp?id='+book_id,'','height=100, width=400, top=0, left=0, toolbar=no, menubar=no, scrollbars=no,resizable=no,location=no, status=no');
 }
 </script>

	</body>
</html>