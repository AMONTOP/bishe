<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>添加消费记录</title>
<link rel="stylesheet" type="text/css" href="/Project_Consumption/css/easyui/easyui.css" />
<link rel="stylesheet" type="text/css" href="/Project_Consumption/css/easyui/icon.css" />
<link rel="stylesheet" type="text/css" href="/Project_Consumption/css/base.css" />
<script type="text/javascript" src="/Project_Consumption/js/easyui/jquery-1.11.2.js"></script>
<script type="text/javascript" src="/Project_Consumption/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="/Project_Consumption/js/easyui/easyui-lang-zh_CN.js"></script>
  </head>  
  <body>
		<div id="container" class="easyui-layout" style="width:1024px;height:800px;padding:1px;margin-left:auto; margin-right:auto;">
		
				<div id="mainbody" style="height:90%">
				  <center>
				    <h1 style="color:skyblue;">修改员工记录</h1>
				    <div style="padding:3px;color:red;">
				      ${msg}
				    </div>
				    <form action="employee-update" method="post">
				      <input id="empId" type="hidden" name="employee.empId" value="${employee.empId}"/>
				      <div style="padding:3px;">
				        <label for="employee.name">真实姓名：</label>
				        <input id="employee.name" type="text" name="employee.name" value="${employee.name}" class="easyui-validatebox textbox" data-options="required:true,validType:'length[2,10]'"/>
				      </div>
				      <div style="padding:3px;">
				        <label for="employee.sex">性别：</label>				    
				        <select id="sex" name="employee.sex" class="easyui-validatebox textbox" style="width:280px;">
				          <option value="1">女</option>
				          <option value="0">男</option>				        
				        </select>
				      </div>
				      <div style="padding:3px;">
				        <label for="employee.mobile">联系电话：</label>
				        <input id="employee.mobile" type="text" name="employee.mobile" value="${employee.mobile}" class="easyui-validatebox textbox" data-options="required:true,validType:'phoneRex'"/>
				      </div>
				      <div style="padding:3px;">
				        <label for="employee.email">邮箱：</label>
				        <input id="employee.email" type="text" name="employee.email" value="${employee.email}" class="easyui-validatebox textbox" data-options="required:true,validType:['email','length[0,20]']"/>
				      </div>
				      				  
				      <div style="padding:3px;">
				        <input type="reset" value="重置"/>
				        &nbsp;&nbsp;&nbsp;
				        <input type="submit" value="修改"/>
				      </div>
				    </form>
				  </center>
				</div>
				<div id="tailbody" style="height:3%">
				  <%@ include file="../tail.jsp" %>
				</div>
			</div>
			
			<script>
			//自定义验证
	$.extend($.fn.validatebox.defaults.rules, {
    phoneRex: {
        validator: function(value){
		var rex=/^1[3-8]+\d{9}$/;
		//var rex=/^(([0\+]\d{2,3}-)?(0\d{2,3})-)(\d{7,8})(-(\d{3,}))?$/;
		//区号：前面一个0，后面跟2-3位数字 ： 0\d{2,3}
        //电话号码：7-8位数字： \d{7,8
        //分机号：一般都是3位数字： \d{3,}
         //这样连接起来就是验证电话的正则表达式了：/^((0\d{2,3})-)(\d{7,8})(-(\d{3,}))?$/		 
		var rex2=/^((0\d{2,3})-)(\d{7,8})(-(\d{3,}))?$/;
		if(rex.test(value)||rex2.test(value))
		{
		  // alert('t'+value);
		  return true;
		}else
		{
		 //alert('false '+value);
		   return false;
		}
          
        },
        message: '请输入正确电话或手机格式'
    }
});

			</script>
  </body>
</html>