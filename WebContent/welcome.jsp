<%@page import="java.util.Iterator"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>welcome</title>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<script type="text/javascript">
/* if(window!=top){
	top.location.href=location.href;
} */
</script>
</head>
<body style="background-image: url(images/back1.jpg); ::before:filter:blur(5px);">

<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="jumbotron">
				<h1>
					欢迎<%
			out.print(session.getAttribute("name"));
					%>来到学生信息管理子系统！！
				</h1>
				<p>
					尊敬的各位家长、各位嘉宾：

　　下午好！

　　首先请允许我代表全体教职员工对大家前来参加家长会表示热烈的欢迎！感谢大家长期以来对我校工作的关心与支持！

　　学校自进入新的历史时期以来，始终如一的走着自己的路：实行以个性作文┼希望数学┼空中英语整体推进的特色教学模式、开齐开足课程、专职教师任教、经常举办各种活动，以丰富学生的生活、注重礼仪教育、狠抓教学质量关。

　　学校注重对学生行为习惯的养成教育，除了学习成绩外，更注重学生情感、态度、价值观的引导，关注每一个学生德、智、体、美全面发展。

　　学校拥有过硬的师资队伍，他们爱岗敬业、爱生如子。特别是对留守学生，更是倾注一片爱心，学校把安全教育、防控春季传染病教育放在高于一切的位置，促进学生的身心健康。

　　各位家长，学校的办学成功，离不开各位家长的关心与支持，学生的成才需要学校、社会和家庭紧密配合。希望本次家长会能让您更多的了解孩子在校学习和生活情况，帮助学生平稳地度过小学阶段的最后一段学习时光，并以优秀的学习成绩进入初中学习。

　　少年有志，国家有望。少年强则国强，少年进步则国进步，少年雄于地球则国雄于地球。少年儿童的健康成长历来是党和政府十分关注的大事，我校全体老师将与社区、家长一起并肩携手，与时俱进，为学生的成长献力献策，推进教育事业再谱新乐章、再创新辉煌！

　　最后，再一次让我代表全校教职工，对大家的光临，表示热烈的欢迎！

　　谢谢大家！
				</p>
				<p>
					 <a class="btn btn-primary btn-large" href="login.jsp">登录点我</a>
				</p>
			</div>
		</div>
	</div>
</div>

</body>
<script src="bootstrap/js/bootstrap.min.js"></script>
</html>