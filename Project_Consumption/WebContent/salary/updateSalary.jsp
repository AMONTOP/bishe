<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
				    <h1 style="color:skyblue;">修改账户信息</h1>
				    <div style="padding:3px;color:red;">
				      ${msg}
				    </div>
				    <form action="updateaccountInfo" method="post">
				      <input id="accountInfoId" type="hidden" name="accountInfo.accountInfoId" value="${accountInfo.accountInfoId}"/>
				      <div style="padding:3px;">
				        <label for="accountInfo.infoName">账户名称：</label>
				        <input id="accountInfo.infoName" type="text" name="accountInfo.infoName" value="${accountInfo.infoName}" class="easyui-validatebox textbox" data-options="required:true,validType:'length[2,10]'"/>
				      </div>
				      <div style="padding:3px;">
				        <label for="accountInfo.infoNo">账号：</label>
				        <input id="accountInfo.infoNo" type="text" name="accountInfo.infoNo" value="${accountInfo.infoNo}" class="easyui-validatebox textbox" data-options="required:true"/>
				      </div>
				      <div style="padding:3px;">
				        <label for="accountInfo.infoBank">开户银行：</label>
				        <input id="accountInfo.infoBank" type="text" name="accountInfo.infoBank" value="${accountInfo.infoBank}" class="easyui-validatebox textbox" data-options="required:true"/>
				      </div>
				      <div style="padding:3px;">
				        <label for="accountInfo.infoAddress">开户市区：</label>
				        <input id="accountInfo.infoAddress" type="text" name="accountInfo.infoAddress" value="${accountInfo.infoAddress}" class="easyui-validatebox textbox" data-options="required:true"/>
				      </div>
				      <div style="padding:3px;">
				        <label for="accountInfo.accountStatus">审核状态：</label>
				        <select name="accountInfo.accountStatus" class="easyui-validatebox textbox" style="width:280px;">
				        	<option value="未审核">未审核</option>
				        	<option value="已审核">已审核</option>
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