<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>个人消费记录系统</title>
<link rel="stylesheet" type="text/css" href="/Project_Consumption/css/easyui/easyui.css" />
<link rel="stylesheet" type="text/css" href="/Project_Consumption/css/easyui/icon.css" />
<link rel="stylesheet" type="text/css" href="/Project_Consumption/css/base.css" />
<script type="text/javascript" src="/Project_Consumption/js/easyui/jquery-1.11.2.js"></script>
<script type="text/javascript" src="/Project_Consumption/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="/Project_Consumption/js/easyui/easyui-lang-zh_CN.js"></script>
  </head>  
  <body>
		<div id="container" class="easyui-layout" style="width:1024px;height:800px;padding:1px;margin-left:auto; margin-right:auto;">
			<div id="logo" data-options="region:'north'" style="width:1024px;height:168px">
			</div>
			<div data-options="region:'west',split:true" title="系统菜单" style="width:165px;">
				<%@ include file="../menu.jsp" %>
			</div>
			<div data-options="region:'center',title:'欢迎使用',iconCls:'icon-ok'" style="height:100%;">
				<div id="mainbody" style="height:90%">
				  <center>
				    <h1 style="color:skyblue;">客户资料列表</h1>
				    <form action="findbyNameclient" method="post">
				    	 <input type="text" name="client.clientName" />
				    	 <input type="submit" value="搜索"/>
				    </form>
				    <form action="showclient" method="post">
				    	<input type="submit" value="返回全部"/>
				    </form>
				   
				    <table border="0" class="gridtable">
				      <tr>
				        <th width="50" height="20">序号：</th>
				        <th width="50" height="20">客户名称：</th>
				        <th width="80" height="20">联系人：</th>
				        <th width="80" height="20">联系电话：</th>
				        <th width="80" height="20">创建日期：</th>
				        <th width="80" height="20">创建人：</th>
				        <th width="80" height="20">操作：</th>
				      </tr>
				      
				      
				   	<c:forEach items="${list}" var="client">
				        <tr>
				          <td width="50" height="20">${client.clientId}</td>
				          <td width="50" height="20">${client.clientName}</td>
				          <td width="50" height="20">${client.contact}</td>
				          <td width="50" height="20">${client.contactPhone}</td>
				          <!-- <td width="50" height="20">${client.createAt}</td>  -->
				          <%-- <td width="50" height="20">${consume.consume_date}</td> --%>
				          <td width="50" height="20"><fmt:formatDate value="${client.createAt}"/></td>
				          <td width="50" height="20">${client.createBy}</td>			
				          <td width="50" height="20">
				            <a href="prepupclient?clientId=${client.clientId}">修改</a>
				            <a href="deleteclient?clientId=${client.clientId}">删除</a>
				          </td>
				        </tr>
				      </c:forEach>
				    </table>
				    <br><br><br>
                  
				</div>
				<div id="tailbody" style="height:3%">
				  <%@ include file="../tail.jsp" %>
				</div>
			</div>
		</div>
  </body>
</html>