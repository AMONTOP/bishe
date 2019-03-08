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
   <form action="prepupproduct.action" method="post">
	   <p class="columns pull-right search-input">
	   		<input class="form-control" name="searchh_id"  type="text" placeholder="搜索">
	   </p>
	   <p class="columns pull-right search-button">
		    <button class="btn btn-default" type="button" name="refresh" title="查询" onclick="findAction()">
		   	 	<i class="glyphicon glyphicon-search icon-search"></i>
		    </button>
	    </p>
   </form>
  
   <p class="columns pull-right search-select"><select></select></p>
  <div id="main">
	<div id="toolbar">
		<a class="waves-effect waves-button" href="javascript:;" onclick="createAction()"><i class="zmdi zmdi-plus"></i> 新增货品</a>
		<a class="waves-effect waves-button" href="javascript:;" onclick="updateAction()"><i class="zmdi zmdi-edit"></i> 修改货品</a>
		<a class="waves-effect waves-button" href="javascript:;" onclick="deleteAction()"><i class="zmdi zmdi-close"></i> 删除用户</a>
	</div>
	<table id="table"></table>
</div>
<!-- 新增 -->
<div id="createDialog" class="crudDialog" hidden>
	<form action="saveproduct.action" method="post" class="myFormId" >
		<div class="form-group">
			<label for="input2">货品编号</label>
			<input id="input2" name="product.productNo" type="text" class="form-control">
		</div>
		<div class="form-group">
			<label for="input3">货品名称</label>
			<input id="input3" name="product.productName" type="text" class="form-control">
		</div>
		<div class="form-group">
			<label for="input4">计量单位</label>
			<input id="input4" name="product.unit" type="text" class="form-control">
		</div>
		<div class="form-group">
			<label for="input5">规格</label>
			<input id="input5" name="product.spec" type="text" class="form-control">
		</div>
		<div class="form-group">
			<label for="input6">价格</label>
			<input id="input6" name="product.price" type="text" class="form-control">
		</div>
		<div class="form-group">
			<label for="input7">是否停用</label>
			<input id="input7" name="product.closed" type="text" class="form-control">
		</div>
		<div class="form-group">
			<label for="input8">备注</label>
			<input id="input8" name="product.remark" type="text" class="form-control">
		</div>
		<div class="form-group">
			<label for="input9">创建时间</label>
			<input id="input9" name="product.createAt" type="text" class="form-control">
		</div>
		<div class="form-group">
			<label for="input10">创建者</label>
			<input id="input10" name="product.createBy" type="text" class="form-control">
		</div>
		
		<div class="form-group">
			<label for="input11">更新时间</label>
			<input id="input11" name="product.updateAt" type="text" class="form-control">
		</div>
		<div class="form-group">
			<label for="input12">更新者</label>
			<input id="input12" name="product.updateBy" type="text" class="form-control">
		</div>
	</form>
</div>
<!-- 编辑 -->
<div id="createDialog2" class="crudDialog" hidden>
	<form action="updateproduct.action" method="post" class="myFormId2" >
		<div class="form-group">
			<label for="input2">货品编号</label>
			<input id="input2" name="product.productNo" type="text" class="form-control">
		</div>
		<div class="form-group">
			<label for="input3">货品名称</label>
			<input id="input3" name="product.productName" type="text" class="form-control">
		</div>
		<div class="form-group">
			<label for="input4">计量单位</label>
			<input id="input4" name="product.unit" type="text" class="form-control">
		</div>
		<div class="form-group">
			<label for="input5">类别id</label>
			<input id="input5" name="product.categoryId" type="text" class="form-control">
		</div>
		<div class="form-group">
			<label for="input51">规格</label>
			<input id="input51" name="product.spec" type="text" class="form-control">
		</div>
		<div class="form-group">
			<label for="input6">价格</label>
			<input id="input6" name="product.price" type="text" class="form-control">
		</div>
		<div class="form-group">
			<label for="input7">是否停用</label>
			<input id="input7" name="product.closed" type="text" class="form-control">
		</div>
	
		<div class="form-group">
			<label for="input8">备注</label>
			<input id="input8" name="product.remark" type="text" class="form-control">
		</div>
		<div class="form-group">
			<label for="input9">创建时间</label>
			<input id="input9" name="product.createAt" type="text" class="form-control">
		</div>
		<div class="form-group">
			<label for="input10">创建者</label>
			<input id="input10" name="product.createBy" type="text" class="form-control">
		</div>
		
		<div class="form-group">
			<label for="input11">更新时间</label>
			<input id="input11" name="product.updateAt" type="text" class="form-control">
		</div>
		<div class="form-group">
			<label for="input12">更新者</label>
			<input id="input12" name="product.updateBy" type="text" class="form-control">
		</div>
	</form>
</div>
		<c:forEach var="product" items="${list}">
	    	 <script>
	    	 var id = ${product.productId};
	    	 var productNo = "${product.productNo}";
	    	 var productName = "${product.productName}";
	    	 var unit = "${product.unit}";
	    	 var categoryId = "${product.categoryId}";
	    	 var spec = "${product.spec}";
	    	 var price = ${product.price};
	    	 var remark = "${product.remark}";
	    	 var closed = ${product.closed};
	    	 var createAt = "${product.createAt}";
	    	 var createBy = "${product.createBy}";
	    	 var updateAt = "${product.updateAt}";
	    	 var updateBy = "${product.updateBy}";
	    	 var obj = {
	    	 	product_id : id,
	    	 	product_no : productNo,
	    	 	product_name:productName,
	    	 	unit : unit,
	    	 	category_id:categoryId,
	    	 	spec:spec,
	    	 	price:price,
	    	 	closed:closed,
	    	 	remark:remark,
	    	 	create_at:createAt,
	    	 	create_by:createBy,
	    	 	update_at:updateAt,
	    	 	update_by:updateBy
	    	 };
	    	 arr.push(obj);
	   		 </script>
    	</c:forEach>
    	 <script>
    		var jsonlist = JSON.stringify(arr);
    		var jj = JSON.parse(jsonlist);
    		console.log(jsonlist);
    		console.log(jj);
    		console.log(typeof(jj));
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
	console.log(jj);
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
		detailView: true,
		detailFormatter: 'detailFormatter',
		pagination: false,
		paginationLoop: false,
		classes: 'table table-hover table-no-bordered',
		//sidePagination: 'server',
		//silentSort: false,
		smartDisplay: false,
		idField: 'product_id',
		sortName: 'product_id',
		sortOrder: 'desc',
		escape: true,
		searchOnEnterKey: true,
		idField: 'systemId',
		maintainSelected: true,
		toolbar: '#toolbar',
		columns: [
			{field: 'state', checkbox: true},
			{field: 'product_no', title: '货品编号', sortable: false, halign: 'center'},
			{field: 'product_name', title: '货品名称', sortable: false, halign: 'center'},
			{field: 'unit', title: '计量单位', sortable: false, halign: 'center'},
			{field: 'spec', title: '规格', sortable: false, halign: 'center'},
			{field: 'price', title: '价格', sortable: false, halign: 'center'},
			{field: 'closed', title: '是否停用', sortable: false, halign: 'center'},
			{field: 'remark', title: '备注', sortable: false, halign: 'center'},
			{field: 'create_at', title: '创建时间', sortable: false, halign: 'center'},
			{field: 'create_by', title: '创建者', sortable: false, halign: 'center'},
			{field: 'update_at', title: '更新时间', sortable: false, halign: 'center'},
			{field: 'update_by', title: '更新者', sortable: false, halign: 'center'}
		]
	}).on('all.bs.table', function (e, name, args) {
		$('[data-toggle="tooltip"]').tooltip();
		$('[data-toggle="popover"]').popover();  
	});
});
function actionFormatter(value, row, index) {
    return [
        '<a class="like" href="javascript:void(0)" data-toggle="tooltip" title="Like"><i class="glyphicon glyphicon-heart"></i></a>　',
        '<a class="edit ml10" href="javascript:void(0)" data-toggle="tooltip" title="Edit"><i class="glyphicon glyphicon-edit"></i></a>　',
        '<a class="remove ml10" href="javascript:void(0)" data-toggle="tooltip" title="Remove"><i class="glyphicon glyphicon-remove"></i></a>'
    ].join('');
}

window.actionEvents = {
    'click .like': function (e, value, row, index) {
        alert('You click like icon, row: ' + JSON.stringify(row));
        console.log(value, row, index);
    },
    'click .edit': function (e, value, row, index) {
        alert('You click edit icon, row: ' + JSON.stringify(row));
        console.log(value, row, index);
    },
    'click .remove': function (e, value, row, index) {
        alert('You click remove icon, row: ' + JSON.stringify(row));
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
// 新增
function createAction() {
	$.confirm({
		type: 'dark',
		animationSpeed: 300,
		title: '新增数据',
		content: $('#createDialog').html(),
		buttons: {
			confirm: {
				text: '确认',
				btnClass: 'waves-effect waves-button',
				action: function () {
					$.alert('确认');
					$(".myFormId").submit();
				}
			},
			cancel: {
				text: '取消',
				btnClass: 'waves-effect waves-button'
			}
		}
	});
}
// 编辑
function updateAction() {
	var rows = $table.bootstrapTable('getSelections');
	if (rows.length == 0) {
		$.confirm({
			title: false,
			content: '请至少选择一条记录！',
			autoClose: 'cancel|3000',
			backgroundDismiss: true,
			buttons: {
				cancel: {
					text: '取消',
					btnClass: 'waves-effect waves-button'
				}
			}
		});
	} else {
		$.confirm({
			type: 'blue',
			animationSpeed: 300,
			title: '编辑数据',
			content: $('#createDialog2').html(),
			buttons: {
				confirm: {
					text: '确认',
					btnClass: 'waves-effect waves-button',
					action: function () {
						$.alert('确认');
					$(".myFormId2").submit();
					}
				},
				cancel: {
					text: '取消',
					btnClass: 'waves-effect waves-button'
				}
			}
		});
	}
}
// 删除
function deleteAction() {
	var rows = $table.bootstrapTable('getSelections');
	if (rows.length == 0) {
		$.confirm({
			title: false,
			content: '请至少选择一条记录！',
			autoClose: 'cancel|3000',
			backgroundDismiss: true,
			buttons: {
				cancel: {
					text: '取消',
					btnClass: 'waves-effect waves-button'
				}
			}
		});
	} else {
		$.confirm({
			type: 'red',
			animationSpeed: 300,
			title: false,
			content: '确认删除该条数据吗？',
			buttons: {
				confirm: {
					text: '<a href="deleteproduct.action?id='+ rows[0].product_id + '">' +'确认</a>',
					btnClass: 'waves-effect waves-button',
					action: function () {
					var ids = new Array();
					for (var i in rows) {
						ids.push(rows[i].product_id);
					}
					console.log(ids);
					for(var m=0;m<ids.length;ids++){
						window.location.href = "http://localhost:8080/erpssh/deleteproduct.action?id=" + ids[m];
					}					
					}
				},
				cancel: {
					text: '取消',
					btnClass: 'waves-effect waves-button'
				}
			}
		});
	}
}
//查找数据
function findAction() {
var rows = $("input[name='searchh_id']").val();
console.log(rows);
	$.confirm({
		type: 'dark',
		animationSpeed: 300,
		title: '查询',
		content: $('#myForm').html(),
		buttons: {
			confirm: {
				text: '确认',
				btnClass: 'waves-effect waves-button',
				action: function () {
					$.alert('确认');
					$(".myForm").submit();
					window.location.href = "http://localhost:8080/erpssh/prepupproduct.action?id=" +rows;
				}
			},
			cancel: {
				text: '取消',
				btnClass: 'waves-effect waves-button'
			}
		}
	});
}
</script>
  </body>
</html>
