<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@ page import="java.sql.Connection"%>
<%@page import="connection.ConnectDB"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type"
			content="text/html; charset=ISO-8859-1">
		<title></title>
		<link rel="stylesheet" type="text/css" href="css/style_button.css" />

	</head>
	<body>

		<center>
			<form method="post" action="actionreadersinfoChange.jsp">
				<table bgColor="#c0c0c0">
					<tr>
						<td colspan="2" align="center" bgColor="#aedaaa"
							style="width: 400px; height: 60px; font-size: 35px;">
							读者信息修改
						</td>
					</tr>
					<%
						String id = request.getParameter("reader_id");
						String identity = request.getParameter("identity");
					%>
					<tr style="width: 100px; height: 30px; font-size: 20px;">
						<td>
							读者账号
						</td>
						<td>
							<input type="text" name="reader_id" readonly
								style="width: 250px; height: 25px;" value=<%=id%>>
						</td>
					</tr>


					<tr style="width: 100px; height: 30px; font-size: 20px;">
						<td>
							姓名
						</td>
						<td>
							<input type="text" name="reader_name"
								style="width: 250px; height: 25px;">
						</td>
					</tr>
					<tr style="width: 100px; height: 30px; font-size: 20px;">
						<td>
							性别
						</td>
						<td>
							<input type="radio" name="sex" value="1" checked>
							男
							<input type="radio" name="sex" value="2">
							女
						</td>
					</tr>
					<tr style="width: 100px; height: 30px; font-size: 20px;">
						<td>
							出生日期
						</td>
						<td>
							<input type="date" name="birthday"
								style="width: 250px; height: 25px;">
						</td>
					</tr>
					<tr style="width: 100px; height: 30px; font-size: 20px;">
						<td>
							联系电话
						</td>
						<td>
							<input type="tel" id="phone" name="phone"
								style="width: 250px; height: 25px;">
						</td>
					</tr>
					<tr style="width: 100px; height: 30px; font-size: 20px;">
						<td>
							手机号码
						</td>
						<td>
							<input type="tel" id="mobile" name="mobile"
								style="width: 250px; height: 25px;">
						</td>
					</tr>
					<tr style="width: 100px; height: 30px; font-size: 20px;">
						<td>
							邮箱
						</td>
						<td>
							<input type="email" id="mail" name="mail"
								style="width: 250px; height: 25px;">
						</td>
					</tr>
					<tr style="width: 100px; height: 30px; font-size: 20px;">
						<td>
							证件名称
						</td>
						<td>
							<select name="card_name" style="width: 180px; height: 25px;">
								<option selected>
									身份证
								</option>
								<option>
									护照
								</option>
								<option>
									驾驶证
								</option>
							</select>
						</td>
					</tr>
					<tr style="width: 100px; height: 30px; font-size: 20px;">
						<td>
							证件号码
						</td>
						<td>
							<input type="text" name="card_id"
								style="width: 250px; height: 25px;">
						</td>
					</tr>
					<%
						if (identity.equals("administrator")) {
					%>
					<tr style="width: 100px; height: 30px; font-size: 20px;">
						<td>
							会员等级
						</td>
						<td>
							<select name="level" style="width: 180px; height: 25px;">
								<option>
								</option>
								<option>
									普通
								</option>
								<option>
									银卡
								</option>
								<option>
									金卡
								</option>
							</select>
						</td>
					</tr>
					<%
						}
					%>
					<%
						String datetime = new SimpleDateFormat("yyyy-MM-dd")
								.format(Calendar.getInstance().getTime());
					%>

					<tr>
						<td colspan="2">
							<center>
								<input type="submit" class="btn" value="提交"
									style="width: 100px; height: 30px;">
							</center>
						</td>
					</tr>
				</table>
			</form>
		</center>

		<script>
            window.onload = function(){
               mobile();
               phone();
               mail();
             }
             function mobile(){
               var inpEle = document.getElementById('mobile');
               var myreg = /^1[3458]\d{9}$/;
               inpEle.onblur = function(){
                  var inpVal = this.value;
                  if(inpVal!=""){  //若不是空值才进行判断
                     if (!myreg.exec(inpVal)){
                        alert('请输入正确的手机号')
                        inpEle.value="";
                     }
                  }
               } 
             }
             function phone(){
               var inpEle = document.getElementById('phone');
               var myreg = /(^(\d{3,4}-)?\d{7,8})$/;
               inpEle.onblur = function(){
                  var inpVal = this.value;
                  if(inpVal!=""){
                     if (!myreg.exec(inpVal)){
                        alert('请输入正确的电话号码')
                        inpEle.value="";
                     }
                  }
               }
               
             }
             function mail(){
               var inpEle = document.getElementById('mail');
               var myreg = /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/;
              
               inpEle.onblur = function(){
                  var inpVal = this.value;
                  if(inpVal!=""){
                     if (!myreg.exec(inpVal)){
                        alert('请输入正确的邮件地址')
                        inpEle.value="";
                     }
                  }
               } 
             }
            
</script>
	</body>
</html>