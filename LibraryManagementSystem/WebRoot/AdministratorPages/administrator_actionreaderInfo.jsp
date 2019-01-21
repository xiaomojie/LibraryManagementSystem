<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@page import="model.ReaderInfoTable"%>
<%@page import="model.userTable"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type"
			content="text/html; charset=ISO-8859-1">
		<title>Insert title here</title>
		<link rel="stylesheet" type="text/css" href="../css/style_button.css" />
	</head>
	<jsp:include page="../isAdministrator.jsp"></jsp:include>
	<body>
		<center>
			<form method="post" action="administrator_actionreaderInfo.jsp">
				<table>

					<tr
						style="float: left; margin-top: 5px; font-size: 20px; padding: 10px">

						<td>
							读者姓名
						</td>
						<td>
							<input type="text" name="reader_name">
						</td>

						<td>
							<input type="submit" value="查询" class="btn">
						</td>
						<td>
							&nbsp &nbsp 读者编号
						</td>
						<td>
							<input type="text" name="reader_id">
						</td>

						<td>
							<input type="submit" value="查询" class="btn">
						</td>
					</tr>
				</table>
			</form>
		</center>
		<hr />
		<%
			request.setCharacterEncoding("UTF-8");
		%>
		<jsp:useBean id="readerInfoTable" class="model.ReaderInfoTable"></jsp:useBean>
		<jsp:useBean id="readerInfoService"
			class="service.AdministratorReaderInfoService"></jsp:useBean>
		<jsp:setProperty property="*" name="readerInfoTable" />
		<%
			List<ReaderInfoTable> list;
			list = readerInfoService.getReaderInfo(readerInfoTable);
			if (list.size() > 0) {
		%>
		<br />
		<br />
		<center>
			<table bgColor="#c0c0c0" style="text-align: center">
				<tr>
					<td colspan="12" style="font-size: 30px" bgColor="#99aacc">
						读者信息
					</td>
				</tr>
				<tr style="font-size: 20px" bgColor="#aedaaa">
					<td style="width: 60px; height: 40px;">
						编号
					</td>
					<td style="width: 100px; height: 40px;">
						姓名
					</td>
					<td style="width: 60px; height: 40px;">
						性别
					</td>
					<td style="width: 100px; height: 40px;">
						出生日期
					</td>
					<td style="width: 100px; height: 40px;">
						联系电话
					</td>
					<td style="width: 100px; height: 40px;">
						手机号码
					</td>
					<td style="width: 100px; height: 40px;">
						邮箱
					</td>
					<td style="width: 100px; height: 40px;">
						证件名称
					</td>
					<td style="width: 150px; height: 40px;">
						证件号
					</td>
					<td style="width: 100px; height: 40px;">
						会员等级
					</td>
					<td style="width: 100px; height: 40px;">
						办证日期
					</td>
					
					<td style="width: 100px; height: 40px;">
						是否修改
					</td>
				</tr>
				<%
							userTable us = (userTable) session.getAttribute("user");
				
					Iterator<ReaderInfoTable> iter = list.iterator();
						ReaderInfoTable readerInfo;
						while (iter.hasNext()) {
							readerInfo = iter.next();
				%>
				<tr style="font-size: 20px; height: 30px">
					<td><%=readerInfo.getReader_id()%></td>
					<td><%=readerInfo.getReader_name()%></td>
					<td><%=readerInfo.getSex()%></td>
					<td><%=readerInfo.getBirthday()%></td>
					<td><%=readerInfo.getPhone()%></td>
					<td><%=readerInfo.getMobile()%></td>
					<td><%=readerInfo.getMail()%></td>
					<td><%=readerInfo.getCard_name()%></td>
					<td><%=readerInfo.getCard_id()%></td>
					<td><%=readerInfo.getLevel()%></td>
					<td><%=readerInfo.getDay()%></td>
					
					
					<td>
						<a
							href="../readersinfoChange.jsp?reader_id=<%=readerInfo.getReader_id()%>&identity=<%=us.getIdentity()%> "
							style="text-decoration: none;">修改</a>
					</td>
				</tr>
				<%
					}
				%>

			</table>
		</center>
		<%
			} else {
				out.print("没有找到符合条件的读者！");
			}
		%>

	</body>
</html>