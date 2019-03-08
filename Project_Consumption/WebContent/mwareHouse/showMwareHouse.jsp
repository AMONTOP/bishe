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
        .pop_box{position: absolute;top: 0;left: 0;right: 0;bottom: 0;z-index: 99999;}
        .pop_box .bg{background: #000;opacity: 0.7;filter:alpha(opacity=70);position: absolute;top:0;left: 0;right: 0;bottom: 0;    height: 849px;}
        .pop_box .contentP{position: relative;margin:0 auto;margin-top: 2%; background: #fff;width: 80%;}
        .pop_box .PTit{height: 45px;background: #eee;}
        .pop_box .PTit h3{line-height: 7px;float: left;padding-left: 15px;font-weight: normal;font-size: 16px;}
        .pop_box .PTit a{display: block;width: 45px;line-height: 45px;text-align: center;background: #ddd;float: right;font-size: 20px;}
        .pop_box .PTit a:hover{background: #50abfd;color: #fff;}
        .pop_box .textmian{padding: 15px;}
        .btn_a1,.btn_a2{padding-top: 15px; text-align: center;}
        .btn_a1 a,.btn_a2 a{display: inline-block;*display: inline;*zoom: 1;width: 120px;line-height: 45px;background: #50abfd;color: #fff;}
        .btn_a1 .addtr2,.btn_a1 .dtadd{background: #ff9900;}
         .rk-num{font-size: 17px;}
     </style>
   
  </head>
  <body>
  <script>
   var arr = [];
   </script>
   <form action="findbyNamewareHouse" method="post" style="position:absolute;top:19px;right:187px;">
	   <p class="columns pull-right search-button">
		    <button class="btn btn-default" type="submit" name="refresh" title="查询" style="padding: 9px;margin-right: 10px;margin-left: -3px;">
		   	 	<i class="glyphicon glyphicon-search icon-search"></i>
		    </button>
	    </p>
	    <p class="columns pull-right search-input">
	   		<input class="form-control" name="wareHouse.wareHouseName"  type="text" placeholder="搜索">
	   </p>
   </form>
   
   	<div class="pop_box hide">
                    <div class="bg"></div>
                    <div class="contentP">
                        <div class="PTit">
                            <h3>仓库详情</h3>
                            <a href="javascript:;" class="closepop">x</a>
                        </div>
                        <div class="textmian">
                        	<p class="rk-num">仓库名称：</p>
                            <table class="normTbe neijian" cellspacing="0" cellpadding="0" border="0" ;>
                                <thead>
                                <tr>                                                                 
                                    <th>仓库货品</th>
                                    <th>货品规格</th>
                                    <th>货品数量</th>
                                    <th>货品单价(元)</th>                                                           
                                </tr>
                                </thead>
                                <tbody class="tbody2">
                                
                                </tbody>
                            </table>
                             <div class="btn_a2">
                                <a class="closepop" href="addNewwareHouseMaterial">新增仓库货品</a>
                            </div>
                            <div class="btn_a1">
                                <a class="closepop" href="javascript:;">关闭</a>
                            </div>
                        </div>
                    </div>
       </div>		
                
   <div id="main">
	<div id="toolbar">
		<a class="waves-effect waves-button" href="addPrematerialHouse">
		<i class="zmdi zmdi-plus"></i> 新增仓库</a>
	</div>
	
	<table id="table"></table>
  </div>			 
				  
				  <c:forEach items="${list2}" var="mwareHouseMaterial">
				  		<script>
				  			var materialName="${mwareHouseMaterial.material.materialName}";
				  			/* console.log(materialName); */
				  		</script>
				  </c:forEach>
				   	<c:forEach items="${list}" var="wareHouse">
						   	<script>
						   	 var id = "${wareHouse.wareId}";
					    	 var wareNo = "${wareHouse.wareNo}";					   
					    	 var wareCapacity = "还可存放"+"${wareHouse.wareCapacity}"+"件";
					    	 var materialName = "${wareHouse.material.materialName}";
					    	 var address = "${wareHouse.address}";
					    	 var empId = "${wareHouse.employee.name}";					    
					    	 var obj = {
					    	 	wareHouse_id : id,
					    	 	wareNo : wareNo,
					    	 	wareCapacity : wareCapacity,
					    	 	materialName : materialName,
					    	 	address : address,
					    	 	empName : empId
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
		idField: 'wareHouse_id',
		sortName: 'wareHouse_id',
		sortOrder: 'desc',
		escape: true,
		searchOnEnterKey: true,
		idField: 'systemId',
		maintainSelected: true,
		toolbar: '#toolbar',
		columns: [
			{field: 'wareNo', title: '仓库名', sortable: false, halign: 'center',formatter:actionFormatter2},
			{field: 'wareCapacity', title: '仓库容量', sortable: false, halign: 'center'},
			/* {field: 'materialName', title: '仓库货品', sortable: false, halign: 'center'}, */
			{field: 'address', title: '仓库地址', sortable: false, halign: 'center'},
			{field: 'empName', title: '仓库负责人', sortable: false, halign: 'center'},
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
	        '<a class="edit ml10" href="prepupwareHouse?wareId='+ row.wareHouse_id +'" data-toggle="tooltip" title="Edit"><i class="glyphicon glyphicon-edit"></i></a>　',
	        '<a class="remove ml10" href="deletewareHouse?wareId='+ row.wareHouse_id +'" data-toggle="tooltip" title="Remove"><i class="glyphicon glyphicon-remove"></i></a>'
	    ].join('');
	}
    
}
function actionFormatter2(value, row, index){
	return [
      '<span data-href="testmaterialHouseMaterial?wareId='+ row.wareHouse_id +'" class="innerbtn" style="color:blue;cursor:pointer">' + row.wareNo + '</span>'
      //
       ].join('');
}
/* function actionFormatter2(value, row, index){
	return [
      '<a href="javascript:;" class="innerbtn" style="color:blue" data-wareHousename="' + row.wareHouse_name + '" data-contact="' + row.contact + '" data-contactphone="' + row.contact_phone + '" data-address = "' + row.address + '" data-postcode = "' + row.postcode + '" data-corporation = "' + row.corporation + '" data-telephone = "' + row.telephone + '" data-email = "' + email + '">' + row.wareHouse_name + '</a>'
    ].join('');
} */

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
 $(function(){ 
	/* $(document).on('click','span[class="innerbtn"]',function(){ */
	$("span[class='innerbtn']").click(function(e){
	$.ajax({
        	url:$(e.target).attr("data-href"),
        	type:"get",
        	dataType:'json',
        	success:function(data){
        		var jsondata = $.parseJSON(data);
        		console.log(jsondata);
        		/* console.log($(e.target).attr("data-href")); */
        		$(".rk-num").html(" ");
        		$(".tbody2").html(" ");
        		if(jsondata.length == 0){
        			$(".rk-num").append("该仓库还没货品记录");
        		}else{
        		$(".rk-num").append("<span>"+jsondata[0][4]+"</span>");
        			for(var i=0;i<jsondata.length;i++){
	        			$(".tbody2").append("<tr><td></td><td></td><td></td><td></td></tr>");
	        			var trs = $("table").find("tr").eq(i+1);        		
	            		trs.find("td").eq(0).html(jsondata[i][1]);
	            		trs.find("td").eq(1).html(jsondata[i][0]);
	            		trs.find("td").eq(2).html(jsondata[i][5]);
	            		trs.find("td").eq(3).html(jsondata[i][2]); 
        			} 
        		}
        		     
	                $('.pop_box').slideDown('400');	    
	            	$('.closepop').click(function () {
	                	$('.pop_box').slideUp('400');
	                	
	            	});
	        	
        	}
        	});

	});
	});
	
        
	</script>
  </body>
</html>
