<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="connection.ConnectDB"%>
<%@page import="java.sql.Connection"%>
<%@page import="model.userTable"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type"
			content="text/html; charset=ISO-8859-1">
			<link rel="stylesheet" type="text/css" href="../css/style_table.css" />
	</head>
	<jsp:include page="islogin.jsp"></jsp:include>
	<body>
		<%
		
			Connection conn = new ConnectDB().getdbConn();
			userTable us = (userTable) session.getAttribute("user");
			
			PreparedStatement pstmt = conn
					.prepareStatement("select * from readers,[member-level] where reader_id = ? and readers.level = [member-level].level");
			pstmt.setString(1, us.getUserid());
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
		%>
		<center>
		<form method = "post" action = "../readersinfoChange.jsp?reader_id=<%=us.getUserid()%>&identity=<%=us.getIdentity()%>">
		<table class = "table">
		<tr >
            <td class="head" colspan = "2" align="center"  >读者个人信息</td>
        </tr>
		<tr class = "row">
		<td>读者编号</td>
		<td><input type="text" disabled="disabled" value="<%=rs.getString(1)%>"
				class="col" /></td>
		</tr>
		<tr class = "row">
		<td>姓   名</td>
		<td><input type="text" disabled="disabled" value="<%=rs.getString(2)%>"
				class="col"  /></td>
		</tr>
		<tr class = "row">
		<td>性   别</td>
		<td><input type="text" disabled="disabled" value="<%=rs.getString(3)%>"
				class="col" /></td>
		</tr>
		<tr class = "row">
		<td>出生日期</td>
		<td><input type="text" disabled="disabled" value="<%=rs.getString(4)%>"
				class="col" /></td>
		</tr>
		<tr class = "row">
		<td>手机号码</td>
		<td><input type="text" disabled="disabled" value="<%=rs.getString(5)%>"
				class="col" /></td>
		</tr>
		<tr class = "row">
		<td>联系电话</td>
		<td><input type="text" disabled="disabled" value="<%=rs.getString(6)%>"
				class="col" /></td>
		</tr>
		<tr class = "row">
		<td>邮箱</td>
		<td><input type="text" disabled="disabled" value="<%=rs.getString(7)%>"
				class="col" /></td>
		</tr>
		<tr class = "row">
		<td>证件名称</td>
		<td><input type="text" disabled="disabled" value="<%=rs.getString(8)%>"
				class="col" /></td>
		</tr>
		<tr class = "row">
		<td>证件编号</td>
		<td><input type="text" disabled="disabled" value="<%=rs.getString(9)%>"
				class="col" /></td>
		</tr>
		<tr class = "row">
		<td>会员级别</td>
		<td><input type="text" disabled="disabled" value="<%=rs.getString(10)%>"
				class="col" /></td>
		</tr>
		<tr class = "row">
		<td>办证日期</td>
		<td><input type="text" disabled="disabled" value="<%=rs.getString(11)%>"
				class="col" /></td>
		</tr>
		<tr class = "row">
		<td>最长出借天数</td>
		<td><input type="text" disabled="disabled" value="<%=rs.getString(13)%>"
				class="col" /></td>
		</tr>
		<tr class = "row">
		<td>最多出借册数</td>
		<td><input type="text" disabled="disabled" value="<%=rs.getString(14)%>"
				class="col" /></td>
		</tr>
		
		<tr>
		<td colspan = "2">
		<center>
		   <input type='submit'  value='修改' class="btn">
		   </center>
		</td>
		</tr>
		</table>
		</center>
			
			<%
				}
			%>
		
	</body>
</html>