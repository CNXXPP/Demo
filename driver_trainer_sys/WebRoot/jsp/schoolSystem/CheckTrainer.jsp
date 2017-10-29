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

<title>My JSP 'CheckTrainer.jsp' starting page</title>

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
#adminName {
	width: 150px;
}
#tbl{
text-align:center;
}
#b {
	background-size: 100% 100%;
}
</style>

</head>

<body>
	<form action="" method="post" class="form form-horizontal"
		id="form-admin-add">
		<div class="Hui-article">

			<div class="text-c">
				<input type="text" class="input-text" style="width:250px"
					placeholder="输入教练工号" id="" name="">&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="text" class="input-text" style="width:250px"
					placeholder="输入教练姓名" id="" name="">&nbsp;&nbsp;&nbsp;&nbsp;
				<button type="submit" class="btn btn-success" id="" name="">
					<i class="Hui-iconfont">&#xe665;</i> 搜教练
				</button>
			</div>
			<br>


			<table class="table table-border table-bordered table-bg" id="tbl">
				<thead>
					<tr>
						<th scope="col" colspan="9">员工列表</th>
					</tr>
					<tr class="text-c">
						<th width="25"><input type="checkbox" name="" value=""></th>
						<th width="40">工号</th>
						<th width="150">姓名</th>
						<th width="90">年龄</th>
						<th width="150">证件类型</th>
						<th width="130">性别</th>
						<th width="100">教练评分</th>
						<th width="100">入职日期</th>
					</tr>
				</thead>
				<tbody>

				</tbody>
			</table>



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
		$.ajax({
			url : "jjn/getTrainers",

			type : "post",

			success : function(data) {

				var tra = data.traList;
				var str = "";

				for (var i = 0; i < tra.length; i++) {
					var timestamp3 = tra[i].traHireDate;

					var newDate = new Date();

					newDate.setTime(timestamp3);

					var da = newDate.toLocaleDateString();

					str += "<tr id="+tra[i].traId+">";
					str += "<th width='25'><input type='checkbox'></th>";
					str += "<th width='25'>" + tra[i].traId + "</th>";
					str += "<th width='25'>" + tra[i].traName + "</th>";
					str += "<th width='25'>" + tra[i].traAge + "</th>";
					str += "<th width='25'>" + tra[i].drivingType + "</th>";
					str += "<th width='25'>" + tra[i].traGender + "</th>";
					str += "<th width='25'>" + tra[i].traScore + "</th>";
					str += "<th width='25'>" + da + "</th>";

				}
				$("#tbl").append(str);
			}
		});
	</script>
</body>
</html>
