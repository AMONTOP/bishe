<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
   <form action="findbyNameproject" method="post" style="position:absolute;top:43px;right:187px;">
	   <p class="columns pull-right search-button">
		    <button class="btn btn-default" type="submit" name="refresh" title="查询" style="padding: 9px;margin-right: 10px;margin-left: -3px;">
		   	 	<i class="glyphicon glyphicon-search icon-search"></i>
		    </button>
	    </p>
	    <p class="columns pull-right search-input">
	   		<input class="form-control" name="project.proName"  type="text" placeholder="搜索项目名">
	   </p>
   </form>
    <p style="text-indent:2em;color:red;background: #fafafa;margin: 0;padding-top:10px">注意：全部工程包含工程设计以及工程承包的所有内容！</p>
    <p style="text-indent:2em;color:red;background: #fafafa;margin: 0;padding-top:10px">注意：当工程达到100%时点击确定发货即可更改订单审核状态！</p>
   <div id="main">
	<div id="toolbar">
		<a class="waves-effect waves-button" href="addPreproject"><i class="zmdi zmdi-plus"></i> 新增项目</a>
	</div>
	<table id="table"></table>
  </div>			 
				  
				  
				   	<c:forEach items="${list}" var="project">
						   	<script>
						   	 var id = "${project.proId}";
					    	 var proNo = "${project.proNo}";
					    	 var proName = "${project.proName}";
					    	 var manId = "${project.manId}";
					    	 var chargeMan = "${project.employee.name}";
					    	 var percent = "${project.percent}"+"%";
					    	 var startDate = "${project.startDate}";
					    	 var newstartDate = startDate.substring(0, 10);
					    	 var endDate = "${project.endDate}";
					    	 var newendDate = endDate.substring(0, 10);
					    	 var text = "${project.text}";
					    	 var remark = "${project.remark}";
					    	 var billId = "${project.orderBill.billId}";
					    	 var billNo = "${project.orderBill.billNo}";
					    	 var obj = {
					    	 	project_id : id,
					    	 	proNo : proNo,
					    	 	proName : proName,
					    	 	manId : manId,
					    	 	chargeMan : chargeMan,
					    	 	percent : percent,
					    	 	startDate : newstartDate,
					    	 	endDate : newendDate,
					    	 	text : text,
					    	 	remark : remark,
					    	 	billId : billId,
					    	 	billNo : billNo
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
		idField: 'project_id',
		sortName: 'project_id',
		sortOrder: 'desc',
		escape: true,
		searchOnEnterKey: true,
		idField: 'systemId',
		maintainSelected: true,
		toolbar: '#toolbar',
		columns: [
			{field: 'proNo', title: '项目编号', sortable: false, halign: 'center'},
			{field: 'proName', title: '项目名称', sortable: false, halign: 'center'},
			{field: 'billNo', title: '订单编号', sortable: false, halign: 'center'},
			{field: 'chargeMan', title: '负责人', sortable: false, halign: 'center'},
			{field: 'percent', title: '进度', sortable: false, halign: 'center',formatter:actionFormatter2},
			{field: 'startDate', title: '计划开始时间', sortable: false, halign: 'center'},
			{field: 'endDate', title: '计划结束时间', sortable: false, halign: 'center'},
			{field: 'Button', title: '操作', events:actionEvents,formatter:actionFormatter,halign: 'center'},
			
		]
	}).on('all.bs.table', function (e, name, args) {
		$('[data-toggle="tooltip"]').tooltip();
		$('[data-toggle="popover"]').popover();  
	});
});
function actionFormatter(value, row, index) {
    return [
        '<a class="like" href="showprojectTask?proId='+row.project_id+'" data-toggle="tooltip" style="color: red;border-bottom: 1px dotted;">具体进度</a>　',
        '<a class="edit ml10" href="prepupproject?proId='+ row.project_id +'" data-toggle="tooltip" title="Edit"><i class="glyphicon glyphicon-edit"></i></a>　',
        '<a class="remove ml10" href="deleteproject?proId='+ row.project_id +'" data-toggle="tooltip" title="Remove"><i class="glyphicon glyphicon-remove"></i></a>'
    ].join('');
}
function actionFormatter2(value, row, index) {
    if(row.percent == '100%'){
    	return[
    		'<a class="like" href="updateOneorderBill?billId='+row.billId+'" data-toggle="tooltip" style="color: red;border-bottom: 1px dotted;">'+ row.percent+'</a>　',
    	].join('');
    }else{
    	return [
    		'<span>' + row.percent + '</span>'
    	].join('');
    }
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
  </body>
</html>
