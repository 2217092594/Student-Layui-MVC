<%@page import="java.awt.Checkbox"%>
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

<!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>

<body>

	<script type="text/javascript">
		if (parent == self) {
			alert("请以正常的方式进入访问系统");
			history.back();
		}
	</script>
	<table class="layui-hide" id="test" lay-filter="test"></table>

	<script type="text/html" id="toolbarDemo">
  <div class="layui-btn-container">
    <button class="layui-btn layui-btn-sm" lay-event="getCheckData">获取选中行数据</button>
    <button class="layui-btn layui-btn-sm" lay-event="getCheckLength">获取选中数目</button>
    <button class="layui-btn layui-btn-sm" lay-event="isAll">验证是否全选</button>
<button class="layui-btn layui-btn-primary layui-border-green" onclick="choose()" >生成图表</button>
  </div>
</script>

	<script type="text/html" id="barDemo">
  
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>


	<script src="layui/layui.js" charset="utf-8"></script>
	<script src="jquery/jquery-2.2.4.min.js" charset="utf-8"></script>
	<!-- 注意：如果你直接复制所有代码到本地，上述 JS 路径需要改成你本地的 -->

	<script>
	var table;
		layui.use([ 'table', 'util' ], function() {
			 table = layui.table, util = layui.util;

			table.render({
				elem : '#test',
				skin : 'line',
				method : 'post',
				even : 'true',
				size : 'lg',
				limit : '6',
				height : 'full-50',
				url : 'GradeshServlet',
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
					field : 'id',
					title : 'ID',
					width : 80,
					fixed : 'left',
					unresize : true,
					sort : true
				}, {
					field : 'name',
					title : '姓名',
					width : 80,
					edit : 'text',
					sort : true
				}, {
					field : 'classs',
					title : '班级',
					width : 180,
					edit : 'text',
					sort : true
				}, {
					field : 'yuwen',
					title : '语文',
					width : 80,
					edit : 'text',
					sort : true
				}, {
					field : 'shuxue',
					title : '数学',
					width : 80,
					edit : 'text',
					sort : true
				}, {
					field : 'yingyu',
					title : '英语',
					edit : 'text',
					width : 80,
					sort : true
				}, {
					field : 'wuli',
					title : '物理',
					edit : 'text',
					width : 80,
					sort : true
				}, {
					field : 'huaxue',
					title : '化学',
					edit : 'text',
					width : 80,
					sort : true
				}, {
					field : 'shengwu',
					title : '生物',
					edit : 'text',
					width : 80,
					sort : true
				}, {
					fixed : 'right',
					title : '操作',
					toolbar : '#barDemo',
					width : 150
				} ] ],
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
							url : 'GradedeServlet',
							data : {
								'id' : data.id
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
				} 
			});

			//监听单元格编辑
			
			table.on('edit(test)', function(obj) {
				var value = obj.value //得到修改后的值
				data = obj.data //得到所在行所有键值
				var field = obj.field; //得到字段
				layer.msg('[ID: ' + data.sid + '] ' + field + ' 字段更改值为：'
						+ util.escape(value));
				$.ajax({
					type : 'post',
					url : 'GradeupServlet',
					data : {
						'id' : data.id,
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
	<script type="text/javascript">
	
		function choose() {
			layer.open({
				  type: 2,
				  skin: 'layui-layer-rim', //加上边框
				  area: ['80%', '100%'], //宽高
				  content: 'chart.jsp'
				});
	
		}
	</script>

</body>
</html>