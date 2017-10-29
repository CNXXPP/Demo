<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>驾校首页欢迎页</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
 <style type="text/css">
     #img{width:100%}
  
  </style>
  </head>
  
  <body>
  <div >
	
			<h2 style="margin-left:10%,display:inline">驾校公告板：</h2>
		<center><h3>标题：<span id="title"></span></h3></center>
		<h3 id="notice" style="margin-left:15%"></h3>
		<h2 id="time" style="margin-left:80%"></h2>
	</div>
  <div style="width:100%;">
     <img  src="images/dahuangfeng.jpg" id="img"/>
  </div>
  </body>
  <script type="text/javascript">
  $(function() {
         /* 发送请求显示最近的一条驾校公告 */
       
		$.post("grj/announcement/getSchoolAnnouncement", {}, function(data) {
			if(data != ""){
			$("#title").text(data.studentSchoolAnnouncement.anTitle);
			$("#notice").text(data.studentSchoolAnnouncement.anContext);
			var showTime=data.studentSchoolAnnouncement.anDate;
			var newDate = new Date();
			newDate.setTime(showTime );
			$("#time").text(newDate.toLocaleString());
			
		}else{
			$("#title").text("抱歉驾校最近暫无公告");
		}
		}
		);

	});
    
  </script>
</html>
