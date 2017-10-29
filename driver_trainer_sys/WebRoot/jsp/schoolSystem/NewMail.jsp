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

<title>My JSP 'NewMail.jsp' starting page</title>

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

</head>

<body>
	<form action="" method="post" class="form form-horizontal"
		id="form-admin-add">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">收信人：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<span class="select-box" style="width:150px;"> <select
					class="select" name="adminRole" size="1" id="sel">

				</select>
				</span>
			</div>
		</div>

		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span
				class="c-red">*</span>标题：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" autocomplete="off"
					id="scmsgTitle" name="title">
			</div>
		</div>

		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">内容：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<textarea name="textarea" id="scmsgContext" cols="" rows=""
					class="textarea" placeholder="说点什么...100个字符以内"></textarea>
				<p class="textarea-numberbar">
					<em class="textarea-length">0</em>/100
				</p>
			</div>
		</div>

		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
				<input class="btn btn-primary radius" type="button"
					value="&nbsp;&nbsp;提交&nbsp;&nbsp;" onclick="sendMail()">
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
	<script type="text/javascript">
		$(function() {
			var id = "${school.schUuid}";
			$.ajax({
				url : "jjn/getList",
				data : {
					"schUuid" : id
				},
				type : "post",

				success : function(data) {

					var stu = data.stuList;
					var str = "";

					for (var i = 0; i < stu.length; i++) {
						str += "<option value="+stu[i].stuUuid+">"
								+ stu[i].stuName + "</option>";

					}
					$("#sel").append(str);
				}
			});

		});

		function sendMail() {
			if ($("#scmsgTitle").val() == "") {
				alert("标题不能为控");
			} else if ($("#scmsgContext").val() == "") {
				alert("内容不能为控");
			} else {

				var scmsgIdentity = $("#sel").val();
				var scmsgTitle = $("#scmsgTitle").val();
				var scmsgContext = $("#scmsgContext").val();
				var id = "${school.schUuid}";
				$
						.ajax({
							url : "jjn/sendMail",

							data : {
								"schUuid" : id,
								"scmsgContext" : scmsgContext,
								"scmsgTitle" : scmsgTitle,
								"scmsgIdentity" : scmsgIdentity,
							},

							type : "post",

							success : function(data) {
								var r = data.res;
								if (r > 0) {
									alert("信件发送成功");
									location = "/driver_trainer_sys/jsp/schoolSystem/CheckMail.jsp";
								}

							}
						});
			}
		}
	</script>
</body>
</html>
