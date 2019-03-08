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
	<style>
        *{
            margin: 0;
            padding: 0;
        }
        .top-ul li{
            float: left;
            list-style: none;
            margin-left: 74px;
        }
        .top-ul li a{
            color: #10776b;
            text-decoration: none;
        }
        .top-ul{
            width: 453px;
            height: 40px;
            float: right;
            margin-top: 73px;
            margin-bottom: 0;
        }
        /*向上*/
        .triangle_border_up{
            width: 0;
            height: 0;
            border-width: 0 30px 30px;
            border-style: solid;
            border-color: transparent transparent #fff;
            margin: 40px auto;
            position: relative;
            top: -49px;
    		left: 41%;
        }

        .top{
            width: 100%;
            height: 121px;
        }
        .logo{
            float: left;
            margin-left: 48px;
            margin-top: 5px;
        }
        .main{
            width: 100%;
            height: 700px;
            background: url("resources/images/back.jpg");
            background-size: cover;
            position: relative;
        }
        .main-box{
                width: 23%;
			    background: white;
			    height: 324px;
			    position: absolute;
			    top: 200px;
			    left: 284px;
			    border-radius: 12px;
			    box-shadow: 0 0 54px #35403f;
        }
        .main-title{
            font-size: 30px;
            color: #049083;
            font-weight: bold;
            position: absolute;
            top: 105px;
            left: 374px;
        }
        form{
            margin-top: 24px;
        }
        form .main-content{
            text-align: center;
            margin-bottom: 22px;
            position: relative;
        }
        .main-content input{
                width: 235px;
			    height: 40px;
			    border-radius: 0;
			    border: 1px solid #80808087;
        }
        .login-input{
            width: 159px;
		    height: 35px;
		    background: #049083;
		    color: white;
		    font-size: 16px;
		    border: 0;
		    border-radius: 7px;
		    letter-spacing: 16px;
		    text-indent: 1em;
		    cursor: pointer;
    	}
        .footer{
            text-align: center;
        }
        .footer p{
            margin-top: 62px;
            color: gray;
        }
    </style>
  </head>
  
  <body>
   <div class="top">
    <img src="resources/images/logo1.png" alt="" class="logo">

    <ul class="top-ul">
        <li><a href="">网址首页</a></li>
        <li><a href="">收藏本站</a></li>
        <li><a href="">联系我们</a></li>
    </ul>
</div>

<div class="main">
    <!--<img src="back.jpg" alt="" style="width: 100%;height: 601px;">-->
    <p class="main-title">管理员登录</p>

    <div class="main-box">
        <span class="triangle_border_up"></span>
        <form action="employee-login" method="post">
            <div class="main-content">
               <!--  <label for="userName">用户名：</label> -->
                <input id="userName" type="text" placeholder="用户名" name="employee.userName" value="${employee.userName}" class="easyui-validatebox textbox"  data-options="required:true,validType:'length[1,20]'"/>
            </div>
            <div class="main-content">
               <!--  <label for="userPass">密 &nbsp; 码：</label> -->
                <input id="userPass" type="password" placeholder="密码" name="employee.userPass" class="easyui-validatebox textbox" data-options="required:true,validType:'length[5,20]'"/>
            </div>
            <div class="main-content" style="margin-left: -100px;">
                <!-- <label for="employee_password">验证码：</label> -->
                <input id="verifyCode" type="text" name="verifyCode" placeholder="验证码" class="easyui-validatebox textbox"  style="width:135px;" data-options="required:true,validType:'length[4,4]'"/>
               
                <img id="img" border=0 src="verifyCode.action" onclick="this.src=this.src+'?'" style="position: absolute;right: 32px;top: 5px;width: 94px;"/>
                <!-- <a href="javascript:img.onclick();">看不清，换一张</a> -->
            </div>
            <div style="padding:3px;text-align: center;">
                <input class="login-input" type="submit" value="登录"/>
            </div>
        </form>
    </div>
</div>

<div class="footer">
    <p>版权所有：Copyright广州大学华软软件学院 1540129422 张晓婷</p>
</div>
  </body>
</html>
