<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.opensymphony.xwork2.ActionContext" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'list.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="resources/plugins/bootstrap-3.3.0/css/bootstrap.min.css" rel="stylesheet"/>
	<link href="resources/plugins/material-design-iconic-font-2.2.0/css/material-design-iconic-font.min.css" rel="stylesheet"/>
	<link href="resources/plugins/bootstrap-table-1.11.0/bootstrap-table.min.css" rel="stylesheet"/>
	<link href="resources/plugins/waves-0.7.5/waves.min.css" rel="stylesheet"/>
	<link href="resources/plugins/jquery-confirm/jquery-confirm.min.css" rel="stylesheet"/>
	<link href="resources/plugins/select2/css/select2.min.css" rel="stylesheet"/>
	<link href="resources/css/common.css" rel="stylesheet"/>
   
  </head>
  <body>
  <script>
   var arr = [];
  </script>
   <form action="employee-findbyName" method="post" style="position:absolute;top:19px;right:187px;">
	   <p class="columns pull-right search-button">
		    <button class="btn btn-default" type="submit" name="refresh" title="查询" style="padding: 9px;margin-right: 10px;margin-left: -3px;">
		   	 	<i class="glyphicon glyphicon-search icon-search"></i>
		    </button>
	    </p>
	    <p class="columns pull-right search-input">
	   		<input class="form-control" name="employee.name"  type="text" placeholder="根据真实姓名搜索">
	   </p>
   </form>
   
                
 <div id="main">
	<div id="toolbar">
		<a class="waves-effect waves-button" href="/Project_Consumption/employee/addEmployee.jsp"><i class="zmdi zmdi-plus"></i> 新增员工信息</a>
	</div>
	<table id="table"></table>
  </div>			 
				  
				  
				   	<c:forEach items="${list}" var="employee">
						   	<script>
						   	 var id = "${employee.empId}";
					    	 var userName = "${employee.userName}";
					    	 var name = "${employee.name}";
					    	 var sex = "${employee.sex}";
					    	 var mobile = "${employee.mobile}";
					    	 var email = "${employee.email}";
					    	 var idCard = "${employee.idCard}";
					    	 var roleName = "${employee.role.roleName}";
					    	 if(sex == 1){
					    	 	sex = "女";
					    	 }else if(sex == 0){
					    	 	sex = "男";
					    	 }
					    	 var obj = {
					    	 	employee_id : id,
					    	 	userName : userName,
					    	 	name : name,
					    	 	sex : sex,
					    	 	mobile : mobile,
					    	 	email : email,
					    	 	idCard : idCard,
					    	 	roleName : roleName
					    	 };
					    	 arr.push(obj);
						   	</script>				 				   
				  </c:forEach>
				   <script>
		    		var jsonlist = JSON.stringify(arr);
		    		var jj = JSON.parse(jsonlist);
		    	   </script>
		    	   
<script src="resources/plugins/jquery.1.12.4.min.js"></script>
<script src="resources/plugins/bootstrap-3.3.0/js/bootstrap.min.js"></script>
<script src="resources/plugins/bootstrap-table-1.11.0/bootstrap-table.min.js"></script>
<script src="resources/plugins/bootstrap-table-1.11.0/locale/bootstrap-table-zh-CN.min.js"></script>
<script src="resources/plugins/waves-0.7.5/waves.min.js"></script>
<script src="resources/plugins/jquery-confirm/jquery-confirm.min.js"></script>
<script src="resources/plugins/select2/js/select2.min.js"></script>
<script src="resources/js/common.js"></script>       
<script>
var $table = $('#table');
$(function() {
	$(document).on('focus', 'input[type="text"]', function() {
		$(this).parent().find('label').addClass('active');
	}).on('blur', 'input[type="text"]', function() {
		if ($(this).val() == '') {
			$(this).parent().find('label').removeClass('active');
		}
	});
	// bootstrap table初始化
	// http://bootstrap-table.wenzhixin.net.cn/zh-cn/documentation/
	$table.bootstrapTable({
		data: jj,
		height: getHeight(),
		striped: true,
		search: false,
		searchOnEnterKey: true,
		showRefresh: true,
		showToggle: true,
		showColumns: true,
		minimumCountColumns: 2,
		showPaginationSwitch: true,
		clickToSelect: true,
		detailView: false,
		detailFormatter: 'detailFormatter',
		pagination: false,
		paginationLoop: false,
		classes: 'table table-hover table-no-bordered',
		//sidePagination: 'server',
		//silentSort: false,
		smartDisplay: false,
		idField: 'employee_id',
		sortName: 'employee_id',
		sortOrder: 'desc',
		escape: true,
		searchOnEnterKey: true,
		idField: 'systemId',
		maintainSelected: true,
		toolbar: '#toolbar',
		columns: [
			{checkbox:true},
			{field: 'userName', title: '用户名', sortable: false, halign: 'center'},
			{field: 'name', title: '真实姓名', sortable: false, halign: 'center'},
			{field: 'sex', title: '性别', sortable: false, halign: 'center'},
			{field: 'mobile', title: '电话', sortable: false, halign: 'center'},
			{field: 'email', title: '邮箱', sortable: false, halign: 'center'},
			{field: 'idCard', title: '身份证', sortable: false, halign: 'center'},
			{field: 'roleName', title: '角色', sortable: false, halign: 'center'},
			{field: 'Button', title: '操作', events:actionEvents,formatter:actionFormatter,halign: 'center'},	
		]
	}).on('all.bs.table', function (e, name, args) {
		$('[data-toggle="tooltip"]').tooltip();
		$('[data-toggle="popover"]').popover();  
	});
	
});
function actionFormatter(value, row, index) {
    return [
        /* '<a class="like" href="javascript:void(0)" data-toggle="tooltip" title="Like"><i class="glyphicon glyphicon-heart"></i></a>　', */
        '<a class="edit ml10" href="employee-prepup?empId='+ row.employee_id +'" data-toggle="tooltip" title="Edit"><i class="glyphicon glyphicon-edit"></i></a>　',
        '<a class="remove ml10" href="employee-delete?empId='+ row.employee_id +'" data-toggle="tooltip" title="Remove"><i class="glyphicon glyphicon-remove"></i></a>'
    ].join('');
}


window.actionEvents = {
    /* 'click .like': function (e, value, row, index) {
        alert('You click like icon, row: ' + JSON.stringify(row));
        console.log(value, row, index);
    }, */
    'click .edit': function (e, value, row, index) {
        /* alert('You click edit icon, row: ' + JSON.stringify(row)); */
    },
    'click .remove': function (e, value, row, index) {
       /*  alert('You click remove icon, row: ' + JSON.stringify(row)); */

    }
};
function detailFormatter(index, row) {
	var html = [];
	$.each(row, function (key, value) {
		html.push('<p><b>' + key + ':</b> ' + value + '</p>');
	});
	return html.join('');
}


</script>
<script>
$(document).ready(function(){
	/* $("input[name='btSelectItem']").attr("id","selectedRow"); */
	$("input[name='btSelectItem']").attr("name","selectedRow");
	for(var i =0;i<jj.length;i++){
		$("input[name='selectedRow']").eq(i).attr("value",jj[i].employee_id);
	}
	$("#table").wrap("<form class='mainform'></form>");
	$(".mainform").attr("action","employee-export2Excel");
	$("#table").after("<input type='submit' value='导出到excel'/>"); 
	
});
	
</script>

  </body>
</html>
