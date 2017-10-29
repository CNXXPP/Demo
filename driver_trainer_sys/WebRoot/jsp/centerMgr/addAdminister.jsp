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

<title></title>

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
<script type="text/javascript" src="js/jquery-2.2.1.js"></script>
</head>

<body style="margin:0px 43%	">
<!-- 	<div style="margin:10% 20%"> -->
	<div style="height:10%"><h2>添加一个用户</div>
	<table class="table table-border table-bordered table-bg table-hover table-sort">
		<tr >
			<td style="text-align: left">姓名:&nbsp;&nbsp;&nbsp;<input type="text" name="" id="name" placeholder="" >
			
		</tr>
	
		<tr>
			<td style="text-align: left">密码: &nbsp;&nbsp;&nbsp;<input type="password" id="pwd" ></td>
		</tr>
		<tr>
			<td style="text-align: left">确认密码:&nbsp;&nbsp;&nbsp;<input type="password" id="pwdConfirm" class="input-password"></td>
		</tr>
		<tr>
			<td style="text-align: left">权限角色: &nbsp;&nbsp;&nbsp; <select id="authotity">
					<option value="4">驾校管理员</option>
					<option value="3">考试安排员</option>
					<option value="2">公告管理员</option>
					<option value="5">考生审核员</option>
			</select></td>
		</tr>
		
	</table>
	<input type="button" value="确认修改" style="width:48%" class="btn btn-success" onclick="sub()"/>
	<input type="button	" style="width:50%" value="取消" class="btn btn-danger radius" id="btnRest">
<!-- 	</div> -->
<script type="text/javascript">
	function sub(){
		alert($("#authotity").val());
		var pwd1=$('#pwd').val(),pwd2=$('#pwdConfirm').val();
		if(pwd1==pwd2){
			$.post("xp/centerMgr/addAdmin",{"admName":$("#name").val(),"admPwd":$("#pwd").val(),"charNo":$("#authotity").val()},function(msg){
				if(msg.result!=null){
					alert("添加成功");
				}
			});
		}else{
			alert("两次密码错误");
		}
	}

</script>
</body>
</html>
