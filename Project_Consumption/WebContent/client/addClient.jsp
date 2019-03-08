<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.text.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>添加消费记录</title>
<link rel="stylesheet" type="text/css" href="/Project_Consumption/css/easyui/easyui.css" />
<link rel="stylesheet" type="text/css" href="/Project_Consumption/css/easyui/icon.css" />
<link rel="stylesheet" type="text/css" href="/Project_Consumption/css/base.css" />
<script type="text/javascript" src="/Project_Consumption/js/easyui/jquery-1.11.2.js"></script>
<script type="text/javascript" src="/Project_Consumption/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="/Project_Consumption/js/easyui/easyui-lang-zh_CN.js"></script>
<script src="/Project_Consumption/js/Popt.js"></script>
<script src="/Project_Consumption/js/cityJson.js"></script>
<script src="/Project_Consumption/js/citySet.js"></script>
<script type="text/javascript">
 	  $(function(){
		  $("form").submit(function(){
			  var consume_name = $.trim($("#clientName").val());
			  if(consume_name == ""){
				  alert("请输入客户名称！");
				  return false;
			  }
			  if(consume_name.length < 2 || consume_name.length > 20){
				  alert("客户名称长度必须在2到20之间！");
				  return false;
			  }
			  var contact = $.trim($("#contact").val());
			  if(contact == ""){
				  alert("请输入联系人名称！");
				  return false;
			  }
		
			  var contactPhone = $.trim($("#contactPhone").val());
			  if(contactPhone.length != 11){
				  alert("请输入11位数的手机号码！");
				  return false;
			  }
			  return true;
		  });
	  });
	  
	</script>
	<style>
		._citys { width: 450px; display: inline-block; border: 2px solid #eee; padding: 5px; position: relative;background: white; }
        ._citys span { color: #56b4f8; height: 15px; width: 15px; line-height: 15px; text-align: center; border-radius: 3px; position: absolute; right: 10px; top: 10px; border: 1px solid #56b4f8; cursor: pointer; }
        ._citys0 { width: 100%; height: 34px; display: inline-block; border-bottom: 2px solid #56b4f8; padding: 0; margin: 0; }
        ._citys0 li { display: inline-block; line-height: 34px; font-size: 15px; color: #888; width: 80px; text-align: center; cursor: pointer; }
        .citySel { background-color: #56b4f8; color: #fff !important; }
        ._citys1 { width: 100%; display: inline-block; padding: 10px 0; }
        ._citys1 a { width: 83px; height: 35px; display: inline-block; background-color: #f5f5f5; color: #666; margin-left: 6px; margin-top: 3px; line-height: 35px; text-align: center; cursor: pointer; font-size: 13px; overflow: hidden; }
        ._citys1 a:hover { color: #fff; background-color: #56b4f8; }
        .AreaS { background-color: #56b4f8 !important; color: #fff !important; }
	</style>
  </head>  
  <body>
		<div id="container" class="easyui-layout" style="width:1024px;height:800px;padding:1px;margin-left:auto; margin-right:auto;">
				<div id="mainbody" style="height:90%">
				  <center>
				    <h1 style="color:skyblue;">添加客户资料</h1>
				    <div style="padding:3px;color:red;">
				      ${msg}
				    </div>
				    <form action="saveclient"  method="post">
				      <div style="padding:3px;">
				        <label for="clientName">客户姓名：</label>
				        <input id="clientName" type="text" name="client.clientName" value="${client.clientName}" class="easyui-validatebox textbox" data-options="required:true,validType:'length[2,20]'"/>
				      </div>
				      <div style="padding:3px;">
				        <label for="contact">联系人：</label>
				        <input id="contact" type="text" name="client.contact" value="${client.contact}" class="easyui-validatebox textbox" data-options="required:true,validType:'length[2,5]'"/>
				      </div>
				      <div style="padding:3px;">
				        <label for="contactPhone">联系电话：</label>
				        <input id="contactPhone" type="text" name="client.contactPhone" value="${client.contactPhone}" class="easyui-validatebox textbox" data-options="required:true,validType:'phoneRex'"/>
				      </div>
				     <div style="padding:3px;">
				        <label for="name">创建人：</label>
				        <input id="name" type="text" name="client.employee.name" value="${name}" class="easyui-validatebox textbox" data-options="required:true" readOnly/>
				      </div>
				      <%
						SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
						String date= format.format(new Date());
					  %>
					  <div style="padding:3px;">
					  		<label for="client.address">地址：</label>
						    <input  type="text" id="city" class="easyui-validatebox textbox validatebox-text" /><br/>
						    <label for="client.address2">详细地址：</label>
						    <input  type="text" id="city2"  class="easyui-validatebox textbox validatebox-text" />
						    <input id="address" type="hidden" name="client.address"/>
					  </div>
					  <div style="padding:3px;">
				        <label for="client.postcode">邮编：</label>
				        <input id="client.postcode" type="text" name="client.postcode" value="${client.postcode}" class="easyui-validatebox textbox" data-options="required:true,validType:'zipCode'"/>
				      </div>					      	
				      <div style="padding:3px;">
				        <label for="client.email">邮箱：</label>
				        <input id="client.email" type="text" name="client.email" value="${client.email}" class="easyui-validatebox textbox" data-options="required:true,validType:'email'"/>
				      </div>
				      <div style="padding:3px;">
				        <label for="client.corporation">变更法人：</label>
				        <input id="client.corporation" type="text" name="client.corporation" value="${client.corporation}" class="easyui-validatebox textbox"/>
				      </div>
				      <div style="padding:3px;">
				        <label for="client.telephone">服务热线：</label>
				        <input id="client.telephone" type="text" name="client.telephone" value="${client.telephone}" class="easyui-validatebox textbox" data-options="required:true,validType:'hotphone'"/>
				      </div>		      				 
				      
					  <input type="hidden" id="empId" name="client.employee.empId" value="${empId}"/>
				      <!-- 创建人 -->
				      <input type="hidden" id="createAt" name="client.createAt" value="<%=date%>"/>
				      <!-- 自动生成时间 -->
				      <input type="hidden" id="clientId" name="client.clientId" value="${sessionScope.session_client.client_id}"/>
				      
				      <div style="padding:3px;">
				        <input type="reset" value="重置"/>
				        &nbsp;&nbsp;&nbsp;
				        <input type="submit" value="添加"/>
				      </div>
				    </form>
				  </center>
				</div>
				<div id="tailbody" style="height:3%">
				  <%@ include file="../tail.jsp" %>
				</div>
			</div>
			
			<script>
			//自定义验证
	$.extend($.fn.validatebox.defaults.rules, {
     phoneRex: {
        validator: function(value){
		var rex=/^1[3-8]+\d{9}$/;
		//var rex=/^(([0\+]\d{2,3}-)?(0\d{2,3})-)(\d{7,8})(-(\d{3,}))?$/;
		//区号：前面一个0，后面跟2-3位数字 ： 0\d{2,3}
        //电话号码：7-8位数字： \d{7,8
        //分机号：一般都是3位数字： \d{3,}
         //这样连接起来就是验证电话的正则表达式了：/^((0\d{2,3})-)(\d{7,8})(-(\d{3,}))?$/		 
		var rex2=/^((0\d{2,3})-)(\d{7,8})(-(\d{3,}))?$/;
		if(rex.test(value)||rex2.test(value))
		{
		  // alert('t'+value);
		  return true;
		}else
		{
		 //alert('false '+value);
		   return false;
		}
          
        },
        message: '请输入正确电话或手机格式'
    },
     hotphone:{
      validator : function(value) {
       // 电话号码格式010-12345678
       /* var reg = /^\d{3,4}?\d{7,8}$/; */
       var reg = /0\d{2}-\d{7,8}/;
       return reg.test(value);
      },
      message : "请正确填写您的电话号码."
     }
});

$("#city").click(function (e) {
        SelCity(this,e);
    });
    $("#city2").bind("input propertychange",function(event){
       var str_address = $("#city").attr("value") + $("#city2").val();
	 	console.log(str_address);
       $("#address").attr({"value" : str_address});
	});
	
	
 
 

			</script>
  </body>
</html>