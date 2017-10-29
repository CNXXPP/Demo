<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>教练管理中心</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<script type="text/javascript" src="lib/html5.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>

<link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />


<title>管理员列表 - 管理员列表 - H-ui.admin v3.0</title>
<style type="text/css">
#page{
width:100%;
height:100%;
}

</style>

  </head>
  
  <body>
   <header class="navbar-wrapper">
	<div class="navbar navbar-fixed-top">
		<div class="container-fluid cl"> <a class="logo navbar-logo f-l mr-10 hidden-xs" href="/aboutHui.shtml">教练管理系统</a> <a class="logo navbar-logo-m f-l mr-10 visible-xs" href="jsp/trainerSystem/trainerPage.jsp">H-ui</a>
			<span class="logo navbar-slogan f-l mr-10 hidden-xs">v3.0</span>
			<a aria-hidden="false" class="nav-toggle Hui-iconfont visible-xs" href="javascript:;">&#xe667;</a>
<!-- 			<nav class="nav navbar-nav"> -->
<!-- 				<ul class="cl"> -->
<!-- 					<li class="dropDown dropDown_hover"> <a href="javascript:;" class="dropDown_A"><i class="Hui-iconfont">&#xe600;</i> 新增 <i class="Hui-iconfont">&#xe6d5;</i></a> -->
<!-- 						<ul class="dropDown-menu menu radius box-shadow"> -->
<!-- 							<li><a href="javascript:;" onclick="article_add('添加资讯','article-add.html')"><i class="Hui-iconfont">&#xe616;</i> 资讯</a></li> -->
<!-- 							<li><a href="javascript:;" onclick="picture_add('添加资讯','picture-add.html')"><i class="Hui-iconfont">&#xe613;</i> 图片</a></li> -->
<!-- 							<li><a href="javascript:;" onclick="product_add('添加资讯','product-add.html')"><i class="Hui-iconfont">&#xe620;</i> 产品</a></li> -->
<!-- 							<li><a href="javascript:;" onclick="member_add('添加用户','member-add.html','','510')"><i class="Hui-iconfont">&#xe60d;</i> 用户</a></li> -->
<!-- 						</ul> -->
<!-- 					</li> -->
<!-- 				</ul> -->
<!-- 			</nav> -->
			<nav id="Hui-userbar" class="nav navbar-nav navbar-userbar hidden-xs">
				<ul class="cl">
<!-- 					<li>超级管理员</li> -->
<!-- 					<li class="dropDown dropDown_hover"> <a href="#" class="dropDown_A">admin <i class="Hui-iconfont">&#xe6d5;</i></a> -->
<!-- 						<ul class="dropDown-menu menu radius box-shadow"> -->
<!-- 							<li><a href="javascript:;" onClick="myselfinfo()">个人信息</a></li> -->
<!-- 							<li><a href="jsp/login.jsp">切换账户</a></li> -->
<!-- 							<li><a href="jsp/login.jsp">退出</a></li> -->
<!-- 						</ul> -->
<!-- 					</li> -->
					<li id="Hui-msg"> <a href="" target="page" title="消息">
							<span class="badge badge-danger" id="messNum"></span>
							<i class="Hui-iconfont" style="font-size:18px">&#xe68a;</i></a></li>
					<li id="Hui-skin" class="dropDown right dropDown_hover"> <a href="javascript:;" class="dropDown_A" title="换肤"><i class="Hui-iconfont" style="font-size:18px">&#xe62a;</i></a>
						<ul class="dropDown-menu menu radius box-shadow">
							<li><a href="javascript:;" data-val="default" title="默认（黑色）">默认（黑色）</a></li>
							<li><a href="javascript:;" data-val="blue" title="蓝色">蓝色</a></li>
							<li><a href="javascript:;" data-val="green" title="绿色">绿色</a></li>
							<li><a href="javascript:;" data-val="red" title="红色">红色</a></li>
							<li><a href="javascript:;" data-val="yellow" title="黄色">黄色</a></li>
							<li><a href="javascript:;" data-val="orange" title="橙色">橙色</a></li>
						</ul>
					</li>
				</ul>
			</nav>
		</div>
	</div>
</header>
<!--/_header 作为公共模版分离出去--> 

<!--_menu 作为公共模版分离出去-->
<aside class="Hui-aside">
	
	<div class="menu_dropdown bk_2">
		<dl id="menu-article">
			<dt><i class="Hui-iconfont">&#xe620;</i> 主页<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a href="jsp/trainerSystem/mainPage.jsp" target="page" title="" id="h">我的主页</a></li>
				</ul>
			</dd>
		</dl>

		<dl id="menu-product">
			<dt><i class="Hui-iconfont">&#xe616;</i> 教练信息<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
				    <li><a href="jsp/trainerSystem/trainerInfo.jsp" title="我的信息" target="page">我的信息</a></li>
					<li><a href="jsp/trainerSystem/appraise.jsp" title="学员的评价" target="page">学员的评价</a></li>
		  
				</ul>
			</dd>
		</dl>
		<dl id="menu-comments">
			<dt><i class="Hui-iconfont">&#xe60d;</i>我的学员 <i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a href="jsp/trainerSystem/myStudent.jsp" target="page">学员信息</a></li>
					<li><a href="jsp/trainerSystem/selectStudyHours.jsp" target="page">查看学员学时</a></li>
				</ul>
			</dd>
		</dl>
		<dl id="menu-member">
			<dt><i class="Hui-iconfont">&#xe62d;</i>教学安排<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a href="jsp/trainerSystem/arrange.jsp"  target="page">课程安排</a></li>
				</ul>
			</dd>
		</dl>
		<dl id="menu-admin">
			<dt class="selected"><i class="Hui-iconfont">&#xe622;</i> 信箱<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd style="display:block">
				<ul>
				    <li><a href="jsp/trainerSystem/writerMsg.jsp" title="角色管理" target="page">写信</a></li>
				     <li><a href="jsp/trainerSystem/sendedMessage.jsp" title="角色管理" target="page">发信箱</a></li>
					<li><a href="jsp/trainerSystem/receiveMsg.jsp" title="角色管理" target="page">收信箱</a></li>
				
				</ul>
			</dd>
		</dl>
		
		<dl id="menu-member">
			<dt><i class="Hui-iconfont">&#xe62e;</i> 设置<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a href="jsp/trainerSystem/updateInfo.jsp" target="page" title="修改信息">修改信息</a></li>
					<li><a href="jsp/trainerSystem/updateTrainerPwd.jsp" target="page" title="修改密码">修改密码</a></li>
					<li><a href="jsp/login.jsp" title="退出登录">退出登录</a></li>
					
					
				</ul>
			</dd>
		</dl>
		
	
	</div>
</aside>
<div class="dislpayArrow hidden-xs"> <a class="pngfix" href="javascript:void(0);" onClick="displaynavbar(this)"></a> </div>
<!--/_menu 作为公共模版分离出去-->



<section class="Hui-article-box">
	<nav class="breadcrumb"><i class="Hui-iconfont"></i> <a href="jsp/studentSystem/main.jsp" class="maincolor">首页</a> </nav>
	<div class="Hui-article" >
		<article class="cl pd-20" style="padding:0px">
			<iframe id="page" src="jsp/trainerSystem/trainerWelcomePage.jsp" name="page"></iframe>
		</article>
	</div>
</section>




<!--_footer 作为公共模版分离出去--> 
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script> 
<script type="text/javascript" src="static/h-ui/js/H-ui.js"></script> 
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.page.js"></script> 
<!--/_footer /作为公共模版分离出去--> 

<!--请在下方写此页面业务相关的脚本--> 
<script type="text/javascript" src="lib/My97DatePicker/4.8/WdatePicker.js"></script> 
<script type="text/javascript" src="lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script> 
<script type="text/javascript">
/*
	参数解释：
	title	标题
	url		请求的url
	id		需要操作的数据id
	w		弹出层宽度（缺省调默认值）
	h		弹出层高度（缺省调默认值）
*/
/*管理员-增加*/
$(function(){
$("#h").click(function(){
$("#page").loction.replace("http://www.baidu.com");

});

});

function admin_add(title,url,w,h){
	layer_show(title,url,w,h);
}
/*管理员-删除*/
function admin_del(obj,id){
	layer.confirm('确认要删除吗？',function(index){
		//此处请求后台程序，下方是成功后的前台处理……
		
		$(obj).parents("tr").remove();
		layer.msg('已删除!',{icon:1,time:1000});
	});
}
/*管理员-编辑*/
function admin_edit(title,url,id,w,h){
	layer_show(title,url,w,h);
}
/*管理员-停用*/
function admin_stop(obj,id){
	layer.confirm('确认要停用吗？',function(index){
		//此处请求后台程序，下方是成功后的前台处理……
		
		$(obj).parents("tr").find(".td-manage").prepend('<a onClick="admin_start(this,id)" href="javascript:;" title="启用" style="text-decoration:none"><i class="Hui-iconfont">&#xe615;</i></a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-default radius">已禁用</span>');
		$(obj).remove();
		layer.msg('已停用!',{icon: 5,time:1000});
	});
}

/*管理员-启用*/
function admin_start(obj,id){
	layer.confirm('确认要启用吗？',function(index){
		//此处请求后台程序，下方是成功后的前台处理……
		
		$(obj).parents("tr").find(".td-manage").prepend('<a onClick="admin_stop(this,id)" href="javascript:;" title="停用" style="text-decoration:none"><i class="Hui-iconfont">&#xe631;</i></a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已启用</span>');
		$(obj).remove();
		layer.msg('已启用!', {icon: 6,time:1000});
	});
}
   
   /*webwocket*/


            var ws;         
            
            if(!window.WebSocket){
            
               alert("服务器不支持WebSocket请升级");
            }else{
         
               ws = new WebSocket("ws://localhost:8080/driver_trainer_sys/MySocket");
            
               ws.onopen = function(){

                ws.send("{msg:'login',ID:'${Trainer.traUuid}',userName:'${Trainer.traName}',department:'教练'}");
             
              };
                 
              ws.onmessage = function(message){

               var d=eval("("+message.data+")");  
               
                 
                switch(d.msg){
                
                 
                  case "login":
              
                      alert(d.userName + "登录了"); 
                    
                    break;
                 
                    
                  case "sendMsg":               	  
                	  
                	 alert("收到"+d.identity+"发来的消息"); 
                	  
                     break;
                
                } 
                 
                 
                 
                 
              }
              
              
              ws.onclose=function(){
    			
    			alert("服务器异常");
    			
    		 };
            
            }









</script> 
  </body>
</html>