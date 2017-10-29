<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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

	<link href="jsp/main/css/bootstrap.css" rel="stylesheet">
	<link href="jsp/main/css/style.css" rel="stylesheet">
	<script type="text/javascript" src="jsp/main/Script/jQuery1.7.js"></script>
	<script type="text/javascript" src="jsp/main/Script/plugin/bootstrap.min.js"></script> 
	<!---------新闻--------->
	<script type="text/javascript" src="jsp/main/Script/plugin/jquery.flexslider-min.js"></script>
	<script type="text/javascript" src="jsp/main/Script/plugin/index.js"></script>
	<style type="text/css">
	
		#title{
			
			font-size:18px;
			font-weight:900;
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
                	<li class="active"><a href="jsp/main/index.jsp">首页</a></li>
                    <li><a href="jsp/main/product_list.jsp">驾校展示</a></li>
                	<li><a href="jsp/centerMgr/centerLogin.jsp">运管登录</a></li>
                    <li><a href="jsp/examination/login.jsp">考试中心</a></li>
                    <li><a href="jsp/login.jsp">驾校相关登录</a></li>
                    <li><a href="jsp/theorySystem/login.jsp">学习平台</a></li><div class="clear"></div>
                </ul>
            </div>
            <div class="clear"></div>
        <div>
    </nav>
    <!---------------------nav  end---------------------->
    
 <div id="myCarousel" class="carousel slide"> 
 	<!-- 轮播（Carousel）指标 -->
   <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
   </ol>    
    <!-- 轮播（Carousel）项目 -->
   <div class="carousel-inner">
      <div class="item active banner01">
      		<div class="banner_p"><a href="#"><img src="images/QQ201813.png"/></a></div>
            
      </div>
      <div class="item banner02">
         <div class="banner_p"><a href="#"><img src="jsp/main/img/2.png"/></a></div>
         
      </div>
      <div class="item banner03">
         <div class="banner_p"><a href="#"><img src="jsp/main/img/3.png"/></a></div>
         
      </div>
   </div>
   <!-- 轮播（Carousel）导航 -->
   <a class="carousel-control left" href="#myCarousel" 
      data-slide="prev"></a>
   <a class="carousel-control right" href="#myCarousel" 
      data-slide="next"></a>
</div> <!-----------------轮播   end------------------->
    
    
    
<!--新闻资讯开始-->
<div class="news_information">
    <div class="center oh">
        <div class="left oh">
            <img src="jsp/main/img/news_information.png" class="fl">
            <a href="jsp/main/servepeople.jsp" id="maincontenttop_0_newsLink" class="pr c008">
              位置查询 <em></em>
            </a>            
        </div>
     <div id="maincontenttop_0_newsClass" class="right oh pcOnly">
                <ul>
                    <li>
                       <a href="jsp/main/new_list.jsp">新闻动态</a>
                    </li>
                
                    <li>
                        <a href="jsp/main/index.jsp">福州驾驶运营管理中心</a>
                    </li>
                                       
                </ul>
               <ol ed_h="1" style="height: 33px;">
                <li class="news_p_n news_p visibility_hidden">
                    <img src="jsp/main/img/index_lf_l.png" class="pa" ed_c="1" style="top: 7.5px; left: 14px;">
                </li>
                <li class="news_p_n news_n">
                    <img src="jsp/main/img/index_lf_r.png" class="pa" ed_c="1" style="top: 7.5px; left: 14.5px;">
                </li>
            </ol>

        </div>
    </div>
</div>
<!--新闻资讯结束-->

<div class="we_big mt20 mb40">
	<div class="we_content">
    	<ul>
        	<li>
            	<div class="we_img"><img src="images/QQ2134838.png"/></div>
                <div class="mt10">
                	<span>我们的故事</span>
                    <p>福建庆隆汽车驾驶员培训有限公司成立于2003年，是福建省交通运输管理局认证通过的福州最大规模一级综合类驾校之一。驾校场地建设全部严格按照公安部及福州市考训场实际场地标准建造，设有25个倒桩库、5个道路考试项目、电子教室及学员宿舍。</p>
                </div>
            </li>
            <li class="ml15 mr15">
            	<div class="we_img"><img src="jsp/main/img/5.png"/></div>
                <div class="mt10">
                	<span>我们的团队</span>
                    <p> 福建庆隆汽车驾驶员培训有限公司拥有100多部教练车，中高级教练员60余人。总校位于福州国家级森林公园旁，学员闲暇之余远眺两路风景，训练场内的教学车辆皆掩映绿树花草丛中。</p>
                </div>
            </li>
            <li>
            	<div class="we_img"><img src="jsp/main/img/4.png"/></div>
                <div class="mt10">
                	<span>我们的理念</span>
                    <p>福建庆隆汽车驾驶员培训有限公司自成立以来，坚持“勤奋务实、开拓创新”的企业精神，秉承“以人为本、技术领先、精益求精，追求完美”为立基之本。</p>
                </div>
            </li><div class="clear"></div>
        </ul>
    </div>
</div>
    <!--------------------we_big end------------------------->
    
    
     
<footer class="pt20">
	<div class="footer pb40">
    	<div class="footer_left ml50">
        	<ul>
            	<li class="qq">
                	<a href="#"><img src="jsp/main/img/qq.png"/></a>
                     <div class="qq_erweima"></div>
                </li>
                <li class="wb">
                    <a href="#"><img src="jsp/main/img/wb.png"/></a>
                    <div class="wb_erweima"</div>
                </li>
                <li class="wx">
                	<a href="#"><img src="jsp/main/img/wx.png"/></a>
                 	<div class="wx_erweima"></div>
                </li>
            </ul>
           
        </div>
        <div class="footer_right">
        	<ul>
        	<li class="footer_li">
            	<div><a href="#"><img src="jsp/main/img/foot_icon_one.png"/> | 关于我们</a></div>
            	<ul>
                	<li><a href="#">了解我们</a></li>
                    <li><a href="#">案例展示</a></li>
                    <li><a href="#">发展历程</a></li>
                    <li><a href="#">我们的观点</a></li>
                    <li><a href="#">联系我们</a></li>
                </ul>                
            </li>
            
            <li class="footer_li">
            	<div><a href="#"><img src="jsp/main/img/foot_icon_two.png"/> | 产品服务</a></div>
            	<ul>
                	<li><a href="#">试验室信息管理软件</a></li>
                    <li><a href="#">工程数据监控平台</a></li>
                    <li><a href="#">拌合站数据监控</a></li>
                    <li><a href="#">桥梁定检大师</a></li>
                    <li><a href="#">云数据服务</a></li>
                </ul>                
            </li>
            
            <li class="footer_li">
            	<div><a href="#"><img src="jsp/main/img/foot_icon_three.png"/> | 人员招聘</a></div>
            	<ul>                	
                    <li><a href="#">Winform高级软件工程师</a></li>
                    <li><a href="#">JAVA软件工程师</a></li>
                    <li><a href="#">C#软件工程师</a></li>
                    <li><a href="#">软件客服</a></li>
                    <li><a href="#">销售专员</a></li>
                </ul>                
            </li><div class="clear"></div>
            
            </ul>
        </div>
        <div class="clear"></div>
    </div>
    
    
  </body>
  
</html>
