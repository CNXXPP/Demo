<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'selectExam.jsp' starting page</title>
    
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
  
th{
    background-color:rgba(255 ,246,143,0.5);
    font-size:16;
    font-color:white;
}
</style>

</head>
<body >
  
 <section  >

<div class="Hui-article">
		<article class="cl pd-20">
			<div class="text-c">
				
				
				
				<h2>考试安排表</h2>
			
			<div class="mt-20">
				<table class="table table-border table-bordered table-bg table-hover table-sort">
					
						<tr class="text-c">
						<th width="200" class="left">序号</th>
						<th width="280" id="stuId"></th>
						</tr>
						<tr class="text-c">
						<th width="200" class="left">驾校</th>
						<th width="280" id="schName"></th>
						</tr>
						<tr class="text-c">
						<th width="200" class="left">考生</th>
						<th width="280" id="stuName"></th>
						</tr>
						<tr class="text-c">
						<th width="200" class="left">考生身份证</th>
						<th width="280" id="idCard"></th>
						</tr>
						<tr class="text-c">
						<th width="200" class="left">考试科目</th>
						<th width="280" id="sub"></th>
						</tr>
						<tr class="text-c">
						<th width="200" class="left">考试地址</th>
						<th width="280" id="examPlace"></th>
						</tr>
						<tr class="text-c">
						<th width="200" class="left">考场类型</th>
						<th width="280" id="examType"></th>
						</tr>
						<tr class="text-c">
						<th width="200" class="left">考试时间</th>
						<th width="280" id="examTime"></th>
						</tr>
						<tr class="text-c">
						<th width="200" class="left">考试结果</th>
						<th width="280" id="result"></th>
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
    	
    	$.post("grj/stuInfo/selectExam",{},function(data){
    		
    		if(data.examInfo == ""){
    			alert("抱歉最近暫无考试安排");
    		}else{
    			var msg=data.examInfo;
    			
    			$("#stuId").text(msg.stuId);
    			
    			$("#schName").text(msg.schName);
    			
                $("#stuName").text(msg.stuName);
    			
    			$("#idCard").text(msg.idCardNo);
    			
                $("#sub").text(msg.subName);
    			
    			$("#examPlace").text(msg.examPlace);
    			if(msg.subName == '科目一' || msg.subName == '科目四'){
    				 $("#examType").text('上机考试');
    			}else{
    			     $("#examType").text('路考');
    			}
               
                /* var showTime = msg.examTime;
                alert(showTime);
				var newDate = new Date();
				newDate.setTime(showTime); */
    			$("#examTime").text(msg.examTime);
    			
    			$("#result").text(msg.examResult);
    		}
    	});
    	
    	
    });
		
		
	</script>
	<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>
