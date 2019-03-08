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
<script src="/Project_Consumption/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet" href="/Project_Consumption/css/jquery.dataTables.min.css">

  </head>  
  <body>
		<div id="container" class="easyui-layout" style="width:1024px;height:800px;padding:1px;margin-left:auto; margin-right:auto;">
			<div id="mainbody" style="height:90%">
				  <center>
				    <h1 style="color:skyblue;">修改货品入库单货品</h1>
				    <div style="padding:3px;color:red;">
				      ${msg}
				    </div>
				    <form action="update2productInstockBill" method="post">
				    	<input id="billId" type="hidden" name="productInstockBill.billId" value="${productInstockBill.billId}"/>
				       <div style="padding:3px;">
				        <label for="productInstockBill.billNo">货品入库单号：</label>
				        <input id="productInstockBill.billNo" type="text" name="productInstockBill.billNo" value="${productInstockBill.billNo}" class="easyui-validatebox textbox" readonly/>
				      	</div>
				      	<div style="padding:3px;">
				        <label for="productInstockBillProduct.quantity">数量：</label>
				        <input class="easyui-numberspinner" name="productInstockBill.quantity" value="1000" data-options="min:10,increment:100" style="width: 256px;height: 30px;line-height: 30px;font-size: 15px;text-indent: 0.5em;"></input>
				      </div>
				     <div style="padding:3px;">
				        <label for="billNo">入库货品：</label>				      
				         <select id="empId2" name="productInstockBill.product.productId" class="easyui-validatebox textbox" style="width:280px;">
				          <option value="0">---货品---</option>
				          <c:forEach items="${listProducts}" var="product">				            
				                <option value="${product.productId}" name="productInstockBill.product.productId">${product.productName}</option>				          
				          </c:forEach>
				         </select>
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
			<script>
			$("select#billState").click(function(){
				if($("#billState option:selected").val() == 2){
					$(".auditAtInput").css("display","block");	
					var mydateInput = document.getElementById("aDate");
			        var date = new Date();
			        var dateString = date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate();
			        mydateInput.value = dateString;				
				}else if($("#billState option:selected").val() == 1){
					console.log("select1");
					$(".auditAtInput").css("display","none");
					$("#aDate").attr({"value":NULL});
				}
			});
			
			</script>
  </body>
</html>