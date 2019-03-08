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
  </head>  
  <body>
		<div id="container" class="easyui-layout" style="width:1024px;height:800px;padding:1px;margin-left:auto; margin-right:auto;">
			<div id="mainbody" style="height:90%">
				  <center>
				    <h1 style="color:skyblue;">添加领料单物料</h1>
				    <div style="padding:3px;color:red;">
				      ${msg}
				    </div>
				    <form action="savedrawMaterialBillMaterial" method="post">
				      
				      <div style="padding:3px;">
				        <label for="drawMaterialBillMaterial.drawMaterialBill.billNo">领料单号：</label>
				        <select id="billId" name="drawMaterialBillMaterial.drawMaterialBill.billId" class="easyui-validatebox textbox" style="width:280px;" onchange="aa()">
				          <option value="0">---请选择单号---</option>
				          <c:forEach items="${listDrawMaterial}" var="drawMaterialBill">				            
				                <option value="${drawMaterialBill.billId}" name="drawMaterialBillMaterial.drawMaterialBill.billId">${drawMaterialBill.billNo}</option>				          
				          </c:forEach>
				        </select>
				      </div>
				      
				       <div style="padding:3px;">
				       
				        <label for="drawMaterialBillMaterial.material.materialName">物料名称：</label>
				        
				        <select id="materialId" name="drawMaterialBillMaterial.material.materialId" class="easyui-validatebox textbox" style="width:280px;">
				          <option value="0">---请选择物料---</option>
				          <c:forEach items="${listMaterial}" var="material">				            
				                <option value="${material.materialId}" name="drawMaterialBillMaterial.material.materialId">${material.materialName}</option>				          
				          </c:forEach>
				        </select>
				      </div>
				       <div style="padding:3px;">
				        <label for="drawMaterialBillMaterial.quantity">数量：</label>
				        <input id="drawMaterialBillMaterial.quantity" type="text" name="drawMaterialBillMaterial.quantity"  class="easyui-validatebox textbox" data-options="required:true"/>
				      </div>
				       <div style="padding:3px;">
				        <label for="drawMaterialBillMaterial.remark">备注：</label>
				        <input id="drawMaterialBillMaterial.remark" type="text" name="drawMaterialBillMaterial.remark"  class="easyui-validatebox textbox" data-options="required:true"/>
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
  </body>
</html>