<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>忘记密码</title>
<meta charset="utf-8">
<link rel="stylesheet" href="layui/css/layui.css">

<style type="text/css">
.container {
	width: 420px;
	height: 400px;
	min-height: 330px;
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
</style>


</head>
<body>
<body>
<div class="layui-form"  >
	<div class="container">
		<button class="close" title="关闭">X</button>
		<div class="layui-form-mid layui-word-aux">
			<img src="images/w.jpg" height="100px" width="100%">

		</div>
		</br>

		<div class="layui-form-item">
			<label class="layui-form-label" width="100px">学 &nbsp 号</label>
			<div class="layui-input-block">
				<input type="text" name="id" id="id" required
					lay-verify="required|number" placeholder="请输入学号" lay-verType="msg"
					autocomplete="off" class="layui-input">
			</div>
		</div>
		</br>

		<div class="layui-form-item">
			<label class="layui-form-label">身份证</label>
			<div class="layui-input-inline">
				<input type="text" name="sidnum" id="sidnum" required
					lay-verify="required|number" placeholder="请输入身份证后六位"
					autocomplete="off" class="layui-input">
			</div>

		</div>

		</br>

		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit lay-filter="passcheck"
					>验&nbsp证</button>
			</div>
		</div>

	</div>
</div>
	<script type="text/javascript" src="layui/layui.js"></script>
	<!-- ajax异步发送请求，使用jQuery封装，大大简化了编写难度 -->
	<script type="text/javascript">
	
	layui.use(['form','layer'], function(){
		  var form = layui.form; //只有执行了这一步，部分表单元素才会自动修饰成功
		var layer = layui.layer
		,$ = layui.jquery;
		
		  form.render();
	});      
	</script>

<script>
function passcheck() {
	var id = $('#id').val();
	var sidnum = $('#sidnum').val();
	$.ajax({
		type : 'post',
		url : 'PassFindServlet',
		data : {
			'id' : id,
			'sidnum' : sidnum,
			'opt' : "check"
		},
		dataType : 'text',//传回来的参数类型 text,json 

		success : function(res) {
			if (res == "success") {
				console.log("chegong");
				layer.msg('验证成功，即将跳转修改页面', {
					offset : '15px',
					icon : 1,
					time : 2000
				})
				window.location.href = "PassFindServlet?page=set";
			} else if (res == "faile") {
				console.log("shibai");
				return layer.msg("验证失败，请检查输入的内容");
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
							form.on('submit(passcheck)', function(data) {
								/* layer.alert(JSON.stringify(data.field), {
									title : '最终的提交信息'
								}) */
								passcheck();
								
								return false;
							});

						});
	</script>
</body>


</body>
<script src="jquery/jquery-2.2.4.min.js"></script>
</html>