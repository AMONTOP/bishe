<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<style>
.spinner{width: 280px;height: 28px;}
.spinner-arrow{height:30px;}
.spinner-arrow-up{height:15px;}
.spinner-arrow-down{height:15px;}
</style>
<script>
	function randomNumber(){
		var now = new Date();
		var hour = now.getHours();
		var minutes = now.getMinutes();
		var seconds = now.getSeconds();
		console.log(hour);
		return "PI" + hour.toString() + minutes.toString() + seconds.toString() + (Math.round(Math.random() * 4)).toString();
	};
	window.onload = function(){
    	document.getElementById("billNo").value = randomNumber();
	};
</script>
  </head>  
  <body>		
				    <form action="test2productInstockBill" method="post">				    				   
				      <div class="billTime" style="padding:3px">
				        <label for="productInstockBill.billTime">货品</label>
				        <input id="billTimeDate" type="text" name="productInstockBill.product.productId" value="2" class="easyui-validatebox textbox" readonly/>
				      </div>
				      <div class="billTime" style="padding:3px">
				        <label for="productInstockBill.billTime">员工</label>
				        <input id="billTimeDate" type="text" name="productInstockBill.employee.empId" value="2" class="easyui-validatebox textbox" readonly/>
				      </div>
				      <div class="billTime" style="padding:3px">
				        <label for="productInstockBill.billTime">状态</label>
				        <input id="billTimeDate" type="text" name="productInstockBill.billState" value="0" class="easyui-validatebox textbox" readonly/>
				      </div>				    
				      <div style="padding:3px;">				     
				        <input type="submit" value="录入"/>
				      </div>
				    </form>				 	
  </body>
</html>