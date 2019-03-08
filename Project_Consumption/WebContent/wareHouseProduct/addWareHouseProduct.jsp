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
				    <h1 style="color:skyblue;">添加仓库货品资料</h1>
				    <div style="padding:3px;color:red;">
				      ${msg}
				    </div>
				    <form action="saveNewwareHouseProduct" method="post">
				      <div style="padding:3px;">
				        <label for="wareNo">仓库名：</label>
				         <select id="wareId" name="wareHouseProduct.wareHouse.wareId" class="easyui-validatebox textbox" style="width:280px;">
				          <option value="0">---请选择仓库---</option>
				          <c:forEach items="${listWareHouse}" var="wareHouse">				            
				                <option value="${wareHouse.wareId}" name="wareHouseProduct.wareHouse.wareId">${wareHouse.wareNo}</option>				          
				          </c:forEach>
				        </select> 				        
				      </div>
				      <div style="padding:3px;height: 54px;">
				        <label for="wareCapacity">货品：</label>
				       	<select id="productId" name="wareHouseProduct.product.productId" class="easyui-validatebox textbox" style="width:280px;" onchange="changeSelect();">
				          <option value="0">---请选择货品---</option>
				          <c:forEach items="${listProduct}" var="product">				            
				                <option value="${product.productId}" name="wareHouseProduct.product.productId">${product.productName}</option>				          
				          </c:forEach>
				        </select>
				      </div>
				      <div style="padding:3px;height: 54px;">
				        <label for="wareCapacity">数量：</label>
				        <input id="quantity" type="text" name="wareHouseProduct.quantity"  class="easyui-validatebox textbox" data-options="required:true"/>				     
				      </div>
				      <div style="padding:3px;height: 54px;">
				        <label for="remark">备注：</label>
				      	<input id="remark" type="text" name="wareHouseProduct.remark"  class="easyui-validatebox textbox"/>				     
				      </div>
				      
				      <input type="hidden" value="true" name="wareHouseProduct.flag" class="flag"/>				     				   
				    				   
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
	    function changeSelect(){
	    	$.ajax({
			url :'test2wareHouseProduct?wareId='+$("#wareId option:selected").val()+'&productId='+$("#productId option:selected").val(),
			type:"get",
			dataType:'json', 
        	success:function(data){
        		console.log("existData");
        		var jsondata = $.parseJSON(data);        		
        		console.log(jsondata);        		
        		if(jsondata.length == 0){
        			$(".flag").attr({"value":true});
        			console.log("aaaa");
        		}else{
        			$(".flag").attr({"value":false});
        			console.log("bbbb");
        		}        		
        	}
		});
	    }
	</script>
  </body>
</html>