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
    <script src="resources/plugins/jquery.1.12.4.min.js"></script>
<script src="resources/plugins/bootstrap-3.3.0/js/bootstrap.min.js"></script>
<script src="resources/plugins/bootstrap-table-1.11.0/bootstrap-table.min.js"></script>
<script src="resources/plugins/bootstrap-table-1.11.0/locale/bootstrap-table-zh-CN.min.js"></script>
<script src="resources/plugins/waves-0.7.5/waves.min.js"></script>
<script src="resources/plugins/jquery-confirm/jquery-confirm.min.js"></script>
<script src="resources/plugins/select2/js/select2.min.js"></script>

<script src="resources/js/common.js"></script>
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
        .rk-num{
        font-size: 17px;
        }
    </style>
</head>

<body>
<script>
    var arr = [];
</script>
 				
  
 <div class="pop_box hide">
                    <div class="bg"></div>
                    <div class="contentP">
                        <div class="PTit">
                            <h3>出库单相关货品</h3>
                            <a href="javascript:;" class="closepop">x</a>
                        </div>
                        <div class="textmian">
                       		<p class="rk-num">出库单编号：</p>
                            <table class="normTbe neijian" cellspacing="0" cellpadding="0" border="0" ;>
                                <thead>
                                <tr>                               
                                    <th>货品编号</th>
                                    <th>货品名称</th>
                                    <!-- <th>数量</th> -->
                                    <th>规格</th>
                                    <th>价钱</th>    
                                                                
                                </tr>
                                </thead>
                                <tbody class="tbody2">
                                
                                </tbody>
                            </table>
                            <div class="btn_a1">
                                <a class="closepop" href="javascript:;">关闭</a>
                            </div>
                        </div>
                    </div>
       </div>
 		   				      
				      
				   	<c:forEach items="${list}" var="productOutstockBill">
				        <script>
				       	 var id = "${productOutstockBill.billId}";
				       	 var billNo = "${productOutstockBill.billNo}";				     
				    	 var fromPrincipal = "${productOutstockBill.employee.name}";
				    	 var warehousePrincipal = "${productOutstockBill.wareHouse.wareNo}";
				    	 var billTime = "${productOutstockBill.billTime}";
				    	 var productWhereabouts = "${productOutstockBill.productWhereabouts}";
				    	 var billState = "${productOutstockBill.billState}";
				    	 var auditAt = "${productOutstockBill.auditAt}";
				    	 var auditBy = "${productOutstockBill.auditBy}";
				    	 var productNo = "${productOutstockBill.product.productNo}";
				    	 var productName = "${productOutstockBill.product.productName}";
				    	 var spec = "${productOutstockBill.product.spec}";
				    	 var price = "${productOutstockBill.product.price}";
				    	 if(billState == 1){
				    	 	billState = "待审核";
				    	 }else if(billState == 2){
				    	 	billState = "已审核";
				    	 }
				    	/*  else if(billState == 3){
				    	 	billState = "已完成";
				    	 } */
				    	 if(productWhereabouts == 1){
				    	 	productWhereabouts = "生产出库";
				    	 }else if(productWhereabouts == 2){
				    	 	productWhereabouts = "其他仓库出库";
				    	 }
				    	 if(auditAt == ''){				    		    	
				    	 	auditAt = "还未审核";
				    	 }
				    	 
				    	 var obj = {
				    	 	id : id,
				    	 	billNo : billNo,
				    	 	fromPrincipal : fromPrincipal,
				    	 	warehousePrincipal : warehousePrincipal,
				    	 	billTime : billTime,
				    	 	productWhereabouts : productWhereabouts,
				    	 	billState : billState,
				    	 	auditAt : auditAt,
				    	 	auditBy : auditBy,
				    	 	productNo : productNo,
				    	 	productName : productName,
				    	 	spec : spec,
				    	 	price : price
				    	 };
				    	 arr.push(obj);
				       </script>
				      </c:forEach>
<script>
    var jsonlist = JSON.stringify(arr);
    var jj = JSON.parse(jsonlist);
</script>
<!-- <a href="javascript:;" class="innerbtn" style="color:blue"> aaa </a> -->
<script>
          /* $(function() {
            $('.innerbtn').click(function () {
            	console.log(jj);      */
            	$(".rk-num").append("<span>"+jj[0].billNo+"</span>");
            	for(var i=0;i<jj.length;i++){
            		$(".tbody2").append("<tr><td></td><td></td><td></td><td></td></tr>");
            		var trs = $("table").find("tr").eq(i+1);
            		trs.find("td").eq(0).html(jj[i].productNo);
            		trs.find("td").eq(1).html(jj[i].productName);
            		trs.find("td").eq(2).html(jj[i].spec);
            		trs.find("td").eq(3).html(jj[i].price);
            	}     	         
                $('.pop_box').slideDown('400');
           /*  }); */
            $('.closepop').click(function () {
                $('.pop_box').slideUp('400');
                setTimeout(
	                function(){
	               	 window.location.href = "show2productOutstockBill"; 
	                },300
                );
                
            });
      /*   }); */
</script>


</body>
</html>
