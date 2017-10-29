<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<title><c:if test="${examStudent.subNo == 1}">科目一：</c:if>
				<c:if test="${examStudent.subNo == 4}">科目四：</c:if>正式考试</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript"
	src="/driver_trainer_sys/js/jquery-2.2.1.js"></script>

</head>
<style>
.button {
	background-color: #4CAF50;
	border: none;
	color: white;
	padding: 5px 20px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	cursor: pointer;
}

ul {
	width: 100%;
	list-style: none;
}

ul li {
	width: 40px;
	float: left;
	margin-right: 2px;
	margin-top: 2px;
	line-height: 30px;
	border: 1px solid black;
}
</style>
<body>
	<div>


		<div
			style="position:absolute;top:1%;left:1%;width:16%;height:17%;background-color:#E0FFFF">
			<span>
				<c:if test="${examStudent.subNo == 1}">科目一：</c:if>
				<c:if test="${examStudent.subNo == 4}">科目四：</c:if>
			</span></br>
			</br>&nbsp;&nbsp;&nbsp;<span style="font-size:23px">正式考试</span>
		</div>


		<div
			style="position:absolute;top:20%;left:1%;width:16%;height:58%;background-color:#E0FFFF">
			<span>个人信息：</span></br>
			<img src="jsp/examination/assets/img/1.jpg" alt="" width="40%" height="40%">
			</br> &nbsp;<span>考生姓名：</span><span id="name">${examStudent.stuName}</span></br>
			</br> &nbsp;<span>性别：</span><span id="sex">${examStudent.stuGender}</span></br>
			</br> &nbsp;<span>考试车型：</span><span id="card">${examStudent.drivingType}</span></br>
			</br> &nbsp;<span>申请原因：</span><span>初次申领</span>
		</div>


		<div
			style="position:absolute;top:80%;left:1%;width:16%;height:18%;background-color:#E0FFFF">
			<span>剩余时间：</span></br>
			</br>&nbsp;&nbsp;&nbsp;<span id="time"
				style="font-size:35px;color:red;font-weight:bold"></span>
		</div>


		<div
			style="position:absolute;top:1%;left:18%;width:50%;height:77%;background-color:#E0FFFF">
			<span>考试题目：</span></br>
			</br> <span id="descri"></span></br>
			</br>
			</br>
			</br>
			</br> &nbsp;<span>A:</span><span id="a"></span></br>
			</br> &nbsp;<span>B:</span><span id="b"></span></br>
			</br> &nbsp;<span>C:</span><span id="c"></span></br>
			</br> &nbsp;<span>D:</span><span id="d"></span>
			<div
				style="position:absolute;top:85%;left:0;width:100%;height:15%;background-color:#E0FFFF">
				</br>&nbsp;<span>你选择的答案：</span><span id="answer"></span>
				<div
					style="position:absolute;top:22%;right:0;width:60%;height:70%;background-color:#E0FFFF">
					<span>请选择：</span> <input type="button" class="button" value="A"
						onclick="answer('A')"> <input type="button" class="button"
						value="B" onclick="answer('B')"> <input type="button"
						class="button" value="C" onclick="answer('C')"> <input
						type="button" class="button" value="D" onclick="answer('D')"></br>
					</br>
				</div>

			</div>
		</div>


		<div
			style="position:absolute;top:80%;left:18%;width:50%;height:18%;background-color:#E0FFFF">
			<span>提示信息：</span></br>
			</br> <span>选择你认为正确的答案！</span>
			<div
				style="position:absolute;top:8%;right:0;width:35%;height:92%;background-color:#E0FFFF">
				<input type="button" class="button" value="上一题"
					onclick="lastQuestion()"> <input type="button"
					class="button" value="下一题" onclick="nextQuestion()"></br>
				</br>&nbsp;&nbsp;&nbsp; <input type="button" class="button" value="交卷"
					onclick="finishExam()">
			</div>
		</div>


		<div
			style="position:absolute;top:1%;left:69%;width:30%;height:97%;background-color:#E0FFFF">
			<ul>
				<c:forEach items="${questionList.data }" var="i" varStatus="status">
					<li id="${status.index}" name="" style="background-color:white"
						onclick="aa(this)">&nbsp;&nbsp;&nbsp;${status.index }</li>
				</c:forEach>



			</ul>
		</div>
		<input class="hid" type="hidden" value="aaaa,bbbb,cccc">
	</div>
	<script type="text/javascript">
		var startTime = new Date().getTime();
		var t;//定时器
		$(function() {
			var i = 0;
			var data = '${questionList.data}';

			var obj = JSON.parse(data);

			console.log(obj[i].desc);
			$("#descri").text(i+"、"+obj[i].desc);
			$("#a").text(obj[i].a);
			$("#b").text(obj[i].b);
			$("#c").text(obj[i].c);
			$("#d").text(obj[i].d);
			$.post("xp/examination/callCamera",{},function(msg){
				alert("考试开始");
			});

		});
		var i = 0;
		var data = '${questionList.data}';

		var obj = JSON.parse(data);

		function aa(a) {
			var id = $(a).attr("id");
			i = id;
			$("#descri").text(i+"、"+obj[i].desc);
			$("#a").text(obj[i].a);
			$("#b").text(obj[i].b);
			$("#c").text(obj[i].c);
			$("#d").text(obj[i].d);
			var ans = $(a).attr("name");
			
			$("#answer").text(ans);
		}
		
		function answer(ans) {
			$("#"+i).css("background-color","#00FF00");
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
			if(i ==  obj.length - 1){
				alert("已经是最后一题");
				return false;
			}
			i++;
		
			$("#descri").text(i+"、"+obj[i].desc);
			$("#a").text(obj[i].a);
			$("#b").text(obj[i].b);
			$("#c").text(obj[i].c);
			$("#d").text(obj[i].d);
			var ans = $("#"+i).attr("name");
			
			$("#answer").text(ans);
		}
		function lastQuestion() {
			if(i ==  0){
				alert("已经是第一题");
				return false;
			}
			i--;
			$("#descri").text(i+"、"+obj[i].desc);
			$("#a").text(obj[i].a);
			$("#b").text(obj[i].b);
			$("#c").text(obj[i].c);
			$("#d").text(obj[i].d);
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
		    console.log("reTime"+reTime);
		    var min=Math.floor(reTime/60)%60;
			    if(min<10){
			    min="0"+min;
			 }
			    console.log("min"+min);
			var sec=(reTime%60)%60;
			    if(sec<10){
				sec="0"+sec;
				}
			    console.log("sec"+sec);		
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
