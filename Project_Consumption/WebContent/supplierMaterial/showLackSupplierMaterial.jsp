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
 .bootstrap-table{
     height: 90%;
 }
 </style>
  </head>
    
  <body>
    <script>
   		var arr = [];
   	</script>


  <div id="main">
	
	<table id="table"></table>
	<div>
		<p style="color:red">注意：当仓库中物料数量小于100时，物料显示为库存不足，相反地，当物料大于100，显示库存充裕。</p>
	  	<p style="color:red">警告：当库存不足时，请及时添加入库单，反馈给相关人员进行采购审核。</p>
	</div>
  </div>
  
  <script src="resources/plugins/jquery.1.12.4.min.js"></script>
<script src="resources/plugins/bootstrap-3.3.0/js/bootstrap.min.js"></script>
<script src="resources/plugins/bootstrap-table-1.11.0/bootstrap-table.min.js"></script>
<script src="resources/plugins/bootstrap-table-1.11.0/locale/bootstrap-table-zh-CN.min.js"></script>
<script src="resources/plugins/waves-0.7.5/waves.min.js"></script>
<script src="resources/plugins/jquery-confirm/jquery-confirm.min.js"></script>
<script src="resources/plugins/select2/js/select2.min.js"></script>
<script src="resources/js/common.js"></script>
<script>
window.actionEvents = {
    /* 'click .like': function (e, value, row, index) {
        alert('You click like icon, row: ' + JSON.stringify(row));
        console.log(value, row, index);
    }, */
    'click .edit': function (e, value, row, index) {
        /* alert('You click edit icon, row: ' + JSON.stringify(row)); */
        console.log(row.supplier_id);
    },
    'click .remove': function (e, value, row, index) {
       /*  alert('You click remove icon, row: ' + JSON.stringify(row)); */
        console.log(value, row, index);
    }
};
			$.ajax({
				url:'showByIdmaterialHouseMaterial',
				dataType:'json',
				success:function(data){
					var jsondata =$.parseJSON(data);
					console.log(jsondata);
					for(var i=0;i<jsondata.length;i++){
						var quantity = jsondata[i][3];
						var materialId = jsondata[i][0];
						var materialName = jsondata[i][1];
						var materialNo = jsondata[i][2];
						var ware = jsondata[i][4];
						var wid = jsondata[i][5];
						var remark = "库存不足";
						var obj = {
							quantity : quantity,
							materialId : materialId,
							materialName : materialName,
							materialNo : materialNo,
							remark : remark,
							ware : ware,
							wid : wid
						};
						arr.push(obj);
					}
					var jsonlist = JSON.stringify(arr);
					var jj = JSON.parse(jsonlist);
					
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
		idField: 'materialId',
		sortName: 'materialId',
		sortOrder: 'desc',
		escape: true,
		searchOnEnterKey: true,
		idField: 'systemId',
		maintainSelected: true,
		toolbar: '#toolbar',
		columns: [
			{field: 'materialNo', title: '物料编号', sortable: false, halign: 'center'},
			{field: 'materialName', title: '物料名称', sortable: false, halign: 'center'},
			{field: 'quantity', title: '数量', sortable: false, halign: 'center'},
			{field: 'ware', title: '仓库', sortable: false, halign: 'center'},
			{field: 'remark', title: '描述', sortable: false, halign: 'center',formatter:actionFormatter2},
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
        '<a class="edit ml10" href="prepupsupplierMaterial?supplierMaterialId='+ row.id +'" data-toggle="tooltip" title="Edit"><i class="glyphicon glyphicon-edit"></i></a>　',
        '<a class="remove ml10" href="deletesupplierMaterial?supplierMaterialId='+ row.id +'" data-toggle="tooltip" title="Remove"><i class="glyphicon glyphicon-remove"></i></a>'
    ].join('');
}

function actionFormatter2(value, row, index){
      	return [	
      		/* '<a href="addPrematerialInstockBill?materialId='+row.materialId+'&materialName='+row.materialName+'" class="innerbtn" style="color:blue" >' + row.remark + '</a>' */
      		'<a href="addPrepurchase?materialId='+row.materialId+'&wid='+row.wid+'" class="innerbtn" style="color:blue" >' + row.remark + '</a>'
      	].join('');
      	
}


function detailFormatter(index, row) {
	var html = [];
	$.each(row, function (key, value) {
		html.push('<p><b>' + key + ':</b> ' + value + '</p>');
	});
	return html.join('');
}

					
				}
			})
	

</script>	   
		
  </body>
</html>
