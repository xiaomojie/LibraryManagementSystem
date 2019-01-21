<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		
		<title>图书管理系统</title>
    <link rel="stylesheet" type="text/css" href="css/stylelogin.css">
  
	</head>

	<body>
	<center>
		<div class="insert" >
			<h1>
				图书管理系统
			</h1>
			<form action="validate.jsp" name='login'>
				<label>
					用户名
				</label>
				<input type='text' name="userid" class="userid"
					style="margin-left: 12px; height: 25px">
				<br />
				<br />
				<label>
					密 码
				</label>
				<input type='password' name="userpassword" class='password'
					style="margin-left: 20px; height: 25px">
				<br />
				<br />
				<input type='submit' name='login' value='登陆' class="loginBtn">

			</form>
		</div>
		</center>
	</body>
</html>
