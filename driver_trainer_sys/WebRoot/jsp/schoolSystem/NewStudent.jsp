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

<title>My JSP 'NewStudent.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="Bookmark" href="favicon.ico">
<link rel="Shortcut Icon" href="favicon.ico" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css"
	href="static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css"
	href="static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css"
	href="lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css"
	href="static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css"
	href="static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script><![endif]-->
<style type="text/css">
</style>

</head>

<body>
	<form action="" method="post" class="form form-horizontal" id="stu">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span
				class="c-red">*</span>姓名：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" placeholder=""
					onblur="judge()" id="stuName" name="stuName" style="width:300px">
				<lable id="titname" class="tit" style="color:red">&nbsp;</lable>
			</div>
		</div>

		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span
				class="c-red">*</span>初始密码：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="password" class="input-text" autocomplete="off" onblur="judge()"
					value="" placeholder="密码" id="stuPwd" name="stuPwd"
					style="width:300px">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span
				class="c-red">*</span>确认密码：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="password" class="input-text" autocomplete="off"
					placeholder="确认密码" id="password2" name="password2" onblur="judge()"
					style="width:300px">
				<lable id="titpwd" class="tit" style="color:red">&nbsp;</lable>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span
				class="c-red">*</span>性别：</label>
			<div class="formControls col-xs-8 col-sm-9 skin-minimal">
				<div class="radio-box">
					<input name="stuGender" type="radio" id="sex-1" checked="checked"
						class="stuGender" value="男"> <label for="sex-1" >男</label>
				</div>
				<div class="radio-box">
					<input type="radio" id="sex-2" name="stuGender" class="stuGender" value="女">
					<label for="sex-2" >女</label>
					<lable id="titsex" class="tit" style="color:red">&nbsp;</lable>
				</div>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span
				class="c-red">*</span>生日：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="date" class="input-text" value="" placeholder=""
					onblur="judge()" id="stuBirthday" name="stuBirthday"
					style="width:300px">
				<lable id="titbirth" class="tit" style="color:red">&nbsp;</lable>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span
				class="c-red">*</span>手机：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="" placeholder=""
					id="stuPhone" name="stuPhone" style="width:300px">
				<lable id="titphone" class="tit" style="color:red">&nbsp;</lable>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span
				class="c-red">*</span>身份证号：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="" id="stuIdentity"
					name="stuIdentity" style="width:300px">
				<lable id="titid" class="tit" style="color:red">&nbsp;</lable>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span
				class="c-red">*</span>证件类型：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<span class="select-box" style="width:150px"> <select
					class="select" id="drivingType" name="drivingType" size="1">
						<option value="C1">C1</option>
						<option value="C2">C2</option>
						<option value="C3">C3</option>
				</select>
				<lable id="tittype" class="tit" style="color:red">&nbsp;</lable>
				</span>
			</div>
		</div>

		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
				<input class="btn btn-primary radius" type="button"
					onclick="stuRegist()" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
			</div>
		</div>
	</form>
	<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
	<script type="text/javascript" src="static/h-ui/js/H-ui.js"></script>
	<script type="text/javascript"
		src="static/h-ui.admin/js/H-ui.admin.page.js"></script>

	<!--/_footer /作为公共模版分离出去-->

	<!--请在下方写此页面业务相关的脚本-->
	<script type="text/javascript"
		src="lib/jquery.validation/1.14.0/jquery.validate.js"></script>
	<script type="text/javascript"
		src="lib/jquery.validation/1.14.0/validate-methods.js"></script>
	<script type="text/javascript"
		src="lib/jquery.validation/1.14.0/messages_zh.js"></script>
	<script type="text/javascript"
		src="lib/My97DatePicker/4.8/WdatePicker.js"></script>
	<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
	<script type="text/javascript">
	var boo=false;
		$(function() {
			$("#stuName").click(function() {
				$("#titname").text("");
			});
			$("#password2").click(function() {
				$("#titpwd").text("");
			});
			$("#stuPwd").click(function() {
				$("#titpwd").text("");
			});
	

		});
		

		function judge() {
			var name = $("#stuName").val();
			var pwd = $("#stuPwd").val();
			var pwd2 = $("#password2").val();
			var birth = $("#stuBirthday").val();
			if (name.length < 2) {
				$("#titname").text("名字不能少于四个字符");
			} 
			else if (pwd !="") {
			}
			else if (pwd != pwd2) {
				$("#titpwd").text("两次输入的密码不同");
			}
			

			else if (birth == "") {
				$("#titbirth").text("请选择生日");
			}
		}

		function stuRegist() {
		var id="${school.schUuid}";
				$.ajax({
							url : "jjn/studentRegist",

							type : "post",
							data : {
							    "schUuid" : id,
								"stuName" : $("#stuName").val(),
								"stuPwd" : $("#stuPwd").val(),
								"stuGender" : $(".stuGender").val(),
								"stuBirthday" : $("#stuBirthday").val(),
								"stuPhone" : $("#stuPhone").val(),
								"stuIdentity" : $("#stuIdentity").val(),
								"drivingType" : $("#drivingType").val(),
							},

							success : function(obj) {
							alert("学员报名成功");
								location = "/driver_trainer_sys/jsp/schoolSystem/CheckStudent.jsp";

							}
						});
			
		}
	</script>
</body>
</html>
