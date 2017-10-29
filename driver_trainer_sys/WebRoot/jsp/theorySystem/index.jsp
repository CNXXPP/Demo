<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<meta charset="utf-8">
	<title>首页-机动车驾驶员网上理论学习</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta http-equiv="Access-Control-Allow-Origin" content="*">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
	
	<link rel="stylesheet" href="/driver_trainer_sys/layui/css/layui.css" media="all" />
	<link rel="stylesheet" href="/driver_trainer_sys/css/font_eolqem241z66flxr.css" media="all" />
	<link rel="stylesheet" href="/driver_trainer_sys/css/main1.css" media="all" />
</head>
<body class="main_body">
	<div class="layui-layout layui-layout-admin">
		<!-- 顶部 -->
		<div class="layui-header header">
			<div class="layui-main">
				<a href="#" class="logo">机动车驾驶员网上理论学习</a>
			    
			    
			    <!-- 顶部右侧菜单 -->
			    <ul class="layui-nav top_menu">
			    	<li class="layui-nav-item showNotice" id="showNotice" pc>
						<a href="javascript:;"><i class="iconfont icon-gonggao"></i><cite>系统公告</cite></a>
					</li>
			    	<li class="layui-nav-item" mobile>
			    		<a href="javascript:;" data-url="page/user/changePwd.html"><i class="iconfont icon-shezhi1" data-icon="icon-shezhi1"></i><cite>设置</cite></a>
			    	</li>
			    	<li class="layui-nav-item" mobile>
			    		<a href="javascript:;"><i class="iconfont icon-loginout"></i> 退出</a>
			    	</li>
					
					<li class="layui-nav-item" pc>
						<a href="javascript:;">
							<img src="/driver_trainer_sys/images/face.jpg" class="layui-circle" width="35" height="35">
							<cite>${Student.stuName}</cite>
						</a>
						<dl class="layui-nav-child">
							<dd><a href="javascript:;" data-url="userInfo.jsp"><i class="iconfont icon-zhanghu" data-icon="icon-zhanghu"></i><cite>个人资料</cite></a></dd>
							
							<dd><a href="/driver_trainer_sys/jsp/theorySystem/login.jsp"><i class="iconfont icon-loginout"></i><cite>退出</cite></a></dd>
						</dl>
					</li>
				</ul>
			</div>
		</div>
		<!-- 左侧导航 -->
		<div class="layui-side layui-bg-black">
			<div class="user-photo">
				<a class="img" title="我的头像" ><img src="/driver_trainer_sys/images/face.jpg"></a>
				<p>你好！<span class="userName">${Student.stuName}</span>, 欢迎登录</p>
			</div>
			<div class="navBar layui-side-scroll"></div>
		</div>
		<!-- 右侧内容 -->
		<div class="layui-body layui-form">
			<div class="layui-tab marg0" lay-filter="bodyTab">
				<ul class="layui-tab-title top_tab">
					<li class="layui-this" lay-id=""><i class="iconfont icon-computer"></i> <cite>首页</cite></li>
				</ul>
				<div class="layui-tab-content clildFrame">
					<div class="layui-tab-item layui-show">
						<iframe src="/driver_trainer_sys/jsp/theorySystem/main.jsp"></iframe>
					</div>
				</div>
			</div>
		</div>
		<!-- 底部 -->
		<div class="layui-footer footer">
			<p>客服QQ：888888888&nbsp; &nbsp;电话：1111-11111111 &nbsp;&nbsp;地址：福州市传一科技卓跃教育　</p>
		</div>
	</div>

	<!-- 锁屏 -->
	
	<!-- 移动导航 -->
	<div class="site-tree-mobile layui-hide"><i class="layui-icon">&#xe602;</i></div>
	

	<script type="text/javascript" src="/driver_trainer_sys/layui/layui.js"></script>
	<script type="text/javascript" src="/driver_trainer_sys/js/jquery-2.2.1.js"></script>
	<script type="text/javascript" src="/driver_trainer_sys/js/bodyTab.js"></script>
	<script type="text/javascript" src="/driver_trainer_sys/js/leftNav.js"></script>
	<script type="text/javascript" src="/driver_trainer_sys/js/index.js"></script>
	<script type="text/javascript" >
	var navs = [{
	"title" : "首页",
	"icon" : "icon-computer",
	"href" : "main.jsp",
	"spread" : false
},{
	"title" : "综合训练",
	"icon" : "&#xe61c;",
	"href" : "",
	"spread" : false,
	"children" : [
		
		{
			"title" : "试题练习",
			"icon" : "&#xe631;",
			"href" : "questionExam.jsp",
			"spread" : false
		},
		{
			"title" : "错题集",
			"icon" : "&#xe631;",
			"href" : "FalseQuestion.jsp",
			"spread" : false
		}
	]
},{
	"title" : "模拟考试",
	"icon" : "icon-text",
	"href" : "",
	"spread" : false,
	"children" : [
		{
			"title" : "科目一模拟考试",
			"icon" : "icon-text",
			"href" : "MocTest.jsp",
			"spread" : false
		},
		{
			"title" : "科目四模拟考试",
			"icon" : "icon-text",
			"href" : "MocTest1.jsp",
			"spread" : false
		}]
},{
	"title" : "个人信息",
	"icon" : "&#xe61c;",
	"href" : "",
	"spread" : false,
	"children" : [
		{
			"title" : "详细学时",
			"icon" : "&#xe631;",
			"href" : "stuTimeInfo.jsp",
			"spread" : false
		},
		{
			"title" : "模考成绩",
			"icon" : "&#xe631;",
			"href" : "mocScore.jsp",
			"spread" : false
		},
		{
			"title" : "信息查看",
			"icon" : "&#xe631;",
			"href" : "userInfo.jsp",
			"spread" : false
		},
		
		
	]
}]
	</script>
	
	
	
</body>
</html>