<%@ page import="model.userTable" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
userTable user = (userTable)session.getAttribute("user");
if(user==null){
%>
<jsp:forward page = "login.jsp"></jsp:forward>
<%}else {
}%>