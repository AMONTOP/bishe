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
  </head>  
  <body>
		<div id="container" class="easyui-layout" style="width:1024px;height:800px;padding:1px;margin-left:auto; margin-right:auto;">
			<div id="mainbody" style="height:90%">
				  <center>
				    <h1 style="color:skyblue;">修改产品物料记录</h1>
				    <div style="padding:3px;color:red;">
				      ${msg}
				    </div>
				    <form action="updateproductMaterial" method="post">
				    	<input id="productMaterialId" type="hidden" name="productMaterial.productMaterialId" value="${productMaterial.productMaterialId}"/>
				      <div style="padding:3px;">
				        <label for="productMaterial.product.productNo">产品编号：</label>
				        <input id="productMaterial.product.productNo"  type="text" name="productMaterial.product.productNo" value="${productMaterial.product.productNo}" class="easyui-validatebox textbox" data-options="required:true,validType:'length[2,7]'"/>
				      </div>
				      <div style="padding:3px;">
				        <label for="productMaterial.product.productName">产品名称：</label>
				        <input type="hidden" name="productMaterial.product.productId" value="${productMaterial.product.productId}"/>
				        <input id="productMaterial.product.productName"  type="text" value="${productMaterial.product.productName}" class="easyui-validatebox textbox" data-options="required:true"/>
				      </div>
				      <div style="padding:3px;">
				        <label for="productMaterial.material.materialNo">物料编号：</label>
				        <input id="productMaterial.material.materialNo" type="text" name="productMaterial.material.materialNo" value="${productMaterial.material.materialNo}" class="easyui-validatebox textbox" data-options="required:true"/>
				      </div>
				       <div style="padding:3px;">
				        <label for="productMaterial.material.materialName">物料名称：</label>
				        <%-- <input id="productMaterial.material.materialName" type="text" name="productMaterial.material.materialName" value="${productMaterial.material.materialName}" class="easyui-validatebox textbox" data-options="required:true"/> --%>
				        <select id="materialId" name="productMaterial.material.materialId" class="easyui-validatebox textbox" style="width:280px;">		
				          <c:forEach items="${listMaterials}" var="material">				            
				                <option value="${material.materialId}" name="productMaterial.material.materialId">${material.materialName}</option>				          
				          </c:forEach>
				        </select>
				      </div>
				   
				      <div style="padding:3px;">
				        <label for="productMaterial.quantity">数量：</label>
				        <input id="productMaterial.quantity" type="text" name="productMaterial.quantity" value="${productMaterial.quantity}" class="easyui-validatebox textbox" data-options="required:true"/>
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