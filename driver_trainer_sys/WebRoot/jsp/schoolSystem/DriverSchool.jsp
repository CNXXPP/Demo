<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'DriverSchool.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript" src="lib/html5.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>

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
<!--[if IE 6]>
<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<!--/meta 作为公共模版分离出去-->

<title>管理员列表 - 管理员列表 - H-ui.admin v3.0</title>
<style type="text/css">
#page {
	width: 100%;
	height: 100%;
	padding:0px;

}
#tt{
    margin:0px;
}


</style>

</head>

<body>
	<header class="navbar-wrapper">
	<div class="navbar navbar-fixed-top">
		<div class="container-fluid cl">
			<a class="logo navbar-logo f-l mr-10 hidden-xs"
				href="/aboutHui.shtml">驾校管理系统</a> <a
				class="logo navbar-logo-m f-l mr-10 visible-xs"
				href="/aboutHui.shtml">H-ui</a> <span
				class="logo navbar-slogan f-l mr-10 hidden-xs">v1.0</span> <a
				aria-hidden="false" class="nav-toggle Hui-iconfont visible-xs"
				href="javascript:;">&#xe667;</a>
			<nav class="nav navbar-nav">
			<ul class="cl">
				<li class="dropDown dropDown_hover"><a href="javascript:;"
					class="dropDown_A"><i class="Hui-iconfont">&#xe600;</i> 新增 <i
						class="Hui-iconfont">&#xe6d5;</i></a>
					<ul class="dropDown-menu menu radius box-shadow">
						<li><a href="jsp/schoolSystem/NewStudent.jsp"
							onclick="article_add('添加资讯','article-add.html')"><i
								class="Hui-iconfont">&#xe60d;</i> 学员</a></li>
						<li><a href="jsp/schoolSystem/NewTrainner.jsp"
							onclick="picture_add('添加资讯','picture-add.html')"><i
								class="Hui-iconfont">&#xe62d;</i> 教练</a></li>
					</ul></li>
			</ul>
			</nav>
			<nav id="Hui-userbar" class="nav navbar-nav navbar-userbar hidden-xs">
			<ul class="cl">
				
				<li class="dropDown dropDown_hover">超级管理员 <i class="Hui-iconfont">&#xe6d5;</i></a>
					<ul class="dropDown-menu menu radius box-shadow">
						<li><a href="jsp/schoolSystem/MyInformation.jsp" >个人信息</a></li>
						<li><a href="jsp/login.jsp">切换账户</a></li>
						<li><a href="jsp/main/index.jsp">退出</a></li>
					</ul></li>
				<li id="Hui-msg"><a href="jsp/schoolSystem/CheckMail.jsp" target="page" title="消息"> <span
						class="badge badge-danger" id="messNum"></span> <i class="Hui-iconfont"
						style="font-size:18px">&#xe68a;</i></a></li>
				<li id="Hui-skin" class="dropDown right dropDown_hover"><a
					href="javascript:;" class="dropDown_A" title="换肤"><i
						class="Hui-iconfont" style="font-size:18px">&#xe62a;</i></a>
					<ul class="dropDown-menu menu radius box-shadow">
						<li><a href="javascript:;" data-val="default" title="默认（黑色）">默认（黑色）</a></li>
						<li><a href="javascript:;" data-val="blue" title="蓝色">蓝色</a></li>
						<li><a href="javascript:;" data-val="green" title="绿色">绿色</a></li>
						<li><a href="javascript:;" data-val="red" title="红色">红色</a></li>
						<li><a href="javascript:;" data-val="yellow" title="黄色">黄色</a></li>
						<li><a href="javascript:;" data-val="orange" title="橙色">橙色</a></li>
					</ul></li>
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
			<dt>
				<i class="Hui-iconfont">&#xe67f;</i> 主页<i
					class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
			</dt>
			<dd>
				<ul>
					<li><a href="jsp/schoolSystem/HomePage.jsp" target="page" title=""
						id="h">我的主页</a></li>
				</ul>
			</dd>
		</dl>
		<dl id="menu-picture">
			<dt>
				<i class="Hui-iconfont">&#xe622;</i> 公告管理<i
					class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
			</dt>
			<dd>
				<ul>
					<li><a href="jsp/schoolSystem/tableTest.jsp" title=""
						target="page">查看公告</a></li>
					<li><a href="jsp/schoolSystem/NewAnnounce.jsp" title=""
						target="page">新的公告</a></li>
				</ul>
			</dd>
		</dl>
		<dl id="menu-product">
			<dt>
				<i class="Hui-iconfont">&#xe62d;</i> 教练管理<i
					class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
			</dt>
			<dd>
				<ul>
					<li><a href="jsp/schoolSystem/TrainerTable.jsp" title=""
						target="page">查看教练</a></li>
					<li><a href="jsp/schoolSystem/NewTrainner.jsp" title=""
						target="page">教练登记</a></li>
				</ul>
			</dd>
		</dl>
		<dl id="menu-comments">
			<dt>
				<i class="Hui-iconfont">&#xe60d;</i>学员管理 <i
					class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
			</dt>
			<dd>
				<ul>
					<li><a href="jsp/schoolSystem/NewStudent.jsp" title=""
						target="page">学员报名</a></li>
					<li><a href="jsp/schoolSystem/CheckStudent.jsp" target="page">学员信息</a></li>
					<li><a href="jsp/schoolSystem/CheckStudentTime.jsp" target="page">查看学员学时</a></li>
				</ul>
			</dd>
		</dl>
		<dl id="menu-member">
			<dt>
				<i class="Hui-iconfont">&#xe616;</i>教学安排<i
					class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
			</dt>
			<dd>
				<ul>
					<li><a href="jsp/schoolSystem/TrainerSetTable.jsp" title="" target="page">教练分配</a></li>
				</ul>
			</dd>
		</dl>
		<dl id="menu-admin">
			<dt class="selected">
				<i class="Hui-iconfont">&#xe68a;</i> 信箱<i
					class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
			</dt>
			<dd style="display:block">
				<ul>
					<li><a href="jsp/schoolSystem/CheckMail.jsp" title="角色管理" target="page">查看信件</a></li>
					<li><a href="jsp/schoolSystem/NewMail.jsp" title="角色管理"
						target="page">写信</a></li>
				</ul>
			</dd>
		</dl>
		<dl id="menu-tongji">
			<dt>
				<i class="Hui-iconfont">&#xe61a;</i> 考试申请<i
					class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
			</dt>
			<dd>
				<ul>
					<li><a href="jsp/schoolSystem/Sub1Regist.jsp" title="" target="page">科目一</a></li>
					<li><a href="jsp/schoolSystem/Sub2Regist.jsp" title="" target="page">科目二</a></li>
					<li><a href="jsp/schoolSystem/Sub3Regist.jsp" title="" target="page">科目三</a></li>
					<li><a href="jsp/schoolSystem/Sub4Regist.jsp" title="" target="page">科目四</a></li>


				</ul>
			</dd>
		</dl>

	</div>
	</aside>
	<div class="dislpayArrow hidden-xs">
		<a class="pngfix" href="javascript:void(0);"
			onClick="displaynavbar(this)"></a>
	</div>
	<!--/_menu 作为公共模版分离出去-->



	<!--_footer 作为公共模版分离出去-->
	<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
	<script type="text/javascript" src="static/h-ui/js/H-ui.js"></script>
	<script type="text/javascript"
		src="static/h-ui.admin/js/H-ui.admin.page.js"></script>
	<!--/_footer /作为公共模版分离出去-->
	<section class="Hui-article-box"> <nav class="breadcrumb">
	<i class="Hui-iconfont"></i> <a href="jsp/schoolSystem/HomePage.jsp"  target="page" class="maincolor">首页</a> <span
		class="c-999 en">&gt;</span>
	</nav>
	<div class="Hui-article">
		<article class="cl pd-20" id="tt"> 
		<iframe id="page" src="jsp/schoolSystem/HomePage.jsp" name="page"></iframe> 
		</article>
	</div>
	</section>
	<!--请在下方写此页面业务相关的脚本-->
	<script type="text/javascript" src="lib/My97DatePicker/4.8/WdatePicker.js"></script> 
	<script type="text/javascript"
		src="lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
	<script type="text/javascript">
	    $(function(){
	              var ws;
	              

	              var schUuid = "${school.schUuid}";

	               if (!window.WebSocket) {
		                   alert("对不起浏览器不支持请升级");
	               } else {
                        
	            	   ws = new WebSocket("ws://localhost:8080/driver_trainer_sys/StudentWebSocket");
	            	   
	            	   ws.onopen = function(){
	            		   ws.send("{msg:'login' , ID:'"+schUuid+"'}");
	            	   };
	            	   
	            	   ws.onmessage = function(msg){
	            		  
// 	            		   alert(msg.data);
	            		   var obj=JSON.parse(msg.data);
	            		  
	            		    if(obj.msg == "sendMsg"){
	            			   alert("收到新消息");
	            			   
	            			   var num= parseInt($("#messNum").text())+1;
		            		   $("#messNum").text(num);
	            		   }
	            		   
	            		   
	            	   };
	            	   
	            	   ws.onclose = function(){
	            		   console.log("websocket关闭");
	            	   };
	            	   
	            	   ws.onerror = function(){
	            		   console.log("websocket错误关闭");
	            	   };
	               }
	            });     
	               
	               $(function(){//修改消息提示数量
	            	   $.post("grj/message/getNeverReadNum",{},
	            			   function(data){
	            		      var num = data.result;
	            		      if(parseInt(num) != 0){
	            		    	  
	            		      $("#messNum").text(num);
	            		      }
	            		      
	            	   });
	               });
	</script>
</body>
</html>
