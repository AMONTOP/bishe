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
    <link href="resources/plugins/bootstrap-3.3.0/css/bootstrap.min.css?v=2" rel="stylesheet"/>
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
 		.dataform input{
 			border: none;
 			disabled="disabled"
 		}
 		.dataform input:focus{outline: none;}
 		.dataform p{
 		    display: inline-block;
 			width: 110px;
 			font-size: 14px;
 		}
 		.submitcss{
	 		background: #0f7562;
		    color: white;
		    padding: 6px 15px;
 		}
 		
    </style>
</head>

<body>
<script>
    var arr = [];
</script>
 					<div style="background: #fafafa;">
	   					<a href="showListmaterialOutstockBill?id=1" class="topSelect">待审核</a>
					   	<a href="showListmaterialOutstockBill?id=2" class="topSelect">已审核</a>
					   <!-- 	<a href="showListmaterialOutstockBill?id=3" class="topSelect">已完成</a> -->
				   	</div>
 <p style="text-indent:2em;color:red;background: #fafafa;margin:0;padding-top:10px">注意：可点击有绿色方框的“审核未通过”按钮代表还未将该物料加出到二次加工的列表，而不可点击的“审核未通过”则代表已经加出了二次加工列表！</p>
 <p style="text-indent:2em;color:red;background: #fafafa;margin:0">审核过程需要，点击“待审核”进出到物料品质审核，在品质审核中进行审核后，则可完成审核！</p>
<div id="main">
    <div id="toolbar">
        <a class="waves-effect waves-button" href="addPrematerialOutstockBill"><i class="zmdi zmdi-plus"></i> 新增物料出库单</a>
    </div>
    <table id="table"></table>
</div>			


	   
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					确定审核出库？
				</h4>
			</div>
			<div class="modal-body dataform">						
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
				<!-- <button type="button" class="btn btn-primary">
					提交更改
				</button> -->
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>		      
				      
				   	<c:forEach items="${list}" var="materialOutstockBill">
				        <script>
				       	 var id = "${materialOutstockBill.billId}";
				       	 var billNo = "${materialOutstockBill.billNo}";				     
				    	 var fromPrincipal = "${materialOutstockBill.employee.name}";
				    	 var warehousePrincipal = "${materialOutstockBill.mwareHouse.wareNo}";
				    	 var billTime = "${materialOutstockBill.billTime}";
				    	 var newbillTime = billTime.substring(0, 10);
				    	 var materialWhereabouts = "${materialOutstockBill.materialWhereabouts}";
				    	 var billState = "${materialOutstockBill.billState}";
				    	 var auditAt = "${materialOutstockBill.auditAt}";
				    	 var newauditAt = auditAt.substring(0, 10);
				    	 var auditBy = "${materialOutstockBill.auditBy}";
				    	 var materialNo = "${materialOutstockBill.material.materialNo}";
				    	 var materialName = "${materialOutstockBill.material.materialName}";
				    	 var spec = "${materialOutstockBill.material.spec}";
				    	 var cost = "${materialOutstockBill.material.cost}";
						 var flag = "${materialOutstockBill.flag}";
			
				    	 if(billState == 0){
				    	 	billState = "待审核";
				    	 }else if(billState == 1){
				    	 	billState = "已审核";
				    	 }else if(billState == 2){
				    	 	billState = "审核未通过";
				    	 }
				    	/*  else if(billState == 3){
				    	 	billState = "已完成";
				    	 } */
				    	 if(materialWhereabouts == 1){
				    	 	materialWhereabouts = "生产出库";
				    	 }else if(materialWhereabouts == 2){
				    	 	materialWhereabouts = "其他仓库出库";
				    	 }
				    	 if(auditAt == ''){				    		    	
				    	 	newauditAt = "还未审核";
				    	 }
				    	 
				    	 var obj = {
				    	 	id : id,
				    	 	billNo : billNo,
				    	 	fromPrincipal : fromPrincipal,
				    	 	warehousePrincipal : warehousePrincipal,
				    	 	billTime : newbillTime,
				    	 	materialWhereabouts : materialWhereabouts,
				    	 	billState : billState,
				    	 	auditAt : newauditAt,
				    	 	auditBy : auditBy,
				    	 	materialNo : materialNo,
				    	 	materialName : materialName,
				    	 	spec : spec,
				    	 	cost : cost,
				    	 	flag : flag
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
            	{checkbox:true},
                {field: 'billNo', title: '物料出库单编号', sortable: false, halign: 'center',formatter:actionFormatter2},
                {field: 'fromPrincipal', title: '领货人', sortable: false, halign: 'center'},
                {field: 'warehousePrincipal', title: '出库仓库', sortable: false, halign: 'center'},
                {field: 'billTime', title: '创建时间', sortable: false, halign: 'center'},
                {field: 'materialWhereabouts', title: '物料去向', sortable: false, halign: 'center'},
                {field: 'billState', title: '物料出库状态', sortable: false, halign: 'center',formatter:actionFormatter3},
                {field: 'auditAt', title: '审核时间', sortable: false, halign: 'center'},
                {field: 'Button', title: '操作', events:actionEvents,formatter:actionFormatter,halign: 'center'}
            ]
        }).on('all.bs.table', function (e, name, args) {
            $('[data-toggle="tooltip"]').tooltip();
            $('[data-toggle="popover"]').popover();
        });
    });
    function actionFormatter(value, row, index) {
        return [
            /* '<a class="like" href="javascript:void(0)" data-toggle="tooltip" title="Like"><i class="glyphicon glyphicon-heart"></i></a>　', */
            '<a class="edit ml10" href="prepupmaterialOutstockBill?billId='+ row.id +'" data-toggle="tooltip" title="Edit"><i class="glyphicon glyphicon-edit"></i></a>　',
            '<a class="remove ml10" href="deletematerialOutstockBill?billId='+ row.id +'" data-toggle="tooltip" title="Remove"><i class="glyphicon glyphicon-remove"></i></a>'
        ].join('');
    }

	function actionFormatter2(value, row, index){
		return [
	      '<a href="showBybillNomaterialOutstockBill?billNo='+ row.billNo +'" class="innerbtn" style="color:blue" >' + row.billNo + '</a>'
	       ].join('');
	}

	function actionFormatter3(value, row, index){
		if(row.billState == "待审核"){
			return [
				/* '<a href="" class="innerbtn btn btn-primary btn-lg" data-billNo="'+ row.billNo +'" data-toggle="modal" data-target="#myModal" onclick="change(this)">'+ row.billState +'出库</a>' */
				'<a href="oneAlertmaterialOutstockBill?billId='+row.id+'" class="innerbtn btn btn-primary btn-lg">待审核</a>'
			].join('');
		}else if(row.billState == "已审核"){
			return [
				'<span>已审核出库</span>'
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
	function change(e) {
        $.ajax({
        	url:'listAllmaterialOutstockBill?billNo='+$(e).attr("data-billNo"),
        	type:'get',
        	dataType:'json',
        	success:function(data){        		    
        		var jsondata = $.parseJSON(data);
        		console.log(jsondata);
        		$(".dataform").empty();
        		for(var i=0;i<jsondata.length;i++) {
        			if(jsondata[i].billState==2){
        				$(".dataform").append("<p>数量：<input type='text' name='mwareHouseMaterial.quantity' value='"+jsondata[i].quantity+"' /></p><p>物料名称："+jsondata[i].material.materialName+"<input type='hidden' name='mwareHouseMaterial.material.materialId' value='"+jsondata[i].material.materialId+"' /></p><p>物料仓库："+jsondata[i].mwareHouse.wareNo+"<input type='hidden' name='mwareHouseMaterial.mwareHouse.wareId' value='"+jsondata[i].mwareHouse.wareId+"' /></p><p>备注：<input type='text' name='mwareHouseMaterial.remark' value='"+jsondata[i].remark+"' /></p><p>已提交审核</p>");
        			}else{
        				$(".dataform").append("<form class='sendform' action='addTomaterialHouseMaterial' method='post'><input type='hidden' name='materialOutstockBill.billId' value='"+jsondata[i].billId+"' /><p>数量：<input type='text' name='mwareHouseMaterial.quantity' value='"+jsondata[i].quantity+"' /></p><p>物料名称：<span style='display:block'>"+jsondata[i].material.materialName+"</span><input type='hidden' name='mwareHouseMaterial.material.materialId' value='"+jsondata[i].material.materialId+"' /></p><p>物料仓库：<span style='display:block'>"+jsondata[i].mwareHouse.wareNo+"</span><input type='hidden' name='mwareHouseMaterial.mwareHouse.wareId' value='"+jsondata[i].mwareHouse.wareId+"' /></p><p>备注：<input type='text' name='mwareHouseMaterial.remark' value='"+jsondata[i].remark+"' /></p><input type='submit' value='提交审核' class='submitcss'></form>");
        			}	    
			    }  
        		
        	}
        });
    }
  $(document).ready(function(){
	/* $("input[name='btSelectItem']").attr("id","selectedRow"); */
	$("input[name='btSelectItem']").attr("name","selectedRow");
	$("a[data-flag='true']").css("pointer-events","none");
	$("a[data-flag='true']").removeClass("innerbtn btn btn-primary btn-lg");
	for(var i =0;i<jj.length;i++){
		$("input[name='selectedRow']").eq(i).attr("value",jj[i].id);
	}
	$("#table").wrap("<form class='mainform'></form>");
	$(".mainform").attr("action","export2ExcelmaterialOutstockBill");
	$("#table").after("<input type='submit' value='导出到excel'/>"); 
	
});

</script>

</body>
</html>
