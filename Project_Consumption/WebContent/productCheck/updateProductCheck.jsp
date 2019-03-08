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
	function randomNumber(){
		var now = new Date();
		var hour = now.getHours();
		var minutes = now.getMinutes();
		var seconds = now.getSeconds();
		console.log(hour);
		return "CPZ" + hour.toString() + minutes.toString() + seconds.toString() + (Math.round(Math.random() * 4)).toString();
	};
	window.onload = function(){
    	document.getElementById("checkNo").value = randomNumber();
	};
	
</script>
<style>
	.slider{display: inline-block;}
</style>
  </head>  
  <body>
		<div id="container" class="easyui-layout" style="width:1024px;height:800px;padding:1px;margin-left:auto; margin-right:auto;">
				<div id="mainbody" style="height:90%">
				  <center>
				    <h1 style="color:skyblue;">修改产品品质记录</h1>
				    <div style="padding:3px;color:red;">
				      ${msg}
				    </div>
				    <form action="updateproductCheck" method="post">
				      <input type="hidden" name="productCheck.productInstockBill.quantity" value="${productCheck.productInstockBill.quantity}"/>
				      <input type="hidden" name="productCheck.productInstockBill.wareHouse.wareId" value="${productCheck.productInstockBill.wareHouse.wareId}"/>
				      <input id="productCheckId" type="hidden" name="productCheck.productCheckId" value="${productCheck.productCheckId}"/>		
				      <input type="hidden" name="productCheck.product.productId" value="${productCheck.product.productId}"/>
				      <input type="hidden" name="productCheck.productInstockBill.billId" value="${productCheck.productInstockBill.billId}"/>
				      <input type="hidden" name="productCheck.checkState" value="true"/>				 			 	
				      <div style="padding:3px;">
				        <label for="productCheck.checkNo">抽检单号：</label>
				        <input id="checkNo" type="text" name="productCheck.checkNo" value="${productCheck.checkNo}" class="easyui-validatebox textbox" readonly/>
				      </div>
				      <div style="padding:3px;">
				        <label for="product.productName">抽检货品：</label>
				        <input id="productId" type="text" name="productCheck.product.productName" value="${productCheck.product.productName}" class="easyui-validatebox textbox" readonly/>
				      </div>
				      <div style="padding:3px;">
				        <label for="checkItem">检测类别：</label>
				        <select name="productCheck.checkItem" class="easyui-validatebox textbox" style="width:280px;">
				        	<option value="包装外表">包装外表</option>
				        	<option value="产品质量">产品质量</option>
				        	<option value="使用寿命">使用寿命</option>
				        </select>
				      </div>
				      
				      <div style="padding:3px;">				      
				        <label for="checkNumber">检测数量：</label>				        
				        <input id="checkNumber" type="text" name="productCheck.checkNumber" value="${productCheck.checkNumber}" class="easyui-validatebox textbox" data-options="required:true"/>
				      </div>
				       <div style="padding:3px;">
				        <label for="product.spec">检测结果：</label>
				        <select name="productCheck.result" id="selectResult" onchange="sclick()" class="easyui-validatebox textbox" style="width:280px;">
				        	<option value="优">优</option>
				        	<option value="良">良</option>				        	
				        	<option value="不合格">不合格</option>
				        </select>
				      </div>
				      <div style="padding:3px;">
				        <label for="product.price">审批状态：</label>
				        <input id="mycheckState" type="hidden" name="productCheck.state" value="true"/>				        
				        <input id="checkState" type="text" value="审批通过" class="easyui-validatebox textbox" readonly/>
				      </div>
				      <div style="padding:3px;">
				        <label for="productCheck.qualify">合格率：</label>				       	        
				        <!-- <input id="productCheck.qualify" name="productCheck.qualify" type="text" value="0.6" class="easyui-validatebox textbox"/> -->
				         <input class="easyui-slider" id="percent" name="productCheck.qualify" style="width:300px" data-options="showTip:true,rule: [0,'|',25,'|',50,'|',75,'|',100]">
				      </div>
				      <div style="padding:25px;">
				        <label for="productCheck.qualify">审核时间：</label>
				       <input type="date" id="date_info" name="productCheck.cdate" readonly/>
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
		<script>
			$(document).ready(function () {
		        var time=new Date();
		        var day = ("0" + time.getDate()).slice(-2);
		        var month = ("0" + (time.getMonth() + 1)).slice(-2);
		        var today = time.getFullYear() + "-" + (month) + "-" + (day);
		        $('#date_info').val(today);
    		});
			  function sclick() {
			  	console.log("sclick");
			    var obj = document.getElementById("selectResult");
			    var index = obj.selectedIndex;
			    let options2 = obj.options[index].text;
			    var text = document.getElementById("checkState");
			    var mycheckState = document.getElementById("mycheckState");
			   /*  var billState = document.getElementById("billState"); */
			    if(options2 == "优" || options2 == "良"){
			      text.value = "审批通过";
			      mycheckState.value = "true";
			      /* billState.value = "true"; */
			    }else if(options2 == "不合格"){
			      text.value = "审批未通过";
			      mycheckState.value = "false";
			      /* billState.value = "false";			      */
			    };
			  };
			
		</script>
  </body>
</html>