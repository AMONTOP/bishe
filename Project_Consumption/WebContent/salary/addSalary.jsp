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
				    <h1 style="color:skyblue;">添加员工工资信息</h1>
				    <div style="padding:3px;color:red;">
				      ${msg}
				    </div>
				    <form action="savesalary" method="post">
				      <div style="padding:3px;">
				        <label for="salary">员工姓名：</label>
				        <select  name="salary.employee.empId" class="easyui-validatebox textbox myselect" style="width:280px;">
				          <option value="0">---请选择领货人---</option>
				          <c:forEach items="${list2}" var="employee">				            
				                <option value="${employee.empId}">${employee.name}</option>				          
				          </c:forEach>
				        </select>
				      </div>
				      
				       <div style="padding:3px;">
				        <label for="salary.infoBank">执行任务：</label>
				       <select  name="salary.projectTask.taskId" class="easyui-validatebox textbox addSelect" style="width:280px;">
				          <!-- <option value="0">---请选择任务---</option> -->
				          <%-- <c:forEach items="" var="projectTask">				            
				                <option value="${projectTask.taskId}">${projectTask.project.proName}${projectTask.taskName}</option>				          
				          </c:forEach> --%>
				        </select>
				      </div> 
				      <div style="padding:3px;">
				        <label for="salary.money">一日工资：</label>
				        <input id="salary.money" type="text" name="salary.money" value="${salary.money}" class="easyui-validatebox textbox" data-options="required:true,validType:'moneyReg'"/>
				      </div>
				      <div style="padding:3px">
				        <label for="salary.salaryState">审核状态：</label>
				        <select name="salary.salaryState" class="easyui-validatebox textbox" style="width:280px;">
				        	<option value="未审核">未审核</option>
				        	<option value="已审核">已审核</option>
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