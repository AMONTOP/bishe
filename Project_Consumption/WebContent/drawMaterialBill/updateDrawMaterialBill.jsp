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

  </head>  
  <body>
		<div id="container" class="easyui-layout" style="width:1024px;height:800px;padding:1px;margin-left:auto; margin-right:auto;">
			<div id="mainbody" style="height:90%">
				  <center>
				    <h1 style="color:skyblue;">修改领料单</h1>
				    <div style="padding:3px;color:red;">
				      ${msg}
				    </div>
				    <form action="updatedrawMaterialBill" method="post">
				      <input type="hidden" name="drawMaterialBill.drawbillId" value="${drawMaterialBill.drawbillId}"/>
				      <div style="padding:3px;">
				        <label for="billNo">领料单号：</label>
				        <input id="billNo" type="text" name="drawMaterialBill.billNo" value="${drawMaterialBill.billNo}" class="easyui-validatebox textbox" readonly/>
				      </div>
				      <div style="padding:3px;">
				        <label for="toPrincipal">领料人：</label>		
				        <select id="empId" name="drawMaterialBill.employee.empId" class="easyui-validatebox textbox" style="width:280px;">
				          <option value="0">---请选择销售员---</option>
				          <c:forEach items="${listEmployee}" var="employee">				            
				                <option value="${employee.empId}" name="drawMaterialBill.employee.empId">${employee.name}</option>				          
				          </c:forEach>
				        </select>
				      </div>
				      <div style="padding:3px;">
				        <label for="warehousePrincipal">仓库：</label>				     
				        <select id="empId" name="drawMaterialBill.wareHouse.wareId" class="easyui-validatebox textbox" style="width:280px;">
				          <option value="0">---请选择仓库---</option>
				          <c:forEach items="${listWareHouse}" var="wareHouse">				            
				                <option value="${wareHouse.wareId}" name="drawMaterialBill.wareHouse.wareId">${wareHouse.wareNo}</option>				          
				          </c:forEach>
				        </select>
				      </div>
				      <div style="padding:3px;">
				        <label for="drawReason">领料原因：</label>
				        <select id="drawReason" name="drawMaterialBill.drawReason" class="easyui-validatebox textbox" style="width:280px;">	
				          <option value="1" name="drawMaterialBill.drawReason">生产计划变更</option>	
				          <option value="2" name="drawMaterialBill.drawReason">物料计划</option>						         
				         </select>					     
				      </div>
				      <div style="padding:3px;">
				        <label for="billState">领料单状态：</label>				
				        <select id="billState" name="drawMaterialBill.billState" class="easyui-validatebox textbox" style="width:280px;">	
				          <option value="1">待审核</option>	
				          <option value="2">已审核</option>						         
				         </select>	
				      </div>
				      
				      <div class="auditAtInput" style="padding:3px;display:none">
				        <label for="auditAt">审核时间：</label>
				        <input id="aDate" type="date" name="drawMaterialBill.auditAt" value="${drawMaterialBill.auditAt}" class="easyui-validatebox textbox"/>
				      </div>
				   	 <div style="padding:3px;">
				        <label for="billTime">创建时间：</label>
				        <input id="billTime" type="text" name="drawMaterialBill.billTime" value="${drawMaterialBill.billTime}" class="easyui-validatebox textbox" readonly/>
				      </div>
				      
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
			<script>
			
			$("select#billState").click(function(){
				console.log($("#billState option:selected").val());
				if($("#billState option:selected").val() == 2){
					console.log("aaaa");
					$(".auditAtInput").css("display","block");
					/* var mydateInput = document.getElementById("aDate");
			        var date = new Date();
			        var dateString = date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate();
			        mydateInput.value = dateString; */
				}else if($("#billState option:selected").val() == 1){
					console.log("bbbb");
					$(".auditAtInput").css("display","none");
					$("#aDate").attr({"value":null});
				}
			});
			
				//billTimeDate
        var mydateInput2 = document.getElementById("billTime");
        var date2 = new Date();
        var dateString2 = date2.getFullYear() + "-" + (date2.getMonth() + 1) + "-" + date2.getDate();
        mydateInput2.value = dateString2;
			</script>
  </body>
</html>