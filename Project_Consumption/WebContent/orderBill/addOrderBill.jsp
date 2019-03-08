<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>添加产品类别</title>
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
		return "DD" + hour.toString() + minutes.toString() + seconds.toString() + (Math.round(Math.random() * 4)).toString();
	};
	window.onload = function(){
    	document.getElementById("billNo").value = randomNumber();
	};
</script>
  </head>  
  <body>
		<div id="container" class="easyui-layout" style="width:1024px;height:800px;padding:1px;margin-left:auto; margin-right:auto;">
			<div id="mainbody" style="height:90%">
				  <center>
				    <h1 style="color:skyblue;">添加订单</h1>
				    <div style="padding:3px;color:red;">
				      ${msg}
				    </div>
				    <form action="saveOneorderBill" method="post">
				      <div style="padding:3px;">
				        <label for="billNo">订单编号：</label>
				        <input id="billNo" type="text" name="orderBill.billNo" value="" class="easyui-validatebox textbox" readOnly />
				      </div>
				     <div style="padding:3px;">
				        <label for="orderbill.employee.name">销售员：</label>
				        <select id="empId" name="orderBill.employee.empId" class="easyui-validatebox textbox" style="width:280px;">
				          <option value="0">---请选择销售员---</option>
				          <c:forEach items="${listEmployee}" var="employee">				            
				                <option value="${employee.empId}" name="orderBill.employee.empId">${employee.name}</option>				          
				          </c:forEach>
				        </select>
				       <%--  <input id="salesman" type="text" name="orderBill.salesman" value="${orderBill.salesman}" class="easyui-validatebox textbox" /> --%>
				      </div>
				      <div style="padding:3px;">
				        <label for="orderBill.client.clientName">客户名：</label>				     
				        <select id="clientId" name="orderBill.client.clientId" class="easyui-validatebox textbox" style="width:280px;">
				          <option value="0">---请选择产品类型---</option>
				          <c:forEach items="${listClient}" var="client">				            
				                <option value="${client.clientId}" name="orderBill.client.clientId">${client.clientName}</option>				          
				          </c:forEach>
				        </select>
				      </div> 
				      <div style="padding:3px;">
				        <label for="billTime">下单时间：</label>
				        <input id="billTime" type="date" name="orderBill.billTime" value="${orderBill.billTime}" class="easyui-validatebox textbox" />
				      </div> 
				      <%-- <div style="padding:3px;">
				        <label for="billAmount">订单金额：</label>
				        <input id="billAmount" type="text" name="orderBill.billAmount" value="${orderBill.billAmount}" class="easyui-validatebox textbox" />
				      </div> --%>
				       <div style="padding:3px;">
				        <label for="billState">订单状态：</label>
				         <select id="billState" name="orderBill.billState" class="easyui-validatebox textbox" style="width:280px;">	
				          <option value="0">请选择审核状态</option>	
				          <option value="1" name="orderBill.billState">待审核</option>	
				        <!--   <option value="2" name="orderBill.billState">已审核</option>		
				          <option value="3" name="orderBill.billState">生产中</option>		
				          <option value="4" name="orderBill.billState">已发货</option>		
				          <option value="5" name="orderBill.billState">已取消</option> -->
				         </select>	
				      </div> 
				      <div style="padding:3px;">
				        <label for="deliveryAt">预计发货时间：</label>
				        <input id="deliveryAt" type="date" name="orderBill.deliveryAt" value="${orderBill.deliveryAt}" class="easyui-validatebox textbox" />
				      </div> 
				  
				      
				  
				      <div style="padding:3px;">
				        <input type="reset" value="重置"/>
				        &nbsp;&nbsp;&nbsp;
				        <input type="submit" value="录入"/>
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