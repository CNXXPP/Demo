<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'writerMessage.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->


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
	
	
	#select{width:50%;height:30px;}
	
	</style>
  </head>
  
  <body>
  <div style="margin-left:15%;margin-top:10%">
                 标题:&nbsp;&nbsp;&nbsp;<input type="text" class="input-text" style="width:250px" placeholder="输入标题" id="title" name=""><br><br>
   	
   	<h2>正文:&nbsp;&nbsp;&nbsp;</h2><br>
   	<textarea name="textarea" id="context"  wrap="physical" style="width:80%;height:200px;magrin-left:10%"></textarea><br><br>
   	<input type="button" onclick="submit()" value="发布" class="btn btn-success radius">
   	</div>


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
	<script type="text/javascript" src="js/jquery-2.2.1.js"></script>
	<script type="text/javascript">
		function submit(){
			var title = $("#title").val();
			var context = $("#context").val();
// 			console.log(title+context);
			$.post("xp/annoMgr/addAnno",{"caTitle":title,"caContext":context},function(msg){
				if(msg.result == true){
					alert("发布成功");
				}else{
					alert("发布失败");
				}
			});
		}
	
	</script>
  </body>
</html>
