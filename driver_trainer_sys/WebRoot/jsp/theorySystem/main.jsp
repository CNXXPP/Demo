<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<meta charset="utf-8">
	<title>首页</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
	<link rel="stylesheet" href="/driver_trainer_sys/layui/css/layui.css" media="all" />
	<link rel="stylesheet" href="/driver_trainer_sys/css/font_eolqem241z66flxr.css" media="all" />
	<link rel="stylesheet" href="/driver_trainer_sys/css/main1.css" media="all" />
	
</head>
<body class="childrenBody">
	<div class="panel_box row">
		<div class="panel col">
			<a href="javascript:;" data-url="/driver_trainer_sys/jsp/theorySystem/studyPage.jsp">
				<div class="panel_icon">
					<i class="layui-icon" data-icon="&#xe63a;">&#xe63a;</i>
				</div>
				<div class="panel_word newMessage">
				</br>
					<span >理论学习</span>
				</div>
			</a>
		</div>
		<div class="panel col">
			<a href="javascript:;" data-url="/driver_trainer_sys/jsp/theorySystem/questionExam.jsp">
				<div class="panel_icon" style="background-color:#F7B824;">
					<i class="iconfont icon-wenben" data-icon="icon-wenben"></i>
				</div>
				<div class="panel_word waitNews">
				</br>
					<span>试题练习</span>
					
				</div>
			</a>
		</div>
		<div class="panel col max_panel" >
			<a href="javascript:;" data-url="FalseQuestion.jsp">
				<div class="panel_icon" style="background-color:#2F4056;">
					<i class="iconfont icon-text" data-icon="icon-text"></i>
				</div>
				<div class="panel_word allNews">
				</br>
					<span>错题集</span>	
				</div>
			</a>
		</div>
		</div>
	
	<div class="row">
		<div class="sysNotice col">
			<blockquote class="layui-elem-quote title">学时信息：</blockquote>
			
				<img src="/driver_trainer_sys/images/5.jpg" width=100% height=200px>
				<table class="layui-table">
				<tr>
				    <td style="background:#66FF99">学习阶段</td><td style="background:#66FF99">需要总学时</td><td style="background:#66FF99">网上学时</td><td style="background:#66FF99">未完成学时</td><td style="background:#66FF99">状态</td>
				</tr>
				<tr>
				    <td>第一部分</td><td>10学时</td><td id="time1"></td><td id="time2"></td><td id="state1"></td>
				</tr>
				<tr>
				    <td>第四部分</td><td>8学时</td><td id="time3"></td><td id="time4"></td><td id="state2"></td>
				</tr>
				</table>
			
		</div>
		<div class="sysNotice col">
			<blockquote class="layui-elem-quote title">个人信息：</blockquote>
			<table class="layui-table">
				<colgroup>
					<col width="200">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<td>姓名：</td>
						<td id="td1">${Student.stuName}</td>
					</tr>
					<tr>
						<td>车型：</td>
						<td id="td2">${Student.drivingType}</td>
					</tr>
					<tr>
						<td>网络学员：</td>
						<td id="td3">是</td>
					</tr>
					<tr>
						<td>卡号：</td>
						<td id="td4">${Student.stuId}</td>
					</tr>
					<tr>
						<td>出生年月：</td>
						<td id="td5">${map.Birthday}</td>
					</tr>
					<tr>
						<td>手机号码</td>
						<td id="td6">${Student.stuPhone}</td>
					</tr>
					
				</tbody>
			</table>
			</div>
			</div>
			<div >
			<blockquote class="layui-elem-quote title">视频学习：</blockquote>
			<table class="layui-table" lay-skin="line">
					<tr>
					    <td>
					      <div class="panel col max_panel">
			                  <a href="javascript:;" data-url="/driver_trainer_sys/jsp/theorySystem/studyPage.jsp">
				              <p><b>交通警察手势</b></p>
				              <img alt="" src="/driver_trainer_sys/images/t1.png" />
					           <i class="iconfont icon-text" data-icon="&#xe63a;">&#xe63a;</i> 
			                  </a>
		                   </div>
					    </td>
					    
					    <td>
					        <div class="panel col max_panel">
			                  <a href="javascript:;" data-url="/driver_trainer_sys/jsp/theorySystem/studyPage.jsp">
				              <p><b>匝道通行</b></p>
				              <img alt="" src="/driver_trainer_sys/images/t3.png" />
					           <i class="iconfont icon-text" data-icon="&#xe63a;">&#xe63a;</i> 
			                  </a>
		                   </div>
					    </td>
					     <td>
					        <div class="panel col max_panel">
			                  <a href="javascript:;" data-url="/driver_trainer_sys/jsp/theorySystem/studyPage.jsp">
				              <p><b>泥泞路段驾驶</b></p>
				              <img alt="" src="/driver_trainer_sys/images/t4.png" />
					           <i class="iconfont icon-text" data-icon="&#xe63a;">&#xe63a;</i> 
			                  </a>
		                   </div>
					    </td>
					    <td>
					        <div class="panel col max_panel">
			                  <a href="javascript:;" data-url="/driver_trainer_sys/jsp/theorySystem/studyPage.jsp">
				              <p><b>冰雪道路驾驶</b></p>
				              <img alt="" src="/driver_trainer_sys/images/t5.png" />
					           <i class="iconfont icon-text" data-icon="&#xe63a;">&#xe63a;</i> 
			                  </a>
		                   </div>
					    </td>
					</tr>

			</table> 
		</div>
	
	<script type="text/javascript" src="/driver_trainer_sys/layui/layui.js"></script>
	<script type="text/javascript" src="/driver_trainer_sys/js/main1.js"></script>
	<script type="text/javascript" src="/driver_trainer_sys/js/jquery-2.2.1.js"></script>
    <script type="text/javascript">
        window.onload=function(){
             $.post("/driver_trainer_sys/CZX/CardTime/getCarTime",{},function(data){
                 var hour1=parseInt(data.StuCardTime.ctSub1/60);
                 var min1=parseInt(data.StuCardTime.ctSub1%60);
                 var hour4=parseInt(data.StuCardTime.ctSub4/60);
                 var min4=parseInt(data.StuCardTime.ctSub4%60);
                 $("#time1").html(hour1+"学时"+min1+"分钟");
                 $("#time3").html(hour4+"学时"+min4+"分钟");
                 var hour11=parseInt((600-data.StuCardTime.ctSub1)/60);
                 var min11=parseInt((600-data.StuCardTime.ctSub1)%60);
                 var hour44=parseInt((480-data.StuCardTime.ctSub4)/60);
                 var min44=parseInt((480-data.StuCardTime.ctSub4)%60);
                 $("#time2").html(hour11+"学时"+min11+"分钟");
                 $("#time4").html(hour44+"学时"+min44+"分钟");
                 if(hour11 == 0 && min11 == 0){
                     $("#state1").html("已完成");
                 }else{
                     $("#state1").html("未完成");
                 }
                 if(hour44 == 0 && min44 == 0){
                     $("#state2").html("已完成");
                 }else{
                     $("#state2").html("未完成");
                 }
             });
        };
        
        $(function(){
            $.post("/driver_trainer_sys/CZX/QuestionTest/checkQNo",{},function(data){
                
            });
        });
        
    </script>
	
	
</body>
</html>