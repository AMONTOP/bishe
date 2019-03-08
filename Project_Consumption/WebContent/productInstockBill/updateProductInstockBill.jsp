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
<script src="/Project_Consumption/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet" href="/Project_Consumption/css/jquery.dataTables.min.css">

  </head>  
  <body>
		<div id="container" class="easyui-layout" style="width:1024px;height:800px;padding:1px;margin-left:auto; margin-right:auto;">
			<div id="mainbody" style="height:90%">
				  <center>
				    <h1 style="color:skyblue;">修改货品入库单</h1>
				    <div style="padding:3px;color:red;">
				      ${msg}
				    </div>
				    <form action="updateproductInstockBill" method="post">
				    	<input id="billId" type="hidden" name="productInstockBill.billId" value="${productInstockBill.billId}"/>
				       <div style="padding:3px;">
				        <label for="productInstockBill.billNo">货品入库单号：</label>
				        <input id="productInstockBill.billNo" type="text" name="productInstockBill.billNo" value="${productInstockBill.billNo}" class="easyui-validatebox textbox" readonly/>
				      </div>
				      <%-- <div style="padding:3px;">
				        <label for="productInstockBill.fromPrincipal">交货人：</label>
				        <input id="productInstockBill.fromPrincipal" type="text" name="productInstockBill.fromPrincipal" value="${productInstockBill.fromPrincipal}" class="easyui-validatebox textbox" data-options="required:true"/>
				      </div> --%>
				      <div style="padding:3px;">
				        <label for="productInstockBill.warehousePrincipal">领货人：</label>
				        <%-- <input id="productInstockBill.warehousePrincipal" type="text" name="productInstockBill.employee.name" value="${productInstockBill.employee.name}" class="easyui-validatebox textbox" data-options="required:true"/> --%>
				        <select id="empId" name="productInstockBill.employee.empId" class="easyui-validatebox textbox" style="width:280px;">
				          <option value="0">---请选择领货人---</option>
				          <c:forEach items="${listEmployees}" var="employee">				            
				                <option value="${employee.empId}" name="productInstockBill.employee.empId">${employee.name}</option>				          
				          </c:forEach>
				        </select>
				      </div>
				      <div style="padding:3px;">
				        <label for="productInstockBill.productSource">货品来源：</label>
				        <select id="empId" name="productInstockBill.productSource" class="easyui-validatebox textbox" style="width:280px;">
				          <option value="1">生产入库</option>				          	            
				          <option value="2">其他仓库入库</option>				          				        
				        </select>
				      </div>
				      <div style="padding:3px;">
				        <label for="warehousePrincipal">仓库：</label>				      
				        <select id="empId" name="productInstockBill.wareHouse.wareId" class="easyui-validatebox textbox" style="width:280px;">
				          <option value="0">---请选择仓库---</option>
				          <c:forEach items="${listWareHouses}" var="ware">				            
				                <option value="${ware.wareId}" name="productInstockBill.wareHouse.wareId">${ware.wareNo}</option>				          
				          </c:forEach>
				        </select>
				      </div>
				      <div style="padding:3px;">
				        <label for="productInstockBill.billState">货品入库状态：</label>
				        <%-- <input id="productInstockBill.billState" type="text" name="productInstockBill.billState" value="${productInstockBill.billState}" class="easyui-validatebox textbox" data-options="required:true"/> --%>
				        <select id="billState" name="productInstockBill.billState" class="easyui-validatebox textbox" style="width:280px;">
				          <option value="1">待审核</option>				          	            
				          <option value="2">已审核</option>	
				          <!-- <option value="3">已完成</option> -->						          				        
				        </select>
				      </div>
				      
				    				      
				      <div class="auditAtInput" style="padding:3px;display:none">
				        <label for="productInstockBill.auditAt">审核时间：</label>
				        <input id="aDate" type="text" name="productInstockBill.auditAt" value="" class="easyui-validatebox textbox" readonly/>
				      </div>
				      <div class="auditAtInput" style="padding:3px;display:none">
				        <label for="productInstockBill.auditBy">审核者：</label>
				        <%-- <input id="productInstockBill.auditBy" type="text" name="productInstockBill.auditBy" value="${productInstockBill.auditBy}" class="easyui-validatebox textbox" data-options="required:true"/> --%>
				        <select id="empId" name="productInstockBill.auditBy" class="easyui-validatebox textbox" style="width:280px;">
				          <option value="0">---请选择领货人---</option>
				          <c:forEach items="${listEmployees}" var="employee">				            
				                <option value="${employee.empId}" name="productInstockBill.auditBy">${employee.name}</option>				          
				          </c:forEach>
				        </select>
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
			$("select#billState").click(function(){
				if($("#billState option:selected").val() == 2){
					$(".auditAtInput").css("display","block");	
					var mydateInput = document.getElementById("aDate");
			        var date = new Date();
			        var dateString = date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate();
			        mydateInput.value = dateString;				
				}else if($("#billState option:selected").val() == 1){
					console.log("select1");
					$(".auditAtInput").css("display","none");
					$("#aDate").attr({"value":NULL});
				}
			});
			
			</script>
  </body>
</html>