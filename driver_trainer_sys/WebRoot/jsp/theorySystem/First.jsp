<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'First.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="/driver_trainer_sys/layui/css/layui.css" media="all" />
	<link rel="stylesheet" href="/driver_trainer_sys/css/font_eolqem241z66flxr.css" media="all" />
    <script type="text/javascript" src="/driver_trainer_sys/js/jquery-2.2.1.js"></script>
  </head>
  
  <body>
    <div class="layui-elem-quote title">第一部分：理论学习 <span id="all"><span>(您今天已经学习</span><span id="time"></span>分钟，还需学习<span id="time1"></span><span>分钟)</span></span></div>
    <table >
	<tr>
	<td height="250px" width="420px">
	<p>1.法律、法规及道路交通信号</p>
	<div>
	<object pluginspage="http://www.macromedia.com/go/getflashplayer" classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=11,3,0,0" width="100%" height="100%" id="ckplayer_a1" name="ckplayer_a1" align="middle">
	<param name="allowScriptAccess" value="always">
	<param name="allowFullScreen" value="true">
	<param name="quality" value="high">
	<param name="bgcolor" value="#FFF">
	<param name="wmode" value="transparent">
	<param name="movie" value="http://fj.17qibu.cn:8001/ckplayer2017/ckplayer.swf">
	<param name="flashvars" value="f=http://fj.17qibu.cn:8001/ckPlayer2017/m3u8.swf&amp;a=http://player.s152.17qibu.cn:15000/cppc/111/list.m3u8&amp;s=4&amp;i=/skin/ico/pcvideo.jpg&amp;c=0&amp;p=2">
	<embed allowscriptaccess="always" allowfullscreen="true" quality="high" bgcolor="#FFF" wmode="transparent" src="http://fj.17qibu.cn:8001/ckplayer2017/ckplayer.swf" flashvars="f=http://fj.17qibu.cn:8001/ckPlayer2017/m3u8.swf&amp;a=http://player.s152.17qibu.cn:15000/cppc/111/list.m3u8&amp;s=4&amp;i=/skin/ico/pcvideo.jpg&amp;c=0&amp;p=2" width="100%" height="100%" name="ckplayer_a1" id="ckplayer_a1" align="middle" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer">
	</object>
	</div>
	</td>
	<td><h2></td>
	<td height="250px" width="420px">
	<p>2.道路交通信号</p>
	<div>
	
	<object pluginspage="http://www.macromedia.com/go/getflashplayer" classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=11,3,0,0" width="100%" height="100%" id="ckplayer_a1" name="ckplayer_a1" align="middle">
	<param name="allowScriptAccess" value="always">
	<param name="allowFullScreen" value="true">
	<param name="quality" value="high">
	<param name="bgcolor" value="#FFF">
	<param name="wmode" value="transparent">
	<param name="movie" value="http://fj.17qibu.cn:8001/ckplayer2017/ckplayer.swf">
	<param name="flashvars" value="f=http://fj.17qibu.cn:8001/ckPlayer2017/m3u8.swf&amp;a=http://player.s152.17qibu.cn:15000/cppc/112/list.m3u8&amp;s=4&amp;i=/skin/ico/pcvideo.jpg&amp;c=0&amp;p=2">
	<embed allowscriptaccess="always" allowfullscreen="true" quality="high" bgcolor="#FFF" wmode="transparent" src="http://fj.17qibu.cn:8001/ckplayer2017/ckplayer.swf" flashvars="f=http://fj.17qibu.cn:8001/ckPlayer2017/m3u8.swf&amp;a=http://player.s152.17qibu.cn:15000/cppc/112/list.m3u8&amp;s=4&amp;i=/skin/ico/pcvideo.jpg&amp;c=0&amp;p=2" width="100%" height="100%" name="ckplayer_a1" id="ckplayer_a1" align="middle" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer">
	</object>
	</div>
	</td>
	<td><h></td>
	
	<td height="250px" width="420px">
	<p>3.道路通行规则</p>
	<div>
	<object pluginspage="http://www.macromedia.com/go/getflashplayer" classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=11,3,0,0" width="100%" height="100%" id="ckplayer_a1" name="ckplayer_a1" align="middle">
	<param name="allowScriptAccess" value="always">
	<param name="allowFullScreen" value="true">
	<param name="quality" value="high">
	<param name="bgcolor" value="#FFF">
	<param name="wmode" value="transparent">
	<param name="movie" value="http://fj.17qibu.cn:8001/ckplayer2017/ckplayer.swf">
	<param name="flashvars" value="f=http://fj.17qibu.cn:8001/ckPlayer2017/m3u8.swf&amp;a=http://player.s152.17qibu.cn:15000/cppc/113/list.m3u8&amp;s=4&amp;i=/skin/ico/pcvideo.jpg&amp;c=0&amp;p=2">
	<embed allowscriptaccess="always" allowfullscreen="true" quality="high" bgcolor="#FFF" wmode="transparent" src="http://fj.17qibu.cn:8001/ckplayer2017/ckplayer.swf" flashvars="f=http://fj.17qibu.cn:8001/ckPlayer2017/m3u8.swf&amp;a=http://player.s152.17qibu.cn:15000/cppc/113/list.m3u8&amp;s=4&amp;i=/skin/ico/pcvideo.jpg&amp;c=0&amp;p=2" width="100%" height="100%" name="ckplayer_a1" id="ckplayer_a1" align="middle" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer">
	</object>
	</div>
	</td>
	</tr>
	<tr>
	<td height="250px" width="420px">
	<div>
	<p>4.驾驶行为及违法行为处罚</p>
	<object pluginspage="http://www.macromedia.com/go/getflashplayer" classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=11,3,0,0" width="100%" height="100%" id="ckplayer_a1" name="ckplayer_a1" align="middle">
	<param name="allowScriptAccess" value="always">
	<param name="allowFullScreen" value="true">
	<param name="quality" value="high">
	<param name="bgcolor" value="#FFF">
	<param name="wmode" value="transparent">
	<param name="movie" value="http://fj.17qibu.cn:8001/ckplayer2017/ckplayer.swf">
	<param name="flashvars" value="f=http://fj.17qibu.cn:8001/ckPlayer2017/m3u8.swf&amp;a=http://player.s152.17qibu.cn:15000/cppc/114/list.m3u8&amp;s=4&amp;i=/skin/ico/pcvideo.jpg&amp;c=0&amp;p=2">
	<embed allowscriptaccess="always" allowfullscreen="true" quality="high" bgcolor="#FFF" wmode="transparent" src="http://fj.17qibu.cn:8001/ckplayer2017/ckplayer.swf" flashvars="f=http://fj.17qibu.cn:8001/ckPlayer2017/m3u8.swf&amp;a=http://player.s152.17qibu.cn:15000/cppc/114/list.m3u8&amp;s=4&amp;i=/skin/ico/pcvideo.jpg&amp;c=0&amp;p=2" width="100%" height="100%" name="ckplayer_a1" id="ckplayer_a1" align="middle" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer">
	</object>
	</div>
	</td>
	<td><h></td>
	<td height="250px" width="420px">
	<div>
	<p>5.机动车登记</p>
	<object pluginspage="http://www.macromedia.com/go/getflashplayer" classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=11,3,0,0" width="100%" height="100%" id="ckplayer_a1" name="ckplayer_a1" align="middle">
	<param name="allowScriptAccess" value="always">
	<param name="allowFullScreen" value="true">
	<param name="quality" value="high">
	<param name="bgcolor" value="#FFF">
	<param name="wmode" value="transparent">
	<param name="movie" value="http://fj.17qibu.cn:8001/ckplayer2017/ckplayer.swf">
	<param name="flashvars" value="f=http://fj.17qibu.cn:8001/ckPlayer2017/m3u8.swf&amp;a=http://player.s152.17qibu.cn:15000/cppc/115/list.m3u8&amp;s=4&amp;i=/skin/ico/pcvideo.jpg&amp;c=0&amp;p=2">
	<embed allowscriptaccess="always" allowfullscreen="true" quality="high" bgcolor="#FFF" wmode="transparent" src="http://fj.17qibu.cn:8001/ckplayer2017/ckplayer.swf" flashvars="f=http://fj.17qibu.cn:8001/ckPlayer2017/m3u8.swf&amp;a=http://player.s152.17qibu.cn:15000/cppc/115/list.m3u8&amp;s=4&amp;i=/skin/ico/pcvideo.jpg&amp;c=0&amp;p=2" width="100%" height="100%" name="ckplayer_a1" id="ckplayer_a1" align="middle" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer">
	</object>
	</div>
	</td>
	<td><h></td>
	<td height="250px" width="420px">
	<div>
	<p>6.交通事故处理</p>
	<object pluginspage="http://www.macromedia.com/go/getflashplayer" classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=11,3,0,0" width="100%" height="100%" id="ckplayer_a1" name="ckplayer_a1" align="middle">
	<param name="allowScriptAccess" value="always">
	<param name="allowFullScreen" value="true">
	<param name="quality" value="high">
	<param name="bgcolor" value="#FFF">
	<param name="wmode" value="transparent">
	<param name="movie" value="http://fj.17qibu.cn:8001/ckplayer2017/ckplayer.swf">
	<param name="flashvars" value="f=http://fj.17qibu.cn:8001/ckPlayer2017/m3u8.swf&amp;a=http://player.s152.17qibu.cn:15000/cppc/116/list.m3u8&amp;s=4&amp;i=/skin/ico/pcvideo.jpg&amp;c=0&amp;p=2"><embed allowscriptaccess="always" allowfullscreen="true" quality="high" bgcolor="#FFF" wmode="transparent" src="http://fj.17qibu.cn:8001/ckplayer2017/ckplayer.swf" flashvars="f=http://fj.17qibu.cn:8001/ckPlayer2017/m3u8.swf&amp;a=http://player.s152.17qibu.cn:15000/cppc/116/list.m3u8&amp;s=4&amp;i=/skin/ico/pcvideo.jpg&amp;c=0&amp;p=2" width="100%" height="100%" name="ckplayer_a1" id="ckplayer_a1" align="middle" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer">
	</object>
	</div>
	</td>
	</tr>
	</table> 
	<script type="text/javascript">
	        var time = 0;
	        var mine = 0;
	        var houre = 0;
	        var timer;
	    window.onload=function(){
	        $.post("/driver_trainer_sys/CZX/CardTime/getCarTime",{},function(data){
	                var hour11=parseInt((600-data.StuCardTime.ctSub1)/60);
                    var min11=parseInt((600-data.StuCardTime.ctSub1)%60);
                    $("#time1").html(hour11+"学时"+min11);
                    if(hour11 == 0 && min11 == 0){
                     $("#all").html("（您已完成本阶段的学习）");
                     window.clearInterval(timer);
                 }
	            });
	        
	        $("#time").html(houre+"学时"+mine);
	        timer=setInterval("lasttime()", "1000");
	    };
	    
	    function lasttime(){
	        time+=1;
	        if(time==60){
	            mine+=1;
	            $("#time").html(houre+"学时"+mine);
	            $.post("/driver_trainer_sys/CZX/CardTime/updateCardTime",{"time":1},function(){
	                
	            });
	            $.post("/driver_trainer_sys/CZX/CardTime/getCarTime",{},function(data){
	                var hour11=parseInt((600-data.StuCardTime.ctSub1)/60);
                    var min11=parseInt((600-data.StuCardTime.ctSub1)%60);
                    $("#time1").html(hour11+"学时"+min11);
                    if(hour11 == 0 && min11 == 0){
                     $("#all").html("（您已完成本阶段的学习）");
                     window.clearInterval(timer);
                     
                 }
	            });
	            time=0;
	            if(mine==60){
	                houre +=1;
	                mine=0;
	                $("#time").html(houre+"学时"+mine);
	            }
	        }
	            $("#time").html(houre+"学时"+mine);
	        
	    }
	    
	    /* $(window).unload(function(){
        rec();
        });
        */
        function rec(){
            var aa = 0;
            aa = (houre*60)+mine;
            $.post("/driver_trainer_sys	/CZX/CardTime/CartTimeRec1",{"time":aa},function(){
                
            });
        } 
        
       
       
     var _t; 
    window.onbeforeunload = function(){ 
    setTimeout(function(){_t = setTimeout(onunloadcancel, 0)}, 0); 
        if($("#all").html()=="（您已完成本阶段的学习）"){
        
        return "真的离开?"; 
        }else{
          var aa = 0;
            aa = (houre*60)+mine;
            $.post("/driver_trainer_sys	/CZX/CardTime/CartTimeRec1",{"time":aa},function(){
                
            });
            return "真的离开?";
    }
    };
    window.onunloadcancel = function(){ 
    clearTimeout(_t); 
    
    };
	</script>
	
  </body>
</html>
