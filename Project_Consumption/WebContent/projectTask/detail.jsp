<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html lang="en-au">
<head>
    <title>jQuery.Gantt</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge;chrome=1">
    <link rel="stylesheet" href="/Project_Consumption/css/style.css" />
    <link rel="stylesheet" href="/Project_Consumption/css/bootstrap.css" />
    <link rel="stylesheet" href="/Project_Consumption/css/prettify.css" />
    <style type="text/css">
        body {
            font-family: Helvetica, Arial, sans-serif;
            font-size: 13px;
            padding: 0 0 50px 0;
        }
        .contain {
            width: 800px;
            margin: 0 auto;
        }
        h1 {
            margin: 40px 0 20px 0;
        }
        h2 {
            font-size: 1.5em;
            padding-bottom: 3px;
            border-bottom: 1px solid #DDD;
            margin-top: 50px;
            margin-bottom: 25px;
        }
        table th:first-child {
            width: 150px;
        }
        label{
        	display: inline;
        }
        #mainbody{
            height: 38%;
            }
        
    </style>
</head>
<body>
<script>
	var arr = [];
</script>
<p style='color:red;padding:10px'>注意：点击领料（退料）进入领料单信息，赶紧生成领料（退料）单吧！</p>
<div class="contain">
	<h1 style="text-align: center;font-size: 26px;">工程进度甘特图</h1>
    <div class="gantt"></div>
</div>
 
		<c:forEach items="${list}" var="projectTask">
			<script>
		    	var taskId = "${projectTask.taskId}";
		    	var proId = "${projectTask.project.proId}";
		    	var taskName = "${projectTask.taskName}";
		    	var chargeId = "${projectTask.chargeId}";
		    	var chargeName = "${projectTask.chargeName}";
		    	var text = "${projectTask.text}";
		    	var startDate = "${projectTask.startDate}";
		    	var newstartDate = new Date(startDate).valueOf();
		    	var endDate = "${projectTask.endDate}";
		    	var newendDate = new Date(endDate).valueOf();
		    	if(taskName == "领料"){
		    		taskName = "<a href='showdrawMaterialBill'>"+taskName+"</a>";
		    	}else if(taskName == "退料"){
		    		taskName = "<a href='showreturnMaterialBill'>"+taskName+"</a>";
		    	}else if(taskName == "货品入库"){
		    		taskName = "<a href='show2productInstockBill'>"+taskName+"</a>";
		    	}else if(taskName == "货品出库发货"){
		    		taskName = "<a href='show2productOutstockBill'>"+taskName+"</a>";
		    	}
		    	var obj = {
		    		"name" : "<a  href='deleteprojectTask?proId=" + proId + "&taskId="+ taskId + "' style='margin-right: 12px;color: red;font-size: 15px;'>×</a>" + taskId ,
		    		"desc" : taskName,
		    		"values": [{
			    		"from" :	"/Date("+newstartDate+")/", 
			    		"to" :	"/Date("+newendDate+")/",
			    		"label" : text,
			    		"customClass" : "ganttRed"
		    		}]
		    	};
		    	arr.push(obj);
    		</script>			 				   
				  </c:forEach>
				   <script>
				   //获取url中的参数
			        function getUrlParam(name) {
			            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
			            var r = window.location.search.substr(1).match(reg);  //匹配目标参数
			            if (r != null) return unescape(r[2]); return null; //返回参数值
			        }

		    		var jsonlist = JSON.stringify(arr);
		    		var jj = JSON.parse(jsonlist);
		    		/* if(jj.length == 0){
		    			alert("请快去添加工程详情吧!!");
		    			window.location.href = "addprojectTask?proId="+getUrlParam("proId");
		    		}  */
		    	   </script>
		    	   
		    	   
		    <div id="container" class="easyui-layout" style="width:1024px;height:800px;padding:1px;margin-left:auto; margin-right:auto;">
				<div id="mainbody" style="height:90%">
				  <center>
				    <h1 style="color:skyblue;">添加工程详情</h1>
				    <div style="padding:3px;color:red;">
				      ${msg}
				    </div>
				    <form action="saveprojectTask?proId=${proId}" method="post">
				      <input type="hidden" id="proId" name="projectTask.project.proId" value="${proId}"/>
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
</body>

<script src="/Project_Consumption/js/jquery-1.7.2.min.js"></script>
<script src="/Project_Consumption/js/jquery.fn.gantt.js"></script>
<script src="/Project_Consumption/js/bootstrap-tooltip.js"></script>
<script src="/Project_Consumption/js/bootstrap-popover.js"></script>
<script src="/Project_Consumption/js/prettify.js"></script>

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
        }else if(myselect == "货品入库"){
            $(".per").val("80");
        }else if(myselect == "货品出库发货"){
            $(".per").val("100");
        }
    });
    
    $(function() {

        "use strict";

        $(".gantt").gantt({
            source: jj,
            navigate: "scroll",
            scale: "weeks",
            maxScale: "months",
            minScale: "days",
            itemsPerPage: 10,
            months:["一月","二月","三月","四月","五月","六月","七月","八月","九月","十月","十一月","十二月"],
            dow:["日","一","二","三","四","五","六"],
            onItemClick: function(data) {
               console.log(jj);       
              var msg = "请您确认工程是否已完成？";
              if(confirm(msg) == true){
              	console.log(proId);
              	 $.ajax({
              	 	url:'updatePreproject',
              	 	type:'post',
              	 	data:{"project.proId":proId},
              	 	success:function(data2){
              	 		console.log(data2);
              	 	}              	
              	 });
              }         
            },
            onAddClick: function(dt, rowId) {
                alert("Empty space clicked - add an item!");
            },
            onRender: function() {
                if (window.console && typeof console.log === "function") {
                    console.log("chart rendered");
                }
            }
        });

        $(".gantt").popover({
            selector: ".bar",
            title: "I'm a popover",
            content: "And I'm the content of said popover."
        });

        prettyPrint();

    });
	/* $("#proId").attr({"value": proId}); */
	/* $("form").attr({"action":"saveprojectTask?proId="+proId}); */

</script>
</html>