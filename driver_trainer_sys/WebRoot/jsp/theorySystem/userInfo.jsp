<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<meta charset="utf-8">
	<title>个人资料</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
	<link rel="stylesheet" href="/driver_trainer_sys/layui/css/layui.css" media="all" />
	<link rel="stylesheet" href="/driver_trainer_sys/css/user.css" media="all" />
</head>
<body class="childrenBody">
	<form class="layui-form">
		<div class="user_left">
			<div class="layui-form-item">
			    <label class="layui-form-label">真实姓名：</label>
			    <div class="layui-input-block">
			    	<input id="pg1" type="text" value="" disabled class="layui-input layui-disabled">
			    </div>
			</div>
			<div class="layui-form-item">
			    <label class="layui-form-label">性别：</label>
			    <div class="layui-input-block">
			    	<input id="pg2" type="text" value="" disabled class="layui-input layui-disabled">
			    </div>
			</div>
			<div class="layui-form-item">
			    <label class="layui-form-label">身份证：</label>
			    <div class="layui-input-block">
			    	<input id="pg3" type="text" value="" disabled class="layui-input layui-disabled">
			    </div>
			</div>
			<div class="layui-form-item">
			    <label class="layui-form-label">车型：</label>
			    <div class="layui-input-block">
			    	<input id="pg4" type="text" value="" disabled class="layui-input layui-disabled">
			    </div>
			</div>
			
			<div class="layui-form-item">
			    <label class="layui-form-label">出生日期：</label>
			    <div class="layui-input-block">
			    	<input id="pg5" type="text" value="" disabled class="layui-input layui-disabled">
			    </div>
			</div>
			
			
			<div class="layui-form-item">
			    <label class="layui-form-label">民族：</label>
			    <div class="layui-input-block">
			    	<input id="pg6" type="text" value="" disabled class="layui-input layui-disabled">
			    </div>
			</div>
			<div class="layui-form-item">
			    <label class="layui-form-label">手机号码：</label>
			    <div class="layui-input-block">
			    	<input id="pg7" type="text" value="" disabled class="layui-input layui-disabled">
			    </div>
			</div>
			<div class="layui-form-item">
			    <label class="layui-form-label">身份地址：</label>
			    <div class="layui-input-block">
			    	<input id="pg8" type="text" value="" disabled class="layui-input layui-disabled">
			    </div>
			</div>
			
		</div>
		<div class="user_right">
			
			<img src="/driver_trainer_sys/images/face.jpg" class="layui-circle" >
		
		
		</div>
		
	</form>
	<script type="text/javascript" src="/driver_trainer_sys/layui/layui.js"></script>
	<script type="text/javascript" src="/driver_trainer_sys/page/user/address.js"></script>
	<script type="text/javascript" src="/driver_trainer_sys/page/user/user.js"></script>
	<script src="/driver_trainer_sys/js/jquery-1.8.2.min.js" ></script>
	<script type="text/javascript">
	     $(function(){
	         $("#pg1").val('${Student.stuName}');
	         $("#pg2").val('${Student.stuGender}');
	         $("#pg3").val('${Student.stuIdentity}');
	         $("#pg4").val('${Student.drivingType}');
	         $("#pg6").val('${Student.ethnicGroup}');
	         $("#pg5").val('${map.Birthday}');
	         $("#pg7").val('${Student.stuPhone}');
	         $("#pg8").val('${Student.identityLocation}');
	     });
	</script>
</body>
</html>