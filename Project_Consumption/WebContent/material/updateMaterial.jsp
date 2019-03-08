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
				    <h1 style="color:skyblue;">修改物料记录</h1>
				    <div style="padding:3px;color:red;">
				      ${msg}
				    </div>
				    <form action="updatematerial" method="post">
				      <input id="materialId" type="hidden" name="material.materialId" value="${material.materialId}"/>
				      <div style="padding:3px;">
				        <label for="material.materialNo">物料编号：</label>
				        <input id="material.materialNo" type="text" name="material.materialNo" value="${material.materialNo}" class="easyui-validatebox textbox" readonly/>
				      </div>
				      <div style="padding:3px;">
				        <label for="material.materialName">物料名称：</label>
				        <input id="material.materialName" type="text" name="material.materialName" value="${material.materialName}" class="easyui-validatebox textbox" data-options="required:true"/>
				      </div>
				      <div style="padding:3px;">
				        <label for="material.unit">计量单位：</label>
				        <input id="material.unit" type="text" name="material.unit" value="${material.unit}" class="easyui-validatebox textbox" data-options="required:true"/>
				      </div>
				       <div style="padding:3px;">
				       
				        <label for="material.materialCategory.categoryName">产品类别：</label>
				        
				        <select id="categoryId" name="material.materialCategory.categoryId" class="easyui-validatebox textbox" style="width:280px;">
				          <option value="0">---请选择产品类型---</option>
				          <c:forEach items="${listCategory}" var="materialCategory">				            
				                <option value="${materialCategory.categoryId}" name="material.materialCategory.categoryId">${materialCategory.categoryName}</option>				          
				          </c:forEach>
				        </select>
				      </div>
				       <div style="padding:3px;">
				        <label for="material.spec">规格：</label>
				        <input id="material.spec" type="text" name="material.spec" value="${material.spec}" class="easyui-validatebox textbox" data-options="required:true"/>
				      </div>
				       <div style="padding:3px;">
				        <label for="material.cost">价格：</label>
				        <input id="material.cost" type="text" name="material.cost" value="${material.cost}" class="easyui-validatebox textbox" data-options="required:true"/>
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