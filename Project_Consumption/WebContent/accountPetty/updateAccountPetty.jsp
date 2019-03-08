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
		return "BYJ" + hour.toString() + minutes.toString() + seconds.toString() + (Math.round(Math.random() * 4)).toString();
	};
	window.onload = function(){
    	document.getElementById("accountNo").value = randomNumber();
	};
</script>
  </head>  
  <body>
		<div id="container" class="easyui-layout" style="width:1024px;height:800px;padding:1px;margin-left:auto; margin-right:auto;">
				<div id="mainbody" style="height:90%">
				  <center>
				    <h1 style="color:skyblue;">添加备用金发放</h1>
				    <div style="padding:3px;color:red;">
				      ${msg}
				    </div>
				    <form action="updateaccountPetty" method="post">
				      <input id="clientId" type="hidden" name="accountPetty.accountPettyId" value="${accountPetty.accountPettyId}"/>
				      <div style="padding:3px;">
				        <label for="pettyNo">领用编号：</label>
				        <input id="pettyNo" type="text" name="accountPetty.pettyNo" value="${accountPetty.pettyNo}" class="easyui-validatebox textbox" readonly/>
				      </div>
				      <%
						SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
						String date= format.format(new Date());
					  %>
					  <input type="hidden" id="createAt" name="accountPetty.useDate" value="<%=date%>"/>
				      <div style="padding:3px;">
				        <label for="empId">领用人：</label>
				        <select name="accountPetty.employee.empId" class="easyui-validatebox textbox" style="width:280px;">
							<option value="0">---请选择领用人---</option>
					        <c:forEach items="${listEmp}" var="employee">				            
					              <option value="${employee.empId}" name="accountPetty.employee.empId">${employee.name}</option>				          
					        </c:forEach>    
				        </select>		     
				      </div>
				      <div style="padding:3px;">
				        <label for="supplier">项目：</label>
				        <select name="accountPetty.project.proId" class="easyui-validatebox textbox" style="width:280px;">
				        	<option value="0">---请选择备用金发放项目---</option>
					        <c:forEach items="${listProject}" var="project">				            
					              <option value="${project.proId}" name="accountPetty.project.proId">${project.proName}</option>				          
					        </c:forEach>  
				        </select>
				      </div>
				      <div style="padding:3px;">
				        <label for="pettyDept">领用部门：</label>
				         <select name="accountPetty.pettyDept" class="easyui-validatebox textbox" style="width:280px;">
				        	<option value="财务部">财务部</option>
				        	<option value="总裁部">总裁部</option>
				        </select>
				      </div>
				      
				      <div style="padding:3px;">
				        <label for="pettyMoney">金额：</label>
				        <input id="pettyMoney" type="text" name="accountPetty.pettyMoney" value="${accountPetty.pettyMoney}" class="easyui-validatebox textbox" data-options="required:true"/>
				      </div>				    
				      <div style="padding:3px;">
				        <label for="pettyStatus">流程状态：</label>
				        <select name="accountPetty.pettyStatus" class="easyui-validatebox textbox" style="width:280px;">
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