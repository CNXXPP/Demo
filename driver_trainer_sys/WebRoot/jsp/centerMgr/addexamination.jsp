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

<script language="javascript" type="text/javascript"
	src="My97DatePicker/WdatePicker.js"></script>


</head>

<body style="margin:0px 43%	">
	<br>
	<br>
	<!-- 	<div style="margin:10% 20%"> -->
	<div style="height:10%">
		<h2>添加一场考试
	</div>
	<table
		class="table table-border table-bordered table-bg table-hover table-sort">
		<tr>
			<td style="text-align: left">科目类型: &nbsp;&nbsp;&nbsp; <select
				id="examSub">
					<option value="科目一" >科目一</option>
					<option value="科目二">科目二</option>
					<option value="科目三">科目三</option>
					<option value="科目四">科目四</option>
			</select></td>


		</tr>

		<tr>
			<td style="text-align: left">考试地点: &nbsp;&nbsp;&nbsp;<input
				type="text" id="examLocation"></td>
		</tr>
		
		<tr>
			<td style="text-align: left">考试最大人数:&nbsp;&nbsp;&nbsp;<input
				type="text" id="examMaxNums" class="input-password" ></td>
		</tr>
		<tr>
			<td style="text-align: left">考试时间: &nbsp;&nbsp;&nbsp; <input
				id="examDate" class="Wdate" type="examDate"
				onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd HH:mm:ss'})"></td>
		</tr>

	</table>
	<input type="button" value="确认修改" style="width:48%"
		class="btn btn-success" onclick="sub()" />
	<input type="button	" style="width:50%" value="取消"
		class="btn btn-danger radius" id="btnRest">
	<!-- 	</div> -->
	<script type="text/javascript">
		function sub() {
				if($("#examSub").val() == "" || $("#examLocation").val()== "" || $("#examMaxNums").val() == ""){
					alert("输入为空！请重新输入");
				}
			
			
				$.post("xp/examMgr/addExam", {
					"examSub" : $("#examSub").val(),
					"examLocation" : $("#examLocation").val(),
					"examMaxNum" : $("#examMaxNums").val(),
					"examDate":$("#examDate").val(),
					
				}, function(msg) {
					if (msg.result != null) {
						alert("添加成功");
					}
				});
		
		}
		  
		$("#examMaxNums").blur(function(){
			
			var reg = new RegExp("^[0-9]*$");  
		       var val = $("#examMaxNums").val();
		    if(!reg.test(val)){  
		        alert("请输入数字!");  
		    }  
		    if(!/^[0-9]*$/.test(val)){  
		        alert("请输入数字!");  
		    }  
		});
	</script>
</body>
</html>
