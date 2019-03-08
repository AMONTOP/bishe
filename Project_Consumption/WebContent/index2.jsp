<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%@page language="java" import="java.util.*,java.io.PrintWriter" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%-- <%
	Object username = session.getAttribute("name");
	if(username == null){
		PrintWriter out1 = response.getWriter();
		out1.print("<script>alert('您还没有登录，请先登录！'); window.location='mylogin.jsp' </script>");
	}
%>  --%> 
 <!DOCTYPE HTML>
<html lang="zh-cn">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>生产管理系统</title>

	<link href="resources/plugins/fullPage/jquery.fullPage.css" rel="stylesheet"/>
	<link href="resources/plugins/bootstrap-3.3.0/css/bootstrap.min.css" rel="stylesheet"/>
	<link href="resources/plugins/material-design-iconic-font-2.2.0/css/material-design-iconic-font.min.css" rel="stylesheet"/>
	<link href="resources/plugins/waves-0.7.5/waves.min.css" rel="stylesheet"/>
	<link href="resources/plugins/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.min.css" rel="stylesheet"/>
	<link href="resources/css/admin.css" rel="stylesheet"/>
	<link href="resources/css/tables.css" rel="stylesheet"/>
	<link rel="stylesheet" type="text/css" href="resources/css/jq22.css"/>
    <link rel="stylesheet" type="text/css" href="resources/css/css.css"/>
    <link rel="stylesheet" type="text/css" href="css/css.css">
    <link rel="stylesheet" type="text/css" href="css/kefu.css">
    <script src="resources/plugins/jquery.1.12.4.min.js"></script>
<script>

    	var msg = "${codeError}";
    	if(msg == "验证码错误"){
    		alert("验证码错误，请重新输入！");
    		window.location.href = "http://localhost:8080/Project_Consumption/mylogin.jsp";
    	}else if(msg == "用户名或密码错误"){
    		alert("用户名或密码错误，请重新输入！");
    		window.location.href = "http://localhost:8080/Project_Consumption/mylogin.jsp";
    	}else if(msg == ''||null){
    		alert("您还没有登录，请先登录！");
    		window.location.href = "http://localhost:8080/Project_Consumption/mylogin.jsp";
    	}
    
</script>
<script type="text/javascript" src="js/index.js" ></script> 
<script type="text/javascript" src="resources/plugins/jquery.slides.js"></script>
<script src="resources/plugins/bootstrap-3.3.0/js/bootstrap.min.js"></script>
<script src="resources/plugins/waves-0.7.5/waves.min.js"></script>
<script src="resources/plugins/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min.js"></script>
<script src="resources/plugins/BootstrapMenu.min.js"></script>
<script src="resources/plugins/device.min.js"></script>
<script src="resources/plugins/fullPage/jquery.fullPage.min.js"></script>
<script src="resources/plugins/fullPage/jquery.jdirk.min.js"></script>
<script src="resources/plugins/jquery.cookie.js"></script>

<script src="resources/js/admin.js"></script>

<script>

	 $(document).ready(function(){
			var arry = [];
			for(var m=0;m<$(".waves-title").length;m++){
				arry.push($(".waves-title").eq(m).text());
			}
			console.log(arry);
		 $.ajax({
			url:'findByIdemployeePermission',
			method : 'get',
			data:{roleId : ${roleId}},
			success:function(res){
					for(var i=0;i<$(res).find(".main").length;i++){
						for(var m=0;m<arry.length;m++){
							 if($(res).find(".main").eq(i).find('td').eq(1).html() == arry[m]){
								$(".waves-title").eq(m).removeClass("stopclick");
								break;
							} 
						}
					}
					for(var i1=0;i1<$(res).find(".main").length;i1++){
						for(var i2=0;i2<$(".waves-content").length;i2++){
							if($(res).find(".main").eq(i1).find('td').eq(2).html() == $(".waves-content")[i2].text){
								$(".waves-content").eq(i2).removeClass("stopclickTab");
							}
						}
					}
			}
		}); 
		}
		);




</script>
	<style>
	/** skins **/
	#zheng-upms-server #header {background: #33383b;}
	#zheng-upms-server .content_tab{background: #0f7562;}
	#zheng-upms-server .s-profile>a{background: url(resources/images/head2.png) right center no-repeat;}
	
	#zheng-cms-admin #header {background: #455EC5;}
	#zheng-cms-admin .content_tab{background: #455EC5;}
	#zheng-cms-admin .s-profile>a{background: url(resources/images/zheng-cms.png) left top no-repeat;}
	
	#zheng-pay-admin #header {background: #F06292;}
	#zheng-pay-admin .content_tab{background: #F06292;}
	#zheng-pay-admin .s-profile>a{background: url(resources/images/zheng-pay.png) left top no-repeat;}
	
	#zheng-ucenter-home #header {background: #6539B4;}
	#zheng-ucenter-home .content_tab{background: #6539B4;}
	#zheng-ucenter-home .s-profile>a{background: url(resources/images/zheng-ucenter.png) left top no-repeat;}
	
	#zheng-oss-web #header {background: #0B8DE5;}
	#zheng-oss-web .content_tab{background: #0B8DE5;}
	#zheng-oss-web .s-profile>a{background: url(resources/images/zheng-oss.png) left top no-repeat;}
	
	#test #header {background: test;}
	#test .content_tab{background: test;}
	#test .s-profile>a{background: url(test) left top no-repeat;}
	.stopclick{color:gray;background:whitesmoke;pointer-events:none;}
	.stopclickTab{color:gray;background:whitesmoke;pointer-events:none;}
	#loading{position:fixed;top:0;left:0;width:100%;height:100%;opacity:0.6;z-index:15000;background:black;}
    #loading img{position: absolute;top: 50%;left: 50%;width: 200px;height: 200px;margin-top: -30px;margin-left: -30px;background: black;} 
	</style>
</head>
<body>
<header id="header">
	<ul id="menu">
		<li id="guide" class="line-trigger">
			<div class="line-wrap">
				<div class="line top"></div>
				<div class="line center"></div>
				<div class="line bottom"></div>
			</div>
		</li>
		<li id="logo" class="hidden-xs">
			<a href="#">
				<img src="resources/images/logo1.png" style="width: 122px;margin-top: -18px;"/>
			</a>
			<span id="system_title">基于JAVAEE的生产管理系统</span>
		</li>
		<li class="pull-right">
			<ul class="hi-menu">
				<!-- 搜索 -->
				<li class="dropdown">
					<a class="waves-effect waves-light" data-toggle="dropdown" href="javascript:;">
						<i class="him-icon zmdi zmdi-search"></i>
					</a>
					<ul class="dropdown-menu dm-icon pull-right">
						<form id="search-form" class="form-inline">
							<div class="input-group">
								<input id="keywords" type="text" name="keywords" class="form-control" placeholder="搜索"/>
								<div class="input-group-btn">
									<button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-search"></span></button>
								</div>
							</div>
						</form>
					</ul>
				</li>
				<li class="dropdown">
					<a class="waves-effect waves-light" data-toggle="dropdown" href="javascript:;">
						<i class="him-icon zmdi zmdi-dropbox"></i>
					</a>
					<ul class="dropdown-menu dm-icon pull-right">
						<li class="skin-switch">
							请选择系统切换
						</li>
						<li class="divider"></li>
						<li>
							<a class="waves-effect switch-systems" href="javascript:;" systemid="1" systemname="zheng-upms-server" systemtitle="基于JAVAEE的生产管理系统"><i class="zmdi zmdi-shield-security"></i>基于JAVAEE的生产管理系统</a>
						</li>
						
						<li>
							<a class="waves-effect switch-systems" href="javascript:;" systemid="2" systemname="zheng-cms-admin" systemtitle="内容管理系统"><i class="zmdi zmdi-wikipedia"></i> 内容管理系统</a>
						</li>
						
						<li>
							<a class="waves-effect switch-systems" href="javascript:;" systemid="3" systemname="zheng-pay-admin" systemtitle="支付管理系统"><i class="zmdi zmdi-paypal-alt"></i> 支付管理系统</a>
						</li>
						
						<li>
							<a class="waves-effect switch-systems" href="javascript:;" systemid="4" systemname="zheng-ucenter-home" systemtitle="用户管理系统"><i class="zmdi zmdi-account"></i> 用户管理系统</a>
						</li>
						
						<li>
							<a class="waves-effect switch-systems" href="javascript:;" systemid="5" systemname="zheng-oss-web" systemtitle="存储管理系统"><i class="zmdi zmdi-cloud"></i> 存储管理系统</a>
						</li>
					</ul>
				</li>
				<li class="dropdown">
					<a class="waves-effect waves-light" data-toggle="dropdown" href="javascript:;">
						<i class="him-icon zmdi zmdi-more-vert"></i>
					</a>
					<ul class="dropdown-menu dm-icon pull-right">
						<li class="hidden-xs">
							<a class="waves-effect" data-ma-action="fullscreen" href="javascript:fullPage();"><i class="zmdi zmdi-fullscreen"></i> 全屏模式</a>
						</li>						
						<li>
							<a class="waves-effect" href="employee-logout"><i class="zmdi zmdi-run"></i> 退出登录</a>
						</li>
					</ul>
				</li>
			</ul>
		</li>
	</ul>
</header>
<section id="main">
	<!-- 左侧导航区 -->
	<aside id="sidebar">
		<!-- 个人资料区 -->
		<div class="s-profile">
			<a class="waves-effect waves-light" href="javascript:;">
				<div class="sp-pic">
					
				</div>
				<div class="sp-info">
				尊敬的${userRole}，<%=ActionContext.getContext().getSession().get("name") %>，您好！
					<i class="zmdi zmdi-caret-down"></i>
				</div>
			</a>
			<ul class="main-menu">
				<!-- <li>
					<a class="waves-effect" href="javascript:;"><i class="zmdi zmdi-account"></i> 个人资料</a>
				</li>
				<li>
					<a class="waves-effect" href="javascript:;"><i class="zmdi zmdi-face"></i> 隐私管理</a>
				</li> -->
				<li>
					<a class="waves-effect" href="employee-logout"><i class="zmdi zmdi-run"></i> 退出登录</a>
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
			<a class="waves-effect waves-title stopclick" href="javascript:;"><i class="zmdi zmdi-accounts-list"></i>业务管理</a>
			<ul>
				<li><a class="waves-effect waves-content stopclickTab" href="javascript:Tab.addTab('客户资料', 'showclient');">客户资料</a></li>
				<li><a class="waves-effect waves-content stopclickTab" href="javascript:Tab.addTab('订单管理', 'showorderBill');">订单管理</a></li>
				<li><a class="waves-effect waves-content stopclickTab" href="javascript:Tab.addTab('订单货品', 'showorderBillProduct');">订单货品</a></li>
			</ul>
			</li>
			<li class="sub-menu system_menus system_1 6">
			<a class="waves-effect waves-title stopclick" href="javascript:;"><i class="zmdi zmdi-lock-outline"></i>物控管理</a>
			<ul>
				<li><a class="waves-effect waves-content stopclickTab" href="javascript:Tab.addTab('货品资料', 'showproduct.action');">货品资料</a></li>
				<li><a class="waves-effect waves-content stopclickTab" href="javascript:Tab.addTab('导出货品资料', 'show2product.action');">导出货品资料</a></li>
				<li><a class="waves-effect waves-content stopclickTab" href="javascript:Tab.addTab('货品类别', 'showproductCategory');">货品类别</a></li>
				<li><a class="waves-effect waves-content stopclickTab" href="javascript:Tab.addTab('物料资料', 'showmaterial');">物料资料</a></li>
				<li><a class="waves-effect waves-content stopclickTab" href="javascript:Tab.addTab('物料类别', 'showmaterialCategory');">物料类别</a></li>
				<li><a class="waves-effect waves-content stopclickTab" href="javascript:Tab.addTab('产品物料', 'showproductMaterial');">产品物料详情</a></li>				
			</ul>
			</li>
			<li class="sub-menu system_menus system_1 7">
			<a class="waves-effect waves-title stopclick" href="javascript:;"><i class="zmdi zmdi-more"></i>采购管理</a>
			<ul>
				<li><a class="waves-effect waves-content stopclickTab" href="javascript:Tab.addTab('供应商信息', 'showsupplier');">供应商信息</a></li>
				<li><a class="waves-effect waves-content stopclickTab" href="javascript:Tab.addTab('供应商物料报价', 'showsupplierMaterial');">供应商物料报价</a></li>
				<li><a class="waves-effect waves-content stopclickTab" href="javascript:Tab.addTab('缺料情况查询', 'supplierMaterial/showLackSupplierMaterial.jsp');">查看缺料情况</a></li>
				<li><a class="waves-effect waves-content stopclickTab" href="javascript:Tab.addTab('采购单', 'showpurchase');">采购单</a></li>
			</ul>
			</li>
			<li class="sub-menu system_menus system_1 3">
			<a class="waves-effect waves-title stopclick" href="javascript:;"><i class="zmdi zmdi-accounts"></i>工程管理</a>
			<ul>
				<li><a class="waves-effect waves-content stopclickTab" href="javascript:Tab.addTab('全部工程', 'showproject');">全部工程</a></li>
				<li><a class="waves-effect waves-content stopclickTab" href="javascript:Tab.addTab('工程设计', 'findbyRemarkSJproject');">工程设计</a></li>
				<li><a class="waves-effect waves-content stopclickTab" href="javascript:Tab.addTab('工程承包', 'findbyRemarkCBproject');">工程承包</a></li>
			</ul>
			</li>
			<li class="sub-menu system_menus system_1 8">
			<a class="waves-effect waves-title stopclick" href="javascript:;"><i class="zmdi zmdi-menu"></i>生产管理</a>
			<ul>
				<li><a class="waves-effect waves-content stopclickTab" href="javascript:Tab.addTab('领料单信息', 'showdrawMaterialBill.action');">领料单信息</a></li>
				<li><a class="waves-effect waves-content stopclickTab" href="javascript:Tab.addTab('领料单物料', 'showdrawMaterialBillMaterial');">领料单物料</a></li>
				<li><a class="waves-effect waves-content stopclickTab" href="javascript:Tab.addTab('退料单信息', 'showreturnMaterialBill');">退料单信息</a></li>
				<li><a class="waves-effect waves-content stopclickTab" href="javascript:Tab.addTab('退料单物料信息', 'showreturnMaterialBillMaterial');">退料单物料信息</a></li>
				
			</ul>
			</li>
			<li class="sub-menu system_menus system_1 10">
			<a class="waves-effect waves-title stopclick" href="javascript:;"><i class="zmdi zmdi-case"></i>仓库管理</a>
			<ul>
				<li><a class="waves-effect waves-content stopclickTab" href="javascript:Tab.addTab('货品仓库信息', 'showwareHouse');">货品仓库信息</a></li>
				<li><a class="waves-effect waves-content stopclickTab" href="javascript:Tab.addTab('货品入库单', 'show2productInstockBill');">货品入库单</a></li>
				<li><a class="waves-effect waves-content stopclickTab" href="javascript:Tab.addTab('导入货品入库单', 'show3productInstockBill');">导入货品入库单</a></li>
				<li><a class="waves-effect waves-content stopclickTab" href="javascript:Tab.addTab('货品入库单货品', 'showmoreproductInstockBill');">货品入库单货品</a></li>
				<li><a class="waves-effect waves-content stopclickTab" href="javascript:Tab.addTab('货品出库单', 'show2productOutstockBill');">货品出库单</a></li>
				<!-- <li><a class="waves-effect waves-content stopclickTab" href="javascript:Tab.addTab('导入货品出库单', 'show3productOutstockBill');">导入货品出库单</a></li> -->
				<li><a class="waves-effect waves-content stopclickTab" href="javascript:Tab.addTab('货品出库单货品', 'showmoreproductOutstockBill');">货品出库单货品</a></li>
				<li><a class="waves-effect waves-content stopclickTab" href="javascript:Tab.addTab('物料仓库信息', 'showmaterialHouse');">物料仓库信息</a></li>
				<li><a class="waves-effect waves-content stopclickTab" href="javascript:Tab.addTab('物料入库单', 'show2materialInstockBill');">物料入库单</a></li>
				<li><a class="waves-effect waves-content stopclickTab" href="javascript:Tab.addTab('物料入库单物料', 'showmorematerialInstockBill');">物料入库单物料</a></li>
				<li><a class="waves-effect waves-content stopclickTab" href="javascript:Tab.addTab('物料出库单', 'show2materialOutstockBill');">物料出库单</a></li>
				<li><a class="waves-effect waves-content stopclickTab" href="javascript:Tab.addTab('物料出库单物料', 'showmorematerialOutstockBill');">物料出库单物料</a></li>
			</ul>
			</li>
			<li>
			<li class="sub-menu system_menus system_1 9">
			<a class="waves-effect waves-title stopclick" href="javascript:;"><i class="zmdi zmdi-collection-text"></i>品质管理</a>
			<ul>
				<li><a class="waves-effect waves-content stopclickTab" href="javascript:Tab.addTab('物料品质', 'showmaterialCheck.action');">物料品质</a></li>
				<li><a class="waves-effect waves-content stopclickTab" href="javascript:Tab.addTab('产品品质', 'showproductCheck.action');">产品品质</a></li>
				<li><a class="waves-effect waves-content stopclickTab" href="javascript:Tab.addTab('二次加工货品', 'showuselessProduct.action');">二次加工货品</a></li>
				<li><a class="waves-effect waves-content stopclickTab" href="javascript:Tab.addTab('二次加工物料', 'showuselessMaterial.action');">二次加工物料</a></li>
			</ul>
			</li>
			<li>
			
			
			<li class="sub-menu system_menus system_1 11">
			<a class="waves-effect waves-title stopclick" href="javascript:;"><i class="zmdi zmdi-money"></i>财务管理</a>
			<ul>
				<li><a class="waves-effect waves-content stopclickTab" href="javascript:Tab.addTab('账户信息', 'showaccountInfo');">账户信息</a></li>
				<li><a class="waves-effect waves-content stopclickTab" href="javascript:Tab.addTab('工资报表', 'showsalary');">工资报表</a></li>
				<li><a class="waves-effect waves-content stopclickTab" href="javascript:Tab.addTab('盈利报表', 'showprofit');">盈利报表</a></li>
				<li><a class="waves-effect waves-content stopclickTab" href="javascript:Tab.addTab('财务项目报销', 'showaccountProject');">账务项目报销</a></li>
				<li><a class="waves-effect waves-content stopclickTab" href="javascript:Tab.addTab('备用金发放', 'showaccountPetty');">备用金发放</a></li>
				<li><a class="waves-effect waves-content stopclickTab" href="javascript:Tab.addTab('付款单', 'showaccountPay');">付款单</a></li>
				<li><a class="waves-effect waves-content stopclickTab" href="javascript:Tab.addTab('收款单', 'showaccountRepay');">收款单</a></li>
			</ul>
			</li>
			<li>
			<li class="sub-menu system_menus system_1 12">
			<a class="waves-effect waves-title stopclick" href="javascript:;"><i class="zmdi zmdi-widgets"></i>系统管理</a>
			<ul>
				<li><a class="waves-effect waves-content stopclickTab" href="javascript:Tab.addTab('权限角色设置', 'prepuprole');">权限角色设置</a></li>
				<li><a class="waves-effect waves-content stopclickTab" href="javascript:Tab.addTab('员工信息', 'employee-show');">员工信息</a></li>
			</ul>
			</li>
			<li>
			<div class="upms-version">
				&copy; 广州大学华软软件学院 1540129422 张晓婷
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
			<div id="slider" style="position: relative; margin: 0; padding: 55px 0 0 0;float: left;">
    <div id="slider_name" class="slider_box">
        <div id="movie_tip" class="silder_tip">电影</div>
        <ul class="silder_con">
            <li class="silder_panel clearfix"><a class="f_l" href="#"><img src="images/t.png"></a>
                <div class="silder_intro f_r">
                    <H3> <strong><a href="#">业务管理</a></strong> <span>Prompt</span> </H3>
                    <ul>
                        <li>
                            <label>主要功能</label>
                            <span><a href="#"></a><a href="#">客户资料、订单管理、订单货品</a></span>
                        </li>                     
                    </ul>
                    <p>[<strong>功能介绍</strong>]
						在此模块中客户资料子模块，可以对录入、导出客户资料，并进行查询、增加、删除、修改；
						在订单管理子模块中，可以对订单进行增删改查；
						在订单货品子模块中，可以对订单货品进行根据订单查询到相对应的货品信息。	
					</p>
                    <a class="silder_play">马上使用</a></div>
            </li>
            <li class="silder_panel clearfix"><a class="f_l" href="#"><img src="images/t1.jpg"></a>
                <div class="silder_intro f_r">
                    <H3> <strong><a href="#">工程管理</a></strong> <span>Prompt</span> </H3>
                    <ul>
                        <li>
                            <label>主要功能：</label>
                            <span><a href="#"></a><a href="#">全部工程、工程设计、工程承包</a></span>
                       </li>   
                    </ul>
                    <p>[<strong>功能介绍</strong>]
						在此模块中全部工程子模块，可以查看所有工程，包括工程设计和工程承包内容；
						在工程设计子模块中，可以对工程设计内容进行增删改查；
						在工程承包子模块中，可以对工程承包内容进行增删改查。
					</p>
                    <a class="silder_play">马上使用</a></div>
            </li>
            <li class="silder_panel clearfix"><a class="f_l" href="#"><img src="images/t2.jpg"></a>
                <div class="silder_intro f_r">
                    <H3> <strong><a href="#">物控管理</a></strong> <span>Prompt</span> </H3>
                    <ul>
                        <li>
                            <label>主要功能：</label>
                            <span><a href="#"></a><a href="#">货品资料、导出货品资料、货品类别、物料资料、物料类别、产品物料详情</a></span>
                       </li>   
                    </ul>
                    <p>[<strong>功能介绍</strong>]
						在此模块中货品资料子模块，可以查看所有货品，并对其进行增删改查，可以导入货品excel表格；
						在导出货品资料子模块中，可以选择相应的货品进行导出excel操作；
						在货品类别子模块中，可以对货品类别内容进行增删改查，
						在物料资料子模块中，可以对货品类别内容进行增删改查，
						在物料类别子模块中，可以对货品类别内容进行增删改查，
						在产品物料详情子模块中，可以对货品类别内容进行增删改查。
					</p>
                    <a class="silder_play">马上使用</a></div>
            </li>
            <li class="silder_panel clearfix"><a class="f_l" href="#"><img src="images/t3.jpg"></a>
                <div class="silder_intro f_r">
                    <H3> <strong><a href="#">采购管理</a></strong> <span>Prompt</span> </H3>
                    <ul>
                         <li>
                            <label>主要功能：</label>
                            <span><a href="#"></a><a href="#">供应商物料报价、供应商信息、查看缺料情况</a></span>
                       	 </li>   
                    </ul>
                    <p>[<strong>功能介绍</strong>]
						在此模块中供应商物料报价子模块，可以查看所有供应商物料，并对其进行增删改查；
						在供应商信息子模块中，可以对供应商信息进行增删改查；
						在查看缺料情况子模块中，可以查看所有物料缺料情况。
					</p>
                    <a class="silder_play">马上使用</a></div>
            </li>
            <li class="silder_panel clearfix"><a class="f_l" href="#"><img src="images/t4.jpg"></a>
                <div class="silder_intro f_r">
                    <H3> <strong><a href="#">生产管理</a></strong> <span>Prompt</span> </H3>
                    <ul>
                        <li>
                            <label>主要功能：</label>
                            <span><a href="#"></a><a href="#">领料单物料、领料单信息、退料单信息、退料单物料信息</a></span>
                       	</li> 
                    </ul>
                    <p>[<strong>功能介绍</strong>]
						在此模块中供应商物料报价子模块，可以查看所有供应商物料，并对其进行增删改查；
						在供应商信息子模块中，可以对供应商信息进行增删改查；
						在查看缺料情况子模块中，可以查看所有物料缺料情况。
					</p>
					<a class="silder_play">马上使用</a></div>
            </li>
            <li class="silder_panel clearfix"><a class="f_l" href="#"><img src="images/t5.jpg"></a>
                <div class="silder_intro f_r">
                    <H3> <strong><a href="#">品质管理</a></strong> <span>Prompt</span> </H3>
                    <ul>
                        <li>
                            <label>类型：</label>
                            <span><a href="#">外文名</a><a href="#">jQuery</a><a href="#">John Resig</a></span></li>
                        <li>
                            <label>核心理念：</label>
                            <span><a href="#">write less,do more</a></span></li>
                        <li>
                            <label>发布时间：</label>
                            <span><a href="#">2006年1月</a><a href="#">2006年1月</a><a href="#">2006年1月</a><a href="#">2006年1月</a></span></li>
                    </ul>
                    <P>[<strong>插件介绍</strong>]jQuery的核心特性可以总结为：具有独特的链式语法和短小清晰的多功能接口；具有高效灵活的css选择器，并且可对CSS选择器进行扩展..</P>
                    <a class="silder_play">马上使用</a></div>
            </li>
            <li class="silder_panel clearfix"><a class="f_l" href="#"><img src="images/t6.jpg"></a>
                <div class="silder_intro f_r">
                    <H3> <strong><a href="#">仓库管理</a></strong> <span>Prompt</span> </H3>
                    <ul>
                        <li>
                            <label>类型：</label>
                            <span><a href="#">外文名</a><a href="#">jQuery</a><a href="#">John Resig</a></span></li>
                        <li>
                            <label>核心理念：</label>
                            <span><a href="#">write less,do more</a></span></li>
                        <li>
                            <label>发布时间：</label>
                            <span><a href="#">2006年1月</a><a href="#">2006年1月</a><a href="#">2006年1月</a><a href="#">2006年1月</a></span></li>
                    </ul>
                    <P>[<strong>插件介绍</strong>]jQuery的核心特性可以总结为：具有独特的链式语法和短小清晰的多功能接口；具有高效灵活的css选择器，并且可对CSS选择器进行扩展..</P>
                    <a class="silder_play">马上使用</a></div>
            </li>
            <li class="silder_panel clearfix"><a class="f_l" href="#"><img src="images/t7.jpg"></a>
                <div class="silder_intro f_r">
                    <H3> <strong><a href="#">财务管理</a></strong> <span>Prompt</span> </H3>
                    <ul>
                        <li>
                            <label>类型：</label>
                            <span><a href="#">外文名</a><a href="#">jQuery</a><a href="#">John Resig</a></span></li>
                        <li>
                            <label>核心理念：</label>
                            <span><a href="#">write less,do more</a></span></li>
                        <li>
                            <label>发布时间：</label>
                            <span><a href="#">2006年1月</a><a href="#">2006年1月</a><a href="#">2006年1月</a><a href="#">2006年1月</a></span></li>
                    </ul>
                    <P>[<strong>插件介绍</strong>]jQuery的核心特性可以总结为：具有独特的链式语法和短小清晰的多功能接口；具有高效灵活的css选择器，并且可对CSS选择器进行扩展..</P>
                    <a class="silder_play">马上使用</a></div>
            </li>
     
        </ul>
        <ul class="silder_nav clearfix">
            <li><a href="#"><img src="images/t.png"></a></li>
            <li><a href="#"><img src="images/t1.jpg"></a></li>
            <li><a href="#"><img src="images/t2.jpg"></a></li>
            <li><a href="#"><img src="images/t3.jpg"></a></li>
            <li><a href="#"><img src="images/t4.jpg"></a></li>
            <li><a href="#"><img src="images/t5.jpg"></a></li>
            <li><a href="#"><img src="images/t6.jpg"></a></li>
            <li><a href="#"><img src="images/t7.jpg"></a></li>
        </ul>
    </div>
    <div class="silderBox"></div>
</div>


          
				<!--日历-->
				<div style="width: 35%;height: 389px;margin: 30px 33px;float: left;" id="rili">
					<div id='calendar'></div>
				</div>

			
			
				<%-- <div class="card">
                <div class="card-body">
                  <h4 class="card-title">审批进度</h4>
                  <div class="table-responsive">
                    <table class="table">
                      <thead>
                        <tr>
                          <th>
                                                                                   审批人员
                          </th>
                          <th>
                            	项目
                          </th>
                          <th>
                            	进度
                          </th>
                          <th>
                            	最新更新时间
                          </th>
                        </tr>
                      </thead>
				      <tbody>              
	                      <c:forEach var="i" begin="1" end="5">
	                      	<tr>
	                          <td>
	                            <img src="resources/images/faces/face1.jpg" class="mr-2" alt="image">
	                            	张晓婷${i}
	                          </td>
	                          <td>
	                            ${i}Iphone手机电子配件制作规划
	                          </td>
	                          <td>
	                            <label class="badge badge-gradient-success">DONE</label>
	                          </td>
	                          <td>
	                            ${i}Dec 5, 2017
	                          </td>                         
	                        </tr>  
	                      </c:forEach>
                         </tbody>                           
                    </table>
                  </div>
                </div>
              </div> --%>
              
              <div class="card">
    <div class="card-body">
        <h4 class="card-title">项目进度</h4>
        <div class="table-responsive">
            <table class="table">
                <thead>
                <tr>
                    <th>
                        #
                    </th>
                    <th>
                        项目负责人
                    </th>
                    <th>
                        预期结束时间
                    </th>
                    <th>
                        进度
                    </th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${listProject}"  var="project">
                 	<tr>
                    <td>
                        ${project.proId }
                         <img src="resources/images/faces/face3.jpg" class="mr-2" alt="image">
                    </td>
                    <td>
                   
                        ${project.employee.name }
                    </td>
                    <td>
                        ${project.endDate}
                    </td>
                    <td>
                        <div class="progress">
                            <div class="progress-bar bg-gradient-success" role="progressbar" style="width: ${project.percent}%" aria-valuenow="${project.percent}" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                    </td>
                </tr>
                </c:forEach>
                
                
                </tbody>
            </table>
        </div>
    </div>
</div>
			</div>
		</div>
	</section>
</section>
<footer id="footer"></footer>

<!--在线客服  -->
<div class="scrollsidebar" id="scrollsidebar">
  <div class="side_content">
    <div class="side_list">
      <div class="side_title"><a title="隐藏" class="close_btn"><span>关闭</span></a></div>
      <div class="side_center">
        <div class="custom_service">
          <p> <a title="点击这里给我发消息" href="#"><img src="css/images/button_11.gif"></a> </p>
        </div>
        <div class="other">
          <p><img src="css/images/qrcode.png" width="120"/></p>
          <p>客户服务热线</p>
          <p>0755-xxx-xxxxx</p>
        </div>
        <div class="msgserver">
          <p><a href="###" >联系我们</a></p>
        </div>
      </div>
      <div class="side_bottom"></div>
    </div>
  </div>
  <div class="show_btn"><span>在线客服</span></div>
</div>

<script type="text/javascript" src="js/kefu.js"></script>
<script type="text/javascript">
    $(function() {
        var loading = '<div id="loading"><img src="resources/images/Double.gif"></div>';
        $('body').append($(loading));
 
        setTimeout(function () {
            $('#loading').remove();
        }, 1000); 
    });
 
</script> 
</body>
</html>