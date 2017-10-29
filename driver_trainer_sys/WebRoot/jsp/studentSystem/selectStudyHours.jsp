<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'selectStudyHours.jsp' starting page</title>
    
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

<style type="text/css">
 td{text-align: center}
 
</style>

</head>
<body >
  <!--学员学时查询页面  -->
 <section  >

<div class="Hui-article">
		<article class="cl pd-20">
			<div class="text-c">
				
				
				
				<h2 id="test">学时查询</h2>
			</div>
			<div class="cl pd-5 bg-1 bk-gray mt-20">
				
				
			</div>
			<div class="mt-20">
				<table class="table table-border table-bordered table-bg table-hover table-sort" id="table">
					
						<tr class="text-c">
						<th width="60">驾校名称</th>
						<th width="60">学员名称</th>
						<th width="120">身份证号码</th>
						<th width="60">科目</th>
						<th width="60">总学时</th>
						<th width="60">累计学时</th>
						<th width="60">剩余学时</th>
						</tr>
				

			</table>
		</div>
		
		</article>
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
		
	    $(function(){
	    	 $.post(
	    			"grj/stuInfo/selectTime",{},function(data){
	    				var msg=data.signInShow;
	    				$("#table").append("<tr class='text-c'><td>"+msg.schoolName +"</td><td>"+msg.stuName+"</td><td>"+msg.idCard+"</td><td>"+msg.subject+"</td><td>"+msg.totalHours+"</td><td>"+msg.cumulativeHours+"</td><td>"+(msg.totalHours-msg.cumulativeHours)+"</td></tr>");
	    				
	    			}
	    	
	    	); 
	    	
	    });
    
		
		
	</script>
	<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>
