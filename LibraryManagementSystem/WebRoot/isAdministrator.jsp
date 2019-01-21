<%@ page import="model.userTable" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	userTable user = (userTable)session.getAttribute("user");
if(user==null){
%>
<jsp:forward page = "login.jsp"></jsp:forward>
<%}else if(!user.getIdentity().equalsIgnoreCase("administrator")){
%>
<script type="text/javascript"> alert("您以读者身份登录，不能进入管理员中心！"); window.location="Reader.jsp" </script>

<%}else{

}%>