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
                            <h3>是否确定审核出库通过？</h3>
                            <a href="javascript:;" class="closepop">x</a>
                        </div>
                        <div class="textmian">
                        	<p>审核中需要进行货品品质检测</p>
                        	<c:forEach items="${list}" var="productOutstockBill" varStatus="status">
                       		<form action="outwareHouseProduct" method="post"  id="myform${status.index}" style="text-align: center;">	
                       		 	  <input type="hidden" name="productOutstockBill.billId" value="${productOutstockBill.billId}" />			        			    				   							    
							      <input type="hidden" name="wareHouseProduct.product.productId" value="${productOutstockBill.product.productId}" />
							      <input type="text" value="${productOutstockBill.product.productName}" readOnly/>			        
							      <input type="hidden" name="wareHouseProduct.wareHouse.wareId" value="${productOutstockBill.wareHouse.wareId}" />							  			      							        
							      <input type="hidden" name="wareHouseProduct.flag" value="0"/>
							      <input type="hidden" name="wareHouseProduct.quantity" value="-${productOutstockBill.quantity}"/>
							      <input type="hidden" id="aDate${status.index}" name="productOutstockBill.auditAt" value=""/>							      				    
							      <!-- <div style="padding:3px;">				     
							        <input type="submit" value="检测"/>
							      </div> -->
							      <input type="button" value="确认" id='saveR${status.index}' style="width: 88px;height: 29px;background: #50abfd;border: none;color: white;font-size: 15px;"/>	
				    		</form>
				    		</c:forEach>
                            <div class="btn_a1">
                                <a class="closepop" href="javascript:;">关闭</a>
                            </div>
                        </div>
                    </div>
       </div>
 		   				      
				      
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.form/4.2.1/jquery.form.min.js"></script>				  
<script>
for(var i=0;i<$("form").length;i++){
 		var mydateInput = document.getElementById("aDate"+i);
				  var date = new Date();
				  var dateString = date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate();
				  mydateInput.value = dateString;
     		(function(i){
     			$("#saveR"+i).click(
     				function(){
     				$.ajax({
						url:"outwareHouseProduct",
						type:'post',
						asycn:false,
						data:$("#myform"+i).serialize(),
						dataType:'json',
							success:function(d4){
								var jsondata3 = $.parseJSON(d4);
								console.log(jsondata3);									
							}
					});	
					$("#saveR"+i).css({"background-color":"gray","color":"white","pointer-events": "none"});
				 		       			 
		         });
		        })(i);
     		}
          
		  
            $('.pop_box').slideDown('400');
           
            $('.closepop').click(function () {
                $('.pop_box').slideUp('400');            
            });
      /*   }); */
</script>


</body>
</html>
