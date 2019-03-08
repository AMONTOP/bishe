<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>个人消费记录系统</title>
  </head>  
  <body> 
		
			<div data-options="region:'west',split:true" title="系统菜单" style="width:165px;">
				<%@ include file="top.jsp" %>
			</div>
			<div data-options="region:'center',title:'欢迎使用',iconCls:'icon-ok'" style="height:100%;">
				<div id="mainbody" style="height:90%">
				  <%@ include file="content.jsp" %>
				</div>
				<div id="tailbody" style="height:3%">
				  <%@ include file="footer.jsp" %>
				</div>	
			</div>
	
  </body>
</html>