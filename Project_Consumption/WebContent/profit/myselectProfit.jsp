<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
				    <h1 style="color:skyblue;">选择需要查看的订单盈利详情</h1>
				    <div style="padding:3px;color:red;">
				      ${msg}
				    </div>
				    <form action="savesalary" method="post">
				      <div style="padding:3px;">
				        <label for="salary">订单编号：</label>
				        <select name="salary.employee.empId" class="easyui-validatebox textbox myselect" style="width:280px;">
				          <option value="0">---请选择订单编号---</option>
				          <c:forEach items="${list2}" var="employee">				            
				                <option value="${employee.empId}">${employee.name}</option>				          
				          </c:forEach>
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
			var arr=[];
				$(".myselect").change(function(){
					$.ajax({
						url:'getTaskprojectTask?empId='+$(".myselect option:selected").val(),
						dataType:'json',
						asycn:false,
						success:function(data){
							var jsondata3 = $.parseJSON(data);
							console.log(jsondata3);
							console.log(jsondata3[0].taskId);
							for(var i=0;i<jsondata3.length;i++){
								var obj={};
								obj.taskId = jsondata3[i].taskId;
								obj.taskName = jsondata3[i].taskName;
								obj.proName = jsondata3[i].project.proName;
								arr.push(obj);
							}
							for(var i=0;i<arr.length;i++){
        						$(".addSelect").append("<option value='"+arr[i].taskId+"'>"+arr[i].proName+arr[i].taskName+"</option>");
    						}
						}
						
					})
					
				})
$.extend($.fn.validatebox.defaults.rules, {
     moneyReg: {
        validator: function(value){
        	return (/^(([1-9]\d*)|\d)(\.\d{1,2})?$/)
    	},
    	message:'请输入正确的金额'
	}
});
			</script>
			
  </body>
</html>