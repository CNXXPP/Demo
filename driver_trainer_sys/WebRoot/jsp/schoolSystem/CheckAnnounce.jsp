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

<title>My JSP 'CheckAnnounce.jsp' starting page</title>

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
#title {
	text-align: center;
	color: lightgray;
}

#f {
	margin-top: 4%;
}

body {
	background-size: 100% 100%;
}
#tbl{
    margin-top: 4%;
}
</style>


</head>

<body background="images/back5.jpg">


	<div id="container">
		<h1 id="title">公告</h1>
	</div>
	<br>

<div>
	<form action="" method="post" class="form form-horizontal">
		
			<div class="text-c">
				<input type="text" class="input-text" style="width:15%"
					placeholder="输入部分标题内容" id="serTit" name="">&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="text" class="input-text" style="width:15%"
					placeholder="输入部分公告内容" id="serText" name="">&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="text" placeholder="选择日期范围"
					onfocus="WdatePicker({maxDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}'})"
					id="datemin" class="input-text Wdate" style="width:120px;">
				- <input type="text" placeholder="选择日期范围"
					onfocus="WdatePicker({minDate:'#F{$dp.$D(\'datemin\')}',maxDate:'%y-%M-%d'})"
					id="datemax" class="input-text Wdate" style="width:120px;">
				<button type="button" class="btn btn-success" id="" name="" onclick="search()">
					<i class="Hui-iconfont">&#xe665;</i> 搜公告
				</button>			
		</div>

	</form>
	</div>
	
	<table class="table table-border table-bordered table-bg" id="tbl">
				<thead>
					<tr>
						<th scope="col" colspan="9">公告列表</th>
					</tr>
					<tr class="text-c">
						<th width="100">标题</th>
						<th width="100">发布日期</th>
					</tr>
				</thead>
				<tbody>

				</tbody>
			</table>
</div>
	<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
	<script type="text/javascript" src="static/h-ui/js/H-ui.js"></script>
	<script type="text/javascript"
		src="static/h-ui.admin/js/H-ui.admin.page.js"></script>

	<!--/_footer /作为公共模版分离出去-->

	<!--请在下方写此页面业务相关的脚本-->
	<script type="text/javascript"
		src="lib/hcharts/Highcharts/5.0.6/js/highcharts.js"></script>
	<script type="text/javascript"
		src="lib/hcharts/Highcharts/5.0.6/js/modules/exporting.js"></script>
	<script type="text/javascript"
		src="lib/My97DatePicker/4.8/WdatePicker.js"></script>
	<script type="text/javascript">
	$(function(){
		$.ajax({
			url : "jjn/getAnnounce",

			type : "post",

			success : function(data) {

				var ann = data.annList;
				var str = "";

				for (var i = 0; i < ann.length; i++) {
					var timestamp3 = ann[i].anDate;

					var newDate = new Date();

					newDate.setTime(timestamp3);

					var da = newDate.toLocaleDateString();

					str += "<tr>";

						        str += "<th width='25'><a>"+ann[i].anTitle+"</a></th>";
						        str += "<th width='25'>"+da+"</th></tr>";

				}
				$("#tbl").append(str);
			}
		});
	});	
		
		function search(){
		    var serTit=$("#serTit").val();
		    var serText=$("#serText").val();
		    var dateMin=$("#datemin").val();
		    var dateMax=$("#datemax").val();
		    
		    	$.ajax({
			url : "jjn/searchAnnounce",
			data : {
			    "anTitle":serTit,
			    "anContext" :serText,
			    "anDate" : dateMin,
			    
			},

			type : "post",

			success : function(data) {

				var ann = data.annList;
				var str = "";

				for (var i = 0; i < ann.length; i++) {
					var timestamp3 = ann[i].anDate;

					var newDate = new Date();

					newDate.setTime(timestamp3);

					var da = newDate.toLocaleDateString();

					str += "<tr>";

						        str += "<th width='25'><a>"+ann[i].anTitle+"</a></th>";
						        str += "<th width='25'>"+da+"</th></tr>";

				}
				$("#tbl").append(str);
			}
		});
	   
		}
	</script>
</body>
</html>
