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
<script>
	function randomNumber(){
		var now = new Date();
		var hour = now.getHours();
		var minutes = now.getMinutes();
		var seconds = now.getSeconds();
		console.log(hour);
		return "UL" + hour.toString() + minutes.toString() + seconds.toString() + (Math.round(Math.random() * 4)).toString();
	};
	window.onload = function(){
    	document.getElementById("useNo").value = randomNumber();
	};
</script>
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
                            <h3>审核未通过</h3>
                            <a href="javascript:;" class="closepop">x</a>
                        </div>
                        <div class="textmian">
                        	<p>审核未通过需要录入二次加工货品表中，等候相关人员进行二次加工货品</p>
                        	
                       		<form action="test2uselessProduct" method="post">				    				   							    
							      <input type="hidden" name="uselessProduct.useNo" id="useNo"/>			        
							      <input type="hidden" name="uselessProduct.productInstockBill.billId" id="billId" />							  			      							        
							      <input type="hidden" name="uselessProduct.productCheck.productCheckId" id="productCheckId"/>
							      <input type="hidden" name="uselessProduct.productCheck.checkItem" id="checkItem"/>							      				    
							      <div style="padding:3px;">				     
							        <input type="submit" value="录入二次加工列表"/>
							      </div>
				    		</form>
                            <div class="btn_a1">
                                <a class="closepop" href="javascript:;">关闭</a>
                            </div>
                        </div>
                    </div>
       </div>
 		   				      
				      
	<c:forEach items="${list}" var="productCheck">
                        		<script>
                        			var productCheckId = "${productCheck.productCheckId}";
                        			var billId = "${productCheck.productInstockBill.billId}";
                        			var checkItem = "${productCheck.checkItem}";
                        			var bill = document.getElementById("billId");
                        			bill.value = billId;
                        			var productCheck = document.getElementById("productCheckId");
                        			productCheck.value = productCheckId;
                        			var check = document.getElementById("checkItem");
                        			check.value = checkItem;
                        		</script>
    </c:forEach>			  
<script>
          
            $('.pop_box').slideDown('400');
           
            $('.closepop').click(function () {
                $('.pop_box').slideUp('400');            
            });
      /*   }); */
</script>


</body>
</html>
