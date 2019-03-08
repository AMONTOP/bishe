<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>添加消费记录</title>
<link rel="stylesheet" type="text/css" href="/Project_Consumption/css/easyui/easyui.css" />
<link rel="stylesheet" type="text/css" href="/Project_Consumption/css/easyui/icon.css" />
<link rel="stylesheet" type="text/css" href="/Project_Consumption/css/base.css" />
<link type="text/css" href="/Project_Consumption/css/jquery-ui-1.8.17.custom.css" rel="stylesheet" />
<link type="text/css" href="/Project_Consumption/css/jquery-ui-timepicker-addon.css" rel="stylesheet" />

<script type="text/javascript" src="/Project_Consumption/js/easyui/jquery-1.11.2.js"></script>
<script type="text/javascript" src="/Project_Consumption/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="/Project_Consumption/js/easyui/easyui-lang-zh_CN.js"></script>

<script type="text/javascript" src="/Project_Consumption/js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="/Project_Consumption/js/jquery-ui-1.8.17.custom.min.js"></script>
<script type="text/javascript" src="/Project_Consumption/js/jquery-ui-timepicker-addon.js"></script>
<script type="text/javascript" src="/Project_Consumption/js/jquery-ui-timepicker-zh-CN.js"></script>
<script>
	function randomNumber(){
		var now = new Date();
		var hour = now.getHours();
		var minutes = now.getMinutes();
		var seconds = now.getSeconds();
		console.log(hour);
		return "PP"+hour.toString() + minutes.toString() + seconds.toString() + (Math.round(Math.random() * 4)).toString();
	};
	window.onload = function(){
    	document.getElementById("proNo").value = randomNumber();
	}; 
</script>
<style>
.slider{    display: inline-block;     }
</style>
  </head>  
  <body>
		<div id="container" class="easyui-layout" style="width:1024px;height:800px;padding:1px;margin-left:auto; margin-right:auto;">
				<div id="mainbody" style="height:90%">
				  <center>
				    <h1 style="color:skyblue;">添加工程资料</h1>
				    <div style="padding:3px;color:red;">
				      ${msg}
				    </div>
				    <form action="saveproject" method="post">
				      <div style="padding:3px;">
				        <label for="proNo">项目编号：</label>
				        <input id="proNo" type="text" name="project.proNo"   class="easyui-validatebox textbox" readonly/>
				      </div>
				      <div style="padding:3px;">
				        <label for="order">相关订单：</label>
				        <select id="relateOrder" name="project.orderBill.billId" class="easyui-validatebox textbox" style="width:280px;">
				          <option value="0">---请选择相关订单---</option>
				          <c:forEach items="${listOrderBills}" var="orderBill">				            
				                <option value="${orderBill.billId}">${orderBill.billNo}</option>				          
				          </c:forEach>
				        </select>				        		     
				      </div>
				      <div style="padding:3px;">
				        <label for="proName">项目名称：</label>
				        <input id="proName" type="text" name="project.proName"  class="easyui-validatebox textbox" />
				      </div>				      
				      <div style="padding:3px;">
				        <label for="chargeMan">负责人：</label>
				        <select id="empId" name="project.employee.empId" class="easyui-validatebox textbox" style="width:280px;">
				          <option value="0">---请选择负责人---</option>
				          <c:forEach items="${listNames}" var="employeeName">				            
				                <option value="${employeeName.empId}" name="project.employee.empId">${employeeName.name}</option>				          
				          </c:forEach>
				        </select>
				      </div> 
				      <div style="padding:3px;">
				        <label for="percent">进度：</label>
				       <!--  <input id="percent" type="text" name="project.percent"  class="easyui-validatebox textbox" data-options="required:true"/> -->
				        <input class="easyui-slider" id="percent" name="project.percent" style="width:300px" data-options="showTip:true,rule: [0,'|',25,'|',50,'|',75,'|',100]">
				      </div>
				       <div style="padding:3px;">
				        <label for="startDate">计划开始时间：</label>
				        <input id="startTime" type="text" name="project.startDate"  class="easyui-validatebox textbox" data-options="required:true"/>
				      </div>
				      <div style="padding:3px;">
				        <label for="endDate">计划结束时间：</label>
				        <input id="endTime" type="text" name="project.endDate" class="easyui-validatebox textbox" data-options="required:true"/>
				      </div>
				      <div style="padding:3px;">
				        <label for="text">大致描述：</label>
				        <input id="text" type="text" name="project.text" class="easyui-validatebox textbox" data-options="required:true"/>
				      </div>
				      <div style="padding:3px;">
				        <label for="remark">类型：</label>
				        <select id="remark" name="project.remark" class="easyui-validatebox textbox" style="width:280px;">				       	           
				          <option value="承包">承包</option>			
				          <option value="设计">设计</option>		          
				        </select>
				      </div>
			
				      
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
			
			<script>
		    $(function () {
		        $("#startTime").datetimepicker({
		                showSecond: true,
		                timeFormat: '',
		                stepHour: 1,
		                stepMinute: 1,
		                /* stepSecond: 1 */
		                onSelect : function(selectedDate) {
		                    $("#endTime").datepicker("option", "minDate", selectedDate);  }
		            }
		        );
		        $("#endTime").datetimepicker({
		                showSecond: true,
		                timeFormat: '',
		                stepHour: 1,
		                stepMinute: 1,
		               /*  stepSecond: 1 */
		                onSelect : function(selectedDate) {
		                    $("#startTime").datepicker("option", "maxDate", selectedDate);  }
		            }
		        );
		    });
		    $("#relateOrder").change(function(){
		    	/* console.log(a); */
		    	$("#proName").val($("#relateOrder option:selected").text()+"订单工程生产");
		    });
		</script>
  </body>
</html>