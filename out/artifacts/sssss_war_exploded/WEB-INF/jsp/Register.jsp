<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<meta charset="utf-8">
<title>注册</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<link rel="stylesheet" href=".//layui/css/layui.css" media="all">
<link rel="stylesheet" href=".//style/admin.css" media="all">
<link rel="stylesheet" href=".//style/login.css" media="all">

</head>
<body>


	<div class="layadmin-user-login layadmin-user-display-show"
		id="LAY-user-login" style="display: none;">
		<div class="layadmin-user-login-main">
			<div class="layadmin-user-login-box layadmin-user-login-header">
				<h2>注册页模板演示</h2>
				<p></p>
			</div>
			<div
				class="layadmin-user-login-box layadmin-user-login-body layui-form">
				<div class="layui-form-item">
					<label
						class="layadmin-user-login-icon layui-icon layui-icon-username"
						for="LAY-user-login-nickname"></label> <input type="text"
						name="nickname" id="id" lay-verify="required|nickname"
						placeholder="ID" class="layui-input">
				</div>
				<div class="layui-form-item">
					<label
						class="layadmin-user-login-icon layui-icon layui-icon-username"
						for="LAY-user-login-nickname"></label> <input type="text"
						name="nickname" id="name" lay-verify="required|nickname"
						placeholder="用户名" class="layui-input">
				</div>
				<div class="layui-form-item">
					<label
						class="layadmin-user-login-icon layui-icon layui-icon-password"
						for="LAY-user-login-password"></label> <input type="password"
						name="password" id="password" lay-verify="required"
						placeholder="密码" class="layui-input">
				</div>
				<div class="layui-form-item">
					<label
						class="layadmin-user-login-icon layui-icon layui-icon-password"
						for="LAY-user-login-repass"></label> <input type="password"
						name="repass" id="LAY-user-login-repass" lay-verify="required"
						placeholder="确认密码" class="layui-input">
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">选择身份：&nbsp;&nbsp;</label>
					<div class="layui-input-block">
						<input type="radio" name="opt" value="student" title="学生"
							checked=""> <input type="radio" name="opt"
							value="teacher" title="老师">
							<input type="radio" name="opt"
							value="admin" title="admin">
					</div>
				</div>
				<div class="layui-form-item" style="height: 18px">
					<input type="checkbox" name="agreement" lay-skin="primary"
						title="同意用户协议" checked>
				</div>
				<div class="layui-form-item">
					<button class="layui-btn layui-btn-fluid" lay-submit
						lay-filter="LAY-user-reg-submit" onclick="register()">注 册</button>
				</div>

			</div>
		</div>

		<div class="/layui-trans layadmin-user-login-footer">

			<p>© All Rights Reserved</p>

		</div>

	</div>

	<script src=".//layui/layui.js"></script>
	<script type="text/javascript">
		function register() {
			var id = $('#id').val();
			var name = $('#name').val();
			var password = $('#password').val();
			var opt=$('input[name="opt"]:checked').val();
			/* alert("name" + name + "mima" + password); */
			$.ajax({
				type : 'post',
				url : 'RegisterServlet',
				data : {
					'id':id,
					'name' : name,
					'password' : password,
					'opt':opt
				},
				dataType : 'text',//传回来的参数类型 text,json 

				success : function(res) {
					if(opt=="student"){
					if (res == "success") {
						layer
						.msg(
								'学生注册成功',
								{
									offset : '15px',
									icon : 1,
									time : 1000
								},
								function() {
									top.location.href = "studentmainview.jsp"; //跳转到登入页
								});
					} else if(res=="faile"){
						return layer.msg("注册失败");
					}else if(res=="youle"){
						return layer.msg("id已经存在");
					}
				}else if(opt=="teacher"){
					if (res == "success") {
						layer
						.msg(
								'教师注册成功',
								{
									offset : '15px',
									icon : 1,
									time : 1000
								},
								function() {
									top.self.location = 'teachermainview.jsp'; 
									/* window.open("login.jsp"); //这个会跳转到新的页面打开*///跳转到登入页
								});
					} else if(res=="faile"){
						return layer.msg("注册失败");
					}else if(res=="youle"){
						return layer.msg("id已经存在");
					}
					
				}else if(opt=="admin"){
					
					if (res == "success") {
						layer
						.msg(
								'管理员注册成功',
								{
									offset : '15px',
									icon : 1,
									time : 1000
								},
								function() {
									top.location.href = "index.jsp"; //跳转到登入页
								});
					} else if(res=="faile"){
						return layer.msg("注册失败");
					}else if(res=="youle"){
						return layer.msg("id已经存在");
					}
					
				}
					
				}
			})
		}
	</script>

	<script>
		layui.config({
					base : '/layui/' //静态资源所在路径
				})
				.extend({
					index : 'lib/index' //主入口模块
				}).use(
						[ 'index', 'user' ],
						function() {
							var $ = layui.$, setter = layui.setter, admin = layui.admin, form = layui.form, router = layui
									.router();

							form.render();

							//提交
							form.on(
											'submit(LAY-user-reg-submit)',
											function(obj) {
												var field = obj.field;

												//确认密码
												if (field.password !== field.repass) {
													return layer
															.msg('两次密码输入不一致');
												}

												//是否同意用户协议
												if (!field.agreement) {
													return layer
															.msg('你必须同意用户协议才能注册');
												}

												//请求接口
												admin
														.req({
															url : layui.setter.base
																	+ 'json/user/reg.js' //实际使用请改成服务端真实接口
															,
															data : field,
															done : function(res) {
																layer.msg(
																				'注册成功',
																				{
																					offset : '15px',
																					icon : 1,
																					time : 1000
																				},
																				function() {
																					location.hash = '/user/login'; //跳转到登入页
																				});
															}
														});

												return false;
											});
						});
	</script>
<head>
<script src="jquery/jquery-2.2.4.min.js">
	
</script>
</head>
</body>
</html>