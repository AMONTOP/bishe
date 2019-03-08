<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 <!DOCTYPE HTML>
<html lang="zh-cn">
<head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'left.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link href="resources/plugins/fullPage/jquery.fullPage.css" rel="stylesheet"/>
	<link href="resources/plugins/bootstrap-3.3.0/css/bootstrap.min.css" rel="stylesheet"/>
	<link href="resources/plugins/material-design-iconic-font-2.2.0/css/material-design-iconic-font.min.css" rel="stylesheet"/>
	<link href="resources/plugins/waves-0.7.5/waves.min.css" rel="stylesheet"/>
	<link href="resources/plugins/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.min.css" rel="stylesheet"/>
	<link href="resources/css/admin.css" rel="stylesheet"/>
	<style>
	#zheng-upms-server .s-profile>a{background: url(resources/images/head2.png) right center no-repeat;}
	</style>
  </head>
  
  <body>

	<aside id="sidebar">
		<!-- 个人资料区 -->
		<div class="s-profile">
			<a class="waves-effect waves-light" href="javascript:;">
				<div class="sp-pic">
					
				</div>
				<div class="sp-info">
					xxx，您好！
					<i class="zmdi zmdi-caret-down"></i>
				</div>
			</a>
			<ul class="main-menu">
				<li>
					<a class="waves-effect" href="javascript:;"><i class="zmdi zmdi-account"></i> 个人资料</a>
				</li>
				<li>
					<a class="waves-effect" href="javascript:;"><i class="zmdi zmdi-face"></i> 隐私管理</a>
				</li>
				<li>
					<a class="waves-effect" href="javascript:;"><i class="zmdi zmdi-settings"></i> 系统设置</a>
				</li>
				<li>
					<a class="waves-effect" href="javascript:;"><i class="zmdi zmdi-run"></i> 退出登录</a>
				</li>
			</ul>
		</div>
		<!-- /个人资料区 -->
		<!-- 菜单区 -->
		<ul class="main-menu">
			<li>
			<a class="waves-effect" href="javascript:Tab.addTab('首页', 'home');"><i class="zmdi zmdi-home"></i> 首页</a>
			</li>
			<li class="sub-menu system_menus system_1 0">
			<a class="waves-effect" href="javascript:;"><i class="zmdi zmdi-accounts-list"></i> 业务管理</a>
			<ul>
				<li><a class="waves-effect" href="javascript:Tab.addTab('客户资料', 'showclient.action');">客户资料</a></li>
				<li><a class="waves-effect" href="javascript:Tab.addTab('订单管理', 'showorderbill.action');">订单管理</a></li>
				<li><a class="waves-effect" href="javascript:Tab.addTab('订单审核', 'showorderstate.action');">订单审核</a></li>
			</ul>
			</li>
			<li class="sub-menu system_menus system_1 3">
			<a class="waves-effect" href="javascript:;"><i class="zmdi zmdi-accounts"></i> 工程管理</a>
			<ul>
				<li><a class="waves-effect" href="javascript:Tab.addTab('工程计划', 'showdept.action');">工程计划</a></li>
				<li><a class="waves-effect" href="javascript:Tab.addTab('用户管理', '/manage/user/index');">工程管理</a></li>
				<li><a class="waves-effect" href="javascript:Tab.addTab('用户管理', '/manage/user/index');">工程承包</a></li>
			</ul>
			</li>
			<li class="sub-menu system_menus system_1 6">
			<a class="waves-effect" href="javascript:;"><i class="zmdi zmdi-lock-outline"></i> 物控管理</a>
			<ul>
				<li><a class="waves-effect" href="javascript:Tab.addTab('货品资料', 'showproduct.action');">货品资料</a></li>
				<li><a class="waves-effect" href="javascript:Tab.addTab('货品类别', 'showproductcategory.action');">货品类别</a></li>
				<li><a class="waves-effect" href="javascript:Tab.addTab('物料资料', 'showmaterial.action');">物料资料</a></li>
				<li><a class="waves-effect" href="javascript:Tab.addTab('物料类别', 'showmaterialcategory');">物料类别</a></li>
				<li><a class="waves-effect" href="javascript:Tab.addTab('权限管理', '');">货品资料的停用</a></li>
			</ul>
			</li>
			<li class="sub-menu system_menus system_1 7">
			<a class="waves-effect" href="javascript:;"><i class="zmdi zmdi-more"></i> 采购管理</a>
			<ul>
				<li><a class="waves-effect" href="javascript:Tab.addTab('供应商信息', 'showsupplier.action');">供应商信息</a></li>
				<li><a class="waves-effect" href="javascript:Tab.addTab('缺料情况查询', '/manage/session/index');">缺料情况查询</a></li>
				<li><a class="waves-effect" href="javascript:Tab.addTab('实际库存情况', '/manage/log/index');">实际库存情况</a></li>
				<li><a class="waves-effect" href="javascript:Tab.addTab('待领料情况', '/manage/map/index');">待领料情况</a></li>
				<li><a class="waves-effect" href="javascript:Tab.addTab('待出库情况', '/manage/map/index');">待出库情况</a></li>
			</ul>
			</li>
			<li class="sub-menu system_menus system_1 8">
			<a class="waves-effect" href="javascript:;"><i class="zmdi zmdi-menu"></i> 生产管理</a>
			<ul>
				<li><a class="waves-effect" href="javascript:Tab.addTab('领料单信息', 'showdrawMaterialbill.action');">领料单信息</a></li>
				<li><a class="waves-effect" href="javascript:Tab.addTab('领料单审核', '');">领料单审核</a></li>
				<li><a class="waves-effect" href="javascript:Tab.addTab('退料单信息', 'showreturnMaterialbill.action');">退料单信息</a></li>
				<li><a class="waves-effect" href="javascript:Tab.addTab('退料单审核', '');">退料单审核</a></li>
			</ul>
			</li>
			<li class="sub-menu system_menus system_1 9">
			<a class="waves-effect" href="javascript:;"><i class="zmdi zmdi-collection-text"></i> 品质管理</a>
			<ul>
				<li><a class="waves-effect" href="javascript:Tab.addTab('文章管理', '/manage/article/index');">品质要求</a></li>
				<li><a class="waves-effect" href="javascript:Tab.addTab('回收管理', '/manage/article/recycle');">品质管理</a></li>
			</ul>
			</li>
			<li>
			<li class="sub-menu system_menus system_1 10">
			<a class="waves-effect" href="javascript:;"><i class="zmdi zmdi-case"></i> 仓库管理</a>
			<ul>
				<li><a class="waves-effect" href="javascript:Tab.addTab('文章管理', 'showproductInstockbill.action');">货品入库单</a></li>
				<li><a class="waves-effect" href="javascript:Tab.addTab('回收管理', '');">货品入库单审核</a></li>
				<li><a class="waves-effect" href="javascript:Tab.addTab('文章管理', 'showproductOutstockbill.action');">货品出库单</a></li>
				<li><a class="waves-effect" href="javascript:Tab.addTab('回收管理', '');">货品出库单审核</a></li>
				<li><a class="waves-effect" href="javascript:Tab.addTab('回收管理', '/manage/article/recycle');">货品库存情况</a></li>
				<li><a class="waves-effect" href="javascript:Tab.addTab('回收管理', '');">物料入库单</a></li>
				<li><a class="waves-effect" href="javascript:Tab.addTab('回收管理', '/manage/article/recycle');">物料入库单审核</a></li>
				<li><a class="waves-effect" href="javascript:Tab.addTab('回收管理', '/manage/article/recycle');">物料出库单</a></li>
				<li><a class="waves-effect" href="javascript:Tab.addTab('回收管理', '/manage/article/recycle');">物料出库单审核</a></li>
				<li><a class="waves-effect" href="javascript:Tab.addTab('回收管理', '/manage/article/recycle');">物料库存情况</a></li>
			</ul>
			</li>
			<li>
			<li class="sub-menu system_menus system_1 11">
			<a class="waves-effect" href="javascript:;"><i class="zmdi zmdi-money"></i> 财务管理</a>
			<ul>
				<li><a class="waves-effect" href="javascript:Tab.addTab('文章管理', '/manage/article/index');">品质要求</a></li>
				<li><a class="waves-effect" href="javascript:Tab.addTab('回收管理', '/manage/article/recycle');">品质管理</a></li>
			</ul>
			</li>
			<li>
			<div class="upms-version">
				&copy; ZHENG-UPMS V1.0.0
			</div>
			</li>
		</ul>
		<!-- /菜单区 -->
	</aside>
	
<footer id="footer"></footer>

<script src="resources/plugins/jquery.1.12.4.min.js"></script>
<script src="resources/plugins/bootstrap-3.3.0/js/bootstrap.min.js"></script>
<script src="resources/plugins/waves-0.7.5/waves.min.js"></script>
<script src="resources/plugins/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min.js"></script>
<script src="resources/plugins/BootstrapMenu.min.js"></script>
<script src="resources/plugins/device.min.js"></script>
<script src="resources/plugins/fullPage/jquery.fullPage.min.js"></script>
<script src="resources/plugins/fullPage/jquery.jdirk.min.js"></script>
<script src="resources/plugins/jquery.cookie.js"></script>

<script src="resources/js/admin.js"></script>
 </body>
</html>
