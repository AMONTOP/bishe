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
		return "WLZ" + hour.toString() + minutes.toString() + seconds.toString() + (Math.round(Math.random() * 4)).toString();
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
				    <h1 style="color:skyblue;">修改物料品质记录</h1>
				    <div style="padding:3px;color:red;">
				      ${msg}
				    </div>
				    <form action="updatematerialCheck" method="post">
				      <input type="hidden" name="materialCheck.materialInstockBill.quantity" value="${materialCheck.materialInstockBill.quantity}"/>
				      <input type="hidden" name="materialCheck.materialInstockBill.mwareHouse.wareId" value="${materialCheck.materialInstockBill.mwareHouse.wareId}"/>
				      <input id="materialCheckId" type="hidden" name="materialCheck.materialCheckId" value="${materialCheck.materialCheckId}"/>		
				      <input type="hidden" name="materialCheck.material.materialId" value="${materialCheck.material.materialId}"/>
				      <input type="hidden" name="materialCheck.materialInstockBill.billId" value="${materialCheck.materialInstockBill.billId}"/>
				      <input type="hidden" name="materialCheck.materialInstockBill.purchase.purId" value="${materialCheck.materialInstockBill.purchase.purId}"/>
				      <input type="hidden" name="materialCheck.checkState" value="true"/>				 			 	
				      <div style="padding:3px;">
				        <label for="materialCheck.checkNo">抽检单号：</label>
				        <input id="checkNo" type="text" name="materialCheck.checkNo" value="${materialCheck.checkNo}" class="easyui-validatebox textbox" readonly/>
				      </div>
				      <div style="padding:3px;">
				        <label for="material.materialName">抽检货品：</label>
				        <input id="materialId" type="text" name="materialCheck.material.materialName" value="${materialCheck.material.materialName}" class="easyui-validatebox textbox" readonly/>
				      </div>
				      <div style="padding:3px;">
				        <label for="checkItem">检测类别：</label>
				        <select name="materialCheck.checkItem" class="easyui-validatebox textbox" style="width:280px;">
				        	<option value="包装外表">包装外表</option>
				        	<option value="产品质量">产品质量</option>
				        	<option value="使用寿命">使用寿命</option>
				        </select>
				      </div>
				      
				      <div style="padding:3px;">				      
				        <label for="checkNumber">检测数量：</label>				        
				        <input id="checkNumber" type="text" name="materialCheck.checkNumber" value="${materialCheck.checkNumber}" class="easyui-validatebox textbox" data-options="required:true"/>
				      </div>
				       <div style="padding:3px;">
				        <label for="material.spec">检测结果：</label>
				        <select name="materialCheck.result" id="selectResult" onchange="sclick()" class="easyui-validatebox textbox" style="width:280px;">
				        	<option value="优">优</option>
				        	<option value="良">良</option>				        	
				        	<option value="不合格">不合格</option>
				        </select>
				      </div>
				      <div style="padding:3px;">
				        <label for="material.price">审批状态：</label>
				        <input id="mycheckState" type="hidden" name="materialCheck.state" value="true"/>				        
				        <input id="checkState" type="text" value="审批通过" class="easyui-validatebox textbox" readonly/>
				      </div>
				      <div style="padding:3px;">
				        <label for="materialCheck.qualify">合格率：</label>				       	        
				        <!-- <input id="materialCheck.qualify" name="materialCheck.qualify" type="text" value="0.6" class="easyui-validatebox textbox"/> -->
				        <input class="easyui-slider" id="percent" name="materialCheck.qualify" style="width:300px" data-options="showTip:true,rule: [0,'|',25,'|',50,'|',75,'|',100]">
				      </div>
				      <div style="padding:25px;">
				        <label for="materialCheck.qualify">审核时间：</label>
				       <input type="date" id="date_info" name="materialCheck.cdate" class="easyui-validatebox textbox" readonly/>
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
			    /* var billState = document.getElementById("billState"); */
			    
			    if(options2 == "优" || options2 == "良"){
			      text.value = "审批通过";
			      mycheckState.value = "true";
			     /*  billState.value = "true"; */			   			   
			    }else if(options2 == "不合格"){
			      text.value = "审批未通过";
			      mycheckState.value = "false";
			     /*  billState.value = "false";	 */
			    } 
			  };
			
		</script>
  </body>
</html>