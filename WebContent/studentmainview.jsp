<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- <script type="text/javascript">
window.onerror=function(){
	return true;
}
$(function(){
	header=H;
	var h=$(window).height();
	$("iframe").height((h-headerH)+"px")
})

</script> -->
<script type="text/javascript">
if(window!=top){
	top.location.href=location.href;
}
</script>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  >
  <link rel="stylesheet" href="./layui/css/layui.css">
  
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学生信息管理子系统</title>
</head>
<body>
<%
System.out.println("studentmainview界面获取到的session为"+session.getAttribute("role"));
if(session.getAttribute("role")=="student" ){
	
}else{
	%>
	<script type="text/javascript">
	alert("您还没有权限，请登录");
	window.document.location.href="login.jsp";
	</script>
 <%    
}
%> 
<div class="layui-layout layui-layout-admin">
  <div class="layui-header">
    <div class="layui-logo layui-hide-xs layui-bg-black">学生信息管理子系统</div>
    <!-- 头部区域（可配合layui 已有的水平导航） -->
    <ul class="layui-nav layui-layout-left">
      <!-- 移动端显示 -->
      <li class="layui-nav-item layui-show-xs-inline-block layui-hide-sm" lay-header-event="menuLeft">
        <i class="layui-icon layui-icon-spread-left"></i>
      </li>
      
      <li class="layui-nav-item layui-hide-xs"><a href="index.jsp">控制台</a></li>
      <li class="layui-nav-item layui-hide-xs"><a href="teachermainview.jsp">老师</a></li>
      <li class="layui-nav-item layui-hide-xs"><a href="studentmainview.jsp">学生</a></li>
    </ul>
    <ul class="layui-nav layui-layout-right">
      <li class="layui-nav-item layui-hide layui-show-md-inline-block">
        <a href="javascript:;">
          <img src="images/boy.gif" class="layui-nav-img">
         
        </a>
        <dl class="layui-nav-child">
          <dd><a href="login.jsp">登录</a></dd>
          <dd><a href="RegisterServlet">注册</a></dd>
          <dd><a href="OutLoginServlet">登出</a></dd>
        </dl>
      </li>
      <li class="layui-nav-item" lay-header-event="menuRight" lay-unselect>
        <a href="javascript:;">
          <i class="layui-icon layui-icon-more-vertical"></i>
        </a>
      </li>
    </ul>
  </div>
  
  <div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
      <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
      <ul class="layui-nav layui-nav-tree" lay-filter="test">
        <li class="layui-nav-item layui-nav-itemed">
          <a class="" href="javascript:;">主要功能</a>
          <dl class="layui-nav-child">
            <dd><a href="StuinfoshServlet2">学生信息查看</a></dd>
            <dd><a href="GradeshServlet2">学生成绩查看</a></dd>
            <!-- <dd><a href="studentadd.jsp">查看成绩</a></dd> -->
            
          </dl>
        </li>
        
        <li class="layui-nav-item"><a href="javascript:;">解决方案</a></li>
        <li class="layui-nav-item"><a href="">方案一</a></li>
      </ul>
    </div>
  </div>
  
  <div class="layui-body">
    <!-- 内容主体区域 -->
    
   <!--  <div style="padding: 15px;">内容主体区域。记得修改 layui.css 和 js 的路径</div> -->
    <iframe src="welcome.jsp" id="main" height="100%" width="100%"></iframe>
     
  
  <div class="layui-footer">
 <div class="/layui-trans layadmin-user-login-footer">

			<p>©第三组，组长张晓龙</p>

		</div>
  </div>
</div>
<script src="./layui/layui.js"></script>

<script>
//JS 
layui.use(['element', 'layer', 'util'], function(){
  var element = layui.element
  ,layer = layui.layer
  ,util = layui.util
  ,$ = layui.jquery;
  $(document).ready(
		  function(){
			  $('dd>a').click(
				function(e){
					e.preventDefault();
					$('#main').attr("src",$(this).attr("href"));
					});
					});
  //头部事件
  util.event('lay-header-event', {
    //左侧菜单事件
    menuLeft: function(othis){
      layer.msg('展开左侧菜单的操作', {icon: 0});
    }
    ,menuRight: function(){
      layer.open({
        type: 1
        ,content: '<div style="padding: 15px;">处理右侧面板的操作</div>'
        ,area: ['260px', '100%']
        ,offset: 'rt' //右上角
        ,anim: 5
        ,shadeClose: true
      });
    }
  });
  
});
</script>
 <!-- <script>
  layui.config({
    base: 'style/' //静态资源所在路径
  }).extend({
    index: 'lib/index' //主入口模块
  }).use('index');
  </script> -->
</body>
</html>