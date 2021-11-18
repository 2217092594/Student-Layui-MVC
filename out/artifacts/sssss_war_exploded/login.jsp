<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录</title>
<meta charset="utf-8">
<link rel="stylesheet" href="layui/css/layui.css">
<script type="text/javascript">
if(window!=top){
	top.location.href=location.href;
}
</script>
<style type="text/css">
.container {
	width: 420px;
	height: 320px;
	min-height: 320px;
	max-height: 320px;
	position: absolute;
	top: 0;
	left: 0;
	bottom: 0;
	right: 0;
	margin: auto;
	padding: 20px;
	z-index: 130;
	border-radius: 8px;
	background-color: #fff;
	box-shadow: 0 3px 18px rgba(100, 0, 0, .5);
	font-size: 16px;
}

.close {
	background-color: white;
	border: none;
	font-size: 18px;
	margin-left: 410px;
	margin-top: -10px;
}

.layui-input {
	border-radius: 5px;
	width: 300px;
	height: 40px;
	font-size: 15px;
}

.layui-form-item {
	margin-left: -20px;
}

#logoid {
	margin-top: -16px;
	padding-left: 150px;
	padding-bottom: 15px;
}

.layui-btn {
	margin-left: -50px;
	border-radius: 5px;
	width: 350px;
	height: 40px;
	font-size: 15px;
}

.verity {
	width: 120px;
}

.font-set {
	font-size: 13px;
	text-decoration: none;
	margin-left: 120px;
}

a:hover {
	text-decoration: underline;
}
</style>


</head>
<body>
<body>
	<form class="layui-form" action="LoginControl?opt=login" method="post">
		<div class="container">
			<button class="close" title="关闭">X</button>
			<div class="layui-form-mid layui-word-aux">
				<img id="logoid" src="images/06.png" height="35">
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">学 &nbsp;&nbsp;号</label>
				<div class="layui-input-block">
					<input type="text" name="id" required lay-verify="required|number"
						placeholder="请输入学号" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">姓 &nbsp;&nbsp;名</label>
				<div class="layui-input-block">
					<input type="text" name="name" required lay-verify="required"
						placeholder="请输入用户名" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">密 &nbsp;&nbsp;码</label>
				<div class="layui-input-inline">
					<input type="password" name="password" required
						lay-verify="required" placeholder="请输入密码" autocomplete="off"
						class="layui-input">
				</div>
				<!-- <div class="layui-form-mid layui-word-aux">辅助文字</div> -->
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">类 &nbsp;&nbsp;型</label>
				<div class="layui-input-block">
					<input type="radio" name="typ" value="1" title="学生" checked> <input
						type="radio" name="typ" value="2" title="教师">
						<input type="radio" name="typ" value="3" title="管理员" >
				</div>
			</div>
			<!-- 			  <div class="layui-form-item">
				    <label class="layui-form-label">记住密码</label>
				    <div class="layui-input-block">
				      <input type="checkbox" name="close" lay-skin="switch" lay-text="ON|OFF">
				    </div>
			  </div> -->

			<div class="layui-form-item">
				<div class="layui-input-block">
					<button class="layui-btn" lay-submit lay-filter="formDemo">登陆</button>
				</div>
			</div>
			<br> <a href="PassFindServlet?page=check" class="font-set">忘记密码?</a> <a href="RegisterServlet"
				class="font-set">立即注册</a>
		</div>
	</form>
	<script type="text/javascript" src="layui/layui.js"></script>
	<script>
		layui.use(
						[ 'form', 'layedit', 'laydate' ],
						function() {
							var form = layui.form, 
							layer = layui.layer, 
							layedit = layui.layedit, 
							laydate = layui.laydate;

							
							//监听提交
							form.on('submit(demo1)', function(data) {
								layer.alert(JSON.stringify(data.field), {
									title : '最终的提交信息'
								})
								return false;
							});

							

						});
	</script> 
</body>


</body>
</html>