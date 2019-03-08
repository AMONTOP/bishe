<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.text.*" %>
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
<script src="/Project_Consumption/js/Popt.js"></script>
<script src="/Project_Consumption/js/cityJson.js"></script>
<script src="/Project_Consumption/js/citySet.js"></script>
<!-- <script type="text/javascript">

 	  $(function(){
		  $("form").submit(function(){
			  var consume_name = $.trim($("#clientName").val());
			  if(consume_name == ""){
				  alert("请输入客户名称！");
				  return false;
			  }
			  if(consume_name.length < 2 || consume_name.length > 10){
				  alert("客户名称长度必须在2到10之间！");
				  return false;
			  }
			  var contact = $.trim($("#contact").val());
			  if(contact == ""){
				  alert("请输入联系人名称！");
				  return false;
			  }
		
			  var contactPhone = $.trim($("#contactPhone").val());
			  if(contactPhone.length != 11){
				  alert("请输入11位数的手机号码！");
				  return false;
			  }
			  return true;
		  });
	  });
	</script> -->
	<style>
 		._citys { width: 450px; display: inline-block; border: 2px solid #eee; padding: 5px; position: relative;background: white; }
        ._citys span { color: #56b4f8; height: 15px; width: 15px; line-height: 15px; text-align: center; border-radius: 3px; position: absolute; right: 10px; top: 10px; border: 1px solid #56b4f8; cursor: pointer; }
        ._citys0 { width: 100%; height: 34px; display: inline-block; border-bottom: 2px solid #56b4f8; padding: 0; margin: 0; }
        ._citys0 li { display: inline-block; line-height: 34px; font-size: 15px; color: #888; width: 80px; text-align: center; cursor: pointer; }
        .citySel { background-color: #56b4f8; color: #fff !important; }
        ._citys1 { width: 100%; display: inline-block; padding: 10px 0; }
        ._citys1 a { width: 83px; height: 35px; display: inline-block; background-color: #f5f5f5; color: #666; margin-left: 6px; margin-top: 3px; line-height: 35px; text-align: center; cursor: pointer; font-size: 13px; overflow: hidden; }
        ._citys1 a:hover { color: #fff; background-color: #56b4f8; }
        .AreaS { background-color: #56b4f8 !important; color: #fff !important; }
        .slider{    display: inline-block;     }
	</style>
  </head>  
  <body>
		<div id="container" class="easyui-layout" style="width:1024px;height:800px;padding:1px;margin-left:auto; margin-right:auto;">
				<div id="mainbody" style="height:90%">
				  <center>
				    <h1 style="color:skyblue;">添加仓库资料</h1>
				    <div style="padding:3px;color:red;">
				      ${msg}
				    </div>
				    <form action="savematerialHouse" method="post">
				      <div style="padding:3px;">
				        <label for="wareNo">仓库名：</label>
				        <input id="wareNo" type="text" name="mwareHouse.wareNo" value="${mwareHouse.wareNo}" class="easyui-validatebox textbox" data-options="required:true"/>
				      </div>
				      <div style="padding:3px;height: 54px;">
				        <label for="wareCapacity">仓库容量：</label>
				        <%-- <input id="wareCapacity" type="text" name="mwareHouse.wareCapacity" value="${mwareHouse.wareCapacity}" class="easyui-validatebox textbox" data-options="required:true"/> --%>
				        <input class="easyui-slider" style="width:300px" data-options="showTip:true,rule: [0,'|',25,'|',50,'|',75,'|',100]">
				      </div>
				      <%-- <div style="padding:3px;">
				        <label for="productName">仓库货品：</label>
				        <select id="productId" name="mwareHouse.product.productId" class="easyui-validatebox textbox" style="width:280px;">
				          <option value="0">---请选择货品---</option>
				          <c:forEach items="${listProduct}" var="product">				            
				                <option value="${product.productId}" name="mwareHouse.product.productId">${product.productName}</option>				          
				          </c:forEach>
				        </select>
				     </div> 
				     <div style="padding:3px;">
				        <label for="address">仓库地址：</label>
				        <input id="address" type="text" name="mwareHouse.address" value="${mwareHouse.address}" class="easyui-validatebox textbox" data-options="required:true"/>
				      </div>
				      --%>
				      <div style="padding:3px;">
					  		<label for="mwareHouse.address">地址：</label>
						    <input  type="text" id="city"  class="easyui-validatebox textbox validatebox-text" readonly /><br/>
						    <label for="mwareHouse.address2">详细地址：</label>
						    <input  type="text" id="city2"  class="easyui-validatebox textbox validatebox-text"/>
						    <input type="hidden" id="address" name="mwareHouse.address"/>
					  </div>
				      <div style="padding:3px;">
				        <label for="name">仓库负责人：</label>
				        <select id="empId" name="mwareHouse.employee.empId" class="easyui-validatebox textbox" style="width:280px;">
				          <option value="0">---请选择负责人---</option>
				          <c:forEach items="${listEmployee}" var="employee">				            
				                <option value="${employee.empId}" name="mwareHouse.employee.empId">${employee.name}</option>				          
				          </c:forEach>
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
	<script type="text/javascript">
	    $("#city").click(function (e) {
	        SelCity(this,e);
	    });
	    $("#city2").bind("input propertychange",function(event){
	       var str_address = $("#city").attr("value") + $("#city2").val();
		 	console.log(str_address);
	       $("#address").attr({"value" : str_address});
		});
		$(function(){
			$(".slider-value").attr({"name":"mwareHouse.wareCapacity"});
		});
	</script>
  </body>
</html>