<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>地图展示</title>
    
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="jsp/main/css/animate.css" rel="stylesheet">
	<link href="jsp/main/css/style.css" rel="stylesheet">
	<script src="jsp/main/Script/wow.min.js" type="text/javascript"></script>
     
    <!--百度密匙--> 
    <script type="text/javascript" src="/WEB-INF/lib/BaiduLBS_Android.jar"></script>
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js "></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js "></script>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=CBN2KpejVPS3utFcSGpId5x2CsMtoAOh"></script>
  
	<script>
	if (!(/msie [6|7|8|9]/i.test(navigator.userAgent))){
		new WOW().init();
	};
	</script>


	<style type="text/css">
	#title {
		font-size: 18px;
		font-weight: 900;
	}
	
	#baiduMap {
		width: 100%;
		height: 70%;
		overflow: hidden;
		margin: 0;
		font-family: "微软雅黑";
	}
	</style>


</head>
  
  <body>
    
    
    
    <!-------------nav begin--------------------->
	<nav>
    	<div class="top_big">
            <div class="top_left">
                <a href="#"><img src="jsp/main/img/logo.png"></a>
            	<div class="logo_zi">
                   <p id = "title">福州驾驶运营管理中心<p> 
                </div>
                <div class="clear"></div>  
            </div>
            <div class="top_right">
             	<ul>
                	<li><a href="jsp/main/index.jsp">首页</a></li>
                    <li><a href="jsp/main/product_list.jsp">驾校展示</a></li>

                    <li class="active"><a href="jsp/main/new_list.jsp">新闻资讯</a></li>

                	<li><a href="jsp/centerMgr/centerLogin.jsp">运管登录</a></li>
                    <li><a href="jsp/examination/login.jsp">正式考试</a></li>
                    <li><a href="jsp/login.jsp">驾校相关登录</a></li>
                    <li><a href="jsp/theorySystem/login.jsp">学习平台</a></li><div class="clear"></div>
                </ul>
            </div>
            <div class="clear"></div>
        <div>
    </nav>
    <!---------------------nav  end---------------------->
    
    <div class="product_banner" >
    	<h1 class="bounceIn wow" data-wow-duration="1s">提供稳定高效的便民服务</h1>
<!--         <a href="#" class="bounceIn wow" data-wow-duration="1s">立即前往</a> -->
    </div>
    
    <!----------------------baiduMap start ----------------------------------------->


       <div class="product_big mt30 pb50">
    	<div class="product_content">
        	<div class="product_soft">            	
                <div class="product_right  fadeInLeft wow" data-wow-delay="0.8s"  style="margin-left:inherit; margin-right:160px;">
                	<h2>福州市地图</h2>
                    <p>系统包含质量检测管理监控信息平台、人员考勤系统、质量信息数据终端管理软件(TAM、QIE)、压力机和万能试验机数据采集与监控系统、试验室视频监控系统、张拉压机系统 。 系统包含质量检测管理监控信息平台、人员考勤系统、质量信息数据终端管理软件(TAM、QIE)、压力机和万能试验机数据采集与监控系统、试验室视频监控系统、张拉压机系统、混凝土拌合站动态数据</p>
                    <a href="#">查看更多</a>
                </div>
                
                <div class="product_left   wow fadeInRight" data-wow-delay="1.0s">
                	<div id="baiduMap"></div>
                </div>
                <div class="clear"></div>
            </div>          
        </div>
    </div>

      <script type="text/javascript">
      var map = new BMap.Map("baiduMap");  //创建Map实例
      var point = new BMap.Point(114.419915,30.513719);  //创建Point位置实例
      map.centerAndZoom("福州", 19);  //设置地图中心点及缩放级别
      map.addControl(new BMap.MapTypeControl());  //添加地图类型控件
      var marker = new BMap.Marker(point);  //创建一个Marker点
      map.addOverlay(marker);  //将Marker点覆盖到地图上
      marker.setAnimation(BMAP_ANIMATION_BOUNCE);  //使Marker点跳动起来
      map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放
 
      </script>
    
    
  </body>
</html>
