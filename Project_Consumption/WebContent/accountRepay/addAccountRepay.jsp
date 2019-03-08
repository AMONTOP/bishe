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
		return "SK" + hour.toString() + minutes.toString() + seconds.toString() + (Math.round(Math.random() * 4)).toString();
	};
	window.onload = function(){
    	document.getElementById("repayNo").value = randomNumber();
	};
</script>
  </head>  
  <body>
		<div id="container" class="easyui-layout" style="width:1024px;height:800px;padding:1px;margin-left:auto; margin-right:auto;">
				<div id="mainbody" style="height:90%">
				  <center>
				    <h1 style="color:skyblue;">添加收款单</h1>
				    <div style="padding:3px;color:red;">
				      ${msg}
				    </div>
				    <form action="saveaccountRepay" method="post">
				      <div style="padding:3px;">
				        <label for="repayNo">收款编号：</label>
				        <input id="repayNo" type="text" name="accountRepay.repayNo" value="${accountRepay.repayNo}" class="easyui-validatebox textbox" readonly/>
				      </div>
				       
				      <%
						SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
						String date= format.format(new Date());
					  %>
					  <input type="hidden" id="createAt" name="accountRepay.repayDate" value="<%=date%>"/>
					  
				      <div style="padding:3px;">
				        <label for="empId">收款人：</label>
				        <select name="accountRepay.employee.empId" class="easyui-validatebox textbox" style="width:280px;">
							<option value="0">---请选择收款人---</option>
					        <c:forEach items="${listEmp}" var="employee">				            
					              <option value="${employee.empId}" name="accountRepay.employee.empId">${employee.name}</option>				          
					        </c:forEach>    
				        </select>		     
				      </div>
				      <div style="padding:3px;">
				        <label for="repayMoney">收款金额：</label>
				        <input id="repayMoney" type="text" name="accountRepay.repayMoney" value="${accountRepay.repayMoney}" class="easyui-validatebox textbox" data-options="required:true"/>
				      </div>
				      <div style="padding:3px;">
				        <label for="supplier">供应商：</label>
				        <select name="accountRepay.supplier.supplierId" class="easyui-validatebox textbox" style="width:280px;">
				        	<option value="0">---请选择供应商---</option>
					        <c:forEach items="${listSupplier}" var="supplier">				            
					              <option value="${supplier.supplierId}" name="accountRepay.supplier.supplierId">${supplier.supplierName}</option>				          
					        </c:forEach>  
				        </select>
				      </div>
				      <div style="padding:3px;">
				        <label for="contact">公司账户：</label>
				        <select name="accountRepay.accountInfo.accountInfoId" class="easyui-validatebox textbox" style="width:280px;">
				        	<option value="0">---请选择公司账户---</option>
					        <c:forEach items="${listAccountInfo}" var="accountInfo">				            
					              <option value="${accountInfo.accountInfoId}" name="accountRepay.accountInfo.accountInfoId">${accountInfo.infoName}</option>				          
					        </c:forEach>  
				        </select>				        
				      </div>
				      <div style="padding:3px;">
				        <label for="contact">审核流程状态：</label>
				        <select name="accountRepay.repayStatus" class="easyui-validatebox textbox" style="width:280px;">
				        	<option value="未提交">未提交</option>
				        	<option value="已提交">已提交</option>
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