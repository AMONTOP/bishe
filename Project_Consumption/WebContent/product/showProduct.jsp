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
 	 	.normTbe{border-left:1px solid #ddd;border-top:1px solid #ddd;margin: 0 auto; }
        .normTbe td,.normTbe th{border-bottom: 1px solid #ddd;border-right:1px solid #ddd;padding: 15px;text-align: center;}
        .normTbe input{width: 80%;text-align: center;}
        .wrapper{width: 1140px;padding: 0 20px; margin: 0 auto;clear: both;}
        .hide{display: none;}
        .hideTr{background: #ddd;}
        .pop_box{position: fixed;top: 0;left: 0;right: 0;bottom: 0;z-index: 99999;}
        .pop_box .bg{background: #000;opacity: 0.7;filter:alpha(opacity=70);position: absolute;top:0;left: 0;right: 0;bottom: 0;}
        .pop_box .contentP{position: relative;margin:0 auto;margin-top: 10%; background: #fff;width: 80%;}
        .pop_box .PTit{height: 45px;background: #eee;}
        .pop_box .PTit h3{line-height: 7px;float: left;padding-left: 15px;font-weight: normal;font-size: 16px;}
        .pop_box .PTit a{display: block;width: 45px;line-height: 45px;text-align: center;background: #ddd;float: right;font-size: 20px;}
        .pop_box .PTit a:hover{background: #50abfd;color: #fff;}
        .pop_box .textmian{padding: 15px;}
        .btn_a1{padding-top: 15px; text-align: center;}
        .btn_a1 a{display: inline-block;*display: inline;*zoom: 1;width: 120px;line-height: 45px;background: #50abfd;color: #fff;}
        .btn_a1 .addtr2,.btn_a1 .dtadd{background: #ff9900;}
     </style>
  </head>
  
  <body>
   <script>
   var arr = [];
   </script>
   <form action="findbyNameproduct" method="post" style="position:absolute;top:44px;right:187px;">
	   <p class="columns pull-right search-button">
		    <button class="btn btn-default" type="submit" name="refresh" title="查询" style="padding: 9px;margin-right: 10px;margin-left: -3px;">
		   	 	<i class="glyphicon glyphicon-search icon-search"></i>
		    </button>
	    </p>
	    <p class="columns pull-right search-input">
	   		<input class="form-control" name="product.productName"  type="text" placeholder="请根据货品名称搜索">
	   </p>
   </form>
   
   <div class="mytable">
   
   </div>
   <%-- <div class="pop_box hide">
                    <div class="bg"></div>
                    <div class="contentP">
                        <div class="PTit">
                            <h3>货品物料信息</h3>
                            <a href="javascript:;" class="closepop">x</a>
                        </div>
                        <div class="textmian">
                            <table class="normTbe neijian" cellspacing="0" cellpadding="0" border="0" ;>
                                <thead>
                                <tr>                               
                                    <th>货品名</th>
                                    <th>物料编号</th>
                                    <th>物料名</th>
                                    <th>数量</th>                                    
                                </tr>
                                </thead>
                                <tbody class="tbody2">
                                <c:forEach items='${listProductMaterials}' var='productMaterial'>
	                                <tr>
		                                <td>${productMaterial.product.productName}</td>
		                                <td>${productMaterial.material.materialNo}</td>
		                                <td>${productMaterial.material.materialName}</td>
		                                <td>${productMaterial.quantity}</td>
	                                </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            <div class="btn_a1">
                                <a class="closepop" href="javascript:;">关闭</a>
                            </div>
                        </div>
                    </div>
       </div> --%>
   <p style="text-indent:2em;color:red;background: #fafafa;margin: 0;padding-top:10px;">注意：点击“货品名称”可显示对应组成货品的物料信息！</p>
  <div id="main">
	<div id="toolbar">
		<a class="waves-effect waves-button" href="addPreproduct"><i class="zmdi zmdi-plus"></i> 新增货品</a>
	</div>
	<table id="table"></table>
  </div>

		<c:forEach items="${list}" var="product">
	    	 <script>
	    	 var id = ${product.productId};
	    	 var productNo = "${product.productNo}";
	    	 var productName = "${product.productName}";
	    	 var productCategory = "${product.productCategory.categoryName}";
	    	 var unit = "${product.unit}";
	    	 var spec = "${product.spec}";
	    	 var price = ${product.price};
	    	 var remark = "${product.remark}";
	    	 var closed = "${product.closed}";

	    	 var obj = {
	    	 	product_id : id,
	    	 	product_no : productNo,
	    	 	product_name:productName,
	    	 	product_category:productCategory,
	    	 	unit : unit,
	    	 	spec:spec,
	    	 	price:price,
	    	 	closed:closed,
	    	 	remark:remark
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
		idField: 'product_id',
		sortName: 'product_id',
		sortOrder: 'desc',
		escape: true,
		searchOnEnterKey: true,
		idField: 'systemId',
		maintainSelected: true,
		toolbar: '#toolbar',
		columns: [
			
			{field: 'product_no', title: '货品编号', sortable: false, halign: 'center'},
			{field: 'product_name', title: '货品名称', sortable: false, halign: 'center',formatter:actionFormatter2},
			{field: 'unit', title: '计量单位', sortable: false, halign: 'center'},
			{field: 'product_category', title: '货品类别', sortable: false, halign: 'center'},
			{field: 'spec', title: '规格', sortable: false, halign: 'center'},
			{field: 'price', title: '价格', sortable: false, halign: 'center'},
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
        '<a class="edit ml10" href="prepupproduct?productId='+ row.product_id +'" data-toggle="tooltip" title="Edit"><i class="glyphicon glyphicon-edit"></i></a>　',
        '<a class="remove ml10" href="deleteproduct?productId='+ row.product_id +'" data-toggle="tooltip" title="Remove"><i class="glyphicon glyphicon-remove"></i></a>'
    ].join('');
}

function actionFormatter2(value, row, index){
	return [
      '<a href="javascript:;" class="innerbtn" style="color:blue" data-productid="' + row.product_id + '">' + row.product_name + '</a>'
    ].join('');
}

window.actionEvents = {
    /* 'click .like': function (e, value, row, index) {
        alert('You click like icon, row: ' + JSON.stringify(row));
        console.log(value, row, index);
    }, */
    'click .edit': function (e, value, row, index) {
        /* alert('You click edit icon, row: ' + JSON.stringify(row)); */
        console.log(row.product_id);
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
<script>
$(document).ready(function(){
	/* $("input[name='btSelectItem']").attr("id","selectedRow"); */
	$("input[name='btSelectItem']").attr("name","selectedRow");
	for(var i =0;i<jj.length;i++){
		$("input[name='selectedRow']").eq(i).attr("value",jj[i].product_id);
	}
	$("#table").wrap("<form class='mainform'></form>");
	$(".mainform").attr("action","importExcelproduct");
	$(".mainform").attr("method","post");
	$(".mainform").attr("enctype","multipart/form-data");
	$("#table").after("<input name='productExcel' type='file'/><input type='submit' value='导入'/>"); 
	
});
	
</script>

<script>
          $(function() {
            $('.innerbtn').click(function () {
            	console.log("click1");
            	var url = "showPMproduct?productId=" + $(this).data("productid");
            	$(".mytable").load(url,function(){
            		$('.pop_box').slideDown('400');
            	});  
            });
            $('.closepop').click(function () {
            	console.log("click2");
                $('.pop_box').slideUp('400');
            });
        });
</script>
  </body>
</html>
