<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>权限树扩展分享</title>
    <link rel="stylesheet" type="text/css" href="/Project_Consumption/layui/css/layui.css">
    <script type="text/javascript" src="/Project_Consumption/layui/layui.js"></script>
    <script type="text/javascript" src="/Project_Consumption/js/jquery-1.7.2.min.js"></script>
 	<style>
 	.main td{
 	padding-left: 10px;
 	}
 	</style>
</head>
<body>
<div class="layui-container" style="float: left;width:50%;">
    <div class="layui-row">
        <!-- <div class="layui-col-md11 layui-col-md-offset1">
            <fieldset class="layui-elem-field layui-field-title"><legend>权限树操作演示</legend></fieldset>
            <div class="layui-form">
                <div class="layui-form-item">
                    <div class="layui-form-label">普通操作</div>
                    <div class="layui-form-block">
                        <button type="button" class="layui-btn layui-btn-primary" onclick="getMaxDept('#LAY-auth-tree-index')">获取树的深度</button>
                        <button type="button" class="layui-btn layui-btn-primary" onclick="checkAll('#LAY-auth-tree-index')">全选</button>
                        <button type="button" class="layui-btn layui-btn-primary" onclick="uncheckAll('#LAY-auth-tree-index')">全不选</button>
                        <button type="button" class="layui-btn layui-btn-primary" onclick="showAll('#LAY-auth-tree-index')">全部展开</button>
                        <button type="button" class="layui-btn layui-btn-primary" onclick="closeAll('#LAY-auth-tree-index')">全部隐藏</button>
                        <button type="button" class="layui-btn layui-btn-primary" onclick="getNodeStatus('#LAY-auth-tree-index')">获取节点状态</button>
                    </div>
                </div>

            </div>
        </div> -->
        <p style="text-indent:2em;color:red;background: #fafafa;margin: 0;padding-top:10px">注意：添加完毕后需要进行重新登录，列表权限重新更新！</p>
        <div class="layui-col-md6 layui-col-md-offset1">
            <fieldset class="layui-elem-field layui-field-title"><legend>系统权限树</legend></fieldset>
            <!-- 此扩展能递归渲染一个权限树，点击深层次节点，父级节点中没有被选中的节点会被自动选中，单独点击父节点，子节点会全部 选中/去选中 -->
            <form class="layui-form" method="post" action="addrole">
                <div class="layui-form-item">
                    <label class="layui-form-label">角色名称</label>
                    <div class="layui-input-block">
                        <select class="select" name="change">
                        <!-- for循环出role中的roleName???? -->   
                        <c:forEach items="${list}" var="role">
                        	<option value="${role.roleId}" name="employeePermission.role.roleId" >${role.roleName}</option>      
                        </c:forEach>                       
                        </select>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">选择权限</label>
                    <div class="layui-input-block">
                        <div id="LAY-auth-tree-index"></div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" type="submit" lay-submit lay-filter="LAY-auth-tree-submit">提交</button>
                        <button class="layui-btn layui-btn-primary" type="reset">重置</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<div style="line-height: 39px;width:50%;float:right;margin-top: 76px;">
	<table id="show_tab" border="1px solid black" style="width: 470px;">
  		<tr id="show_tab_one" class="title" style="text-align:center;font-weight: bold;font-size: 16px;">
  			<td>角色</td>
  			<td>可操作的模块</td>
  			<td>对应的子模块</td>
  			<td>操作</td>
  		</tr>
    	<c:forEach items="${list2}" var="employeePermission" varStatus="status">
    	 	<tr class="main" id="show_tab_tr">
    			<td>${employeePermission.role.roleName}</td>
    			<td>${employeePermission.permission.module.moduleName}</td>
    			<td>${employeePermission.permission.module.subModuleName}</td>
    			<td><a href="deleteemployeePermission?id=${employeePermission.rolePermissionId}" style="color:red">删除</a></td>
    		 </tr>    		
    	</c:forEach>
	</table>
	<!-- <div style="position: relative;width: 90%;height: 131px;right: 0;clear:both;"> -->
    	<div style="margin-left: 114px;margin-top: 22px;">
		    <input id="lastpage" type="button" value="上一页" >
		    <input id="curPage" type="text" size="5">
		    <input id="nextpage" type="button" value="下一页">
		  	 共<input id="page" type="text" size="1" readonly="readonly" >页  		 
    	</div>
    <!-- </div> -->
</div>

     
</body>
<script type="text/javascript">
$(document).ready(function(){
	$(".select").change(function(){
		console.log($(".select option:selected").val());
	});
});

    layui.config({
        base: '/Project_Consumption/extends/',
    }).extend({
        authtree: 'authtree',
    });
    layui.use(['jquery', 'authtree', 'form', 'layer'], function(){
        var $ = layui.jquery;
        var authtree = layui.authtree;
        var form = layui.form;
        var layer = layui.layer;
        // 初始化
        $.ajax({
            url: '/Project_Consumption/systemSet/tree.json?s=5',
            dataType: 'json',
            success: function(data){
         
                // 渲染时传入渲染目标ID，树形结构数据（具体结构看样例，checked表示默认选中），以及input表单的名字
                authtree.render('#LAY-auth-tree-index', data.data.trees, {
                     inputname: 'employeePermission.permission.permissionId' 
                    /* inputname:'authids' */
                    ,layfilter: 'lay-check-auth'
                    ,autowidth: true
                });

				$("input[value='yhzgl']").attr("name","");
                authtree.on('change(lay-check-auth)', function(data) {
                    console.log('监听 authtree 触发事件数据', data);
                    // 获取所有节点
                    var all = authtree.getAll('#LAY-auth-tree-index');
                    // 获取所有已选中节点
                    var checked = authtree.getChecked('#LAY-auth-tree-index');
                    // 获取所有未选中节点
                    var notchecked = authtree.getNotChecked('#LAY-auth-tree-index');
                    // 获取选中的叶子节点
                    var leaf = authtree.getLeaf('#LAY-auth-tree-index');
                    // 获取最新选中
                    var lastChecked = authtree.getLastChecked('#LAY-auth-tree-index');
                    // 获取最新取消
                    var lastNotChecked = authtree.getLastNotChecked('#LAY-auth-tree-index');
                    console.log(
                        'all', all,"\n",
                        'checked', checked,"\n",
                        'notchecked', notchecked,"\n",
                        'leaf', leaf,"\n",
                        'lastChecked', lastChecked,"\n",
                        'lastNotChecked', lastNotChecked,"\n"
                    );
                });
                authtree.on('deptChange(lay-check-auth)', function(data) {
                    console.log('监听到显示层数改变',data);
                });
                authtree.on('dblclick(lay-check-auth)', function(data) {
                    console.log('监听到双击事件',data);
                });
            },
            error: function(xml, errstr, err) {
                layer.alert(errstr+'，获取样例数据失败，请检查是否部署在本地服务器中！');
            }
        });
        // 表单提交样例
        form.on('submit(LAY-auth-tree-submit)', function(obj){
            var authids = authtree.getChecked('#LAY-auth-tree-index');
            console.log('Choosed authids is', authids);
            obj.field.authids = authids;
            console.log(obj.field);
            var arr = [];
            for(var i=1;i<authids.length;i++){
            	console.log(authids[i]);
            	arr.push(authids[i]);
            }
            for(var m=0;m<arr.length;m++){
	            $.ajax({
	                url: 'saveemployeePermission',
	                method:'post',
	                data: {'employeePermission.permission.permissionId':arr[m],
	                	'employeePermission.role.roleId':obj.field.change
	                },
	                success: function(res){
	                    layer.alert('提交成功！请刷新列表');
	                },
	                error:function(res){
	                	layer.alert('提交失败！权限中已有该权限');
	                }
	            });
            }
            
            return false;
        });
    });
</script>
<script type="text/javascript">

    // 获取最大深度样例
    function getMaxDept(dst){
        layui.use(['jquery', 'layer', 'authtree'], function(){
            var layer = layui.layer;
            var authtree = layui.authtree;

            layer.alert('树'+dst+'的最大深度为：'+authtree.getMaxDept(dst));
        });
    }
    // 全选样例
    function checkAll(dst){
        layui.use(['jquery', 'layer', 'authtree'], function(){
            var layer = layui.layer;
            var authtree = layui.authtree;

            authtree.checkAll(dst);
        });
    }
    // 全不选样例
    function uncheckAll(dst){
        layui.use(['jquery', 'layer', 'authtree'], function(){
            var layer = layui.layer;
            var authtree = layui.authtree;

            authtree.uncheckAll(dst);
        });
    }
    // 显示全部
    function showAll(dst){
        layui.use(['jquery', 'layer', 'authtree'], function(){
            var layer = layui.layer;
            var authtree = layui.authtree;

            authtree.showAll(dst);
        });
    }
    // 隐藏全部
    function closeAll(dst){
        layui.use(['jquery', 'layer', 'authtree'], function(){
            var layer = layui.layer;
            var authtree = layui.authtree;

            authtree.closeAll(dst);
        });
    }
    // 获取节点状态
    function getNodeStatus(dst){
        layui.use(['jquery', 'layer', 'authtree', 'laytpl'], function(){
            var layer = layui.layer;
            var authtree = layui.authtree;
            var laytpl = layui.laytpl;

            // 获取所有节点
            var all = authtree.getAll('#LAY-auth-tree-index');
            // 获取所有已选中节点
            var checked = authtree.getChecked('#LAY-auth-tree-index');
            // 获取所有未选中节点
            var notchecked = authtree.getNotChecked('#LAY-auth-tree-index');
            // 获取选中的叶子节点
            var leaf = authtree.getLeaf('#LAY-auth-tree-index');
            // 获取最新选中
            var lastChecked = authtree.getLastChecked('#LAY-auth-tree-index');
            // 获取最新取消
            var lastNotChecked = authtree.getLastNotChecked('#LAY-auth-tree-index');

            var data = [
                {func: 'getAll', desc: '获取所有节点', data: all},
                {func: 'getChecked', desc: '获取所有已选中节点', data: checked},
                {func: 'getNotChecked', desc: '获取所有未选中节点', data: notchecked},
                {func: 'getLeaf', desc: '获取选中的叶子节点', data: leaf},
                {func: 'getLastChecked', desc: '获取最新选中', data: lastChecked},
                {func: 'getLastNotChecked', desc: '获取最新取消', data: lastNotChecked},
            ];

            var string =  laytpl($('#LAY-auth-tree-nodes').html()).render({
                data: data,
            });
            layer.open({
                title: '节点状态'
                ,content: string
                ,area: '800px'
                ,tipsMore: true
            });
            $('body').unbind('click').on('click', '.LAY-auth-tree-show-detail', function(){
                layer.open({
                    type: 1,
                    title: $(this).data('title')+'-节点详情',
                    content: '['+$(this).data('content')+']',
                    tipsMore: true
                });
            });
        });
    }
    
    
    //table分页        
        var pageSize=10;  //每页显示的记录条数   
        var curPage=0;   //显示第curPage页
        var len;         //总行数
        var page;        //总页数
       $(function(){    
       len =$("#show_tab tr").length-1;   //去掉表头     
        page=len % pageSize==0 ? len/pageSize : Math.floor(len/pageSize)+1;//根据记录条数，计算页数
        console.log("len:"+len+"page:"+page);
        document.getElementById("page").value=page;
        curPage=1;
        displayPage();//显示第一页
      $("#nextpage").click(function(){//下一页
          if(curPage<page){
              curPage+=1;
          }
          else{
              alert("已经是最后一页啦！");
          }
         displayPage();
         });
      $("#lastpage").click(function(){//上一页
          if(curPage>1){
              curPage-=1;
          }
          else{
              alert("已经是第一页啦！");
          }
          displayPage();
          });
      $("#npage").click(function(){//跳到固定某一页
          var npage=parseInt(document.getElementById("curPage").value);
          if(npage>page||npage<1){
              alert("gaiyebucunzai");
          }
          else{
              curPage=npage;
          }
          displayPage();
          });
 });
 
 function displayPage(){  
     var begin=(curPage-1)*pageSize;//起始记录号
     var end = begin + pageSize;
     console.log("  begin:"+len+"   end:"+end);
     if(end > len ) end=len;
     $("#show_tab tr").hide();
     $("#show_tab tr").each(function(i){
         if(i-1>=begin && i-1<end)//显示第page页的记录
             {
             $("#show_tab_one").show();
             $(this).show();
             document.getElementById("curPage").value=curPage;
             }         
     });

 }        
 function pageSize2(){
     curPage=0;   //显示第curPage页   
     pageSize=parseInt(document.getElementById("pageSize").value);
      len =$("#show_tab tr").length-1;   //去掉表头     
      page=len % pageSize==0 ? len/pageSize : Math.floor(len/pageSize)+1;//根据记录条数，计算页数
      console.log("len:"+len+"   page:"+page);
      document.getElementById("page").value=page;
      curPage=1;
      displayPage();//显示第一页   
 }
</script>
<!-- 状态模板 -->
<script type="text/html" id="LAY-auth-tree-nodes">
    <style type="text/css">
        .layui-layer-page .layui-layer-content{
            padding: 20px;
            line-height: 22px;
        }
    </style>
    <table class="layui-table">
        <thead>
        <th>方法名</th>
        <th>描述</th>
        <th>节点</th>
        </thead>
        <tbody>
        {{# layui.each(d.data, function(index, item) { }}
        <tr>
            <td>{{item.func}}</td>
            <td>{{item.desc}}</td>
            <td><a class="LAY-auth-tree-show-detail" href="javascript:;" data-title="{{item.desc}}" data-content="{{item.data.join(']<br>[')}}">查看详情</a>({{item.data.length}})</td>
        </tr>
        {{# });}}
        </tbody>
    </table>
</script>

</html>