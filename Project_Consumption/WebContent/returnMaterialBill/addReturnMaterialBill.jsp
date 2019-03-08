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
		return "RMB" + hour.toString() + minutes.toString() + seconds.toString() + (Math.round(Math.random() * 4)).toString();
	};
	window.onload = function(){
    	document.getElementById("billNo").value = randomNumber();
	};
</script>
<style>
	.normTbe{border-left:1px solid #ddd;border-top:1px solid #ddd;margin: 0 auto; }
    .normTbe td,.normTbe th{border-bottom: 1px solid #ddd;border-right:1px solid #ddd;padding: 15px;text-align: center;}
    .normTbe input{width: 80%;text-align: center;}
    .wrapper{width: 1140px;padding: 0 20px; margin: 0 auto;clear: both;}
    .hide{display: none;}
        .hideTr{background: #ddd;}
        .pop_box{position: fixed;top: 0;left: 0;right: 0;bottom: 0;z-index: 99999;}
        .pop_box .bg{background: #000;opacity: 0.7;filter:alpha(opacity=70);position: absolute;top:0;left: 0;right: 0;bottom: 0;}
        .pop_box .contentP{position: relative;margin:0 auto;margin-top: 10%; background: #fff;width: 80%;}
        .pop_box .PTit{height: 45px;background: #eee;}
        .pop_box .PTit h3{line-height: 7px;float: left;padding-left: 15px;font-weight: normal;font-size: 16px;}
        .pop_box .PTit a{display: block;width: 45px;line-height: 45px;text-align: center;background: #ddd;float: right;font-size: 20px;}
        .pop_box .PTit a:hover{background: #50abfd;color: #fff;}
        .pop_box .textmian{padding: 15px;}
        .btn_a1{padding-top: 15px; text-align: center;}
        .btn_a1 a{display: inline-block;*display: inline;*zoom: 1;width: 120px;line-height: 45px;background: #50abfd;color: #fff;}
        .btn_a1 .addtr2,.btn_a1 .dtadd{background: #ff9900;}
        form{    margin-bottom: 10px;}
</style>
  </head>  
  <body>
		<div id="container" class="easyui-layout" style="width:1024px;height:800px;padding:1px;margin-left:auto; margin-right:auto;">
			<div id="mainbody" style="height:90%">
				  <center>
				    <h1 style="color:skyblue;">添加退料单</h1>
				    <div style="padding:3px;color:red;">
				      ${msg}
				    </div>
				    <form action="savereturnMaterialBill" id="myform" method="post"  onsubmit="return submitForm()">
				      <div style="padding:3px;">
				        <label for="billNo">退料单号：</label>
				        <input id="billNo" type="text" name="returnMaterialBill.billNo" value="${returnMaterialBill.billNo}" class="easyui-validatebox textbox" readonly/>
				      </div>
				      <div style="padding:3px;">
				        <label for="toPrincipal">退料人：</label>		
				        <select id="empId" name="returnMaterialBill.employee.empId" class="easyui-validatebox textbox" style="width:280px;">
				          <option value="0">---请选择销售员---</option>
				          <c:forEach items="${listEmployee}" var="employee">				            
				                <option value="${employee.empId}" name="returnMaterialBill.employee.empId">${employee.name}</option>				          
				          </c:forEach>
				        </select>
				      </div>
				      <div style="padding:3px;">
				        <label for="warehousePrincipal">仓库：</label>				     
				        <select id="empId" name="returnMaterialBill.mwareHouse.wareId" class="easyui-validatebox textbox" style="width:280px;">
				          <option value="0">---请选择仓库---</option>
				          <c:forEach items="${listWareHouse}" var="mwareHouse">				            
				                <option value="${mwareHouse.wareId}" name="returnMaterialBill.mwareHouse.wareId">${mwareHouse.wareNo}</option>				          
				          </c:forEach>
				        </select>
				      </div>
				      <div style="padding:3px;">
				        <label for="drawReason">相关订单：</label>
				        <select id="relateOrder" name="returnMaterialBill.orderBill.billId" class="easyui-validatebox textbox" style="width:280px;">
				          <option value="0">---请选择相关订单---</option>
				          <c:forEach items="${listOrderBill}" var="orderBill">				            
				                <option value="${orderBill.billId}">${orderBill.billNo}</option>				          
				          </c:forEach>
				        </select>				        		     
				      </div>				 
				   
				      <div style="padding:3px;">
				        <label for="returnReason">退料原因：</label>
				        <select id="returnReason" name="returnMaterialBill.returnReason" class="easyui-validatebox textbox" style="width:280px;">	
				          <option value="1" name="returnMaterialBill.returnReason">生产计划变更</option>	
				          <option value="2" name="returnMaterialBill.returnReason">物料计划</option>						         
				         </select>					     
				      </div>
				      <div style="padding:3px;">
				        <label for="billState">退料单状态：</label>				
				        <select id="billState" name="returnMaterialBill.billState" class="easyui-validatebox textbox" style="width:280px;">	
				          <option value="1">待审核</option>					         					      
				         </select>	
				      </div>
				      
				      <div class="auditAtInput" style="padding:3px;display:none">
				        <label for="auditAt">审核时间：</label>
				        <input id="aDate" type="date" name="returnMaterialBill.auditAt" value="${returnMaterialBill.auditAt}" class="easyui-validatebox textbox"/>
				      </div>
				   	 <div style="padding:3px;">
				        <label for="billTime">创建时间：</label>
				        <input id="billTime" type="text" name="returnMaterialBill.billTime" value="${returnMaterialBill.billTime}" class="easyui-validatebox textbox" readonly/>
				      </div>
				      
				      <div style="padding:3px;">
				        <input type="reset" value="重置"/>
				        &nbsp;&nbsp;&nbsp;
				        <input type="submit" id="myBtn" value="录入"/>
				      </div>
				    </form>
				    
				    <input type="button" id="alertBtn" value="新增物料" />
				     <!-- 弹出框 -->
				   <div class="pop_box hide">
                    <div class="bg"></div>
                    <div class="contentP">
                        <div class="PTit">
                            <h3>新增物料退料信息</h3>
                            <a href="javascript:;" class="closepop">x</a>
                        </div>
                        <div class="textmian">                        	
                       		<form action="savereturnMaterialBillMaterial" id="" method="post">	
                       			<!-- for循环，循环出所有所用物料-->
                       			<%-- <c:forEach>
                       			
                       			</c:forEach> --%>	
                       			<div class="alertMain">
                       			
                       			</div>    				   							   						     						      				    
							      <div style="padding:3px;text-align:center">				     
							        
							      </div>
				    		</form>                          
                        </div>
                    </div>
       				</div>
				     <!--  弹出框 -->
				  </center>
				</div>
				<div id="tailbody" style="height:3%">
				  <%@ include file="../tail.jsp" %>
				</div>
			</div>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.form/4.2.1/jquery.form.min.js"></script>
			<script>
           
			$("#alertBtn").click(function(){
			$('.pop_box').slideDown('400');
				$.ajax({
				//获取orderBillProduct的product
					url:'optionPrereturnMaterialBill?billId='+$("#relateOrder option:selected").val(),
					dataType:'json',
					asycn:false,
					success:function(data){
						var jsondata = $.parseJSON(data);
						console.log(jsondata);
						var productArr = [];
						var materialArr = [];
						var materialNameArr = [];
						for(var i=0;i<jsondata.length;i++){
							var productId = jsondata[i].product.productId;
							productArr.push(productId);
						}
						console.log(productArr);
						for(var m=0;m<productArr.length;m++){
							$.ajax({
								url:'getMaterialproductMaterial?productId='+productArr[m],
								asycn:false,
								dataType:'json',
								success:function(data2){
									var jsondata2 = $.parseJSON(data2);
									console.log(jsondata2);
									for(var n=0;n<jsondata2.length;n++){
										var materialId = jsondata2[n].material.materialId;
										materialArr.push(materialId);
										var materialName = jsondata2[n].material.materialName;
										materialNameArr.push(materialName);
										
									}
								}
							})
													
						}		
						var str = '';
						var obj2={};
						setTimeout(function(){
							obj2.materialId = materialArr;
							obj2.materialName = materialNameArr;
							console.log(obj2.materialId.length);
					
							for(var q=0;q<obj2.materialId.length;q++){
								str+="<form action='savereturnMaterialBillMaterial' id='aform"+q+"' method='post'>";
								str+="<span>"+obj2.materialName[q]+"——</span>";
								str+="<input type='hidden' name='returnMaterialBillMaterial.material.materialId' class='material"+q+"' value='"+obj2.materialId[q]+"'>";
								str+="数量：<input type='text' name='returnMaterialBillMaterial.quantity' class='quantity"+q+"'>";
								/* str+="<input type='hidden' name='returnMaterialBillMaterial.returnMaterialBill.mwareHouse.wareId' value='3' />"; */
								str+="<input type='button' style='width: 88px;height: 29px;background: #50abfd;border: none;color: white;font-size: 15px;margin-left: 11px;' id='saveR"+q+"' value='保存'/>";
								str+="</form>";							
							} 
							$(".alertMain").append(str);
							
							for(var q1=0;q1<obj2.materialId.length;q1++){
								(function(q1){
									$("#saveR"+q1).click(									
											function(){
												console.log(".material"+q1);
												console.log($(".material"+q1).val());
													$.ajax({
													url:'savereturnMaterialBillMaterial',
													type:'post',
													asycn:false,
													data:{'returnMaterialBillMaterial.returnMaterialBill.returnbillId':returnbill[0],'returnMaterialBillMaterial.material.materialId':$(".material"+q1).val(),'returnMaterialBillMaterial.quantity':$(".quantity"+q1).val()}, 
													success:function(d2){
													console.log(d2);
												}
											});	
											$("#saveR"+q1).css({"background-color":"gray","color":"white","pointer-events": "none"});		
										}										
									);
								})(q1);
							}
						
						},1000);
		
					}
				})
				
			})
			
			$('.closepop').click(function () {
                $('.pop_box').slideUp('400');            
            });
            var returnbill = [];
			function submitForm(){
				$("#myform").ajaxSubmit(function(message){
					console.log("aaa");
					$.ajax({
					url:"getRMIdreturnMaterialBill?billNo='"+ $("#billNo").val() +"'",
					dataType:'json',
					success:function(d4){
						var jsondata3 = $.parseJSON(d4);
						console.log(jsondata3);
						returnbill.push(jsondata3[0].returnbillId);
					}
					});
				});
					
				return false;
			}		
			
				//billTimeDate
        var mydateInput2 = document.getElementById("billTime");
        var date2 = new Date();
        var dateString2 = date2.getFullYear() + "-" + (date2.getMonth() + 1) + "-" + date2.getDate();
        mydateInput2.value = dateString2;
			</script>
  </body>
</html>