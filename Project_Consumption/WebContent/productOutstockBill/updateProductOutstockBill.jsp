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
<style>
.spinner{width: 280px;height: 28px;}
.spinner-arrow{height:30px;}
.spinner-arrow-up{height:15px;}
.spinner-arrow-down{height:15px;}
</style>
<script>
	function randomNumber(){
		var now = new Date();
		var hour = now.getHours();
		var minutes = now.getMinutes();
		var seconds = now.getSeconds();
		console.log(hour);
		return "PI" + hour.toString() + minutes.toString() + seconds.toString() + (Math.round(Math.random() * 4)).toString();
	};
	window.onload = function(){
    	document.getElementById("billNo").value = randomNumber();
	};
</script>
  </head>  
  <body>
		<div id="container" class="easyui-layout" style="width:1024px;height:800px;padding:1px;margin-left:auto; margin-right:auto;">
			<div id="mainbody" style="height:90%">
				  <center>
				    <h1 style="color:skyblue;">修改货品出库单</h1>
				    <div style="padding:3px;color:red;">
				      ${msg}
				    </div>
				    <form action="saveproductOutstockBill" method="post">
				      <div style="padding:3px;">
				        <label for="billNo">货品出库单号：</label>
				        <input id="billNo" type="text" name="productOutstockBill.billNo" value="${productOutstockBill.billNo}" class="easyui-validatebox textbox" readonly/>
				      </div>
				      <div style="padding:3px;">
				        <label for="employee">领货人：</label>
				       <%--  <input id="fromPrincipal" type="text" name="productOutstockBill.fromPrincipal" value="${productOutstockBill.fromPrincipal}" class="easyui-validatebox textbox" data-options="required:true"/> --%>
				        <select id="empId" name="productOutstockBill.employee.empId" class="easyui-validatebox textbox" style="width:280px;">
				          <option value="0">---请选择领货人---</option>
				          <c:forEach items="${listEmployees}" var="employee">				            
				                <option value="${employee.empId}" name="productOutstockBill.employee.empId">${employee.name}</option>				          
				          </c:forEach>
				        </select>
				      </div>
				      <div style="padding:3px;">
				        <label for="warehousePrincipal">仓库：</label>				      
				        <select id="empId" name="productOutstockBill.wareHouse.wareId" class="easyui-validatebox textbox wareSelect" style="width:280px;" onchange="changeWare();">
				          <option value="0">---请选择仓库---</option>
				          <c:forEach items="${listWareHouses}" var="ware">				            
				                <option value="${ware.wareId}" name="productOutstockBill.wareHouse.wareId">${ware.wareNo}</option>				          
				          </c:forEach>
				        </select>
				      </div>
				      <div style="padding:3px;">
				        <label for="warehousePrincipal">货品：</label>				      
				        
				        <select class="select2" name="productOutstockBill.product.productId">
				        
				        </select>
				      </div>
				      <div class="quantity" style="padding:3px;">
				        <label for="productOutstockBill.quantity">数量：</label>
				       <input class="easyui-numberbox" name="productOutstockBill.quantity" value="1"  data-options="500,min:1"  style="width: 256px;height: 30px;line-height: 30px;font-size: 15px;text-indent: 0.5em;"/><br/>
				       <span onclick="getSelect()" class="lessQuantity">输出的数量请小于：</span>
				      </div>
				      <div style="padding:3px;">
				        <label for="productSource">货品来源：</label>
				       <%--  <input id="productSource" type="text" name="productOutstockBill.productSource" value="${productOutstockBill.productSource}" class="easyui-validatebox textbox" data-options="required:true"/> --%>
				        <select id="empId" name="productOutstockBill.productWhereabouts" class="easyui-validatebox textbox" style="width:280px;">
				          <option value="1">生产出库</option>				          	            
				          <option value="2">其他仓库出库</option>				          				        
				        </select>
				      </div>
				      <div style="padding:3px;">
				        <label for="billState">货品出库单状态：</label>
<%-- 				    <input id="billState" type="text" name="productOutstockBill.billState" value="${productOutstockBill.billState}" class="easyui-validatebox textbox" data-options="required:true"/> --%>
				        <select id="billState" name="productOutstockBill.billState" class="easyui-validatebox textbox" style="width:280px;">
				          <option value="1">待审核</option>				          	            
				          <option value="2">已审核</option>				    						          				       
				        </select>
				      </div>
				      <div class="billTime" style="padding:3px;display:none">
				        <label for="productOutstockBill.billTime">创建时间：</label>
				        <input id="billTimeDate" type="text" name="productOutstockBill.billTime" value="${productOutstockBill.billTime}" class="easyui-validatebox textbox" readonly/>
				      </div>
				      
				      <div class="auditAtInput" style="padding:3px;display:none">
				        <label for="productOutstockBill.auditAt">审核时间：</label>
				        <input id="aDate" type="text" name="productOutstockBill.auditAt" value="${productOutstockBill.auditAt}" class="easyui-validatebox textbox" readonly/>
				      </div>
				      <div class="auditAtInput" style="padding:3px;display:none">
				        <label for="productOutstockBill.auditBy">审核者：</label>
				        <%-- <input id="productOutstockBill.auditBy" type="text" name="productOutstockBill.auditBy" value="${productOutstockBill.auditBy}" class="easyui-validatebox textbox" data-options="required:true"/> --%>
				        <select id="empId" name="productOutstockBill.auditBy" class="easyui-validatebox textbox" style="width:280px;">
				          <option value="0">---请选择领货人---</option>
				          <c:forEach items="${listEmployees}" var="employee">				            
				                <option value="${employee.empId}" name="productOutstockBill.auditBy">${employee.name}</option>				          
				          </c:forEach>
				        </select>
				      </div>
				      <input type="hidden" name="productOutstockBill.billTime" id="aDate" />				     
				      
				      <div style="padding:3px;">
				        <input type="reset" value="重置"/>
				        &nbsp;&nbsp;&nbsp;
				        <input type="submit" value="录出"/>
				      </div>
				    </form>
				  </center>
				</div>
				<div id="tailbody" style="height:3%">
				  <%@ include file="../tail.jsp" %>
				</div>
			</div>
			
	<script type="text/javascript">
		$("select#billState").click(function(){
				if($("#billState option:selected").val() == 2){
					$(".auditAtInput").css("display","block");
					var mydateInput = document.getElementById("aDate");
			        var date = new Date();
			        var dateString = date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate();
			        mydateInput.value = dateString;
				}else if($("#billState option:selected").val() == 1){
					$(".auditAtInput").css("display","none");
					$("#aDate").attr({"value":NULL});
				}
			});
			function changeWare(){
				console.log($(".wareSelect option:selected").val());
				$(".select2").empty();
				$.ajax({
					url:'showChangewareHouseProduct?wareId='+$(".wareSelect option:selected").val(),
					success:function(data){	
						console.log(data);		
						var jsondata = $.parseJSON(data);		
						for(var i=0;i<data.length;i++){
							$(".select2").append("<option value="+jsondata[i][1]+">"+jsondata[i][0]+"</option>");
						}
					}
				});				
			}
			function getSelect(){
		    	/* console.log($(".select2 option:selected").val());
		    	console.log($(".wareSelect option:selected").val()); */
		    	var wareId =  $(".wareSelect option:selected").val();
		    	var productId = $(".select2 option:selected").val();
		    	$.ajax({
		    		url:'getQuantitywareHouseProduct?wareId='+ wareId +'&productId='+productId,
		    		dataType:'json',
		    		success:function(data){		 
		    			var jsondata = $.parseJSON(data);
		    			var quantity = jsondata[0][5];
		    			$(".lessQuantity").text("输出的数字请小于："+quantity);
		    			
		    			$(".easyui-numberbox").attr({"data-options":"max:"+quantity+",min:1"});
		    			$.parser.parse($(".quantity"));
		    		},
		    		error:function(e){
		    			console.log(e);
		    		}		    
		    	});
    		}
        
        //billTimeDate
        var mydateInput2 = document.getElementById("billTimeDate");
        var date2 = new Date();
        var dateString2 = date2.getFullYear() + "-" + (date2.getMonth() + 1) + "-" + date2.getDate();
        mydateInput2.value = dateString2;
    </script>

  </body>
</html>