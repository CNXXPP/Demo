<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>运管中心</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />

<link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script> 
 
<script type="text/javascript" src="lib/jquery.validation/1.14.0/jquery.validate.js"></script> 
<script type="text/javascript" src="lib/jquery.validation/1.14.0/validate-methods.js"></script> 
<script type="text/javascript" src="lib/jquery.validation/1.14.0/messages_zh.js"></script> 
<script type="text/javascript" src="static/h-ui/js/H-ui.js"></script> 
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.page.js"></script>
  </head>
  
  <body>
   <header class="navbar-wrapper">
	<div class="navbar navbar-fixed-top">
		<div class="container-fluid cl"> <a class="logo navbar-logo f-l mr-10 hidden-xs" href="/aboutHui.shtml">福州驾驶员培训考试运营管理中心</a> <a class="logo navbar-logo-m f-l mr-10 visible-xs" href="/aboutHui.shtml"></a> <span class="logo navbar-slogan f-l mr-10 hidden-xs"></span> <a aria-hidden="false" class="nav-toggle Hui-iconfont visible-xs" href="javascript:;">&#xe667;</a>
			
			<nav id="Hui-userbar" class="nav navbar-nav navbar-userbar hidden-xs">
				
				<ul class="cl">
					
					<li class="dropDown dropDown_hover"> <a  class="dropDown_A">${admin.admName} <i class="Hui-iconfont">&#xe6d5;</i></a>
						<ul class="dropDown-menu menu radius box-shadow">
							
							<li><a href="jsp/centerMgr/updateAdminPwd.jsp" target="iframe">修改密码</a></li>
							<li><a href="jsp/centerMgr/centerLogin.jsp">退出</a></li>
						</ul>
					</li>
				
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
	<h4>&nbsp;&nbsp;&nbsp;${adminMap.CHAR_TYPE}</h4>
		<c:forEach items="${menuMap }" var='menu' varStatus="status">
			<dl id="${status.index }">
				<dt><i class="Hui-iconfont">&#xe61a;</i>${menu.key }<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
				<dd>
				<ul>
					<c:forEach items="${menu.value }" var='m' >
						<li><a href="${m.value }" target="iframe" title="${m.key }">${m.key }</a></li>
					</c:forEach>
					
					
				</ul>
			</dd>
			</dl>
		</c:forEach>
		<dl id="menu-article">
			<dt><i class="Hui-iconfont">&#xe61a;</i>个人中心<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a href="jsp/centerMgr/personInfo.jsp" target="iframe" title="个人主页">个人主页</a></li>
					<li><a href="jsp/centerMgr/updateAdminPwd.jsp" target="iframe" title="密码修改">密码修改</a></li>
				</ul>
			</dd>
		</dl>
		<!--  <div class="menu_dropdown bk_2">
		<dl id="menu-article">
			<dt><i class="Hui-iconfont">&#xe61a;</i>主页<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a href="jsp/studentSystem/schoolWelcomePage.jsp" target="iframe" title="驾校主页">驾校主页</a></li>
					
				</ul>
			</dd>
		</dl>
		<dl id="menu-admin">
			<dt><i class="Hui-iconfont">&#xe616;</i> 系统公告<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a href="jsp/studentSystem/studentNotice.jsp" target="iframe" title="系统公告">系统公告</a></li>
					
				</ul>
			</dd>
		</dl>
		<dl id="menu-picture">
			<dt><i class="Hui-iconfont">&#xe613;</i>信箱<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a href="jsp/studentSystem/writerMessage.jsp" target="iframe" title="写信">写信</a></li>
					<li><a href="jsp/studentSystem/sendedMessage.jsp" target="iframe" title="发信箱">发信箱</a></li>
					<li><a href="jsp/studentSystem/receiveMessage.jsp" target="iframe" title="收信箱">收信箱</a></li>
				</ul>
			</dd>
		</dl>
		<dl id="menu-product">
			<dt><i class="Hui-iconfont">&#xe60d;</i> 学员信息查询<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
				    <li><a href="jsp/studentSystem/studentInfo.jsp" target="iframe" title="查看个人信息">查看个人信息</a></li>
					<li><a href="jsp/studentSystem/selectStudyHours.jsp" target="iframe" title="查看学时">查看学时</a></li>
					<li><a href="jsp/studentSystem/selectExam.jsp" target="iframe" title="查看考试">查看考试</a></li>
				</ul>
			</dd>
		</dl>
		<dl id="menu-article">
			<dt><i class="Hui-iconfont">&#xe622;</i>评价<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a href="jsp/studentSystem/appraiseCoach.jsp" target="iframe" title="评价教练">评价教练</a></li>
					<li><a href="jsp/studentSystem/appraiseSchool.jsp" target="iframe" title="评价驾校">评价驾校</a></li>
				</ul>
			</dd>
		</dl>
		<dl id="menu-member">
			<dt><i class="Hui-iconfont">&#xe62e;</i> 设置<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a href="jsp/studentSystem/updateInfo.jsp" target="iframe" title="修改信息">修改信息</a></li>
					<li><a href="jsp/studentSystem/updatePassword.jsp" target="iframe" title="修改密码">修改密码</a></li>
					<li><a href="jsp/login.jsp" title="退出登录">退出登录</a></li>
					
					
				</ul>
			</dd>
		</dl>
		
		
		
	</div>  -->
		
		
		
	</div>
</aside>
<div class="dislpayArrow hidden-xs"><a class="pngfix" href="javascript:void(0);" onClick="displaynavbar(this)"></a></div>
<!--/_menu 作为公共模版分离出去-->

<section class="Hui-article-box">
	<nav class="breadcrumb"><i class="Hui-iconfont"></i> <a href="jsp/centerMgr/centerMain.jsp" class="maincolor">首页</a> </nav>
	<div class="Hui-article" >
		<article class="cl pd-20" style="padding:0px">
			<iframe  src="jsp/centerMgr/personInfo.jsp" style="width:100%;height:100%;margin:0px" name="iframe"></iframe>
		</article>
	</div>
</section>
	<script type="text/javascript">
		
	</script>
  </body>
</html>
