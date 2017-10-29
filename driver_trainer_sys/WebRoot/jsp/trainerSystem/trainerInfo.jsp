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

<title>教练信息</title>

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

<style>
th {
	
	font-size: 13;
	
}

#textDiv {
	margin-top: 20px;
}

H3 {
	display: inline;
}
</style>

</head>
<body>

	<section>

	<div class="Hui-article">



		<div >

			<h2 style="display:inline">教练信息</h2>
			<img src="images/dahuangfeng.jpg"
				style="width:100px;height:100px;margin-left:100px;">
			<div style="float:right;margin-right:40%">
				<h3>教练姓名：</h3>
				<h4>${Trainer.traName}</h4>
				</br></br>
				<h3 style="margin-top:2cm;">所持教练证号：</h3>
				<h4>${Trainer.traId}</h4>
				<br>
			</div>

		</div>
		<div class="cl pd-5 bg-1 bk-gray mt-20"></div>

		<div id="textDiv">
			<table
				class="table table-border table-bordered table-bg table-hover table-sort">

				<tr class="text-c">
					<th width="23%" >姓名:</th>
					<th width="23%">${Trainer.traName}</th>
					<th width="23%" >年龄：</th>
					<th width="31%">${Trainer.traAge}</th>
				</tr>
				<tr class="text-c">
					<th width="23%" >证件类型</th>
					<th width="23%">身份证</th>
					<th width="23%" >证件编号</th>
					<th width="31%">35043066666688</th>
				</tr>
				<tr class="text-c">
					<th width="23%" >现居住地</th>
					<th width="23%">仓山</th>
					<th width="23%" >民族:</th>
					<th width="31%">汉族</th>
				</tr>
				<tr class="text-c">
					<th width="23%" >性别</th>
					<th width="23%">${Trainer.traGender}</th>
					<th width="23%" >联系电话:</th>
					<th width="31%">${Trainer.traPhone}</th>
				</tr>
				<tr class="text-c">
					<th width="23%" >所得评分:</th>
					<th width="23%">${Trainer.traScore}</th>
					<th width="23%" >上次登录时间:</th>
					<th width="31%">${map.LastLoginDate}</th>
				</tr>
				<tr class="text-c">
					<th width="23%" >简介:</th>
					<th width="31%">${Trainer.traIntro}</th>
				</tr>
				
			</table>

		</div>
	</div>
	</section>



	<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
	<script type="text/javascript" src="static/h-ui/js/H-ui.js"></script>
	<script type="text/javascript"
		src="static/h-ui.admin/js/H-ui.admin.page.js"></script>

	<script type="text/javascript"
		src="lib/My97DatePicker/4.8/WdatePicker.js"></script>
	<script type="text/javascript"
		src="lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
	<script type="text/javascript">
		
	</script>
	<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>
