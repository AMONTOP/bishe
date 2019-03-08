<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.text.*" %>
<%@page import="com.opensymphony.xwork2.ActionContext"%>

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
<script>
	function randomNumber(){
		var now = new Date();
		var hour = now.getHours();
		var minutes = now.getMinutes();
		var seconds = now.getSeconds();
		console.log(hour);
		return "CG" + hour.toString() + minutes.toString() + seconds.toString() + (Math.round(Math.random() * 4)).toString();
	};
	window.onload = function(){
    	document.getElementById("purNo").value = randomNumber();
	};
</script>
	
  </head>  
  <body>
		<div id="container" class="easyui-layout" style="width:1024px;height:800px;padding:1px;margin-left:auto; margin-right:auto;">
				<div id="mainbody" style="height:90%">
				  <center>
				    <h1 style="color:skyblue;">添加采购单</h1>
				    <div style="padding:3px;color:red;">
				      ${msg}
				    </div>
				    <form action="savepurchase"  method="post">
				      <div style="padding:3px;">
				        <label for="purNo">采购单号：</label>
				        <input id="purNo" type="text" name="purchase.purNo" value="" class="easyui-validatebox textbox" readonly/>
				      </div>
				      <div style="padding:3px;">
				        <label for="material">采购物料：</label>
				        <input id="material" type="text"  value="${material.materialName}" class="easyui-validatebox textbox" readOnly/>
				      </div>
				      <div style="padding:3px;">
				        <label for="contactPhone">采购仓库：</label>
				        <input type="text"  value="${mwareHouseMaterial.mwareHouse.wareNo }" class="easyui-validatebox textbox" readOnly/>
				        <input type="hidden" name="purchase.mwareHouseMaterial.wid" value="${mwareHouseMaterial.wid }"/>
				      </div>
				       <div style="padding:3px;">
				        <label for="contactPhone">采购数量：</label>
				        <input  type="text" name="purchase.quantity" value="100" class="easyui-validatebox textbox" />
				      </div>
				     <div style="padding:3px;">
				        <label for="name">采购人员：</label>
				        <input type="text" value='<%=ActionContext.getContext().getSession().get("name") %>' class="easyui-validatebox textbox" readOnly/>
				        <input type="hidden" name="purchase.employee.empId" value='<%=ActionContext.getContext().getSession().get("empId") %>' />				        
				      </div>
				      <div style="padding:3px;">
				        <label for="name">审核状态：</label>
				        <select name="purchase.purState">
				        	<option value="待审核">待审核</option>
				        	<option value="已审核">已审核</option>
				        </select>
				      </div>				     
					 
				      <div style="padding:3px;">
				        <input type="reset" value="重置"/>
				        &nbsp;&nbsp;&nbsp;
				        <input type="submit" value="添加"/>
				      </div>
				    </form>
				  </center>
				</div>
				<div id="tailbody" style="height:3%">
				  <%@ include file="../tail.jsp" %>
				</div>
			</div>

  </body>
</html>