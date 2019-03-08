<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="swust.model.*" %>
<%@page import="java.util.ArrayList , java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="/struts-tags" %>
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
window.onload = function(){
							var billTime = "${orderBill.billTime}";
							var newBillTime = billTime.substring(0, 10);
							var el = document.getElementById("billTime");
							el.setAttribute('value',newBillTime);
							
							var deliveryAt = "${orderBill.deliveryAt}";
							var newDeliveryAt = deliveryAt.substring(0, 10);
							var el2 = document.getElementById("deliveryAt");
							el2.setAttribute('value',newDeliveryAt);
							};
</script>
  </head>  
  <body>
		<div id="container" class="easyui-layout" style="width:1024px;height:800px;padding:1px;margin-left:auto; margin-right:auto;">
			<div id="mainbody" style="height:90%">
				  <center>
				    <h1 style="color:skyblue;">修改订单记录</h1>
				    <div style="padding:3px;color:red;">
				      ${msg}
				    </div>
				    <form action="updateorderBill" method="post">
				      <input id="billId" type="hidden" name="orderBill.billId" value="${orderBill.billId}" readOnly/>
				      <div style="padding:3px;">
				        <label for="billNo">订单编号：</label> 
				        <input id="billNo" type="text" name="orderBill.billNo" value="${orderBill.billNo}" class="easyui-validatebox textbox" readonly />
				      </div>
				     <div style="padding:3px;">
				        <label for="salesman">销售员：</label>
				        <select id="empId" name="orderBill.employee.empId" class="easyui-validatebox textbox" style="width:280px;">
				          <option value="${orderBill.employee.empId}">${orderBill.employee.name}</option>
				          <c:forEach items="${listEmployee}" var="employee">				            
				                <option value="${employee.empId}" name="orderBill.employee.empId">${employee.name}</option>				          
				          </c:forEach>
				        </select>
				       <%--  <input id="salesman" type="text" name="orderBill.employee.empId" value="${orderBill.employee.name}" class="easyui-validatebox textbox" /> --%>
				      </div>
				      <div style="padding:3px;">
				        <label for="orderBill.client.clientName">客户名：</label>				     
				        <select id="clientId" name="orderBill.client.clientId" class="easyui-validatebox textbox" style="width:280px;">
				          <option value="${orderBill.client.clientId}">${orderBill.client.clientName}</option>
				          <c:forEach items="${listClient}" var="client">				            
				                <option value="${client.clientId}" name="orderBill.client.clientId">${client.clientName}</option>				          
				          </c:forEach>
				        </select>
				      </div> 
				      <div style="padding:3px;">
				        <label for="billTime">下单时间：</label>
						
				        <input id="billTime" type="date" name="orderBill.billTime" value="" class="easyui-validatebox textbox" />
				      </div> 
				      <div style="padding:3px;">
				        <label for="billAmount">订单金额：</label>
				        <input id="billAmount" type="text" name="orderBill.billAmount" value="${orderBill.billAmount}" class="easyui-validatebox textbox" />
				      </div> 
				       <div style="padding:3px;">
				        <label for="orderBill.billState">订单状态：</label>
				        
				        <select id="billState" name="orderBill.billState" class="easyui-validatebox textbox" style="width:280px;">	
				          <option value="0">请选择审核状态</option>			         				        	            
				          <option value="1" name="orderBill.billState">待审核</option>	
				          <option value="2" name="orderBill.billState">已审核</option>		
				          <option value="3" name="orderBill.billState">生产中</option>		
				          <option value="4" name="orderBill.billState">已发货</option>		
				         <!--  <option value="5" name="orderBill.billState">已取消</option>		 -->			          
				        </select>
				      </div> 
				      <div style="padding:3px;">
				        <label for="deliveryAt">预计发货时间：</label>
				        <input id="deliveryAt" type="date" name="orderBill.deliveryAt" value="" class="easyui-validatebox textbox" />
				      </div> 
				      <%-- 
				      <div style="padding:3px;">
				        <label for="deliveryBy">发货者：</label>
				        <input id="deliveryBy" type="text" name="orderBill.deliveryBy" value="${orderBill.deliveryBy}" class="easyui-validatebox textbox"/>
				      </div>  
				      --%>
				
				      				  
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
  </body>
</html>