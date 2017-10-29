<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'MyInformation.jsp' starting page</title>
    
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
#tb{
margin-left:20%;
}
#discuss{
height:50%;
margin-top:20%;
}
#page {
	width: 100%;
	height: 100%;
	padding:0px;

}

body {
	background-size: 100% 100%;
}
</style>


</head>

<body background="">


	<div id="container">
		<h1 id="title">我的信息</h1>
	</div>
	<br>



<div id="tb">
	<table class="table table-border table-bordered table-bg" style="width:80%">
		<thead>
			<tr>
				<th scope="col" colspan="9">Information</th>
			</tr>
			<tr class="text-c">
				<th width="25%">驾校名称</th>
				<td width="25%">${school.schName }</td>
				<th width="25%">驾校地址</th>
				<td width="25%">${school.schLocation }</td>		
			</tr>
				<tr class="text-c">
				<th width="25%">驾校简介</th>
				<td width="25%">${school.schIntro }</td>
				<th width="25%">驾校评分</th>
				<td width="25%">${school.schScore }</td>		
			</tr>
				<tr class="text-c">
				<th width="25%">联系方式</th>
				<td width="25%">${school.schPhone }</td>
				<th width="25%">上次登录时间</th>
				<td width="25%">${school.lastLoginDate }</td>		
			</tr>
			
		</thead>
		<tbody>
		</tbody>
	</table><br>
	
	<div class="Hui-article" id="discuss">
		<article class="cl pd-20" id="tt"> <iframe id="page"
			src="jsp/schoolSystem/CheckDiscuss.jsp" name="page"></iframe> </article>
	</div>
	<p>评论：</p>
	<a href="jsp/schoolSystem/DriverSchool.jsp" style="margin-left:49%">&gt;&gt;返回</a>
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
	<script type="text/javascript">
		
	</script>
  </body>
</html>
