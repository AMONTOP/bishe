<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.opensymphony.xwork2.ActionContext"%>
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
   	<form action="findbyMaterialNamesupplierMaterial" method="post" style="position:absolute;top:19px;right:187px;">
	   <p class="columns pull-right search-button">
		    <button class="btn btn-default" type="submit" name="refresh" title="查询" style="padding: 9px;margin-right: 10px;margin-left: -3px;">
		   	 	<i class="glyphicon glyphicon-search icon-search"></i>
		    </button>
	    </p>
	    <p class="columns pull-right search-input">
	   		<input class="form-control" name="supplierMaterial.material.materialName"  type="text" placeholder="根据物料名称搜索">
	   </p>
   </form>

  <div id="main">
	<div id="toolbar">
		<a class="waves-effect waves-button" href="addPresupplierMaterial"><i class="zmdi zmdi-plus"></i> 新增供应商物料信息</a>
	</div>
	<table id="table"></table>
  </div>	
				      
		<c:forEach items="${listSupplierMaterials}" var="supplierMaterial">
			<script>
	    	 var id = "${supplierMaterial.supplierMaterialId}";
	    	 var supplierName = "${supplierMaterial.supplier.supplierName}";
	    	 var materialId = "${supplierMaterial.material.materialId}";
	    	 var materialNo = "${supplierMaterial.material.materialNo}";
	    	 var materialName = "${supplierMaterial.material.materialName}";
	    	 var unit = "${supplierMaterial.material.unit}";
	    	 var cost = ${supplierMaterial.material.cost};
	    	 var remark = "${supplierMaterial.remark}";
	    	 var price = "${supplierMaterial.price}";
			 if(remark == 0){
			 	remark = "库存不足";
			 }else if(remark == 1){
			 	remark = "库存充裕";
			 }
	    	 var obj = {
	    	 	id : id,
	    	 	supplier_name:supplierName,
	    	 	materialId : materialId,
	    	 	material_no : materialNo,
	    	 	material_name : materialName,
	    	 	unit : unit,
	    	 	cost : cost+"元",
	    	 	remark:remark,
	    	 	price : price
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
			{field: 'supplier_name', title: '供应商名称', sortable: false, halign: 'center'},
			{field: 'material_no', title: '物料编号', sortable: false, halign: 'center'},
			{field: 'material_name', title: '物料名称', sortable: false, halign: 'center'},
			{field: 'unit', title: '计量单位', sortable: false, halign: 'center'},
			{field: 'price', title: '物料成本(/个)', sortable: false, halign: 'center'},
			/* {field: 'remark', title: '备注', sortable: false, halign: 'center',formatter:actionFormatter2}, */
			{field: 'Button', title: '操作', events:actionEvents,formatter:actionFormatter,halign: 'center'},
			
		]
	}).on('all.bs.table', function (e, name, args) {
		$('[data-toggle="tooltip"]').tooltip();
		$('[data-toggle="popover"]').popover();  
	});
});
function actionFormatter(value, row, index) {
	if("<%=ActionContext.getContext().getSession().get("myRole")%>" == "财务管理员"){
		return null;
	}else{
		return [
	        /* '<a class="like" href="javascript:void(0)" data-toggle="tooltip" title="Like"><i class="glyphicon glyphicon-heart"></i></a>　', */
	        '<a class="edit ml10" href="prepupsupplierMaterial?supplierMaterialId='+ row.id +'" data-toggle="tooltip" title="Edit"><i class="glyphicon glyphicon-edit"></i></a>　',
	        '<a class="remove ml10" href="deletesupplierMaterial?supplierMaterialId='+ row.id +'" data-toggle="tooltip" title="Remove"><i class="glyphicon glyphicon-remove"></i></a>'
	    ].join('');
	}
    
}

function actionFormatter2(value, row, index){
		console.log();
		if(row.remark == "库存不足"){
      		return [	'<a href="addPrematerialInstockBill?materialId='+row.materialId+'&materialName='+row.material_name+'" class="innerbtn" style="color:blue" >' + row.remark + '</a>'].join('');
      	}else if(row.remark == "库存充裕"){
      		return [	'<span>'+row.remark+'</span>'].join('');
      	}
	
}

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
