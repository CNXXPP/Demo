<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'examPage.jsp' starting page</title>
    <link href="//cdn.staticfile.org/twitter-bootstrap/3.0.1/css/bootstrap.min.css" rel="stylesheet">
	
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	

	

	<script type="text/javascript" src="//cdn.staticfile.org/jquery/2.0.0/jquery.min.js"></script>
	<script type="text/javascript" src="//cdn.staticfile.org/jqueryui/1.10.2/jquery-ui.min.js"></script>
	<script type="text/javascript" src="//cdn.staticfile.org/jqueryui-touch-punch/0.2.2/jquery.ui.touch-punch.min.js"></script>
	<script type="text/javascript" src="//cdn.staticfile.org/twitter-bootstrap/3.0.1/js/bootstrap.min.js"></script>
<style type="text/css">
 td{
 	
 	text-align: center;
 	height：20px;
 	width: 20px;
 
 }
 a{
 	display:block;height:100%;width:100%;
 }
</style>
	
  </head>
  
  <body>
    <div class="container" style="width: 85%">
	<div class="row clearfix">
		<div class="col-md-12 column" style="text-align: center">
			<h2>
			机动车驾驶员网上理论考试平台
				
			</h3>
			<br><br><br><br>
		</div>
	</div>
	<div class="row clearfix">
		<div class="col-md-3 column">
		<img src="jsp/examination/assets/img/1.jpg" alt="" width="60%" height="30%">
			
			<h4>正式考试&nbsp;:&nbsp;<c:if test="${examStudent.subNo == 1}">科目一</c:if>
				<c:if test="${examStudent.subNo == 4}">科目四</c:if></h4>
				
			<h4>考生姓名：${examStudent.stuName}</h4>
			<h4>性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：${examStudent.stuGender}</h4>
			<h4>考试车型：${examStudent.drivingType}</h4>
			<h4>申请原因：初次申领</h4>
			<h4>剩余时间：</h4></br>
			</br>&nbsp;&nbsp;&nbsp;<span id="time"
				style="font-size:35px;color:red;font-weight:bold"></span>
				<br>
				<button class="btn btn-danger btn-lg" type="button" onclick="finishExam()">交卷</button>
		</div>
		<div class="col-md-5 column">
			<p id="descri" style="font-size: 200%">
				
			</p>
			
			
			
			</br> &nbsp;<label style="font-size: 150%">A:</label><span id="a" style="font-size: 150%"></span></br>
			</br> &nbsp;<label style="font-size: 150%">B:</label><span id="b" style="font-size: 150%"></span></br>
			</br> &nbsp;<label style="font-size: 150%">C:</label><span id="c" style="font-size: 150%"></span></br>
			</br> &nbsp;<label style="font-size: 150%">D:</label><span id="d" style="font-size: 150%"></span>	</br></br>
			<h3>你选择的答案：</span><span id="answer"></h3></span></br></br>
				<div class="btn-group">
					<button class="btn btn-default btn-lg" type="button" onclick="answer('A')">A</button>
					<button class="btn btn-default btn-lg" type="button" onclick="answer('B')">B</button>
					<button class="btn btn-default btn-lg" type="button" onclick="answer('C')">C</button>
					<button class="btn btn-default btn-lg" type="button" onclick="answer('D')">D</button>
				</div>
				<br>
				<br><div style="width:50%"><p>&nbsp;</p></a></div>
				<button type="button" class="btn btn-default btn-lg btn-success" onclick="lastQuestion()">上一题</button>
				<button type="button" class="btn btn-default btn-lg btn-success" onclick="nextQuestion()">下一题</button>
			</div>
		<div class="col-md-4 column">
		<h3>试题导航</h3>
			<table class="table table-bordered">
			<tr>
				<c:forEach items="${questionList.data }" var="i" varStatus="status">
					<%-- <li id="${status.index}" name="" style="background-color:white"
						onclick="aa(this)">&nbsp;&nbsp;&nbsp;${status.index }</li> --%>
						<c:if test="${status.index%5  == 0 && status.index != 0}"><tr></c:if>
						<td style="background-color:white"><a id="${status.index + 1}" name="" onclick="aa(this)">${status.index + 1}</a></td>
						
				</c:forEach>
			</tr>
			</table>
<!-- 			<div class="progress"> -->
<!-- 				<div class="progress-bar progress-success" style="width: 50%;"> -->
<!-- 				答题进度 -->
<!-- 				</div> -->
<!-- 			</div> -->
		</div>
	</div>
</div>
<script type="text/javascript">
		var startTime = new Date().getTime();
		var t;//定时器
		$(function() {
			var i = 0;
			var data = '${questionList.data}';
			
			var obj = JSON.parse(data);
			
			$("#descri").text((i+1)+"、"+obj[i].desc);
			$("#a").text(obj[i].a);
			$("#b").text(obj[i].b);
			$("#c").text(obj[i].c);
			$("#d").text(obj[i].d);
			$.post("xp/examination/callCamera",{},function(msg){
				alert("考试开始");
			});

		});
		var i = 1;
		var data = '${questionList.data}';

		var obj = JSON.parse(data);
		
		function aa(a) {
			var id = $(a).attr("id");
			i = parseInt(id);
			var n = parseInt(i) - 1;
			$("#descri").text((i) + "、"+obj[n].desc);
			$("#a").text(obj[n].a);
			$("#b").text(obj[n].b);
			$("#c").text(obj[n].c);
			$("#d").text(obj[n].d);
			var ans = $(a).attr("name");
			
			$("#answer").text(ans);
		}
		
		function answer(ans) {
			$("#"+i).parent().css("background-color","#00FF00");
			//     	alert(ans+$("#"+i));
			$("#" + i).attr("name", ans);
			//     	alert($("#"+i).attr("name"));
// 			i++;
// 			$("#descri").text(i+"、"+obj[i].desc);
// 			$("#a").text(obj[i].a);
// 			$("#b").text(obj[i].b);
// 			$("#c").text(obj[i].c);
// 			$("#d").text(obj[i].d);
			
			var ans = $("#"+i).attr("name");
			
			$("#answer").text(ans);
			
		}
		function nextQuestion() {
			if(i ==  obj.length ){
				alert("已经是最后一题");
				return false;
			}
			i++;
		
			$("#descri").text((i)+"、"+obj[i-1].desc);
			$("#a").text(obj[i-1].a);
			$("#b").text(obj[i-1].b);
			$("#c").text(obj[i-1].c);
			$("#d").text(obj[i-1].d);
			var ans = $("#"+i).attr("name");
			
			$("#answer").text(ans);
		}
		function lastQuestion() {
			if(i ==  1){
				alert("已经是第一题");
				return false;
			}
			i--;
			$("#descri").text((i)+"、"+obj[i-1].desc);
			$("#a").text(obj[i-1].a);
			$("#b").text(obj[i-1].b);
			$("#c").text(obj[i-1].c);
			$("#d").text(obj[i-1].d);
			var ans = $("#"+i).attr("name");
			
			$("#answer").text(ans);
		}
		function finishExam(){
			clearInterval(t); //停止定时器
			//计算分数
			var finishTime = new Date().getTime();
			var score = 0;
			for(var k = 0;k < obj.length;k++){
				
				if(obj[k].correct == $("#"+k).attr("name")){
					score++;
					
				}
			}
			//提交分数
			
			var curSub = "";
			if('${examStudent.subNo}' == '1'){
				curSub = "科目一";
			}else if('${examStudent.subNo}' == '4'){
				curSub = "科目四";
			}
			
			$.post("xp/examination/calcScore",{
				"scScore":score,
				"curSub":curSub,
				"startTime":startTime,
				"endTime":finishTime
				},function(msg){
				 var display;
				 if(msg.result == '-1'){
					 display = "违反考试规定，该场考试成绩无效！！！";
				 }else{
					 display = "考试结束！你的考试成绩为"+msg.result;
				 }
				 
				 alert(display);
				 location = "jsp/main/index.jsp";
			});
		}
		
		   //倒计时的方法
		   function lastTime(){     
				if(reTime>0){
				reTime-=1;
				}
		
		    var min=Math.floor(reTime/60)%60;
			    if(min<10){
			    min="0"+min;
			 }
			   
			var sec=(reTime%60)%60;
			    if(sec<10){
				sec="0"+sec;
				}
			  	
		    $("#time").prop("innerHTML",min+":"+sec);
			if(reTime == 0){
				clearInterval(t);
				finishExam(); //交卷
			}
			
		}

		    //计时器
		    window.onload=function(){
		           
 		           reTime=45*60;
		     	
		 	       var min=Math.floor(reTime/60)%60;
			       if(min<10){
			           min="0"+min;
			        }
			       var sec=(reTime%60)%60;
			       if(sec<10){
				      sec="0"+sec;
				    }
					
		    $("#time").prop("innerHTML",min+":"+sec); 
		    
		    
		    t = setInterval("lastTime()", "1000");     

		    }
		
	</script>
  </body>
</html>
