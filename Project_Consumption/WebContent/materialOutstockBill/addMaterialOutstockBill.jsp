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
		return "CK" + hour.toString() + minutes.toString() + seconds.toString() + (Math.round(Math.random() * 4)).toString();
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
				    <h1 style="color:skyblue;">添加物料出库单</h1>
				    <div style="padding:3px;color:red;">
				      ${msg}
				    </div>
				    <form action="savematerialOutstockBill" method="post">
				      <div style="padding:3px;">
				        <label for="billNo">物料出库单号：</label>
				        <input id="billNo" type="text" name="materialOutstockBill.billNo" value="${materialOutstockBill.billNo}" class="easyui-validatebox textbox" readonly/>
				      </div>
				      <div style="padding:3px;">
				        <label for="employee">领货人：</label>
				       <%--  <input id="fromPrincipal" type="text" name="materialOutstockBill.fromPrincipal" value="${materialOutstockBill.fromPrincipal}" class="easyui-validatebox textbox" data-options="required:true"/> --%>
				        <select id="empId" name="materialOutstockBill.employee.empId" class="easyui-validatebox textbox" style="width:280px;">
				          <option value="0">---请选择领货人---</option>
				          <c:forEach items="${listEmployees}" var="employee">				            
				                <option value="${employee.empId}" name="materialOutstockBill.employee.empId">${employee.name}</option>				          
				          </c:forEach>
				        </select>
				      </div>
				      <div style="padding:3px;">
				        <label for="warehousePrincipal">仓库：</label>				      
				        <select id="empId" name="materialOutstockBill.mwareHouse.wareId" class="easyui-validatebox textbox wareSelect" style="width:280px;" onchange="changeWare();">
				          <option value="0">---请选择仓库---</option>
				          <c:forEach items="${listMwareHouses}" var="mware">				            
				                <option value="${mware.wareId}" name="materialOutstockBill.mwareHouse.wareId">${mware.wareNo}</option>				          
				          </c:forEach>
				        </select>
				      </div>
				      <div style="padding:3px;">
				        <label for="warehousePrincipal">物料：</label>				      
				        <select name="materialOutstockBill.material.materialId" class="easyui-validatebox textbox select2" style="width:280px;">
				         <!--  <option value="0">---请选择物料---</option> -->
				          <c:forEach items="${listMaterials}" var="material">				            
				                <option value="${material.materialId}" name="materialOutstockBill.material.materialId">${material.materialName}</option>				          
				          </c:forEach>
				        </select>
				      </div>
				      <div class="quantity" style="padding:3px;">
				        <label for="materialOutstockBill.quantity">数量：</label>
				       <input class="easyui-numberbox" name="materialOutstockBill.quantity" value="1"  data-options="500,min:1"  style="width: 256px;height: 30px;line-height: 30px;font-size: 15px;text-indent: 0.5em;"/><br/>
				       <span onclick="getSelect()" class="lessQuantity">输出的数量请小于：</span>
				      </div>
				      <div style="padding:3px;">
				        <label for="materialSource">物料来源：</label>
				       <%--  <input id="materialSource" type="text" name="materialOutstockBill.materialSource" value="${materialOutstockBill.materialSource}" class="easyui-validatebox textbox" data-options="required:true"/> --%>
				        <select id="empId" name="materialOutstockBill.materialWhereabouts" class="easyui-validatebox textbox" style="width:280px;">
				          <option value="1">生产出库</option>				          	            
				          <option value="2">其他仓库出库</option>				          				        
				        </select>
				      </div>
				      <div style="padding:3px;">
				        <label for="billState">物料出库单状态：</label>
<%-- 				    <input id="billState" type="text" name="materialOutstockBill.billState" value="${materialOutstockBill.billState}" class="easyui-validatebox textbox" data-options="required:true"/> --%>
				        <select id="billState" name="materialOutstockBill.billState" class="easyui-validatebox textbox" style="width:280px;">
				          <option value="0">待审核</option>				          	            
				          <option value="1">已审核</option>				    						          				       
				        </select>
				      </div>
				      <div class="billTime" style="padding:3px;display:none">
				        <label for="materialOutstockBill.billTime">创建时间：</label>
				        <input id="billTimeDate" type="text" name="materialOutstockBill.billTime" value="${materialOutstockBill.billTime}" class="easyui-validatebox textbox" readonly/>
				      </div>
				      
				      <div class="auditAtInput" style="padding:3px;display:none">
				        <label for="materialOutstockBill.auditAt">审核时间：</label>
				        <input id="aDate" type="text" name="materialOutstockBill.auditAt" value="${materialOutstockBill.auditAt}" class="easyui-validatebox textbox" readonly/>
				      </div>
				      
				      <input type="hidden" name="materialOutstockBill.billTime" id="aDate" />				     
				      
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
				if($("#billState option:selected").val() == 1){
					$(".auditAtInput").css("display","block");
					var mydateInput = document.getElementById("aDate");
			        var date = new Date();
			        var dateString = date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate();
			        mydateInput.value = dateString;
				}else if($("#billState option:selected").val() == 0){
					$(".auditAtInput").css("display","none");
					$("#aDate").attr({"value":NULL});
				}
			});
			function changeWare(){
				console.log($(".wareSelect option:selected").val());
				$(".select2").empty();
				$.ajax({
					url:'showChangematerialHouseMaterial?wareId='+$(".wareSelect option:selected").val(),
					success:function(data){	
						console.log(data);		
						var jsondata = $.parseJSON(data);
						
						for(var i=0;i<data.length;i++){
							
							console.log(jsondata[i][1]);		
							$(".select2").append("<option value="+jsondata[i][1]+">"+jsondata[i][0]+"</option>");
						}
					}
				});				
			}
			function getSelect(){
		    	/* console.log($(".select2 option:selected").val());
		    	console.log($(".wareSelect option:selected").val()); */
		    	var wareId =  $(".wareSelect option:selected").val();
		    	var materialId = $(".select2 option:selected").val();
		    	$.ajax({
		    		url:'getQuantitymaterialHouseMaterial?wareId='+ wareId +'&materialId='+materialId,
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