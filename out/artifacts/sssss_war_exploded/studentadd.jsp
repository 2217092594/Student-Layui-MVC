<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>注册</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<link rel="stylesheet" href="layui/css/layui.css" media="all">
<link rel="stylesheet" href="style/admin.css" media="all">
<link rel="stylesheet" href="style/login.css" media="all">
 <script type="text/javascript">
 if(parent==self){
	 alert("请以正常的方式进入访问系统");
	 history.back();
	 }
 

</script>
</head>
<body>


	<div class="layadmin-user-login layadmin-user-display-show"
		id="LAY-user-login" style="display: none;">
		<div class="layadmin-user-login-main">
			<div class="layadmin-user-login-box layadmin-user-login-header">
				<h2>添加学生信息</h2>
				<p>233333</p>
			</div>
			<div
				class="layadmin-user-login-box layadmin-user-login-body layui-form">
				<div class="layui-form-item">
					<label
						class="layadmin-user-login-icon layui-icon layui-icon-note"
						for="LAY-user-login-nickname" style="font-size: 25px; color: #393D49;"></label> <input type="text"
						name="nickname" id="id" lay-verify="required|number"
						placeholder="ID" class="layui-input">
				</div>
				<div class="layui-form-item">
					<label
						class="layadmin-user-login-icon layui-icon layui-icon-username"
						for="LAY-user-login-nickname"style="font-size: 25px; color: #393D49;"></label> <input type="text"
						name="nickname" id="name" lay-verify="required|nickname"
						placeholder="姓名" class="layui-input">
				</div>
				
				<div class="layui-form-item">
					<label
						class="layadmin-user-login-icon layui-icon layui-icon-heart-fill"
						for="LAY-user-login-nickname"style="font-size: 25px; color: #393D49;"></label> <input type="text"
						name="nickname" id="age" lay-verify="required|number"
						placeholder="年龄" class="layui-input">
				</div>
				<div class="layui-form-item">
					<label
						class="layadmin-user-login-icon layui-icon layui-icon-face-surprised"
						for="LAY-user-login-nickname"style="font-size: 25px; color: #393D49;"></label> <input type="text"
						name="nickname" id="sex" lay-verify="required|nickname"
						placeholder="性别" class="layui-input">
				</div>
				<div class="layui-form-item">
					<label
						class="layadmin-user-login-icon layui-icon layui-icon-template-1"
						for="LAY-user-login-nickname"style="font-size: 25px; color: #393D49;"></label> <input type="text"
						name="nickname" id="classs" lay-verify="required|nickname"
						placeholder="班级" class="layui-input">
				</div>
				<div class="layui-form-item">
					<label
						class="layadmin-user-login-icon layui-icon layui-icon-read"
						for="LAY-user-login-nickname"style="font-size: 25px; color: #393D49;"></label> <input type="text"
						name="nickname" id="zy" lay-verify="required|nickname"
						placeholder="学科" class="layui-input">
				</div>
				
				<div class="layui-form-item">
					<label
						class="layadmin-user-login-icon layui-icon layui-icon-cellphone"
						for="LAY-user-login-cellphone"style="font-size: 25px; color: #393D49;"></label> <input type="text"
						name="cellphone" id="phone" lay-verify="phone|required"
						placeholder="手机" class="layui-input">
				</div>
				
				<div class="layui-form-item">
					<label
						class="layadmin-user-login-icon layui-icon layui-icon-cellphone"
						for="LAY-user-login-cellphone"style="font-size: 25px; color: #393D49;"></label> <input type="text"
						name="cellphone" id="sidnum" lay-verify="required|identity"
						placeholder="身份证" class="layui-input">
				</div>
				
				
					<div class="layui-form-item">
					<button class="layui-btn layui-btn-fluid" lay-submit
						lay-filter="studentadd" >添 加</button>
				</div>
				
			</div>
		</div>

		<div class="layui-trans layadmin-user-login-footer">

			<p>© All Rights Reserved：张晓龙</p>

		</div>

	</div>

	<script src="layui/layui.js"></script>
	<script type="text/javascript">
	function studentadd() {
		var id = $('#id').val();
		var name = $('#name').val();
		var age = $('#age').val();
		var sex = $('#sex').val();
		var phone = $('#phone').val();
		var zy = $('#zy').val();
		var classs = $('#classs').val();
		var sidnum = $('#sidnum').val();
		/* var opt=$('input[name="opt"]:checked').val(); */
		/* alert("name" + name + "mima" + password); */
		$.ajax({
			type : 'post',
			url : 'StuinfoinServlet',
			data : {
				'sid':id,
				'sname' : name,
				'ssex' : sex,
				'sage':age,
				'sclass':classs,
				'sphone':phone,
				'szy':zy,
				'sidnum':sidnum
			},
			dataType : 'text',//传回来的参数类型 text,json 

			success : function(res) {
				if (res == "success") {
					layer.msg(
							'添加成功'/* ,
						    {
								offset : '15px',
								icon : 1,
								time : 1000
							}  */)
				} else if(res=="faile"){
					return layer.msg("添加失败");
				}else if(res=="youle"){
					return layer.msg("该学生信息已存在");
				}
			}
		})
	}
	</script>
	
	<!-- <script>
		layui
				.config({
					base : '/layui/' //静态资源所在路径
				})
				.extend({
					index : 'lib/index' //主入口模块
				})
				.use(
						[ 'index', 'user' ],
						function() {
							var $ = layui.$, setter = layui.setter, admin = layui.admin, form = layui.form, router = layui
									.router();

							form.render();

							//提交
							form
									.on(
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
																layer
																		.msg(
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
	</script> -->
	
	  <script>
		layui.use([ 'form', 'layedit', 'laydate' ],
						function() {
							var form = layui.form, 
							layer = layui.layer, 
							layedit = layui.layedit, 
							laydate = layui.laydate;

							
							//监听提交
							form.on('submit(studentadd)', function(data) {
							 /* layer.alert(JSON.stringify(data.field), {
									title : '最终的提交信息'
								})  */
								/* var data1 = form.val("teacheradd");
						console.log(JSON.stringify(data.field)); */ 
							studentadd();
					
								return false;
							});


							
						});
	</script>  
	
	<script src="jquery/jquery-2.2.4.min.js"></script>
</body>
</html>
