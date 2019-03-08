<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>登录</title>
<link rel="stylesheet" type="text/css" href="/Project_Consumption/css/easyui/easyui.css" />
<link rel="stylesheet" type="text/css" href="/Project_Consumption/css/easyui/icon.css" />
<link rel="stylesheet" type="text/css" href="/Project_Consumption/css/base.css" />
<script type="text/javascript" src="/Project_Consumption/js/easyui/jquery-1.11.2.js"></script>
<script type="text/javascript" src="/Project_Consumption/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="/Project_Consumption/js/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript">
	  $(function(){
		  $("form").submit(function(){
			  var employee_username = $.trim($("#userName").val());
			  if(employee_username == ""){
				  alert("请输入用户名！");
				  return false;
			  }
			  if(employee_username.length < 2 || employee_username.length > 20){
				  alert("用户名长度必须在2到20之间！");
				  return false;
			  }
			  var employee_password = $.trim($("#userPass").val());
			  if(employee_password == ""){
				  alert("请输入密码！");
				  return false;
			  }
			  if(employee_password.length < 5 || employee_password.length > 20){
				  alert("密码长度必须在5到20之间！");
				  return false;
			  }
			  var verifyCode = $.trim($("#verifyCode").val());
			  if(verifyCode == ""){
				  alert("请输入验证码");
				  return false;
			  }
			  if(verifyCode.length != 4){
				  alert("验证码长度必须为4位");
				  return false;
			  }
			  return true;
		  });
	  });
	</script>
  </head>  
  <body>
		<div id="container" class="easyui-layout" style="width:1024px;height:800px;padding:1px;margin-left:auto; margin-right:auto;">
			<div id="mainbody" style="height:90%">
				  <center>
				    <h1 style="color:skyblue;">登录</h1>
				    <div style="padding:3px;color:red;">
				    ${msg}
				    </div>
				    <form action="employee-login" method="post">
				      <div style="padding:3px;">
				        <label for="userName">用户名：</label>
				        <input id="userName" type="text" name="employee.userName" value="${employee.userName}" class="easyui-validatebox textbox" data-options="required:true,validType:'length[2,20]'"/>
				      </div>
				      <div style="padding:3px;">
				        <label for="userPass">密码：</label>
				        <input id="userPass" type="password" name="employee.userPass" class="easyui-validatebox textbox" data-options="required:true,validType:'length[5,20]'"/>
				      </div>
				      <div style="padding:3px;">
				        <label for="employee_password">验证码：</label>
				        <input id="verifyCode" type="text" name="verifyCode" class="easyui-validatebox textbox" data-options="required:true,validType:'length[4,4]'"/>
				        <br>
                        <img id="img" border=0 src="verifyCode.action" onclick="this.src=this.src+'?'"/>
                        <a href="javascript:img.onclick();">看不清，换一张</a>
                      </div>
				      <div style="padding:3px;">
				        <input type="reset" value="重置"/>
				        &nbsp;&nbsp;&nbsp;
				        <input type="submit" value="登录"/>
				      </div>
				    </form>
				  </center>
				</div>
				<div id="tailbody" style="height:3%">
				  <%@ include file="tail.jsp" %>
				</div>
			</div>
  </body>
</html>