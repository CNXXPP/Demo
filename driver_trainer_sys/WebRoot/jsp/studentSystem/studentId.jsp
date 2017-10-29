<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'studentId.jsp' starting page</title>
    
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
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
  
  <style type="text/css">
    div{
    width:70%;
    height:600px;
    margin-left:15%;
    
    
    }
    
    body{
    background-image:url("images/stuid.jpg"); }
    
   
  
  </style>
  
  </head>
  
  
  
  <body>
     <div >
       <center style="margin-top:10%"><h1 >恭喜报名成功</h1></center><br><br>
       <center><h1>您的学号为：</h1><h1 id="register"></h1>
      <input type="botton" class="btn btn-primary radius" id="btnSure"
			value="确认" /></center>
     </div>
     <script type="text/javascript">
     
        $(function(){
        	
        	
        	var registerId = '${registerId}';
   	     
   	     if(registerId != ""){
   	    	 $("#register").text(registerId);
   	     }
   	      $("#btnSure").click(function(){
   	    	  location = "jsp/login.jsp";
   	      });
        });
     
     </script>
  </body>
</html>
