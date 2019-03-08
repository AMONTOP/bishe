<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<script type="text/javascript" src="/Project_Consumption/js/easyui/jquery-1.11.2.js"></script>
<script type="text/javascript">
  $(function(){
	  $("#logout").click(function(){
		  if(!confirm("确认退出吗？")){
			  return false;
		  }
	  });
  });
</script>
<style type="text/css">
  a{
    text-decoration:none;
    color:blue;
  }
  a:hover{
    background:skyblue;
  }
</style>
</head>
<body>
<div class="easyui-accordion" style="width:158px;height:auto;">
	<div title="个人账号管理" data-options="iconCls:'icon-mini-add'" style="overflow:auto;padding:10px;">
		<c:choose>
		  <c:when test="${empty session_consumer}">
		    <p><a href="login.jsp">登录</a></p>
		    <p><a href="register.jsp">注册</a></p>
		  </c:when>
		  <c:otherwise>
		    <p><a href="consumer-change">修改密码</a></p>
		    <p><a id="logout" href="consumer-logout">退出账号</a></p>
		  </c:otherwise>
		</c:choose>
	</div>
	<div title="个人消费记录管理" data-options="iconCls:'icon-mini-add'" style="overflow:auto;padding:10px;">
	    <p><a href="consume-addPre">添加消费记录</a></p>
	    <p><a href="consume-findAll">查看消费记录</a></p>
	    <p><a href="consume-export">导出消费账单</a></p>
	    <p><a href="consume-graph">统计消费情况</a></p>
	</div>
	<div title="客户资料" data-options="iconCls:'icon-mini-add'" style="overflow:auto;padding:10px;">
	    <p><a href="/Project_Consumption/client/addClient.jsp">添加消费记录</a></p>
	    <p><a href="showclient">查看消费记录</a></p>
	</div>
	<div title="产品资料" data-options="iconCls:'icon-mini-add'" style="overflow:auto;padding:10px;">
	    <p><a href="addPreproduct">添加消费记录</a></p>
	    <p><a href="showproduct">查看消费记录</a></p>
	</div>
	<div title="产品分类" data-options="iconCls:'icon-mini-add'" style="overflow:auto;padding:10px;">
	    <p><a href="/Project_Consumption/productCategory/addProductCategory.jsp">添加消费记录</a></p>
	    <p><a href="showproductCategory">查看消费记录</a></p>
	</div>
	<div title="物料资料" data-options="iconCls:'icon-mini-add'" style="overflow:auto;padding:10px;">
	    <p><a href="addPrematerial">添加物料记录</a></p>
	    <p><a href="showmaterial">查看物料记录</a></p>
	</div>
	<div title="物料分类" data-options="iconCls:'icon-mini-add'" style="overflow:auto;padding:10px;">
	    <p><a href="/Project_Consumption/materialCategory/addMaterialCategory.jsp">添加物料分类记录</a></p>
	    <p><a href="showmaterialCategory">查看物料分类记录</a></p>
	</div>
	<div title="产品物料详情" data-options="iconCls:'icon-mini-add'" style="overflow:auto;padding:10px;">
	    <p><a href="addPreproductMaterial">添加物料分类记录</a></p>
	    <p><a href="showproductMaterial">查看物料分类记录</a></p>
	</div>
	<div title="订单" data-options="iconCls:'icon-mini-add'" style="overflow:auto;padding:10px;">
	    <p><a href="addPreorderBill">添加物料分类记录</a></p>
	    <p><a href="showorderBill">查看物料分类记录</a></p>
	</div>
	<div title="订单货品" data-options="iconCls:'icon-mini-add'" style="overflow:auto;padding:10px;">
	    <p><a href="addPreorderBillProduct">添加物料分类记录</a></p>
	    <p><a href="showorderBillProduct">查看物料分类记录</a></p>
	</div>
	<div title="领料单" data-options="iconCls:'icon-mini-add'" style="overflow:auto;padding:10px;">
	    <p><a href="addPredrawMaterialBill">添加物料分类记录</a></p>
	    <p><a href="showdrawMaterialBill">查看物料分类记录</a></p>
	</div>
	<div title="领料单物料" data-options="iconCls:'icon-mini-add'" style="overflow:auto;padding:10px;">
	    <p><a href="addPredrawMaterialBillMaterial">添加物料分类记录</a></p>
	    <p><a href="showdrawMaterialBillMaterial">查看物料分类记录</a></p>
	</div>
	<div title="退料单" data-options="iconCls:'icon-mini-add'" style="overflow:auto;padding:10px;">
	    <p><a href="addPrereturnMaterialBill">添加物料分类记录</a></p>
	    <p><a href="showreturnMaterialBill">查看物料分类记录</a></p>
	</div>
	<div title="退料单物料" data-options="iconCls:'icon-mini-add'" style="overflow:auto;padding:10px;">
	    <p><a href="addPrereturnMaterialBillMaterial">添加物料分类记录</a></p>
	    <p><a href="showreturnMaterialBillMaterial">查看物料分类记录</a></p>
	</div>
	<div title="货品出库单" data-options="iconCls:'icon-mini-add'" style="overflow:auto;padding:10px;">
	    <p><a href="addProductOutstockBill">添加物料分类记录</a></p>
	    <p><a href="showproductOutstockBill">查看物料分类记录</a></p>
	</div>
	<div title="货品出库单货品" data-options="iconCls:'icon-mini-add'" style="overflow:auto;padding:10px;">
	    <p><a href="addProductOutstockBillProduct">添加物料分类记录</a></p>
	    <p><a href="showproductOutstockBillProduct">查看物料分类记录</a></p>
	</div>
	<div title="货品入库单" data-options="iconCls:'icon-mini-add'" style="overflow:auto;padding:10px;">
	    <p><a href="addProductInstockBill">添加物料分类记录</a></p>
	    <p><a href="showproductInstockBill">查看物料分类记录</a></p>
	</div>
	<div title="货品入库单货品" data-options="iconCls:'icon-mini-add'" style="overflow:auto;padding:10px;">
	    <p><a href="addProductInstockBillProduct">添加物料分类记录</a></p>
	    <p><a href="showproductInstockBillProduct">查看物料分类记录</a></p>
	</div>
	<div title="物料出库单" data-options="iconCls:'icon-mini-add'" style="overflow:auto;padding:10px;">
	    <p><a href="addMaterialOutstockBill">添加物料分类记录</a></p>
	    <p><a href="showmaterialOutstockBill">查看物料分类记录</a></p>
	</div>
	<div title="物料出库单物料" data-options="iconCls:'icon-mini-add'" style="overflow:auto;padding:10px;">
	    <p><a href="addMaterialOutstockBillMaterial">添加物料分类记录</a></p>
	    <p><a href="showmaterialOutstockBillMaterial">查看物料分类记录</a></p>
	</div>
	<div title="物料入库单" data-options="iconCls:'icon-mini-add'" style="overflow:auto;padding:10px;">
	    <p><a href="addMaterialInstockBill">添加物料分类记录</a></p>
	    <p><a href="showmaterialInstockBill">查看物料分类记录</a></p>
	</div>
	<div title="物料入库单物料" data-options="iconCls:'icon-mini-add'" style="overflow:auto;padding:10px;">
	    <p><a href="addMaterialInstockBillMaterial">添加物料分类记录</a></p>
	    <p><a href="showmaterialInstockBillMaterial">查看物料分类记录</a></p>
	</div>
	<div title="供应商资料" data-options="iconCls:'icon-mini-add'" style="overflow:auto;padding:10px;">
	    <p><a href="/Project_Consumption/supplier/addSupplier.jsp">添加消费记录</a></p>
	    <p><a href="showsupplier">查看消费记录</a></p>
	</div>
	<div title="供应商物料报价" data-options="iconCls:'icon-mini-add'" style="overflow:auto;padding:10px;">
	    <p><a href="/Project_Consumption/supplierMaterial/addSupplierMaterial.jsp">添加供应商物料报价</a></p>
	    <p><a href="showsupplierMaterial">查看供应商物料报价</a></p>
	    <p><a href="findbyRemarksupplierMaterial">查看缺料情况</a></p>
	</div>
</div>
</body>
</html>