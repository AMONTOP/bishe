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

<!-- <script>
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
</script> -->
  </head>  
  <body>
		<div id="container" class="easyui-layout" style="width:1024px;height:800px;padding:1px;margin-left:auto; margin-right:auto;">
			<div id="mainbody" style="height:90%">
				  <center>
				    <h1 style="color:skyblue;">添加货品入库单货品</h1>
				    <div style="padding:3px;color:red;">
				      ${msg}
				    </div>
				    <form action="save2materialInstockBill" method="post">
				      <div style="padding:3px;">
				        <label for="billNo">货品入库单号：</label>
				        <%-- <input id="billNo" type="text" name="materialInstockBill.billNo" value="${materialInstockBill.billNo}" class="easyui-validatebox textbox" readonly/> --%>
				         <select id="empId" name="materialInstockBill.billNo" class="easyui-validatebox textbox" style="width:280px;">
				          <option value="0">---入库单---</option>
				          <c:forEach items="${listMaterialInstockBills}" var="billMaterial">				            
				                <option value="${billMaterial.billNo}" name="materialInstockBill.billNo">${billMaterial.billNo}</option>				          
				          </c:forEach>
				        </select>
				      </div>
				      <div style="padding:3px;">
				        <label for="materialInstockBillMaterial.quantity">数量：</label>
				        <input class="easyui-numberspinner" name="materialInstockBill.quantity" value="1000" data-options="min:10,increment:100" style="width: 256px;height: 30px;line-height: 30px;font-size: 15px;text-indent: 0.5em;"></input>
				      </div>
				      <div style="padding:3px;">
				        <label for="billNo">入库货品：</label>
				        <%-- <input id="billNo" type="text" name="materialInstockBill.billNo" value="${materialInstockBill.billNo}" class="easyui-validatebox textbox" readonly/> --%>
				         <select id="empId2" name="materialInstockBill.material.materialId" class="easyui-validatebox textbox" style="width:280px;">
				          <option value="0">---货品---</option>
				          <c:forEach items="${listMaterials}" var="material">				            
				                <option value="${material.materialId}" name="materialInstockBill.material.materialId">${material.materialName}</option>				          
				          </c:forEach>
				          
				         </select>
				      </div>
				      <%-- <div style="padding:3px;">
				        <label for="employee">领货人：</label>
				        <select id="empId" name="materialInstockBill.employee.empId" class="easyui-validatebox textbox" style="width:280px;">
				          <option value="0">---请选择领货人---</option>
				          <c:forEach items="${listEmployees}" var="employee">				            
				                <option value="${employee.empId}" name="materialInstockBill.employee.empId">${employee.name}</option>				          
				          </c:forEach>
				        </select>
				      </div> --%>
				      <%-- <div style="padding:3px;">
				        <label for="warehousePrincipal">仓库：</label>				      
				        <select id="empId" name="materialInstockBill.wareHouse.wareId" class="easyui-validatebox textbox" style="width:280px;">
				          <option value="0">---请选择仓库---</option>
				          <c:forEach items="${listWareHouses}" var="ware">				            
				                <option value="${ware.wareId}" name="materialInstockBill.wareHouse.wareId">${ware.wareNo}</option>				          
				          </c:forEach>
				        </select>
				      </div> --%>
				      <%-- <div style="padding:3px;">
				        <label for="materialSource">货品来源：</label>			      
				        <select id="empId" name="materialInstockBill.materialSource" class="easyui-validatebox textbox" style="width:280px;">
				          <option value="1">生产入库</option>				          	            
				          <option value="2">其他仓库入库</option>				          				        
				        </select>
				      </div>
				      <div style="padding:3px;">
				        <label for="billState">货品入库单状态：</label>
				    <input id="billState" type="text" name="materialInstockBill.billState" value="${materialInstockBill.billState}" class="easyui-validatebox textbox" data-options="required:true"/>
				        <select id="empId" name="materialInstockBill.billState" class="easyui-validatebox textbox" style="width:280px;">
				          <option value="1">待审核</option>				          	            
				          <option value="2">已审核</option>	
				          <option value="3">已完成</option>						          				        
				        </select>
				      </div>
				      <input type="hidden" name="materialInstockBill.billTime" id="aDate" />
				       --%>
				      <%-- 
				      <div style="padding:3px;">
				        <label for="auditAt">审核时间：</label>
				        <input id="auditAt" type="text" name="materialInstockBill.auditAt" value="${materialInstockBill.auditAt}" class="easyui-validatebox textbox" data-options="required:true"/>
				      </div>
				      <div style="padding:3px;">
				        <label for="auditBy">审核者：</label>
				        <input id="auditBy" type="text" name="materialInstockBill.auditBy" value="${materialInstockBill.auditBy}" class="easyui-validatebox textbox" data-options="required:true"/>
				      </div> 
				      --%>

				      
				      <div style="padding:3px;">
				        <input type="reset" value="重置"/>
				        &nbsp;&nbsp;&nbsp;
				        <input type="submit" value="录入"/>
				      </div>
				    </form>
				  </center>
				</div>
				<div id="tailbody" style="height:3%">
				  <%@ include file="../tail.jsp" %>
				</div>
			</div>
			
<!-- 	<script type="text/javascript">
        var mydateInput = document.getElementById("aDate");
        var date = new Date();
        var dateString = date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate();
        mydateInput.value = dateString;
    </script> -->
    <script>
   $("#empId").change(function () {
        var billNo = $("#empId option:selected").text();
        $("#empId2 option").remove();
        $.ajax({
    		url:"testmaterialInstockBill?billNo="+billNo,
    		type:"get",
    		dataType:'json',
    		success:function(data){
    			var jsondata = $.parseJSON(data);
    			for(var i=0;i<jsondata.length;i++) {
			        $("#empId2").append("<option name='materialInstockBill.material.materialId' value='"+ jsondata[i].materialId +"'>" + jsondata[i].materialName +"</option>");
			    }  	
    		}    		
    	});
    });
    	
    </script>

  </body>
</html>