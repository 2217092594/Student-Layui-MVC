<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="layui/css/layui.css" media="all">
<link rel="stylesheet" href="style/admin.css" media="all">
<!-- <style type="text/css">
body,html{
width: 100%;
height: 100%;
}
.auto div{
width: 100%;
height: 100%;
}


</style> -->
</head>
<body >
<%-- <div>
<%
String yuwen= request.getParameter("yuwen");
String shuxue=request.getParameter("shuxue");
String yingyu=request.getParameter("yingyu");
String wuli=request.getParameter("wuli");
String huaxue=request.getParameter("huaxue");
String shengwu=request.getParameter("shengwu");
out.println(yuwen+shuxue+yingyu+wuli+huaxue+shengwu);
%>
</div> --%>
<div class="auto "   style="width: 100%;height: 100%;"  >
	<div class="layui-card">
    
        <div class="layui-card-body">
            <div id="EchartZhu" style="width: 800px;height: 500px;"> </div>
        </div>
</div>
</div>
</body>
<%int[] a = {100, 100, 100, 100, 100, 100}; 
System.out.println(a);
String b = "[100, 100, 100, 100, 100, 100]";
String c = "100, 100, 100, 100, 100, 100";
%>
<% System.out.print(a); %>
	<script type="text/javascript" src="layui/layui.js"></script>
	<script type="text/javascript">
	 layui.config({base:'layui/'}).extend({echarts: 'echarts'}).use(['jquery', 'form', 'layer', 'laydate', 'table','layedit','upload','element', 'echarts', 'carousel'], function () {
        var $ = layui.jquery;
        var element = layui.element;
        carousel = layui.carousel;
        echarts = layui.echarts;
        var form = layui.form;
        var layer = layui.layer;
        var laydate = layui.laydate;
        var table = layui.table;
        var layedit = layui.layedit;
        var upload = layui.upload;
         layer.msg("ss");
 
        var chart = echarts.init(document.getElementById('EchartZhu'));
        
      
        
        //指定图表配置项和数据
        
     var   option = {
        	    tooltip : {
        	        trigger: 'axis'
        	    },
        	    legend: {
        	        data:['张晓龙','金源','朱宏鑫','周华羽','赵倩']
        	    },
        	    toolbox: {
        	        show : true,
        	        feature : {
        	            mark : {show: true},
        	            dataView : {show: true, readOnly: false},
        	            magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
        	            restore : {show: true},
        	            saveAsImage : {show: true}
        	        }
        	    },
        	    calculable : true,
        	    xAxis : [
        	        {
        	            type : 'category',
        	            boundaryGap : false,
        	            data : ['语文','数学','英语','物理','化学','生物']
        	        }
        	    ],
        	    yAxis : [
        	        {
        	            type : 'value'
        	        }
        	    ],
        	    series : [
        	        {
        	            name:'张晓龙',
        	            type:'line',
        	            stack: '总量',
        	            itemStyle: {normal: {areaStyle: {type: 'default'}}},
        	            data:<%=b %>
        	        },
        	        {
        	            name:'金源',
        	            type:'line',
        	            stack: '总量',
        	            itemStyle: {normal: {areaStyle: {type: 'default'}}},
        	            data:[55, 68, 89, 98, 58, 85]
        	        },
        	        {
        	            name:'朱宏鑫',
        	            type:'line',
        	            stack: '总量',
        	            itemStyle: {normal: {areaStyle: {type: 'default'}}},
        	            data:[96, 96, 100, 50, 50, 80]
        	        },
        	        {
        	            name:'周华羽',
        	            type:'line',
        	            stack: '总量',
        	            itemStyle: {normal: {areaStyle: {type: 'default'}}},
        	            data:[100, 95, 96, 50, 50, 60]
        	        },
        	        {
        	            name:'赵倩',
        	            type:'line',
        	            stack: '总量',
        	            itemStyle: {normal: {areaStyle: {type: 'default'}}},
        	            data:[100, 95, 80, 40, 60, 80]
        	        }
        	    ]
        	};
        chart.setOption(option, true);
      
      

 
});
	 </script>
</html>