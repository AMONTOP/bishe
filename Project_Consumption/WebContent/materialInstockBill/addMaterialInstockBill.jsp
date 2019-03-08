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
		return "MI" + hour.toString() + minutes.toString() + seconds.toString() + (Math.round(Math.random() * 4)).toString();
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
				    <h1 style="color:skyblue;">添加物料入库单</h1>
				    <div style="padding:3px;color:red;">
				      ${msg}
				    </div>
				    <form action="savematerialInstockBill" method="post">
				      <div style="padding:3px;">
				        <label for="billNo">物料入库单号：</label>
				        <input id="billNo" type="text" name="materialInstockBill.billNo" value="${materialInstockBill.billNo}" class="easyui-validatebox textbox" readonly/>
				      </div>
				      <input type="hidden" value="${purchase.purId }" name="materialInstockBill.purchase.purId"/>
				      <div style="padding:3px;">
				        <label for="employee">领货人：</label>
				       <%--  <input id="fromPrincipal" type="text" name="materialInstockBill.fromPrincipal" value="${materialInstockBill.fromPrincipal}" class="easyui-validatebox textbox" data-options="required:true"/> --%>
				        <select id="empId" name="materialInstockBill.employee.empId" class="easyui-validatebox textbox" style="width:280px;">
				          <option value="0">---请选择领货人---</option>
				          <c:forEach items="${listEmployees}" var="employee">				            
				                <option value="${employee.empId}" name="materialInstockBill.employee.empId">${employee.name}</option>				          
				          </c:forEach>
				        </select>
				      </div>
				      <div style="padding:3px;">
				        <label for="warehousePrincipal">仓库：</label>
				       <%-- <select id="empId" name="materialInstockBill.mwareHouse.wareId" class="easyui-validatebox textbox" style="width:280px;">
				           <option value="0">---请选择仓库---</option>
				          <c:forEach items="${listMwareHouses}" var="ware">				            
				                <option value="${ware.wareId}" name="materialInstockBill.mwareHouse.wareId">${ware.wareNo}</option>				          
				          </c:forEach>
				        </select>  --%>
				       	 <input type="text" value="${mwareHouseMaterial.mwareHouse.wareNo }" class="easyui-validatebox textbox"  readOnly/>
				       	 <input type="hidden" name="materialInstockBill.mwareHouse.wareId" value="${mwareHouseMaterial.mwareHouse.wareId}"  readOnly/>	
				      </div>
				      <div style="padding:3px;">
				        <label for="warehousePrincipal">物料：</label>
				        <input type="text" value="${material.materialName}" class="easyui-validatebox textbox" readOnly/>		
				        <input type="hidden" name="materialInstockBill.material.materialId" value="${material.materialId}"/>		      
				        <%-- <select id="empId" name="materialInstockBill.material.materialId" class="easyui-validatebox textbox" style="width:280px;">
				           <option value="0">---请选择物料---</option>
				          <c:forEach items="${listMaterials}" var="material">				            
				                <option value="${material.materialId}" name="materialInstockBill.material.materialId">${material.materialName}</option>				          
				          </c:forEach>
				        </select> --%>
				      </div>
				      <div class="quantity" style="padding:3px;">
				        <label for="materialInstockBill.quantity">数量：</label>
				       <input class="easyui-numberspinner" name="materialInstockBill.quantity" value="1000" data-options="increment:100" style="width: 256px;height: 30px;line-height: 30px;font-size: 15px;text-indent: 0.5em;"></input>
				      </div>
				      <div style="padding:3px;">
				        <label for="materialSource">物料来源：</label>
				       <%--  <input id="materialSource" type="text" name="materialInstockBill.materialSource" value="${materialInstockBill.materialSource}" class="easyui-validatebox textbox" data-options="required:true"/> --%>
				        <select id="empId" name="materialInstockBill.materialSource" class="easyui-validatebox textbox" style="width:280px;">
				          <option value="1">生产入库</option>				          	            
				          <option value="2">其他仓库入库</option>				          				        
				        </select>
				      </div>
				      <div style="padding:3px;">
				        <label for="billState">物料入库单状态：</label>
<%-- 				    <input id="billState" type="text" name="materialInstockBill.billState" value="${materialInstockBill.billState}" class="easyui-validatebox textbox" data-options="required:true"/> --%>
				        <select id="billState" name="materialInstockBill.billState" class="easyui-validatebox textbox" style="width:280px;">
				          <option value="0">待审核</option>				          	            
				          <option value="1">已审核</option>				    						          				       
				        </select>
				      </div>
				      <div class="billTime" style="padding:3px;display:none">
				        <label for="materialInstockBill.billTime">创建时间：</label>
				        <input id="billTimeDate" type="text" name="materialInstockBill.billTime" value="${materialInstockBill.billTime}" class="easyui-validatebox textbox" readonly/>
				      </div>
				      
				      <div class="auditAtInput" style="padding:3px;display:none">
				        <label for="materialInstockBill.auditAt">审核时间：</label>
				        <input id="aDate" type="text" name="materialInstockBill.auditAt" value="${materialInstockBill.auditAt}" class="easyui-validatebox textbox" readonly/>
				      </div>
				      <div class="auditAtInput" style="padding:3px;display:none">
				        <label for="materialInstockBill.auditBy">审核者：</label>
				        <%-- <input id="materialInstockBill.auditBy" type="text" name="materialInstockBill.auditBy" value="${materialInstockBill.auditBy}" class="easyui-validatebox textbox" data-options="required:true"/> --%>
				        <select id="empId" name="materialInstockBill.auditBy" class="easyui-validatebox textbox" style="width:280px;">
				          <option value="0">---请选择领货人---</option>
				          <c:forEach items="${listEmployees}" var="employee">				            
				                <option value="${employee.empId}" name="materialInstockBill.auditBy">${employee.name}</option>				          
				          </c:forEach>
				        </select>
				      </div>
				      <input type="hidden" name="materialInstockBill.billTime" id="aDate" />				     
				      
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
			
	<script type="text/javascript">
	$("select#billState").click(function(){
				if($("#billState option:selected").val() == 2){
					$(".auditAtInput").css("display","block");
					var mydateInput = document.getElementById("aDate");
			        var date = new Date();
			        var dateString = date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate();
			        mydateInput.value = dateString;
				}else if($("#billState option:selected").val() == 1){
					$(".auditAtInput").css("display","none");
					$("#aDate").attr({"value":NULL});
				}
			});
        
        //billTimeDate
        var mydateInput2 = document.getElementById("billTimeDate");
        var date2 = new Date();
        var dateString2 = date2.getFullYear() + "-" + (date2.getMonth() + 1) + "-" + date2.getDate();
        mydateInput2.value = dateString2;
    </script>

  </body>
</html>