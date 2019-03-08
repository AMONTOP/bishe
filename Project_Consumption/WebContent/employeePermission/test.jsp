<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'showEmployeePermission.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script src="resources/plugins/jquery.1.12.4.min.js"></script>
  </head>
  
  <body>
  	<table border="1px solid black">
  		<tr class="title">
  			<td>角色</td>
  			<td>可操作的模块</td>
  			<td>对应的子模块</td>
  			
  			
  			
  		</tr>
 
    	<c:forEach items="${list}" var="employeePermission" varStatus="status">
    	 	<tr class="main">
    			<td>${employeePermission.role.roleName}</td>
    			<td>${employeePermission.permission.module.moduleName}</td>
    			<td>${employeePermission.permission.module.subModuleName}</td>
    			
    		 </tr>
    		<script>
    			var id = "${employeePermission.rolePermissionId}";
    			var permissionRole = "";
    			
    			var permissionModule = "";
    			var subModule = "";
    			var i = ${status.index};
	    		$(".main").each(function(){
	    			$(".main").addClass(function(i){
	    				return "tr"+(i+1);
	    			});
	    			$(".tr"+(i+1)).find('td').eq(0).text(permissionRole);
	    			$(".tr"+(i+1)).find('td').eq(1).text(permissionModule);
	    			$(".tr"+(i+1)).find('td').eq(2).text(subModule);
	    		});
    			
    		
    		
    		</script>
    		
    	</c:forEach>
     </table>
  </body>
</html>
