<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*,java.text.*" %>

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
		return "FK" + hour.toString() + minutes.toString() + seconds.toString() + (Math.round(Math.random() * 4)).toString();
	};
	window.onload = function(){
    	document.getElementById("payNo").value = randomNumber();
	};
</script>
  </head>  
  <body>
		<div id="container" class="easyui-layout" style="width:1024px;height:800px;padding:1px;margin-left:auto; margin-right:auto;">
				<div id="mainbody" style="height:90%">
				  <center>
				    <h1 style="color:skyblue;">添加付款单</h1>
				    <div style="padding:3px;color:red;">
				      ${msg}
				    </div>
				    <form action="saveaccountPay" method="post">
				      <div style="padding:3px;">
				        <label for="payNo">付款编号：</label>
				        <input id="payNo" type="text" name="accountPay.payNo" value="${accountPay.payNo}" class="easyui-validatebox textbox" readonly/>
				      </div>
				       
				      <%
						SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
						String date= format.format(new Date());
					  %>
					  <input type="hidden" id="createAt" name="accountPay.payDate" value="<%=date%>"/>
					  
				      <div style="padding:3px;">
				        <label for="empId">付款人：</label>
				        <select name="accountPay.employee.empId" class="easyui-validatebox textbox" style="width:280px;">
							<option value="0">---请选择付款人---</option>
					        <c:forEach items="${listEmp}" var="employee">				            
					              <option value="${employee.empId}" name="accountPay.employee.empId">${employee.name}</option>				          
					        </c:forEach>    
				        </select>		     
				      </div>
				      <div style="padding:3px;">
				        <label for="payMoney">付款金额：</label>
				        <input id="payMoney" type="text" name="accountPay.payMoney" value="${accountPay.payMoney}" class="easyui-validatebox textbox" data-options="required:true"/>
				      </div>
				      <div style="padding:3px;">
				        <label for="supplier">供应商：</label>
				        <select name="accountPay.supplier.supplierId" class="easyui-validatebox textbox" style="width:280px;">
				        	<option value="0">---请选择供应商---</option>
					        <c:forEach items="${listSupplier}" var="supplier">				            
					              <option value="${supplier.supplierId}" name="accountPay.supplier.supplierId">${supplier.supplierName}</option>				          
					        </c:forEach>  
				        </select>
				      </div>
				      <div style="padding:3px;">
				        <label for="supplier">项目：</label>
				        <select name="accountPay.project.proId" class="easyui-validatebox textbox" style="width:280px;">
				        	<option value="0">---请选择付款项目---</option>
					        <c:forEach items="${listProject}" var="project">				            
					              <option value="${project.proId}" name="accountPay.project.proId">${project.proName}</option>				          
					        </c:forEach>  
				        </select>
				      </div>
				      <div style="padding:3px;">
				        <label for="contact">公司账户：</label>
				        <select name="accountPay.accountInfo.accountInfoId" class="easyui-validatebox textbox" style="width:280px;">
				        	<option value="0">---请选择公司账户---</option>
					        <c:forEach items="${listAccountInfo}" var="accountInfo">				            
					              <option value="${accountInfo.accountInfoId}" name="accountPay.accountInfo.accountInfoId">${accountInfo.infoName}</option>				          
					        </c:forEach>  
				        </select>				        
				      </div>
				      <div style="padding:3px;">
				        <label for="contact">审核流程状态：</label>
				        <select name="accountPay.payStatus" class="easyui-validatebox textbox" style="width:280px;">
				        	<option value="未提交">未提交</option>
				        	<option value="已提交">已提交</option>
				        </select>
				      </div>
				      
				      <div style="padding:3px;">
				        <label for="contact">部门：</label>
				        <select name="accountPay.payDept" class="easyui-validatebox textbox" style="width:280px;">
				        	<option value="财务部">财务部</option>
				        	<option value="总裁部">总裁部</option>
				        </select>
				      </div>
				      <div style="padding:3px;">
				        <label for="contact">付款类型：</label>
				        <select name="accountPay.payItem" class="easyui-validatebox textbox" style="width:280px;">
				        	<option value="劳务付款">劳务付款</option>
				        	<option value="办公付款">办公付款</option>
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