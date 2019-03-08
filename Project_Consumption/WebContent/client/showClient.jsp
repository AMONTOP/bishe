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
        .export-excel{
	 		width: 141px;
		    height: 30px;
		    background: #009f9d;
		    border: none;
		    color: white;
		    font-size: 14px;
		    border-radius: 6px;
		    margin-top: 20px;
    	}
     </style>
   
  </head>
  <body>
  <script>
   var arr = [];
   </script>
   <form action="findbyNameclient" method="post" style="position:absolute;top:19px;right:187px;">
	   <p class="columns pull-right search-button">
		    <button class="btn btn-default" type="submit" name="refresh" title="查询" style="padding: 9px;margin-right: 10px;margin-left: -3px;">
		   	 	<i class="glyphicon glyphicon-search icon-search"></i>
		    </button>
	    </p>
	    <p class="columns pull-right search-input">
	   		<input class="form-control" name="client.clientName"  type="text" placeholder="请根据客户名进行搜索">
	   </p>
   </form>
   
   			<div class="pop_box hide">
                    <div class="bg"></div>
                    <div class="contentP">
                        <div class="PTit">
                            <h3>供应商信息详情</h3>
                            <a href="javascript:;" class="closepop">x</a>
                        </div>
                        <div class="textmian">
                            <table class="normTbe neijian" cellspacing="0" cellpadding="0" border="0" ;>
                                <thead>
                                <tr>                               
                                    <th>企业名称</th>
                                    <th>联系人</th>
                                    <th>联系电话</th>
                                    <th>地址</th>
                                    <th>邮编</th>    
                                    <th>邮箱</th>
                                    <th>法人代表</th>
                                    <th>企业电话</th>                               
                                </tr>
                                </thead>
                                <tbody class="tbody2">
                                <tr>                                  
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td> 
                                    <td></td>  
                                    <td></td> 
                                    <td></td> 
                                    <td></td>                                                                 
                                </tr>
                                </tbody>
                            </table>
                            <div class="btn_a1">
                                <a class="closepop" href="javascript:;">关闭</a>
                            </div>
                        </div>
                    </div>
       </div>
                
   <div id="main">
	<div id="toolbar">
		<a class="waves-effect waves-button" href="/Project_Consumption/client/addClient.jsp?empId=<%= ActionContext.getContext().getSession().get("empId") %>">
		<i class="zmdi zmdi-plus"></i> 新增客户</a>
	</div>
	
	<table id="table"></table>
  </div>			 
				  
				  
				   	<c:forEach items="${list}" var="client">
						   	<script>
						   	 var id = "${client.clientId}";
					    	 var clientName = "${client.clientName}";					   
					    	 var contact = "${client.contact}";
					    	 var contactPhone = "${client.contactPhone}";
					    	 var address = "${client.address}";
					    	 var postcode = "${client.postcode}";
					    	 var email = "${client.email}";
					    	 var corporation = "${client.corporation}";
					    	 var telephone = "${client.telephone}";
					    	 var createAt = "${client.createAt}";
					    	 var newDate = createAt.substring(0, 10);
					    	 console.log(newDate);
					    	 var createById = "${client.employee.empId}";
					    	 var createBy = "${client.employee.name}";
					    	 var userName = "${client.employee.userName}";
					    	 var name = "${client.employee.name}";
					    	 var sex = "${client.employee.sex}";
					    	 var mobile = "${client.employee.mobile}";
					    	 /* var email = "${client.employee.email}"; */
					    	 
					    	 var obj = {
					    	 	client_id : id,
					    	 	client_name : clientName,
					    	 	contact : contact,
					    	 	contact_phone : contactPhone,
					    	 	address : address,
					    	 	postcode : postcode,
					    	 	email : email,
					    	 	corporation : corporation,
					    	 	telephone : telephone,
					    	 	create_at : newDate,
					    	 	create_by : createBy,
					    	 	create_by_id : createById,
					    	 	userName : userName,
					    	 	name : name,
					    	 	sex : sex,
					    	 	mobile : mobile
					    	 	/* email : email */
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
		idField: 'client_id',
		sortName: 'client_id',
		sortOrder: 'desc',
		escape: true,
		searchOnEnterKey: true,
		idField: 'systemId',
		maintainSelected: true,
		toolbar: '#toolbar',
		columns: [
			{checkbox:true},
			{field: 'client_name', title: '客户名称', sortable: false, halign: 'center',formatter:actionFormatter2},
			{field: 'contact', title: '联系人', sortable: false, halign: 'center'},
			{field: 'contact_phone', title: '联系电话', sortable: false, halign: 'center'},
			{field: 'create_at', title: '创建日期', sortable: false, halign: 'center'},
			{field: 'create_by', title: '创建人', sortable: false, halign: 'center'},
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
        '<a class="edit ml10" href="prepupclient?clientId='+ row.client_id +'" data-toggle="tooltip" title="Edit"><i class="glyphicon glyphicon-edit"></i></a>　',
        '<a class="remove ml10" href="deleteclient?clientId='+ row.client_id +'" data-toggle="tooltip" title="Remove"><i class="glyphicon glyphicon-remove"></i></a>'
    ].join('');
}

function actionFormatter2(value, row, index){
	return [
      '<a href="javascript:;" class="innerbtn" style="color:blue" data-clientname="' + row.client_name + '" data-contact="' + row.contact + '" data-contactphone="' + row.contact_phone + '" data-address = "' + row.address + '" data-postcode = "' + row.postcode + '" data-corporation = "' + row.corporation + '" data-telephone = "' + row.telephone + '" data-email = "' + row.email + '">' + row.client_name + '</a>'
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
		$("input[name='selectedRow']").eq(i).attr("value",jj[i].client_id);
	}
	$("#table").wrap("<form class='mainform'></form>");
	$(".mainform").attr("action","export2Excelclient");
	$("#table").after("<input type='submit' class='export-excel' value='导出到excel'/>"); 
});
</script>

<script>
          $(function() {
            $('.innerbtn').click(function () {          	 
            	$(".tbody2 td:nth-child(1)").html($(this).data("clientname")); 
            	$(".tbody2 td:nth-child(2)").html($(this).data("contact")); 
            	$(".tbody2 td:nth-child(3)").html($(this).data("contactphone")); 
            	$(".tbody2 td:nth-child(4)").html($(this).data("address")); 
            	$(".tbody2 td:nth-child(5)").html($(this).data("postcode")); 
            	$(".tbody2 td:nth-child(6)").html($(this).data("email")); 
            	$(".tbody2 td:nth-child(7)").html($(this).data("corporation")); 
            	$(".tbody2 td:nth-child(8)").html($(this).data("telephone")); 
            	
                $('.pop_box').slideDown('400');
            });
            $('.closepop').click(function () {
                $('.pop_box').slideUp('400');
            });
        });
</script>

  </body>
</html>
