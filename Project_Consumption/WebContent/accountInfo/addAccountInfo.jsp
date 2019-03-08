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

  </head>  
  <body>
		<div id="container" class="easyui-layout" style="width:1024px;height:800px;padding:1px;margin-left:auto; margin-right:auto;">
				<div id="mainbody" style="height:90%">
				  <center>
				    <h1 style="color:skyblue;">添加账户信息</h1>
				    <div style="padding:3px;color:red;">
				      ${msg}
				    </div>
				    <form action="saveaccountInfo" method="post">
				      <div style="padding:3px;">
				        <label for="accountInfo.infoName">账户名称：</label>
				        <input id="accountInfo.infoName" type="text" name="accountInfo.infoName" value="${accountInfo.infoName}" class="easyui-validatebox textbox" data-options="required:true,validType:'length[2,10]'"/>
				      </div>
				      <div style="padding:3px;">
				        <label for="accountInfo.infoNo">银行账号：</label>
				        <input id="accountInfo.infoNo" type="text" name="accountInfo.infoNo" value="${accountInfo.infoNo}" class="easyui-validatebox textbox" data-options="required:true" validType="bankRex"/>
				      </div>
				      <div style="padding:3px;">
				        <label for="accountInfo.infoBank">开户银行：</label>
				        <input id="accountInfo.infoBank" type="text" name="accountInfo.infoBank" value="${accountInfo.infoBank}" class="easyui-validatebox textbox" data-options="required:true"/>
				      </div>
				      <div style="padding:3px;">
				        <label for="accountInfo.infoAddress">开户市区：</label>
				        <input id="accountInfo.infoAddress" type="text" name="accountInfo.infoAddress" value="${accountInfo.infoAddress}" class="easyui-validatebox textbox" data-options="required:true"/>
				      </div>
				      <div style="padding:3px">
				        <label for="accountInfo.accountStatus">审核状态：</label>
				        <select name="accountInfo.accountStatus" class="easyui-validatebox textbox" style="width:280px;">
				        	<option value="未审核">未审核</option>
				        	<option value="已审核">已审核</option>
				        </select>
				      </div>
				      <%
						SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
						String date= format.format(new Date());
					  %>
					  <input type="hidden" id="createAt" name="accountInfo.infoDate" value="<%=date%>"/>
					  
					  <input type="hidden" id="empId" name="accountInfo.employee.empId" value="${empId}"/>				  
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
    bankRex: {
         validator:function(value,param) {
        		 return check_bank_account(value);
        	 },
       	 message:'请输入正确的银行卡号'
    }
});
function check_bank_account(bankno){
	var isChecked = false;
	var n = /^[10|18|30|35|37|40|41|42|43|44|45|46|47|48|49|50|51|52|53|54|55|56|58|60|62|65|68|69|84|87|88|94|95|98|99]{0,2}\d{14,17}$/.test(bankno);
	if (n) {
		var lastNum=bankno.substr(bankno.length-1,1);//取出最后一位（与luhm进行比较）
		var first15Num=bankno.substr(0,bankno.length-1);//前15或18位
		var newArr=new Array();
		for(var i = first15Num.length-1;i>-1;i--){//前15或18位倒序存进数组
			newArr.push(first15Num.substr(i,1));
		}
		var arrJiShu=new Array(); //奇数位*2的积 <9
		var arrJiShu2=new Array(); //奇数位*2的积 >9
		var arrOuShu=new Array(); //偶数位数组
		for(var j=0;j<newArr.length;j++){
			if((j+1) % 2 == 1){//奇数位
				if (parseInt(newArr[j])*2<9) {
					arrJiShu.push(parseInt(newArr[j])*2);
				} else {
					arrJiShu2.push(parseInt(newArr[j])*2);
				}
			}else{//偶数位
				arrOuShu.push(newArr[j]);
			}
		}
		var jishu_child1=new Array();//奇数位*2 >9 的分割之后的数组个位数
		var jishu_child2=new Array();//奇数位*2 >9 的分割之后的数组十位数
		for(var h=0;h<arrJiShu2.length;h++){
			jishu_child1.push(parseInt(arrJiShu2[h])%10);
			jishu_child2.push(parseInt(arrJiShu2[h])/10);
		}
		var sumJiShu=0; //奇数位*2 < 9 的数组之和
		var sumOuShu=0; //偶数位数组之和
		var sumJiShuChild1=0; //奇数位*2 >9 的分割之后的数组个位数之和
		var sumJiShuChild2=0; //奇数位*2 >9 的分割之后的数组十位数之和
		var sumTotal=0;
		for(var m=0;m<arrJiShu.length;m++){
			sumJiShu=sumJiShu+parseInt(arrJiShu[m]);
		}
		for(var n=0;n<arrOuShu.length;n++){
			sumOuShu=sumOuShu+parseInt(arrOuShu[n]);
		}
		for(var p=0;p<jishu_child1.length;p++){
			sumJiShuChild1=sumJiShuChild1+parseInt(jishu_child1[p]);
			sumJiShuChild2=sumJiShuChild2+parseInt(jishu_child2[p]);
		}
		//计算总和
		sumTotal=parseInt(sumJiShu)+parseInt(sumOuShu)+parseInt(sumJiShuChild1)+parseInt(sumJiShuChild2);
		//计算Luhm值
		var k= parseInt(sumTotal)%10==0?10:parseInt(sumTotal)%10;
		var luhm= 10-k;
		if (lastNum == luhm) {
			isChecked = true;
		} else {
			isChecked = false;
		}
	} else {
		isChecked = false;
	}
	return isChecked;
}


			</script>
  </body>
</html>