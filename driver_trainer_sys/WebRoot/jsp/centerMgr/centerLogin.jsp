<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">


<title>登录</title>

<!-- Bootstrap core CSS -->
<link href="/driver_trainer_sys/css/bootstrap.min.css" rel="stylesheet">
<!-- Bootstrap theme -->
<link href="css/bootstrap-theme.min.css"
	rel="stylesheet">


<!-- Custom styles for this template -->

<script type="text/javascript"
	src="/driver_trainer_sys/js/jquery-2.2.1.js"></script>



<style type="text/css">
#container1 {
	margin: auto;
	
	
}

body {
	margin-top: 8.5%;
	height: 100%;
	background-image: url(images/bmwi8.jpg);
	background-size: 100%;
/* 	background: url(images/1.jpg); //平铺*/ 
}

html {
	height: 100%;
}
</style>

</head>

<body>

	<div class="container" id="container1"
		style="width: 25%;background-color: white;opacity: 0.9">
		<div style="font-family: 宋体;font-size: 300%;color: black;text-align: center;width: 100%;margin: auto;">福州市驾驶员运营管理中心</div>



		<h2 class="form-signin-heading" style="width:100%;">管理员登录</h2>

		<input name="username" type="text" id="user" class="form-control"
			placeholder="请输入账号" required autofocus
			style="width:100%;height: 50px;background-color: transparent;" datatype="n" errormsg="账号为数字">
		<br> <input type="password" id="inputPassword"
			class="form-control" placeholder="请输入密码" required
			style="width:100%;height: 50px;background-color: transparent">
		<br> <input type="text" id="checkCode" placeholder="请输入验证码"
			style="background-color: transparent;">
			<img  id="traineCode"
							src="xp/centerMgr/AuthCode" title="点击更换" alt="" onclick="change(this)"/>
		<br>
		<div>
			<label id="tip">&nbsp;</label>
		</div>

		<button class="btn btn-lg btn-danger" style="width:100%;"
			onclick="login()">登录</button>
		<br> <br>
		<button class="btn btn-lg btn-primary btn-block" style="width:100%;"
			onclick="reset()">重置</button>
		<br> <br> <br>



	</div>
	<!-- /container -->


	<script type="text/javascript">
		
	
		$(document.body).css({
// 			"overflow-x" : "hidden",
// 			"overflow-y" : "hidden"
		});
		//刷新验证码图片
		 function change(image) {
		 	//改变img的src即可，由于该URL并没有变化，因此追加动态参数伪装成变化的URL。
		 	image.src = "xp/centerMgr/AuthCode?date=" + new Date().getTime();
		 	rightCode = '${AuthCode1}';
		 }
		function login() {
 			
			var username = $("#user").val();
			var pwd = $("#inputPassword").val();
			var checkCode = $("#checkCode").val();
			
			if (username == "" || pwd == "") {
				$("#tip").text("提示：用户名或密码不能为空");
			} else if (checkCode == "") {

				$("#tip").text("提示：验证码不能为空");
			} else {
				$("#tip").text("提示：正在登录");

				$.ajax({
					url : "xp/centerMgr/login",

					type : "post",
					data:{
						"admId":$("#user").val(),
						"admPwd":pwd,
						"codeInput":checkCode
					},
					

					success : function(obj) {
						//alert(obj.result);
						if (obj.result=="wrongAuthCode") {
							$("#tip").text("提示：验证码错误！");
						} else if (obj.result=="wrongId") {
							$("#tip").text("提示：用户不存在！");
						} else if (obj.result=="wrongPwd") {
							
							$("#tip").text("提示：密码错误！");
						} else {
							location = "/driver_trainer_sys/jsp/centerMgr/centerMain.jsp";
						}
					}
				});

			}

		}

		function reset() {
			username = $("#user").val("");
			pwd = $("#inputPassword").val("");
			checkCode = $("#checkCode").val("");

		}
	</script>
</body>
</html>