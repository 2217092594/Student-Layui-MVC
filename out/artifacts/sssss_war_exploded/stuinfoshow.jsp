<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Layui</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="layui/css/layui.css" media="all">
<script type="text/javascript">
	if (parent == self) {
		alert("请以正常的方式进入访问系统");
		history.back();
	}
</script>
<!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>

	<table class="layui-hide" id="test" lay-filter="test"></table>

	<script type="text/html" id="toolbarDemo">
  <div class="layui-btn-container">
    <button class="layui-btn layui-btn-sm" lay-event="getCheckData">获取选中行数据</button>
    <button class="layui-btn layui-btn-sm" lay-event="getCheckLength">获取选中数目</button>
    <button class="layui-btn layui-btn-sm" lay-event="isAll">验证是否全选</button>
  </div>
</script>

	<script type="text/html" id="barDemo">
  
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>


	<script src="layui/layui.js" charset="utf-8"></script>
	<script src="jquery/jquery-2.2.4.min.js" charset="utf-8"></script>
	<!-- 注意：如果你直接复制所有代码到本地，上述 JS 路径需要改成你本地的 -->

	<script>
		layui.use([ 'table', 'util' ], function() {
			var table = layui.table, util = layui.util;

			table.render({
				elem : '#test',
				skin : 'line',
				method : 'post',
				even : 'true',
				size : 'lg',
				escape : true,
				limit : '6',
				height : 'full-50',
				url : 'StuinfoshServlet',
				toolbar : '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
				,
				defaultToolbar : [ 'filter', 'exports', 'print', { //自定义头部工具栏右侧图标。如无需自定义，去除该参数即可
					title : '提示',
					layEvent : 'LAYTABLE_TIPS',
					icon : 'layui-icon-tips'
				} ],
				title : '用户数据表',
				cols : [ [ {
					type : 'checkbox',
					fixed : 'left'
				}, {
					field : 'sid',
					title : 'ID',
					width : 80,
					fixed : 'left',
					unresize : true,
					sort : true
				}, {
					field : 'sname',
					title : '用户名',
					width : 100,
					edit : 'text'
				}, {
					field : 'sage',
					title : '年龄',
					width : 50,
					edit : 'text',
					sort : true
				}, {
					field : 'ssex',
					title : '性别',
					width : 55,
					edit : 'text',
					sort : true
				}, {
					field : 'sclass',
					title : '班级',
					width : 100,
					edit : 'text'
				}, {
					field : 'szy',
					title : '专业',
					edit : 'text',
					width : 180
				}, {
					field : 'sphone',
					title : '手机',
					edit : 'text',
					width : 120
				}, {
					field : 'sidnum',
					title : '身份证号',
					edit : 'text',
					width : 180
				}, {
					fixed : 'right',
					title : '操作',
					toolbar : '#barDemo',
					width : 100
				}

				] ],
				page : true

			});

			//头工具栏事件
			table.on('toolbar(test)', function(obj) {
				var checkStatus = table.checkStatus(obj.config.id);
				switch (obj.event) {
				case 'getCheckData':
					var data = checkStatus.data;
					layer.alert(JSON.stringify(data));
					break;
				case 'getCheckLength':
					var data = checkStatus.data;
					layer.msg('选中了：' + data.length + ' 个');
					break;
				case 'isAll':
					layer.msg(checkStatus.isAll ? '全选' : '未全选');
					break;

				//自定义头工具栏右侧图标 - 提示
				case 'LAYTABLE_TIPS':
					layer.alert('made by 张晓龙');
					break;
				}
				;
			});

			//监听行工具事件
			table.on('tool(test)', function(obj) {
				var data = obj.data;
				//console.log(obj)
				if (obj.event === 'del') {
					layer.confirm('真的删除行么', function(index) {
						obj.del();
						$.ajax({
							type : 'post',
							url : 'StuinfodeServlet',
							data : {
								'id' : data.sid
							},
							dataType : 'text',//传回来的参数类型 text,json 

							success : function(res) {
								if (res == "success") {
									return layer.msg("删除成功");
								} else if (res == "faile") {
									return layer.msg("删除失败");
								}
							}

						});
						layer.close(index);
					});
				} else if (obj.event === 'edit') {
					layer.prompt({
						formType : 2,
						value : data.email
					}, function(value, index) {
						obj.update({
							email : value
						});
						layer.close(index);
					});
				}
			});

			//监听单元格编辑
			table.on('edit(test)', function(obj) {
				var value = obj.value //得到修改后的值
				, data = obj.data //得到所在行所有键值
				, field = obj.field; //得到字段
				layer.msg('[ID: ' + data.sid + '] ' + field + ' 字段更改值为：'
						+ util.escape(value));
				$.ajax({
					type : 'post',
					url : 'StuinfoupServlet',
					data : {
						'id' : data.sid,
						'field' : field,
						'value' : util.escape(value)
					},
					dataType : 'text',//传回来的参数类型 text,json 

					success : function(res) {
						if (res == "success") {
							return layer.msg("修改成功");
						} else if (res == "faile") {
							return layer.msg("修改失败");
						}
					}

				});
			});

		});
	</script>

</body>
</html>