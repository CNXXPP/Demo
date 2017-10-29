<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>新闻直播</title>
    
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
	<script>
	if (!(/msie [6|7|8|9]/i.test(navigator.userAgent))){
		new WOW().init();
	};
	</script>


	<style type="text/css">
	
		#title{
			
			font-size:18px;
			font-weight:900;
		}
	
	</style>


  </head>
  
  <body>
    
    
    
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
    
    
    <div class="news_banner_big zoomIn wow" data-wow-duration="1s">
    	<img src="jsp/main/img/1.png">
    </div>
    <!-------------------news_banner_big end-------------------------->
   
    
    
 <!---------------news_contact_big  begin----------------------------->
 
 	<div class="news_contact_big mb40 mt40">

           <div class="news_img mb40">
           			<ul>
                    	<li>
                        	<div class="news_li_img"><img src="jsp/main/img/news_one.png"/></div>
                            <div class="news_p"><p><span>02-01</span>重要通告！！！【置顶】</p></div>
                        </li>
                        <li>
                        	<div class="news_li_img"><img src="jsp/main/img/news_two.png"/></div>
                            <div class="news_p"><p><span>06-12</span>目前甘肃省共有驾校400所 53万人正在排队考</p></div>
                        </li>
                        <li class="news_last_child">
                        	<div class="news_li_img"><img src="jsp/main/img/news_three.jpg"/></div>
                            <div class="news_p"><p><span>05-30</span> 南阳市驾校建设模拟实景 有"高速""山路""隧道" </p></div>
                        </li><div class="clear"></div>
                    </ul>
           	
           </div>

  
    	<div class="news_contact">
        	<ul>
            	<li>
                	<p><a href="#">云南省全年可培训100余万人 今年学车不再难</a><span>2016-5-30</span></p>
                </li>
                <li>
                	<p><a href="#">考驾照拿满分，推荐驾校一点通vip仿真版</a><span>2016-5-30</span></p>
                </li>
                <li>
                	<p><a href="#">学员先南昌推学车后付费 教练不好可随时换</a><span>2016-5-30</span></p>
                </li>
                <li>
                	<p><a href="#">太原驾考路考模拟考试将能网上预约 </a><span>2016-5-30</span></p>
                </li>
                <li>
                	<p><a href="#">东莞驾考科目三将电子评判</a><span>2016-5-30</span></p>
                </li>
                <li>
                	<p><a href="#">德州市驾校级别评定出炉 44家驾校重“排辈”</a><span>2016-5-30</span></p>
                </li>
                <li>
                	<p><a href="#">学车便宜了！沪驾校额度放宽学费下调500至1500元</a><span>2016-5-30</span></p>
                </li>
                <li>
                	<p><a href="#">东莞驾校迎来高考生学车高潮 </a><span>2016-5-30</span></p>
                </li>
                <li>
                	<p><a href="#">常州运管出台驾校“奖优罚劣”考核方案</a><span>2016-5-30</span></p>
                </li>
                <div class="clear"></div>
            </ul>
        </div><!-------------------------->
        
        <div class="page mt40">
            <ul>
                <li><a href="#">上一页</a></li>
                <li class="page_first"><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li class="page_last"><a href="#">下一页</a></li><div class="clear"></div>
            </ul>
        </div>
        <div class="clear"></div>        
    </div>           <!----------------news_contact_big end----------------------------->
 

    
<footer class="pt20">
	<div class="footer pb50">
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
