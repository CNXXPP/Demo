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
	<link rel="stylesheet" type="text/css" href="js/jquery-ui-1.12.1.custom/jquery-ui.min.css">
	
	 <script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
	
	<script type="text/javascript" src="js/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
	<style>
	#form{margin-left:10%;
	margin-top:30px;}
	
	#select{width:50%;height:30px;}
	
	</style>
  </head>
  
  <body>
   <div id="form">
                 标&nbsp;&nbsp;题:&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="input-text" style="width:250px" placeholder="输入标题" id="title" ><br><br>
   	发送给：<select  id="select">
   	    <option>驾校</option>
   	    <option>教练</option>
   	</select><br><br>
   	<h2>正文:</h2><br>
   	<textarea name="textarea"  wrap="physical" style="width:80%;height:200px;magrin-left:10%" id="context"></textarea><br><br>
   	<input type="button" value="发送" class="btn btn-success radius" id="send" />
   	

     <!-- <input type="button"  value="帮助" id="input2"> -->
    <!--  <div id="dialog" title="操作帮助" >
	<p>欢迎使用OSTA考试系统。您可以点击新建考试开始一场新的考试，或者再您断线后重新登陆上也可以点击新建考试按钮，选择回到相应的考试场次。谢谢</p>
    </div> -->
   </div>
	
	 <script type="text/javascript">
    $(function(){
   
    $( "#dialog" ).dialog({
    	autoOpen: false,
    	width: 400,
    	buttons: [
    		{
    			text: "确认",
    			click: function() {
    				$( this ).dialog( "close" );
    			}
    		},
    		{
    			text: "取消",
    			click: function() {
    				$( this ).dialog( "close" );
    			}
    		}
    	]
    });
    
   
    /* $("#input2").click(function(){
    	//$( "#dialog" ).dialog( "open" );
    	var num=parent.document.getElementById("messNum");
    	alert(num.innerHTML);
    	num.innerHTML=66;
    	//parent.document.getElementById("mesNum").value=55;
    
    }); */
    
     
     $("#send").click(function(){
    	if( $("#title").val() == ""){
    		alert("标题不能为空");
    		return ;
    	}
    	
    	if($("#context").val() == ""){
    		alert("信件内容还没写呢");
    		return ;
    	}
    	
    	$.post(
    			"grj/message/writerMessage",
    			{"title":$("#title").val(),"user":$("#select option:selected").text(),"context":$("#context").val()},
    			function(data){
    				
    				var result = data.result;
    				alert(result);
    				if(result == "已发送"){
    					$("#title").val("");
    					
    					$("#context").val("");
    				}
    			}
    			);
    	 
     });
    
    
    });


    </script>
  </body>
</html>
