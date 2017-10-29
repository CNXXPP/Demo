<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'updatePassword.jsp' starting page</title>
    
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
   <form>
      请输入旧密码:<input type="password" class="input-text" placeholder="旧密码" id="oldPwd"/><br></br>
      
       请输入新密码:<input type="password" class="input-text" placeholder="新密码" id="newPwd"/><br></br>
       
        确认新密码:<input type="password" class="input-text" placeholder="确认新密码" id="newAgain"/><br></br>
   
   <input type="button" value="确认修改" class="btn btn-success" id="btn"/>
   
   </form>
   
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
	    		
	    		if($("#oldPwd").val() == ""){
	    			alert("对不起请输入旧密码");
	    			return ;
	    		}
	    		else if($("#newPwd").val() == ""){
	    			alert("对不起请输入新密码");
	    			return ;
	    		}
	    		else if($("#newAgain").val() != $("#newPwd").val()){
	    			alert("对不起两次输入旧密码不一致");
	    			return ;
	    		}else{
	    			$.post(
	    			  "grj/stuInfo/updatePwd",
	    			  {"oldPwd":$("#oldPwd").val(),"newPwd":$("#newPwd").val()},
	    			  function(data){
	    				  var result = data.result;
	    				  
	    				  alert(result);//修改结果提醒
	    				  
	    				  if(result == "修改成功"){
	    					  $("#oldPwd").val("");
	    					  
	    					  $("#newPwd").val("");
	    					  
	    					  $("#newAgain").val("");
	    				  }
	    			  }
	    			);
	    		}
	    		
	    		
	    		
	    	});
	    	
	    	
	    	
	    });
	
	</script>
  </body>
</html>
