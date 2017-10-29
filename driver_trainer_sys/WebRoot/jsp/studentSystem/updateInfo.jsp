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

<title>My JSP 'updateInfo.jsp' starting page</title>

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

input {
	height: 30px;
}

#btnRest {
	width: 200px;
}

#btnSub {
	width: 200px;
}
</style>

</head>
<body>

	<section>

	<div class="Hui-article">



		<div>

			<h2 style="display:inline">考生信息</h2>
			<img src="images/dahuangfeng.jpg"
				style="width:100px;height:100px;margin-left:100px;">
			<div style="float:right;margin-right:40%">
				<h3>学员姓名：</h3>
				<h3 id="stuName"></h3>
				</br> </br>
				<h3 style="margin-top:2cm;">报考驾照类型：</h3>
				<h3 id="driveType"></h3>
				<br>
			</div>

		</div>
		<div class="cl pd-5 bg-1 bk-gray mt-20"></div>

		<div id="textDiv">
			<form action="">
				<table
					class="table table-border table-bordered table-bg table-hover table-sort">



					<tr class="text-c">
						<th width="23%"">学号</th>
						<th width="23%" id="stuId"></th>
						<th width="23%">姓名</th>
						<th width="31%" id="name"></th>
					</tr>
					<tr class="text-c">
						<th width="23%">证件类型</th>
						<th width="23%">身份证</th>
						<th width="23%">证件编号</th>
						<th width="31%" id="cardNo"></th>
					</tr>
					<tr class="text-c">
						<th width="23%">现居住地</th>
						<th width="23%"><input type="text" id="liveSpace" /></th>
						<th width="23%">证件地址</th>
						<th width="31%" id="cardSpace"></th>
					</tr>
					<tr class="text-c">
						<th width="23%">性别</th>
						<th width="23%" id="sex">男</th>
						<th width="23%">出生日期</th>
						<th width="31%" id="birthDate"></th>
					</tr>
					<tr class="text-c">
						<th width="23%">民族</th>
						<th width="23%" id="nation"></th>
						<th width="23%">联系电话</th>
						<th width="31%"><input type="text" id="phone" /></th>
					</tr>
					<tr class="text-c">
						<th width="23%">原准驾车型</th>
						<th width="23%" id="oldType"></th>
						<th width="23%">报名时间</th>
						<th width="31%" id="createDate"></th>
					</tr>

				</table>
				<div style="margin-top:30px;">
					<input type="reset" value="取消" class="btn btn-danger radius"
						id="btnRest"> <input type="button" value="修改"
						class="btn btn-success" id="btnSub" ">
				</div>
			</form>
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
		$(function() {

			$.post("grj/stuInfo/showInfo", {}, function(data) {
               
				var stu = data.student;

				$("#stuName").text(stu.stuName);

				$("#driveType").text(stu.drivingType);

				$("#stuId").text(stu.stuId);

				$("#name").text(stu.stuName);

				$("#cardNo").text(stu.stuIdentity);

				$("#liveSpace").attr("placeholder", stu.curLocation);

				$("#cardSpace").text(stu.identityLocation);

				/*转换时间戳  */
				var showTime = stu.stuBirthday;
				var newDate = new Date();
				newDate.setTime(showTime);
				$("#birthDate").text(newDate.toLocaleDateString());

				$("#nation").text(stu.ethnicGroup);

				$("#phone").attr("placeholder", stu.stuPhone);

				$("#oldType").text(stu.formerType);

				var showTime1 = stu.createDate;
				var newDate1 = new Date();
				newDate1.setTime(showTime1);
				$("#createDate").text(newDate1.toLocaleDateString());

			}

			);

			$("#btnRest").click(function() {
				 $("#liveSpace").val("");
                 $("#phone").val("");
			});

			$("#btnSub").click(function() {
				if ($("#liveSpace").val() == "" && $("#phone").val() == "") {
					alert("抱歉没有修改的选项");
				} else {

					var sure = confirm("确认要修改吗?");
				
						if (sure == true) {
							var parm = "";
							if($("#liveSpace").val() == ""){
								 parm = {"stuPhone":$("#phone").val()};
							}else{
								if($("#phone").val() != ""){
									parm = {"curLocation":$("#liveSpace").val(),"stuPhone":$("#phone").val()};
								}else{
									parm = {"curLocation":$("#liveSpace").val()};
								}
							}
						$.post("grj/stuInfo/updateInfo", 
								parm,
								function(data) {
                                       alert(data.message);
                                       $("#liveSpace").val("");
                                       $("#phone").val("");
                                       if(data.message == '修改成功'){
                                    	   $("#liveSpace").attr("placeholder", data.studentupdate.curLocation);
                                    	   
                                    	   $("#phone").attr("placeholder", data.studentupdate.stuPhone);
                                       } 
						});
					}

				}
				
			
		});
		
		});	
	</script>
	<!--/请在上方写此页面业务相关的脚本-->
	
</body>
</html>
