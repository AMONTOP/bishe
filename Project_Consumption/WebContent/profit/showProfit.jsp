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
 <script src="resources/plugins/jquery.1.12.4.min.js"></script>
 <script src="resources/plugins/bootstrap-3.3.0/js/bootstrap.min.js"></script>
<script src="resources/plugins/bootstrap-table-1.11.0/bootstrap-table.min.js"></script>
<script src="resources/plugins/bootstrap-table-1.11.0/locale/bootstrap-table-zh-CN.min.js"></script>
<script src="resources/plugins/waves-0.7.5/waves.min.js"></script>
<script src="resources/plugins/jquery-confirm/jquery-confirm.min.js"></script>
<script src="resources/plugins/select2/js/select2.min.js"></script>
<script src="resources/js/common.js"></script>   
  </head>
  <body>
 
   <!-- <form action="findbyNamesalary" method="post" style="position:absolute;top:19px;right:187px;">
	   <p class="columns pull-right search-button">
		    <button class="btn btn-default" type="submit" name="refresh" title="查询" style="padding: 9px;margin-right: 10px;margin-left: -3px;">
		   	 	<i class="glyphicon glyphicon-search icon-search"></i>
		    </button>
	    </p>
	    <p class="columns pull-right search-input">
	   		<input class="form-control" name="salary.salaryName"  type="text" placeholder="搜索">
	   </p>
   </form> -->
   
   <div id="main">
	<div id="toolbar">
		<a class="waves-effect waves-button" href="addPresalary"><i class="zmdi zmdi-plus"></i> 新增订单盈利信息</a>
	</div>
	<table id="table"></table>
  </div>			 
  <script>
  	var arr2=[];
  	var arr=[];
    var sarr = []; 
    var productArr = [];
    var materialArr = [];
  	var sum=0;
  	var sum2=0;
  	var sum3 = 0;
  </script>
				  <c:forEach items="${list2}" var="salary" varStatus="index">
				  	<script>
				  	 		var startDate = "${salary.projectTask.startDate}";
					    	 var endDate = "${salary.projectTask.endDate}";
					    	 var money = "${salary.money}";
					    	 var state = "${salary.salaryState}";
					    	 var sdate = new Date(startDate);
						     var now = new Date(endDate);
						     var days = now.getTime()-sdate.getTime();
						     var day = parseInt(days/(1000*60*60*24));
						     console.log(day);
					    	 var totalMoney = 	money*day;
					    	 arr.push(parseInt(totalMoney));	    
				  	</script>
				  </c:forEach>
				  <script>
				  console.log(arr);
				  	for(var m=0;m<arr.length;m++){
				  		sum+=arr[m];
				  	}
				  	//人工成本
				  	console.log(sum);
				  </script>
				  <c:forEach items="${list3}" var="orderBillProduct" varStatus="index">
				  	<script>
				  			var billId = "${orderBillProduct.orderBill.billId}";
				  			var billNo = "${orderBillProduct.orderBill.billNo}";
				  			var productId = "${orderBillProduct.product.productId}";
				  	 		var productName = "${orderBillProduct.product.productName}";
					    	var quantity = "${orderBillProduct.quantity}";
					    	var price = "${orderBillProduct.product.price}"; 
					    	var totalproduct = parseInt(price) * parseInt(quantity);
					    	sum2 += totalproduct;
					    	productArr.push(productId);
				  	</script>
				  </c:forEach>
				  <script>
				  	//售出价格
				  	console.log(sum2);
				  	for(var i2=0;i2<productArr.length;i2++){
				  		$.ajax({
				  			url:'getMaterialproductMaterial?productId='+productArr[i2],
				  			dataType:'json',
				  			asycn:false,
				  			success:function(data){
				  				var jsondata = $.parseJSON(data);
								for(var j=0;j<jsondata.length;j++){
									var cost = jsondata[j].material.cost;
									var quantity =  jsondata[j].quantity;
									var totalmaterial = cost*quantity;
									materialArr.push(totalmaterial);	
								}	
				  			}
				  		})
				  		
				  	}

					  	setTimeout(function(){
						  	for(var j2=0;j2<materialArr.length;j2++){
						  		sum3+=materialArr[j2];
						  	}
						  	console.log(materialArr);
				  			console.log("物料成本"+sum3);
				  			var profitMoney = sum2 - sum - sum3;
				  			var obj = {
				  				id:billId,
				  				billNo :billNo,					   
					    	 	sum : sum,
					    	 	sum2 : sum2,
					    	 	sum3 :sum3,
					    	 	profitMoney : profitMoney
						    };
						   
						    arr2.push(obj);
						    var jsonlist = JSON.stringify(arr2);	
						    var jj = JSON.parse(jsonlist);
 console.log(jj);
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
			{field: 'billNo', title: '订单编号', sortable: false, halign: 'center'},
			{field: 'sum2', title: '售出价', sortable: false, halign: 'center'},
			{field: 'sum', title: '人工成本', sortable: false, halign: 'center'},			
			{field: 'sum3', title: '物料成本', sortable: false, halign: 'center'},
			{field: 'profitMoney', title: '盈利金额', sortable: false, halign: 'center'},
			{field: 'Button', title: '操作', formatter:actionFormatter,halign: 'center'},			
		]
	}).on('all.bs.table', function (e, name, args) {
		$('[data-toggle="tooltip"]').tooltip();
		$('[data-toggle="popover"]').popover();  
	});
});
function actionFormatter(value, row, index) {
    return [
        /* '<a class="like" href="javascript:void(0)" data-toggle="tooltip" title="Like"><i class="glyphicon glyphicon-heart"></i></a>　', */
        '<a class="edit ml10" href="prepupsalary?sid='+ row.id +'" data-toggle="tooltip" title="Edit"><i class="glyphicon glyphicon-edit"></i></a>　',
        '<a class="remove ml10" href="deletesalary?sid='+ row.id +'" data-toggle="tooltip" title="Remove"><i class="glyphicon glyphicon-remove"></i></a>'
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
 					  
					  	},1000);
					  	
				  </script>	    	    
					 
		    	   

    
 
  </body>
</html>
