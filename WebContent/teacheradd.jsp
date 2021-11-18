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
				<h2>添加教师信息</h2>
				<p>233333</p>
			</div>
			<div
				class="layadmin-user-login-box layadmin-user-login-body layui-form">
				<div class="layui-form-item">
					<label
						class="layadmin-user-login-icon layui-icon layui-icon-note"
						for="LAY-user-login-nickname" style="font-size: 25px; color: #009688;"></label> <input type="text"
						name="id" id="id" lay-verify="required|number"
						placeholder="ID" class="layui-input">
				</div>
				<div class="layui-form-item">
					<label
						class="layadmin-user-login-icon layui-icon layui-icon-username"
						for="LAY-user-login-nickname"style="font-size: 25px; color: #009688;"></label> <input type="text"
						name="name" id="name" lay-verify="required|nickname"
						placeholder="姓名" class="layui-input">
				</div>
				<div class="layui-form-item">
					<label
						class="layadmin-user-login-icon layui-icon layui-icon-face-surprised"
						for="LAY-user-login-nickname"style="font-size: 25px; color: #009688;"></label> <input type="text"
						name="sex" id="sex" lay-verify="required|nickname"
						placeholder="性别" class="layui-input">
				</div>
				<div class="layui-form-item">
					<label
						class="layadmin-user-login-icon layui-icon layui-icon-heart-fill"
						for="LAY-user-login-nickname"style="font-size: 25px; color: #009688;"></label> <input type="text"
						name="age" id="age" lay-verify="required|nickname"
						placeholder="年龄" class="layui-input">
				</div>
				<div class="layui-form-item">
					<label
						class="layadmin-user-login-icon layui-icon layui-icon-read"
						for="LAY-user-login-nickname"style="font-size: 25px; color: #009688;"></label> <input type="text"
						name="xueke" id="xueke" lay-verify="required|nickname"
						placeholder="学科" class="layui-input">
				</div>
				
				<div class="layui-form-item">
					<label
						class="layadmin-user-login-icon layui-icon layui-icon-cellphone"
						for="LAY-user-login-cellphone"style="font-size: 25px; color: #009688;"></label> <input type="text"
						name="phone" id="phone" lay-verify="phone"
						placeholder="手机" class="layui-input">
				</div>
				<div class="layui-form-item">
					<label
						class="layadmin-user-login-icon layui-icon layui-icon-email"
						for="LAY-user-login-cellphone"style="font-size: 25px; color: #009688;"></label> <input type="text"
						name="email" id="email" lay-verify="email"
						placeholder="邮箱" class="layui-input">
				</div>
				<div class="layui-form-item">
					<label
						class="layadmin-user-login-icon layui-icon layui-icon-read"
						for="LAY-user-login-nickname"style="font-size: 25px; color: #009688;"></label> <input type="text"
						name="tidnum" id="tidnum" lay-verify="required|identity"
						placeholder="身份证" class="layui-input">
				</div>
				
				
				<div class="layui-form-item">
					<button class="layui-btn layui-btn-fluid" lay-submit
						lay-submit lay-filter="teacheradd"   >添 加</button>
				</div>
				
				<!-- <div class="layui-form-item">
					<button class="layui-btn layui-btn-fluid" lay-submit
						lay-filter="teacheradd"  onclick="register()">注 册</button>
				</div> -->
			</div>
		</div>

		<div class="layui-trans layadmin-user-login-footer">

			<p>© All Rights Reserved：张晓龙</p>

		</div>

	</div>

	<script src="layui/layui.js"></script>
	
 <script type="text/javascript">
	function teacheradd() {
		var id = $('#id').val();
		var name = $('#name').val();
		var age = $('#age').val();
		var sex = $('#sex').val();
		var phone = $('#phone').val();
		var xueke = $('#xueke').val();
		var email = $('#email').val();
		var tidnum = $('#tidnum').val();
		/* var opt=$('input[name="opt"]:checked').val(); */
		/* alert("name" + name + "mima" + password); */
		$.ajax({
			type : 'post',
			url : 'TeainfoinServlet',
			data : {
				'tid':id,
				'tname' : name,
				'tsex' : sex,
				'tage':age,
				'temail':email,
				'tphone':phone,
				'txueke':xueke,
				'tidnum':tidnum
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
					return layer.msg("该教师信息已存在");
				}
			}
		})
	}
	</script>
	<!--  <script>
		layui.config({
					base : '/layui/' //静态资源所在路径
				}).extend({
					index : 'lib/index' //主入口模块
				}).use(
						[ 'index', 'user' ],
						function() {
							var $ = layui.$, 
							setter = layui.setter, 
							admin = layui.admin, 
							form = layui.form, 
							router = layui.router();

							form.render();

							//提交
							form.on('submit(teacheradd)',
											function(obj) {
												var field = obj.field;

											/* 	//确认密码
												if (field.password !== field.repass) {
													return layer
															.msg('两次密码输入不一致');
												}

												//是否同意用户协议
												if (!field.agreement) {
													return layer
															.msg('你必须同意用户协议才能注册');
												}
 */
												//请求接口
											/* 	admin.req({
															url :'TeainfoinServlet', //实际使用请改成服务端真实接口
															data : field,
															done : function(res) {
																layer.msg('注册成功',
																				{
																					offset : '15px',
																					icon : 1,
																					time : 1000
																				}/* ,
																				function() {
																					location.hash = 'login.jsp'; //跳转到登入页
																				} */);
															}
														}); */

														$.ajax({
															type : 'post',
															url : 'TeainfoinServlet',
															data :field,
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
																	return layer.msg("该教师信息已存在");
																}
															}
														});
												return false;
											});
						});
	</script>  -->
	
  <script>
		layui.use([ 'form', 'layedit', 'laydate' ],
						function() {
							var form = layui.form, 
							layer = layui.layer, 
							layedit = layui.layedit, 
							laydate = layui.laydate;

							
							//监听提交
							form.on('submit(teacheradd)', function(data) {
							 /* layer.alert(JSON.stringify(data.field), {
									title : '最终的提交信息'
								})  */
								/* var data1 = form.val("teacheradd");
						console.log(JSON.stringify(data.field)); */ 
							teacheradd();
					
								return false;
							});


							
						});
	</script>  
	<script src="jquery/jquery-2.2.4.min.js"></script>
</body>
</html>
