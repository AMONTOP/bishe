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
				    <h1 style="color:skyblue;">修改产品记录</h1>
				    <div style="padding:3px;color:red;">
				      ${msg}
				    </div>
				    <form action="updateproduct" method="post">
				      <input id="productId" type="hidden" name="product.productId" value="${product.productId}"/>
				      <div style="padding:3px;">
				        <label for="product.productNo">产品编号：</label>
				        <input id="product.productNo" type="text" name="product.productNo" value="${product.productNo}" class="easyui-validatebox textbox" readonly/>
				      </div>
				      <div style="padding:3px;">
				        <label for="product.productName">产品名称：</label>
				        <input id="product.productName" type="text" name="product.productName" value="${product.productName}" class="easyui-validatebox textbox" data-options="required:true"/>
				      </div>
				      <div style="padding:3px;">
				        <label for="product.unit">计量单位：</label>
				        <input id="product.unit" type="text" name="product.unit" value="${product.unit}" class="easyui-validatebox textbox" data-options="required:true"/>
				      </div>
				       <div style="padding:3px;">
				       
				        <label for="product.productCategory.categoryName">产品类别：</label>
				        
				        <select id="categoryId" name="product.productCategory.categoryId" class="easyui-validatebox textbox" style="width:280px;">
				          <option value="0">---请选择产品类型---</option>
				          <c:forEach items="${listCategory}" var="productCategory">				            
				                <option value="${productCategory.categoryId}" name="product.productCategory.categoryId">${productCategory.categoryName}</option>				          
				          </c:forEach>
				        </select>
				      </div>
				       <div style="padding:3px;">
				        <label for="product.spec">规格：</label>
				        <input id="product.spec" type="text" name="product.spec" value="${product.spec}" class="easyui-validatebox textbox" data-options="required:true"/>
				      </div>
				       <div style="padding:3px;">
				        <label for="product.price">价格：</label>
				        <input id="product.price" type="text" name="product.price" value="${product.price}" class="easyui-validatebox textbox" data-options="required:true"/>
				      </div>
				      				  
				      <div style="padding:3px;">
				        <input type="reset" value="重置"/>
				        &nbsp;&nbsp;&nbsp;
				        <input type="submit" value="修改"/>
				      </div>
				    </form>
				  </center>
				</div>

			</div>
		
  </body>
</html>