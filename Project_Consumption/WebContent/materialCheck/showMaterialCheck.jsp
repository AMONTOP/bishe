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
 	<style>
 	.topSelect{
	 		    font-size: 15px;
			    width: 91px;
			    display: inline-block;
			    height: 28px;
			    text-align: center;
			    color: #000000c9;
			    border-radius: 3px;
			    margin: 7px;
			    line-height: 28px;
			    background: #eaeaea;
 		}
 		.topSelect:hover{
 			background:#0f7562;
 			color:white;
 		}
 	</style>
  </head>
  
  <body>
   <script>
   var arr = [];
   </script>
   <div style="background: #fafafa;">
	   	<a href="showListmaterialCheck?id=0" class="topSelect">审批未通过</a>
		<a href="showListmaterialCheck?id=1" class="topSelect">审批通过</a>
   </div>
   <form action="findbyNamematerial" method="post" style="position:absolute;top:19px;right:187px;">
	   <p class="columns pull-right search-button">
		    <button class="btn btn-default" type="submit" name="refresh" title="查询" style="padding: 9px;margin-right: 10px;margin-left: -3px;">
		   	 	<i class="glyphicon glyphicon-search icon-search"></i>
		    </button>
	    </p>
	    <p class="columns pull-right search-input">
	   		<input class="form-control" name="material.materialName"  type="text" placeholder="搜索">
	   </p>
   </form>
  
  <div id="main">
	<div id="toolbar">
		<a class="waves-effect waves-button" href="addPrematerial"><i class="zmdi zmdi-plus"></i> 新增物料品质</a>
	</div>
	<table id="table"></table>
  </div>

		<c:forEach items="${list}" var="materialCheck">
	    	 <script>
	    	 var id = ${materialCheck.materialCheckId};
	    	 var checkNo = "${materialCheck.checkNo}";
	    	 var materialId = "${materialCheck.material.materialId}";
	    	 var materialName = "${materialCheck.material.materialName}";
	    	 var empId = "${materialCheck.employee.empId}";
	    	 var empName = "${materialCheck.employee.userName}";
	    	 var checkItem = "${materialCheck.checkItem}";
	    	 var checkNumber = "${materialCheck.checkNumber}";
	    	 var cdate = "${materialCheck.cdate}";
	    	 var result = "${materialCheck.result}";
	    	 var note = "${materialCheck.note}";
	    	 var qualify = "${materialCheck.qualify}";
			 var state = "${materialCheck.state}";
			 var billNo = "${materialCheck.materialInstockBill.billNo}";
			 if(state == "false"){
			 	state = "审批未通过";
			 }else if(state == "true"){
			 	state = "审批通过";
			 }
			 var checkState = "${materialCheck.checkState}";
			 if(checkState == "true" && checkState != null){
			 	checkState = "已检测";
			 }else if(checkState == "false" || checkState == ''){
			 	checkState = "未检测";
			 }
	    	 var obj = {
	    	 	id : id,
	    	 	checkNo : checkNo,
	    	 	materialId : materialId,
	    	 	materialName : materialName,
	    	 	empId : empId,
	    	 	empName : empName,
	    	 	checkItem : checkItem,
	    	 	checkNumber : checkNumber,
	    	 	cdate : cdate,
	    	 	result : result,
	    	 	note : note,
	    	 	qualify : qualify,
	    	 	state: state,
	    	 	checkState : checkState,
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
		idField: 'id',
		sortName: 'id',
		sortOrder: 'desc',
		escape: true,
		searchOnEnterKey: true,
		idField: 'systemId',
		maintainSelected: true,
		toolbar: '#toolbar',
		columns: [
			{field: 'checkNo', title: '抽检单号', sortable: false, halign: 'center'},
			{field: 'billNo', title: '入库单号', sortable: false, halign: 'center'},
			{field: 'materialName', title: '物料名称', sortable: false, halign: 'center'},
			{field: 'empName', title: '检测人员', sortable: false, halign: 'center'},
			{field: 'checkItem', title: '检测类别', sortable: false, halign: 'center'},
			{field: 'checkNumber', title: '检测数量', sortable: false, halign: 'center'},
			{field: 'cdate', title: '检测日期', sortable: false, halign: 'center'},
			{field: 'result', title: '检测结果', sortable: false, halign: 'center'},
			{field: 'qualify', title: '合格率', sortable: false, halign: 'center'},
			{field: 'state', title: '审批状态', sortable: false, halign: 'center'},
			{field: 'checkState', title: '检测状态', sortable: false, halign: 'center',formatter:actionFormatter2},
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
        '<a class="edit ml10" href="prepupmaterialCheck?materialCheckId='+ row.id +'" data-toggle="tooltip" title="Edit"><i class="glyphicon glyphicon-edit"></i></a>　',
        '<a class="remove ml10" href="deletematerialCheck?materialCheckId='+ row.id +'" data-toggle="tooltip" title="Remove"><i class="glyphicon glyphicon-remove"></i></a>'
    ].join('');
}

function actionFormatter2(value, row, index){
	if(row.checkState == "未检测"){
      return ['<a href="prepupmaterialCheck?materialCheckId='+ row.id +'" class="innerbtn" style="color:blue" >' + row.checkState + '</a>'].join('');
    }else{
      return ['<span>已检测</span>'].join('');
    } 
}

window.actionEvents = {
    /* 'click .like': function (e, value, row, index) {
        alert('You click like icon, row: ' + JSON.stringify(row));
        console.log(value, row, index);
    }, */
    'click .edit': function (e, value, row, index) {
        /* alert('You click edit icon, row: ' + JSON.stringify(row)); */
        console.log(row.material_id);
    },
    'click .remove': function (e, value, row, index) {
       /*  alert('You click remove icon, row: ' + JSON.stringify(row)); */
        console.log(value, row, index);
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
