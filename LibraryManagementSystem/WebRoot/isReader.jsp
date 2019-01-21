<%@ page import="model.userTable" %>
<%@ page import="service.userService" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="model.userTable;"%>
<%
	userTable user = (userTable)session.getAttribute("user");
if(user==null){
%>
<jsp:forward page = "login.jsp"></jsp:forward>
<%}else if(user.getIdentity().equalsIgnoreCase("administrator")){
%>
<script type="text/javascript"> alert("您以管理员身份登录，不能进入读者个人中心！"); window.location="Administrator.jsp" </script>
<%}else{

}%>