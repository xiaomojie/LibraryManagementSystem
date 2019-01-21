<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>
<%@page import="model.BorrowBooksReadersInfoTable"%>
<%@ page import="java.util.*"%>
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
			<form method="post" action="administrator_actionoverdue.jsp">
				<table>
					<tr
						style="float: left; margin-top: 5px; font-size: 20px; padding: 10px">
						<td>
							图书编号
						</td>
						<td>
							<input type="text" name="book_id">
						</td>
						<td>
							读者编号
						</td>
						<td>
							<input type="text" name="reader_id">
						</td>
						
						<td>
							<input class="btn" type="submit" value="提交">
						</td>
					</tr>
				</table>
			</form>
		</center>
		<hr/>
		<jsp:useBean id="borrowBooksReaders" class="model.BorrowBooksReadersInfoTable"></jsp:useBean>
		<jsp:useBean id="bookInfoService"
			class="service.AdministratorOverdue"></jsp:useBean>
		<jsp:setProperty property="*" name="borrowBooksReaders" />
		<%
			List<BorrowBooksReadersInfoTable> list = bookInfoService
					.getOverdue(borrowBooksReaders);
			if (list.size() > 0) {
		%>
		 <center>
		 <br />
		<br />
			<table bgColor="#c0c0c0" style="text-align: center">
			    
				<tr>
					<td colspan="9" style="font-size: 30px" bgColor="#99aacc">
						逾期未还信息
					</td>
				</tr>
				<tr style="font-size: 25px" bgColor="#aedaaa">
					<td style="width: 150px; height: 40px;">
						读者编号
					</td>
					<td style="width: 150px; height: 40px;">
						读者姓名
					</td>
					<td style="width: 150px; height: 40px;">
						手机
					</td>
					<td style="width: 150px; height: 40px;">
						电话
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
						应还日期
					</td>
					<td style="width: 150px; height: 40px;">
						邮件提醒
					</td>
				<%
					Iterator<BorrowBooksReadersInfoTable> iter = list.iterator();
						BorrowBooksReadersInfoTable info;
						while (iter.hasNext()) {
							info = iter.next();
				%>
				<tr style="font-size: 20px; height: 30px">
					<td><%=info.getReader_id()%></td>
					<td><%=info.getReader_name()%></td>
					<td><%=info.getMobile()%></td>
					<td><%=info.getPhone()%></td>
					<td><%=info.getBook_id()%></td>
					<td><%=info.getBook_name()%></td>
					<td><%=info.getAuthor()%></td>
					<td><%=info.getDate_return()%></td>
					<td>
						<a href = "administrator_email.jsp?book_name=<%=info.getBook_name()%>&date_return=<%=info.getDate_return()%>&mail=<%=info.getMail() %>" style="text-decoration: none;">提醒</a>
					</td> 
				</tr>
				<%
					}
				%>
			</table>
		</center>
		<%
			}
		%>
		
	</body>
</html>