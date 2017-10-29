<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<meta charset="utf-8">
	<title>试题练习</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
	<link rel="stylesheet" href="/driver_trainer_sys/layui/css/layui.css" media="all" />
	<link rel="stylesheet" href="/driver_trainer_sys/css/font_eolqem241z66flxr.css" media="all" />
	
</head>
<body >
			 <button type="button" id="pg1" class="layui-btn" onclick="aaa()">第一部分</button>
			 <button type="button" id="pg2" class="layui-btn" onclick="bbb()">第四部分</button>    <span style="margin-left:300px;font-size:25px;">当前部分：</span><span id="span" style="font-size:25px;color: red;">第一部分</span>

	<div>
	<iframe id="tt1" src="/driver_trainer_sys/jsp/theorySystem/FirstQuestion.jsp" width="100%" height="100%" frameborder="no" scrolling="yes"></iframe>
	</div>
	
	
	
	<script type="text/javascript" src="/driver_trainer_sys/layui/layui.js"></script>
	<script type="text/javascript" src="/driver_trainer_sys/page/message/message.js"></script>
	<script type="text/javascript">
	    function aaa(){
	         $("#tt1").attr('src',"/driver_trainer_sys/jsp/theorySystem/FirstQuestion.jsp");
	         $("#span").text("第一部分");
	    }
	    
	    function bbb(){
	        $("#tt1").attr('src',"/driver_trainer_sys/jsp/theorySystem/ForthQuestion.jsp");
	        $("#span").text("第四部分");
	    }
	</script>
</body>
</html>