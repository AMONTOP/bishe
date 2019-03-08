<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
				    <h1 style="color:skyblue;">修改领料单</h1>
				    <div style="padding:3px;color:red;">
				      ${msg}
				    </div>
				    <form action="updatematerialOutstockBill" method="post">
				    	<input id="billId" type="hidden" name="materialOutstockBill.billId" value="${materialOutstockBill.billId}"/>
				       <div style="padding:3px;">
				        <label for="materialOutstockBill.billNo">领料单号：</label>
				        <input id="materialOutstockBill.billNo" type="text" name="materialOutstockBill.billNo" value="${materialOutstockBill.billNo}" class="easyui-validatebox textbox" data-options="required:true,validType:'length[2,10]'"/>
				      </div>
				      <div style="padding:3px;">
				        <label for="materialOutstockBill.toPrincipal">领料人：</label>
				        <input id="materialOutstockBill.toPrincipal" type="text" name="materialOutstockBill.toPrincipal" value="${materialOutstockBill.toPrincipal}" class="easyui-validatebox textbox" data-options="required:true"/>
				      </div>
				      <div style="padding:3px;">
				        <label for="materialOutstockBill.warehousePrincipal">仓库负责人：</label>
				        <input id="materialOutstockBill.warehousePrincipal" type="text" name="materialOutstockBill.warehousePrincipal" value="${materialOutstockBill.warehousePrincipal}" class="easyui-validatebox textbox" data-options="required:true"/>
				      </div>
				      <div style="padding:3px;">
				        <label for="materialOutstockBill.materialWhereabouts">领料原因：</label>
				        <input id="materialOutstockBill.materialWhereabouts" type="text" name="materialOutstockBill.materialWhereabouts" value="${materialOutstockBill.materialWhereabouts}" class="easyui-validatebox textbox" data-options="required:true"/>
				      </div>
				      <div style="padding:3px;">
				        <label for="materialOutstockBill.billState">领料单状态：</label>
				        <input id="materialOutstockBill.billState" type="text" name="materialOutstockBill.billState" value="${materialOutstockBill.billState}" class="easyui-validatebox textbox" data-options="required:true"/>
				      </div>
				      
				      <div style="padding:3px;">
				        <label for="materialOutstockBill.auditAt">审核时间：</label>
				        <input id="materialOutstockBill.auditAt" type="text" name="materialOutstockBill.auditAt" value="${materialOutstockBill.auditAt}" class="easyui-validatebox textbox" data-options="required:true"/>
				      </div>
				      <div style="padding:3px;">
				        <label for="materialOutstockBill.auditBy">审核者：</label>
				        <input id="materialOutstockBill.auditBy" type="text" name="materialOutstockBill.auditBy" value="${materialOutstockBill.auditBy}" class="easyui-validatebox textbox" data-options="required:true"/>
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