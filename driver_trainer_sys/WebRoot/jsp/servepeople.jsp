<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>便民服务</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

   <link rel="stylesheet" href="css/default.min.css?t=227" />
	<!--[if (gte IE 9)|!(IE)]><!-->
	<script type="text/javascript" src="lib/jquery/jquery.min.js"></script>
	<!--<![endif]-->
	<!--[if lte IE 8 ]>
	<script src="http://libs.baidu.com/jquery/1.11.3/jquery.min.js"></script>
	<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
	<script src="lib/amazeui/amazeui.ie8polyfill.min.js"></script>
	<![endif]-->
	<script type="text/javascript" src="lib/handlebars/handlebars.min.js"></script>
	<script type="text/javascript" src="lib/iscroll/iscroll-probe.js"></script>
	<script type="text/javascript" src="lib/amazeui/amazeui.min.js"></script>
	<script type="text/javascript" src="lib/raty/jquery.raty.js"></script>
	<script type="text/javascript" src="js/main.min.js?t=1"></script>
    <script type="text/javascript" src="js/jquery-2.2.1.js"></script>

  </head>
  
  <body>
    
    
        ﻿<header class="hd">
    <div class="cml-g">
        <div class="hd-left">
            <div class="hd-logo">
                <a href="#">
                    <img src="images/logo.png" />
                </a>
            </div>
            <div class="hd-company">
                <strong>福州驾驶运营管理中心</strong>
            </div>   
        </div>
        <div class="hd-right">
            <a href="jsp/login.jsps">登录</a><i class="font">&#xe62b;</i><a href="#">注册</a>
        </div>
    </div>
</header>

<div class="hd-nav">
    <button class="am-show-sm-only am-collapsed" data-am-collapse="{target: '.hd-navul'}">&#xe68b;</button>
    <nav>
        <ul class="hd-navul am-collapse" style="height: 0px;">
            <li class="on"><a href="index.html">首页</a></li>
            <li><a href="about.html">关于我们</a></li>
            <li><a href="new_list.html">新闻资讯</a></li>
            <li><a href="product_list.html">产品展示</a></li>
            <li><a href="jsp/servepeople.jsp">便民服务</a>
            <li><a href="jsp/login.jsp">联系我们</a>
        </ul>
    </nav>
</div>


    <div class="am-cf"></div>
    <div class="cm-bannre">
        <img src="images/QQ201813.png"/>
    </div>

    <div class="cm-mian">
        <div class="cml-g">
            <div class="am-u-sm-3 am-u-md-3 am-u-lg-3">
                <div class="cm-type">
                    <ul>
                        <li class="on"><a href="#">关于我们</a></li>
                        <li><a href="#">文化理念</a></li>
                        <li><a href="#">招聘岗位</a></li>
                        <li><a  onclick="weizhangwang()">招聘流程</a></li>
                        <li><a href="http://www.weizhangwang.com/" id="weizhangwang()">交通违章查询</a></li>
                    </ul>
                </div>
            </div>
            <div class="am-u-sm-9 am-u-md-9 am-u-lg-9">
                   <div class="cm-article">
                       <div class="cm-title">
                           <div class="cm-title-nav">当前位置：<span><a href="#">网站首页</a></span>><span><a href="#">加入中正</a></span>><span>文化理念</span></div>
                       </div>
                       <div class="cm-content">
                           价值观
                           中正公司秉承“创新为魂 和谐为本”的核心理念，不懈追逐建设具有全球地位、受人尊敬的伟大公司的愿景目标。

                           企业文化
                           更高、更快、更强
                           更高 我们追求更高，意味着企业文化价值更高!
                           更快 我们追求更快，意味着企业发展速度更快!
                           更强 追求更强，意味着企业经济实力更强

                           企业管理
                           质量至上，环境优美，安全健康，持续改进。

                           经营理念
                           诚信构建双赢，品牌创造价值，服务赢得市场。

                           质量目标
                           中国农化行业品质**者
                       </div>
                   </div>
            </div>
        </div>
    </div>


    ﻿<footer class="footer">
    <div class="cml-g">
        <h1>
          <a href="#">法律申明</a>
          <a href="#">隐私安全</a>
          <a href="#">网站地图</a>
          <a href="#">联系我们</a>
        </h1>
        <h2>
            <span>版权所有 1999-2017</span>
            <span>某某集团有限公司</span>
            <span>鄂ICP备1300121000558</span>
        </h2>
        <h3>
            <span>地址:湖北省XX市XX街道XX路XX号</span>
            <span>邮编:4335100</span>
            <span>电话:0714-12345678</span>
        </h3>
<h3>
    </div>
</footer>
      <script type="text/javascript">
      
        function weizhangwang(){
        
           $(".cm-content").hide();
        
        
        };  
      
      
      
      </script>
   

  </body>
</html>
