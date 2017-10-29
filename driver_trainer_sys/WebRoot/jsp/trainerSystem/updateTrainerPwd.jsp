<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
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
 #main{position:absolute;
       top:23%;left:40%;    }
       
       input{height:30px;}
</style>

  </head>
  
  <body>
  
  <center><h2>修改密码</h2></center>
  <div id="main">
 
      请输入旧密码:<input type="password" class="input-text" placeholder="旧密码" id="pwd1"/><br></br>
      
       请输入新密码:<input type="password" class="input-text" placeholder="新密码" id="pwd2"/><br></br>
       
        确认新密码:<input type="password" class="input-text" placeholder="确认新密码" id="pwd3"/><br></br>
   
   <input type="button" value="确认修改" class="btn btn-success" id="btn"/>
  
   
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
	
	
	<script type="text/javascript">
	
	  
	$(function(){
 
	    $("#btn").click(function(){
	    
	      var pw1 = $("#pwd1").val();
	      var pw2 = $("#pwd2").val();	       
	      var pw3 = $("#pwd3").val();
           
         if(pw2!=pw3){
         
           alert("两次输入的新密码不一致，请重新输入");

         }else{
          
	      $.ajax({
	      
	         url:"cw/updateTrainerPwd",
	         dataType:"text",
 	         data:{"pw1":pw1 ,"pw2":pw2},
 	         
	         success:function(data){
	       
	         if(data==0){
	         
	           alert("旧密码输入有误，请重新输入");
	         }else{	         
	            
	           alert("修改成功，请用新密码重新登录");	           
	           location = "jsp/login.jsp";
	         }
	       
	          
	       }
	      
	      });
	    
	     }
	    
	    });
	  
	  
	  
	  
	  
	  });
	
	
	
	
	</script>
	
	
  </body>
</html>
