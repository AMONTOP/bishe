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
<script>
	function randomNumber(){
		var now = new Date();
		var hour = now.getHours();
		var minutes = now.getMinutes();
		var seconds = now.getSeconds();
		console.log(hour);
		return "DMB" + hour.toString() + minutes.toString() + seconds.toString() + (Math.round(Math.random() * 4)).toString();
	};
	window.onload = function(){
    	/* document.getElementById("billNo").value = randomNumber(); */
    	$("#billNo").attr("value",randomNumber());
	};
</script>
  </head>  
  <body>
		<div id="container" class="easyui-layout" style="width:1024px;height:800px;padding:1px;margin-left:auto; margin-right:auto;">
			<div id="mainbody" style="height:90%">
				  <center>
				    <h1 style="color:skyblue;">添加领料单</h1>
				    <div style="padding:3px;color:red;">
				      ${msg}
				    </div>
				    <form action="savedrawMaterialBill" method="post" id="myform">				 
				      <div style="padding:3px;">
				        <label for="billNo">领料单号：</label>
				        <input id="billNo" type="text" name="drawMaterialBill.billNo" value="" class="easyui-validatebox textbox" readonly/>
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
				        <select id="empId" name="drawMaterialBill.mwareHouse.wareId" class="easyui-validatebox textbox" style="width:280px;">
				          <option value="0">---请选择仓库---</option>
				          <c:forEach items="${listWareHouse}" var="wareHouse">				            
				                <option value="${wareHouse.wareId}" name="drawMaterialBill.mwareHouse.wareId">${wareHouse.wareNo}</option>				          
				          </c:forEach>
				        </select>
				      </div>
				      <div style="padding:3px;">
				        <label for="drawReason">领料原因：</label>
				        <select id="drawReason" name="drawMaterialBill.drawReason" class="easyui-validatebox textbox" style="width:280px;">	
				          <option value="1" name="drawMaterialBill.drawReason">生产领料</option>					         					         
				         </select>					     
				      </div>
				      <div style="padding:3px;">
				        <label for="drawReason">相关订单：</label>
				        <select id="relateOrder" name="drawMaterialBill.orderBill.billId" class="easyui-validatebox textbox" style="width:280px;">
				          <option value="0">---请选择相关订单---</option>
				          <c:forEach items="${listOrderBill}" var="orderBill">				            
				                <option value="${orderBill.billId}">${orderBill.billNo}</option>				          
				          </c:forEach>
				        </select>				        		     
				      </div>
				      <div style="padding:3px;">
				        <label for="billState">领料单状态：</label>				
				        <select id="billState" name="drawMaterialBill.billState" class="easyui-validatebox textbox" style="width:280px;">	
				          <option value="1">待审核</option>				         
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
				        <input type="button" id="myBtn" value="录入"/>
				      </div>
				    </form>
				  </center>
				</div>
				<div id="tailbody" style="height:3%">
				  <%@ include file="../tail.jsp" %>
				</div>
			</div>
			<script>
			var productArr = [];
			$("select#relateOrder").change(function(){
				console.log(randomNumber());
				 $.ajax({
				 //+$("#relateOrder option:selected").val()
				 	//获取选择框中的drawMaterialBill数据
					url:"optionPredrawMaterialBill?billId="+$("#relateOrder option:selected").val(),
					dataType:'json',
					success:function(data){
						var jsondata = $.parseJSON(data);
						console.log(jsondata);
						var length = jsondata.length;	
						console.log(length);
						for(var n3=0;n3<length;n3++){
							productArr.push(jsondata[n3].product.productId);
						}
						for(var m2=0;m2<productArr.length;m2++){
						$.ajax({
								url:"getMaterialproductMaterial?productId="+ productArr[m2],
								dataType:'json',
								success:function(d){
									var jsondata2 = $.parseJSON(d);		
									var formdata = $("#myform").serialize();
									console.log(d);					
									$("#myBtn").click(function(){
										console.log("click");										
										$.ajax({
											url:'savedrawMaterialBill',
											type:'post',
											data:formdata,
											dataType:'json',
											success:function(data1){												
												$.ajax({
													url:"getDMIddrawMaterialBill?billNo='"+ $("#billNo").val() +"'",
													dataType:'json',
													success:function(data){
														var jsondata3 = $.parseJSON(data);
														
														for(var m=0;m<jsondata2.length;m++){
															//插入数据到drawMaterialBillMaterial											
															$.ajax({
																url:'savedrawMaterialBillMaterial',
																type:'post',
																data:{"drawMaterialBillMaterial.drawMaterialBill.drawbillId":jsondata3[0].drawbillId,"drawMaterialBillMaterial.material.materialId":jsondata2[m].material.materialId,"drawMaterialBillMaterial.quantity":jsondata2[m].quantity},
																success:function(){
																	window.location=" <%=request.getContextPath()%>/showdrawMaterialBill> ";
																}
															});
														}
													}
											});
											}									
										});								
									});
																	
								}					
							});	
						
						}	
										
					}
				});
				
			});
		var mydateInput2 = document.getElementById("billTime");
        var date2 = new Date();
        var dateString2 = date2.getFullYear() + "-" + (date2.getMonth() + 1) + "-" + date2.getDate();
        mydateInput2.value = dateString2;
				
			</script>
  </body>
</html>