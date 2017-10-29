<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>教练写信箱</title>
    
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
	#fro{margin-left:11%;
	margin-top:30px;}
	
	#select{width:20%;height:30px;}
	
	</style>
  </head>
  
  <body>
  
  <div id="fro">
&nbsp; &nbsp;&nbsp;标题:&nbsp;&nbsp;<input type="text" class="input-text" style="width:250px" placeholder="输入标题" id="titie"><br><br>
   	发送给：<select  id="select">
   	    <option>驾校</option>
   	</select><br><br>
   	<h2>正文:</h2><br>
   	<textarea name="textarea"  wrap="physical" style="width:80%;height:200px;magrin-left:10%" id="textarea"></textarea><br><br>
   	<input type="button" value="发送" class="btn btn-success radius" onclick="sendmsg()"/>
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
		
		$.ajax({
			
			url:"cw/selectAllstu",
			type:"post",
			dataType:"json",
			
			success:function(imt){
				
				for(var i=0; i<imt.length; i++){
					
					$("#select").append("<option>"+imt[i].stuUuid+"</option>");
					
				}
				
			}
			
		});
		
	});
	
	
	  
	 var ws; 
	  
    function sendmsg(){  
    	alert($("select option:selected").val());
    	alert($("select option:selected").val());
        $.ajax({

            url:"cw/writerMsg",
            type:"post",
            data: {"traUuid":'${Trainer.traUuid}',"tmsgTitle":$("#titie").val(),"tmsgContext":$("#textarea").val(),"tmsgIdentity":'${Trainer.traId}',"tmsgStatus":'未查看', "tmsgType":'发',"tmsgGroup":$("select option:selected").val()},
            
            dataType:"json",
            
            success:function(imt){
            
               if(imt==1){
                  
                  alert("发送成功");
                  
                  ws = new WebSocket("ws://localhost:8080/driver_trainer_sys/MySocket");
                  
                   ws.onopen = function(){
                   
                        ws.send("{msg:'sendMsg',group:'"+$("select option:selected").val()+"',identity:'教练中心'}");
                        $("#titie").val("");
                        $("#textarea").val("");
                     
                   }
                   
                   
               ws.onmessage = function(message){

                var d=eval("("+message.data+")"); 
                   
                  switch(d.msg){
                  
                     case "sendMsg":
                     
                     alert("收到"+d.identity+"消息，请注意查收！");
                  
                     break;
                  
                  
                  } 
                  
                  
                 } 
                 
               }
            
            }
            
            
            
        });
        
        
        
        
        
        
    
     }
	
	
	
	</script>
	
	
	
  </body>
</html>
