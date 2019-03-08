<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

 	
    <section id="main">
	<!-- 左侧导航区 -->
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
				<li><a class="waves-effect" href="javascript:Tab.addTab('客户资料', 'showclient');">客户资料</a></li>
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
				<li><a class="waves-effect" href="javascript:Tab.addTab('货品资料', 'showproduct');">货品资料</a></li>
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
	<!-- /左侧导航区 -->
	<section id="content">
		<div class="content_tab">
			<div class="tab_left">
				<a class="waves-effect waves-light" href="javascript:;"><i class="zmdi zmdi-chevron-left"></i></a>
			</div>
			<div class="tab_right">
				<a class="waves-effect waves-light" href="javascript:;"><i class="zmdi zmdi-chevron-right"></i></a>
			</div>
			<ul id="tabs" class="tabs">
				<li id="tab_home" data-index="home" data-closeable="false" class="cur">
					<a class="waves-effect waves-light">首页</a>
				</li>
			</ul>
		</div>
		<div class="content_main">
			<div id="iframe_home" class="iframe cur">
				<p><h4>通用用户权限管理系统 <i style="color:#c00">(此站仅为静态页演示)</i></h4></p>
				<p><b>演示地址</b>：<a href="http://www.zhangshuzheng.cn/zhengAdmin" target="_blank">http://www.zhangshuzheng.cn/zhengAdmin</a></p>
				<p><b>系统简介</b>：本系统是基于RBAC授权和基于用户授权的细粒度权限控制通用平台，并提供单点登录、会话管理和日志管理。接入的系统可自由定义组织、角色、权限、资源等。</p><br/>
				<p><h4>系统功能概述：</h4></p>
				<p><b>系统组织管理</b>：系统和组织增加、删除、修改、查询功能。</p>
				<p><b>用户角色管理</b>：用户和角色增加、删除、修改、查询功能。</p>
				<p><b>资源权限管理</b>：资源和权限增加、删除、修改、查询功能。</p>
				<p><b>权限分配管理</b>：提供给角色和用户的权限增加、删除、修改、查询功能。</p>
				<p><b>单点登录(SSO)</b>：提供统一用户单点登录认证、用户鉴权功能。</p>
				<p><b>用户会话管理</b>：提供分布式用户会话管理</p>
				<p><b>操作日志管理</b>：提供记录用户登录、操作等日志。</p><br/>
				<p><h4>对外接口概述：</h4></p>
				<p><b>系统组织数据接口</b>、<b>用户角色数据接口</b>、<b>资源权限数据接口</b>、<b>单点登录(SSO)接口</b>、<b>用户鉴权接口</b></p><br/>
				<p><h4>关于作者</h4></p>
				<p><b>姓　　名</b>：张恕征</p>
				<p><b>电子邮箱</b>：469741414@qq.com</p>
			</div>
		</div>
	</section>
</section>
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
