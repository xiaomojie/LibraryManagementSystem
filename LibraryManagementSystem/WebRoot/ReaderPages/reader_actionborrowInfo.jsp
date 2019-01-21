<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@page import="model.BorrowInfoTable"%>
<%@ page import="model.userTable" %>
<%@page import="service.ReaderBorrowInfoService"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/style_button.css" />
</head>
<jsp:include page="islogin.jsp"></jsp:include>
<body>
<%userTable user = (userTable)session.getAttribute("user");%>
<center>
<form method = "post" action = "reader_actionborrowInfo.jsp">
<table >
<tr style="float:left;
    margin-top:5px;
	font-size:20px;
	padding:5px">
  <td>读者编号</td>
  <td><input type = "text"  readonly name = "reader_id" value=<%=user.getUserid() %> ></td>
  <td>借阅信息</td>
  <td>
     <select name = "selected" style=" width:180px; height:25px;">
        <option value="当前借阅信息">当前借阅信息</option>
        <option value="六个月内借阅信息">六个月内借阅信息</option>
        <option value="一年内借阅信息">一年内借阅信息</option>
     </select>
  </td>
  <td ><center>
  <input class = "btn" type = "submit" value ="提交">
  </center>
</tr>
</table>
</form>
</center>
<hr/>
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="borrowInfoTable" class = "model.BorrowInfoTable"></jsp:useBean>
<jsp:useBean id="borrowInfoService" class = "service.ReaderBorrowInfoService"></jsp:useBean>
<jsp:setProperty property = "*" name = "borrowInfoTable"/>
<%
List<BorrowInfoTable> list;
list=borrowInfoService.getBorrowInfo(borrowInfoTable);
if(list.size()>0){
      %>
      <br/><br/>
      <center>
      <table bgColor="#c0c0c0" style="text-align:center">
      <tr> <td colspan = "7" style = "font-size:30px" bgColor="#99aacc"><%=borrowInfoTable.getSelected()%></td></tr>
      <tr style = "font-size:25px" bgColor="#aedaaa" >
         <td style=" width:150px; height:40px;">图书编号</td>
         <td style=" width:150px; height:40px;">图书名</td>
         <td style=" width:150px; height:40px;">作者</td>
         <td style=" width:150px; height:40px;">图书类别</td>
        
         <td style=" width:150px; height:40px;">借阅日期</td>
         <td style=" width:150px; height:40px;">应还日期</td>
     </tr>
     <%
        Iterator<BorrowInfoTable> iter = list.iterator();
        BorrowInfoTable borrowInfo;
        while(iter.hasNext()){
           borrowInfo=iter.next();
           %>
           <tr style = "font-size:20px; height:30px">
             <td><%=borrowInfo.getBook_id()%></td>
             <td><%=borrowInfo.getBook_name()%></td>
             <td><%=borrowInfo.getAuthor()%></td>
             <td><%=borrowInfo.getCategory()%></td>
             <td><%=borrowInfo.getDate_borrow()%></td>
             <td><%=borrowInfo.getDate_return()%></td>
           </tr>
           <% 
        }
      %>
     
     </table>
     </center>
      <% 
  }else{
      out.print("没有找到符合条件的借阅信息！"); 
  }
 %>

</body>
</html>