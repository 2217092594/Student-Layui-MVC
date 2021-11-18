<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>更改密码</title>
<link rel="stylesheet" href="layui/css/layui.css">
<style type="text/css">
.container {
	width: 420px;
	height: 300px;
	min-height: 200px;
	max-height: 360px;
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
#bg{

 

    width: 100%;
 

    height: 100%;
 

    top: 0px;
 

    left: 0px;
 

    position: absolute;
 

}
</style>

</head>
<img src="images/pass.jpg" height="100px" width="100%" id="bg">
<body >

<div class="layui-form" background="images/pass.jpg" >
	<div class="container">
		<button class="close" title="关闭">X</button>
		<div class="layui-form-mid layui-word-aux">
			<img src="images/set.png" height="100px" width="100%">

		</div>
		</br>

		<div class="layui-form-item">
			<label class="layui-form-label">新密码</label>
			<div class="layui-input-inline">
				<input type="text" name="password" id="password" required
					lay-verify="required|number" placeholder="请输入新的密码"
					autocomplete="off" class="layui-input">
			</div>

		</div>

		</br>

		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit lay-filter="passset" id="passset"
					>更&nbsp改</button>
			</div>
		</div>

	</div>
</div>
	<script type="text/javascript" src="layui/layui.js"></script>
	
		<script type="text/javascript">
	
	layui.use(['form','layer'], function(){
		  var form = layui.form; //只有执行了这一步，部分表单元素才会自动修饰成功
		var layer = layui.layer
		,$ = layui.jquery;
		
		  form.render();
	});      
	</script>
	
	<script>
function passset() {
	
	var password = $('#password').val();
	$.ajax({
		type : 'post',
		url : 'PassFindServlet',
		data : {
			'password' : password,
			'opt' : "set"
		},
		dataType : 'text',//传回来的参数类型 text,json 

		success : function(res) {
			if (res == "success") {
				console.log("chegong");
				layer.msg('修改成功，即将跳转登录页面', {
					offset : '15px',
					icon : 1,
					time : 2000
				})
				window.location.href = "login.jsp";
			} else if (res == "faile") {
				console.log("shibai");
				return layer.msg("修改失败，请联系管理员解决问题！！");
			}
		}
	})
}
</script>
	
	<script>
		layui.use([ 'form', 'layedit', 'laydate' ],
						function() {
							var form = layui.form, layer = layui.layer, layedit = layui.layedit, laydate = layui.laydate;
							//监听提交
							form.on('submit(passset)', function(data) {
								/* layer.alert(JSON.stringify(data.field), {
									title : '最终的提交信息'
								}) */
								passset();
								
								return false;
							});

						});
	</script>
	
</body>

<script src="jquery/jquery-2.2.4.min.js"></script>
</html>