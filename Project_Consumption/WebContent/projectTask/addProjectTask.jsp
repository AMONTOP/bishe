<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
        String path = request.getContextPath(); 
        String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
        String name = request.getParameter("proId");//用request得到 
        request.setAttribute("proId", name);
%> 
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
				    <h1 style="color:skyblue;">添加工程详情</h1>
				    <div style="padding:3px;color:red;">
				      ${msg}
				    </div>
				    <form action="saveprojectTask?proId=${proId }" method="post">
				      <input type="hidden" id="proId" name="projectTask.project.proId" value=""/>
				      <div style="padding:3px;">
				        <label for="taskName">任务名称：</label>
				        <%-- <input id="taskName" type="text" name="projectTask.taskName" value="${projectTask.taskName}" class="easyui-validatebox textbox" data-options="required:true,validType:'length[2,10]'"/> --%>
				        <select class="easyui-validatebox textbox myselect" name="projectTask.taskName">
				        	<option value="准备分工">准备分工</option>
				        	<option value="领料">领料</option>
				        	<option value="制作中">制作中</option>
				        	<option value="退料">退料</option>
				        	<option value="货品入库">货品入库</option>
				        	<option value="货品出库发货">货品出库发货</option>
				        </select>
				      </div>
				      <div style="padding:3px;">
				        <label for="employee">执行人员：</label>				      
				        <select id="empId" name="projectTask.employee.empId" class="easyui-validatebox textbox" style="width:280px;">
				          <option value="0">---请选择领货人---</option>
				          <c:forEach items="${listEmployees}" var="employee">				            
				                <option value="${employee.empId}">${employee.name}</option>				          
				          </c:forEach>
				        </select>
				      </div>
				      <div style="padding:3px;">
				        <label for="text">任务描述：</label>
				        <input id="text" type="text" name="projectTask.text" value="${projectTask.text}" class="easyui-validatebox textbox" data-options="required:true"/>
				      </div>
				      <div style="padding:3px;">
				        <label for="text">任务进度(%)：</label>
				        <input id="text" type="text" name="projectTask.project.percent" value="10" class="easyui-validatebox textbox per" readonly/>
				      </div>
				      <div style="padding:3px;">
				        <label for="startDate">开始时间：</label>
				        <input id="startDate" type="date" name="projectTask.startDate" value="${projectTask.startDate}" class="easyui-validatebox textbox" data-options="required:true"/>
				      </div>
				      <div style="padding:3px;">
				        <label for="endDate">结束时间：</label>
				        <input id="endDate" type="date" name="projectTask.endDate" value="${projectTask.endDate}" class="easyui-validatebox textbox" data-options="required:true"/>
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
			$(".myselect").change(function () {
		        var myselect =  $(".myselect option:selected").val();
		        if(myselect == "准备分工"){
		            $(".per").val("10");
		        }else if(myselect == "领料"){
		            $(".per").val("25");
		        }else if(myselect == "制作中"){
		            $(".per").val("50");
		        }else if(myselect == "退料"){
		            $(".per").val("60");
		        }else if(myselect == "制作完毕"){
		            $(".per").val("90");
		        }else if(myselect == "发货"){
		            $(".per").val("100");
		        }
	    	});
	    	$("#proId").attr({"value": proId});
			$("form").attr({"action":"saveprojectTask?proId="+proId});
    </script>
  </body>
</html>