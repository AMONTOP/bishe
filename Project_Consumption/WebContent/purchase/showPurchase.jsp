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
	<link href="resources/plugins/purchase-design-iconic-font-2.2.0/css/purchase-design-iconic-font.min.css" rel="stylesheet"/>
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
   
				 
	<div id="main">
		<div id="toolbar">
			<!-- <a class="waves-effect waves-button" href="addPrepurchase"><i class="zmdi zmdi-plus"></i> 新增物料</a> -->
		</div>
		<table id="table"></table>
	  </div>				      
				   	<c:forEach items="${list}" var="purchase">
				        <script>
					    	 var id = ${purchase.purId};
					    	 var purchaseNo = "${purchase.purNo}";
					    	 var wareNo = "${purchase.mwareHouseMaterial.mwareHouse.wareNo}";
					    	 var wid = "${purchase.mwareHouseMaterial.wid}";
					    	 var materialName = "${purchase.mwareHouseMaterial.material.materialName}";
					    	 var materialId = "${purchase.mwareHouseMaterial.material.materialId}";
					    	 var purState = "${purchase.purState}";
					    	 var quantity = "${purchase.quantity}";
					    	 var employeeName = "${purchase.employee.name}"; 
					    	
					    	 var obj = {
					    	 	purchase_id : id,
					    	 	purchase_no : purchaseNo,
					    	 	wareNo : wareNo,
					    	 	wid : wid,
					    	 	materialName : materialName,
					    	 	materialId : materialId,
					    	 	purState : purState,
					    	 	quantity : quantity,
					    	 	employeeName : employeeName					    	 	
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
		idField: 'purchase_id',
		sortName: 'purchase_id',
		sortOrder: 'desc',
		escape: true,
		searchOnEnterKey: true,
		idField: 'systemId',
		maintainSelected: true,
		toolbar: '#toolbar',
		columns: [
			{field: 'purchase_no', title: '采购单号', sortable: false, halign: 'center'},
			{field: 'materialName', title: '采购物料', sortable: false, halign: 'center'},
			{field: 'quantity', title: '采购数量', sortable: false, halign: 'center'},
			{field: 'wareNo', title: '采购仓库', sortable: false, halign: 'center'},
			{field: 'employeeName', title: '采购人员', sortable: false, halign: 'center'},
			{field: 'purState', title: '审核状态', sortable: false, halign: 'center',formatter:actionFormatter2},
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
        '<a class="remove ml10" href="deletepurchase?purId='+ row.purchase_id +'" data-toggle="tooltip" title="Remove"><i class="glyphicon glyphicon-remove"></i></a>'
    ].join('');
}

function actionFormatter2(value, row, index) {
	if(row.purState == "待审核"){
		 return [	    
	        '<a  href="addPrematerialInstockBill?materialId='+row.materialId+'&wid='+row.wid+'&purId='+row.purchase_id+'" style="color:red">待审核</a>'
	    ].join('');
	}else if(row.purState == "已审核"){
		 return [
        	'<span>已审核</span>'
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
