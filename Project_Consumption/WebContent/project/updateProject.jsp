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
.slider{display: inline-block;}
</style>
  </head>  
  <body>
		<div id="container" class="easyui-layout" style="width:1024px;height:800px;padding:1px;margin-left:auto; margin-right:auto;">
		
				<div id="mainbody" style="height:90%">
				  <center>
				    <h1 style="color:skyblue;">修改工程记录</h1>
				    <div style="padding:3px;color:red;">
				      ${msg}
				    </div>
				    <form action="updateproject" method="post">
				      <input id="proId" type="hidden" name="project.proId" value="${project.proId}"/>
				       <div style="padding:3px;">
				        <label for="proNo">项目编号：</label>
				        <input id="proNo" type="text" name="project.proNo" value="${project.proNo}" class="easyui-validatebox textbox" data-options="required:true,validType:'length[2,10]'"/>
				      </div>
				      <div style="padding:3px;">
				        <label for="proName">项目名称：</label>
				        <input id="proName" type="text" name="project.proName" value="${project.proName}" class="easyui-validatebox textbox" data-options="required:true"/>
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
				        <input class="easyui-slider" id="percent" name="project.percent" style="width:300px" data-options="showTip:true,rule: [0,'|',25,'|',50,'|',75,'|',100]">
				      </div>
				       <div style="padding:3px;">
				        <label for="startDate">计划开始时间：</label>
				        <input id="startTime" type="date" name="project.startDate" value="${project.startDate}" class="easyui-validatebox textbox" data-options="required:true"/>
				      </div>
				      <div style="padding:3px;">
				        <label for="endDate">计划结束时间：</label>
				        <input id="endTime" type="date" name="project.endDate" value="${project.endDate}" class="easyui-validatebox textbox" data-options="required:true"/>
				      </div>
				      <div style="padding:3px;">
				        <label for="text">大致描述：</label>
				        <input id="text" type="text" name="project.text" value="${project.text}" class="easyui-validatebox textbox" data-options="required:true"/>
				      </div>
				      <div style="padding:3px;">
				        <label for="remark">类型：</label>
				        <select id="remark" name="project.remark" class="easyui-validatebox textbox" style="width:280px;">
				          <option value="设计">设计</option>		            
				          <option value="承包">承包</option>				          
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
  </body>
</html>