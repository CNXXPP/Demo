<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<meta charset="utf-8">
	<title>理论学习</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
	<link rel="stylesheet" href="/driver_trainer_sys/layui/css/layui.css" media="all" />
	<link rel="stylesheet" href="/driver_trainer_sys/css/font_eolqem241z66flxr.css" media="all" />
	
</head>
<body class="childrenBody">
	
		<blockquote class="layui-elem-quote news_search">
			
			 <button type="button" id="pg1" class="layui-btn" onclick="aaa()">第一部分</button>
			 <button type="button" id="pg2" class="layui-btn" onclick="bbb()">第四部分</button>
			 
		</blockquote>
		
	
	<div>
	<iframe id="tt1" src="/driver_trainer_sys/jsp/theorySystem/First.jsp" width="100%" height="100%" frameborder="no" scrolling="yes"></iframe>
	</div>
	
	
	
	<script type="text/javascript" src="/driver_trainer_sys/layui/layui.js"></script>
	<script type="text/javascript" src="/driver_trainer_sys/page/message/message.js"></script>
	<script type="text/javascript">
        
	    function aaa(){
	         $("#tt1").attr('src',"/driver_trainer_sys/jsp/theorySystem/First.jsp");
	    }
	    
	    function bbb(){
	        $("#tt1").attr('src',"/driver_trainer_sys/jsp/theorySystem/Forth.jsp");
	    }
	</script>
</body>
</html>