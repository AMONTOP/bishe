<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>消息</title>
	<link rel="stylesheet" type="text/css" href="/Project_Consumption/css/easyui/easyui.css" />
	<link rel="stylesheet" type="text/css" href="/Project_Consumption/css/easyui/icon.css" />
 	<link rel="stylesheet" type="text/css" href="/Project_Consumption/css/base.css" />
 	<script type="text/javascript" src="/Project_Consumption/js/easyui/jquery-1.11.2.js"></script>
	<script type="text/javascript" src="/Project_Consumption/js/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="/Project_Consumption/js/easyui/easyui-lang-zh_CN.js"></script>
  </head>  
  <body>  
		<div id="container" class="easyui-layout" style="width:1024px;height:680px;padding:1px;margin-left:auto; margin-right:auto;">
			<div id="logo" data-options="region:'north'" style="width:1024px;height:168px">
			</div>
			<div data-options="region:'west',split:true" title="系统菜单" style="width:165px;">
				<%@ include file="menu.jsp" %>
			</div>
			<div data-options="region:'center',title:'欢迎使用',iconCls:'icon-ok'" style="height:100%;">
				<div id="mainbody">
				  <center>
				    <h1 style="color:skyblue;">分类列表</h1>
				    <table border="0" class="gridtable">
				      <tr>
				        <th width="50" height="20">序号：</th>
				        <th width="50" height="20">分类名称：</th>
				        <th width="80" height="20">操作：</th>
				      </tr>
				      
				      <c:forEach items="${types}" var="type">
				        <tr>
				          <td width="50" height="20">${type.type_id}</td>
				          <td width="50" height="20">${type.type_name}</td>
				          <td width="50" height="20">
				            <a href="type-updatePre?type_id=${type.type_id}">修改</a>
				            <a href="type-delete?type_id=${type.type_id}">删除</a>
				          </td>
				        </tr>
				      </c:forEach>
				    </table>
				  </center>
				</div>	
			</div>
		</div>
  </body>
</html>