<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
	if (window != top) {
		top.location.href = location.href;

	}
</script>

<%
	System.out.println("index界面获取到的session为" + session.getAttribute("role"));
	if (session.getAttribute("role") == "admin") {

	} else {
%>
<script type="text/javascript">
	alert("您还没有权限，请登录");
	window.document.location.href = "login.jsp";
</script>
<%
	}
%>



<head>

<link rel="icon" href="images/01.ico" type="image/x-icon">
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
>
<link rel="stylesheet" href="./layui/css/layui.css">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
　
img {
	transition: all 2s;
}

img:hover {
	transform: rotate(360deg);
}
</style>


<title>学生信息管理子系统</title>
</head>
<body>
	<div class="layui-layout layui-layout-admin">
		<div class="layui-header">
			<div>

				<div class="layui-logo layui-hide-xs layui-bg-black"
					style="height: 70px; align-items: center; justify-content: center; display: flex;">
					<ul>

						<div id="head"
							style="border-radius: 50%; overflow: hidden; width: 70px; height: 70px; margin: 0; padding: 0">
							<img src="images/011.jpg" style="transition: all 2s"
								hover="transform:rotate(360deg)">

						</div>


					</ul>
				</div>



			</div>
			<!-- 头部区域（可配合layui 已有的水平导航） -->
			<ul class="layui-nav layui-layout-left">
				<!-- 移动端显示 -->
				<li class="layui-nav-item layui-show-xs-inline-block layui-hide-sm"
					lay-header-event="menuLeft"><i
					class="layui-icon layui-icon-spread-left"></i></li>

				<li class="layui-nav-item layui-hide-xs"><a href="index.jsp">
						<i class="layui-icon layui-icon-console"></i> 控制台
				</a></li>
				<li class="layui-nav-item layui-hide-xs"><a
					href="teachermainview.jsp"> <i
						class="layui-icon layui-icon-group"></i> 老师
				</a></li>
				<li class="layui-nav-item layui-hide-xs"><a
					href="studentmainview.jsp"> <i
						class="layui-icon layui-icon-friends"></i> 学生
				</a></li>
			</ul>
			<ul class="layui-nav layui-layout-right">
				<li class="layui-nav-item layui-hide layui-show-md-inline-block">
					<a href="javascript:;"> <img src="images/boy.gif"
						class="layui-nav-img">

				</a>
					<dl class="layui-nav-child">
						<dd>
							<a href="login.jsp"><i
								class="layui-icon layui-icon-username "
								style="font-size: 15px; color: #FF7900;"></i> 登录</a>
						</dd>
						<dd>
							<a href="RegisterServlet"><i
								class="layui-icon layui-icon-logout "
								style="font-size: 15px; color: #4E6EF2;"></i> 注册</a>
						</dd>
						<dd>
							<a href="OutLoginServlet"><i
								class="layui-icon layui-icon-logout "
								style="font-size: 15px; color: red;"></i> 登出</a>
						</dd>
					</dl>
				</li>
				<li class="layui-nav-item" lay-header-event="menuRight" lay-unselect>
					<a href="javascript:;"> <i
						class="layui-icon layui-icon-more-vertical"></i>
				</a>
				</li>
			</ul>
		</div>

		<div class="layui-side layui-bg-black" style="top: 70px">
			<div class="layui-side-scroll">
				<!-- 左侧导航区域（可配合layui已有的垂直导航） -->

				<ul class="layui-nav layui-nav-tree" lay-filter="test">

					<li class="layui-nav-item layui-nav-itemed"><a class=""
						href="javascript:;"> <i
							class="layui-icon layui-icon-template-1"></i> 主要功能
					</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="StuinfoshServlet">管理学生列表</a>
							</dd>
							<dd>
								<a href="TeainfoshServlet">管理教师列表</a>
							</dd>
							<dd>
								<a href="GradeshServlet">管理成绩列表</a>
							</dd>
							<dd>
								<a href="StuinfoinServlet">添加学生</a>
							</dd>
							<dd>
								<a href="TeainfoinServlet">添加老师</a>
							</dd>
							<dd>
								<a href="GradeinServlet">添加成绩</a>
							</dd>

						</dl></li>



					<li class="layui-nav-item"><a href="javascript:;"> <i
							class="layui-icon layui-icon-face-surprised"></i> 敬请期待
					</a></li>
					<li class="layui-nav-item"><a href=""> <i
							class="layui-icon layui-icon-face-surprised"></i> 敬请期待
					</a></li>
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
			layui
					.use(
							[ 'element', 'layer', 'util' ],
							function() {
								var element = layui.element, layer = layui.layer, util = layui.util, $ = layui.jquery;
								$(document)
										.ready(
												function() {
													$('dd>a')
															.click(
																	function(e) {
																		e
																				.preventDefault();
																		$(
																				'#main')
																				.attr(
																						"src",
																						$(
																								this)
																								.attr(
																										"href"));
																	});
												});
								//头部事件
								util.event('lay-header-event', {
									//左侧菜单事件
									menuLeft : function(othis) {
										layer.msg('展开左侧菜单的操作', {
											icon : 0
										});
									},
									menuRight : function() {
										layer.open({
											type : 1,
											content : '',
											area : [ '260px', '100%' ],
											offset : 'rt' //右上角
											,
											anim : 5,
											shadeClose : true
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