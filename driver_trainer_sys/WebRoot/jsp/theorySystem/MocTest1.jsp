<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'MocTest.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="/driver_trainer_sys/js/jquery-2.2.1.js"></script>
	<script type="text/javascript" src="/driver_trainer_sys/js/jquery-ui.js"></script>
	<link rel="stylesheet" href="/driver_trainer_sys/css/jquery-ui.css">

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
ul{width:100%;list-style:none;}
ul li{width:40px;float:left;margin-right:2px;margin-top:2px;line-height:30px;border:1px solid black;}
  </style>
  <body >
  <div>
    
    
    <div style="position:absolute;top:1%;left:1%;width:16%;height:17%;background-color:#E0FFFF">
        <span>科目四考场：</span></br></br>&nbsp;&nbsp;&nbsp;<span style="font-size:23px">模拟考场</span>
    </div>
   
   
    <div style="position:absolute;top:20%;left:1%;width:16%;height:58%;background-color:#E0FFFF">
        <span>个人信息：</span></br></br></br></br></br></br></br></br>
        &nbsp;<span>考生姓名：</span><span id="name">${Student.stuName}</span></br></br>
        &nbsp;<span>性&nbsp;&nbsp;别：</span><span id="sex">${Student.stuGender}</span></br></br>
        &nbsp;<span>考试车型：</span><span id="card">${Student.drivingType}</span></br></br>
        &nbsp;<span>申请原因：</span><span>初次申领</span>
    </div>
    
    
    <div style="position:absolute;top:80%;left:1%;width:16%;height:18%;background-color:#E0FFFF">
        <span>剩余时间：</span></br></br>&nbsp;&nbsp;&nbsp;<span id="time" style="font-size:35px;color:red;font-weight:bold"></span>
    </div>
    
    
    <div style="position:absolute;top:1%;left:18%;width:50%;height:77%;background-color:#E0FFFF">
        <span>考试题目：</span></br></br>
        <span id="descri"></span></br></br></br></br></br>
        &nbsp;<span>A:</span><span id="pg1"></span></br></br>
        &nbsp;<span>B:</span><span id="pg2"></span></br></br>
        &nbsp;<span>C:</span><span id="pg3"></span></br></br>
        &nbsp;<span>D:</span><span id="pg4"></span>
        <div style="position:absolute;top:85%;left:0;width:100%;height:15%;background-color:#E0FFFF">
            </br>&nbsp;<span>你选择的答案：</span><span id="answer"></span>
         <div id="abcd" style="position:absolute;top:22%;right:0;width:60%;height:70%;background-color:#E0FFFF">
            <span>请选择：</span>
            <input type="button" class="button" value="A" onclick="aaa(this)">
            <input type="button" class="button" value="B" onclick="aaa(this)">
            <input type="button" class="button" value="C" onclick="aaa(this)">
            <input type="button" class="button" value="D" onclick="aaa(this)"></br></br>
        </div>
            
        </div>
    </div>
   
   
    <div style="position:absolute;top:80%;left:18%;width:50%;height:18%;background-color:#E0FFFF">
        <span>提示信息：</span></br></br>
        <span id="tishi">选择你认为正确的答案！</span>
        <div id="wode" style="position:absolute;top:8%;right:0;width:35%;height:92%;background-color:#E0FFFF">
            <input type="button" class="button" value="上一题" onclick="up()">
            <input type="button" class="button" value="下一题" onclick="next()"></br></br>&nbsp;&nbsp;&nbsp;
            <input type="button" class="button" value="交卷" onclick="commit()">
        </div>
    </div>
   
   
    <div style="position:absolute;top:1%;left:69%;width:30%;height:97%;background-color:#E0FFFF">
        <ul id="ull">
            
        </ul>
    </div>
    <input class="hid" type="hidden" value="aaaa,bbbb,cccc">
    <div id="dialog" title="你确认要提交试卷？">
	   <p style="color:red;font-size: 13pt; font-weight:bold;">1、点击【确认交卷】将提交考试，考试结束！<br/>2、点击【继续考试】将关闭本窗口，考试继续！</p>
    </div>
    <div id="Dialog" title="考试结果">
	   <p id="dia" style="color:red;font-size: 13pt; font-weight:bold;"></p>
    </div>
   </div> 
  <script type="text/javascript">
     
         // 循环遍历随机数数组 
        /* for(var v = 0 ; v < arr.length; v++){ 
             lang+=arr[v]+",";
         } 
         $(".hid").val(lang); */

      var nno =1;
      var last =1;
      
      //导航功能，获取试题
      function aa(obj){
           var id = $(obj).attr("id");
           var no = $(obj).attr("value");
           var answer = $("#ull").find('li').eq((last-1)).attr("answer");
           var lastanswer = $("#ull").find('li').eq(last-1).find('i').text();
           
           
           $("#tishi").text("选择你认为正确的答案！");
           if(lastanswer!=null&&lastanswer!=""){           
               if(answer == lastanswer){
                   $("#ull").find('li').eq((last-1)).css("background-color","#90EE90");           
               }else if(lastanswer!=answer){
                   $("#ull").find('li').eq((last-1)).css("background-color","#DC143C");
               }
           }else {
               $("#ull").find('li').eq((last-1)).css("background-color","");
           }
           

           $("#answer").html("");
           $.post("/driver_trainer_sys/CZX/QuestionTest/nextQuestion",{"qno":id,"subject":"科目四"},function(data){
               $("#descri").html("["+no+"]"+data.question.qDescription);
               $("#pg1").html(data.question.qAnswerA);
               $("#pg2").html(data.question.qAnswerB);
               $("#pg3").html(data.question.qAnswerC);
               $("#pg4").html(data.question.qAnswerD);
               $("#ull").find('li').eq((no-1)).attr("answer"," "+data.question.qAnswerCorrect);
           });
           nno=no;
            $("#ull").find('li').eq((nno-1)).css("background-color","#ADD8E6");
           if($("#ull").find('li').eq((nno-1)).find('i').text()!=""){
               $("#answer").html($("#ull").find('li').eq((nno-1)).find('i').text());  
               $("#abcd").hide();               
               if($("#ull").find('li').eq((nno-1)).attr("answer")==$("#ull").find('li').eq((nno-1)).find('i').text()){
                   $("#tishi").text("恭喜你答对了！");
               }else{
                   $("#tishi").text("很遗憾你答错了，正确答案为："+$("#ull").find('li').eq((nno-1)).attr("answer"));
               }
           }else {
                
               $("#abcd").show();
           }
           last=no;           
         }
         
     var score=0;
     var arr = new Array();
     var xiabiao=0;
     //交卷的方法
     function confirm(){
         for(var i=0;i<50 ;i++){
             if($("#ull").find('li').eq((i)).find('i').text()==""||$("#ull").find('li').eq((i)).find('i').text()==null||$("#ull").find('li').eq(i).attr("answer")!=$("#ull").find('li').eq(i).find('i').text()){
                 arr[xiabiao] = $("#ull").find('li').eq(i).attr("id");
                 xiabiao= xiabiao+1;
             }else if($("#ull").find('li').eq(i).attr("answer")==$("#ull").find('li').eq(i).find('i').text()){
                 score++;
             }
         }
         
         $.post("/driver_trainer_sys/CZX/mocExam/intsertScore",{"subject":"科目一","score":score},function(){

         });
        
        /* var lang="";
         for(var v = 0 ; v <arr.length; v++){ 
             lang+=arr[v]+",";
         } 
         $(".hid").val(lang);
         alert($(".hid").val()); */
        
        
         for(var p = 0; p<arr.length; p++){
         $.post("/driver_trainer_sys/CZX/falseQustion/insertFalse",{"qno":arr[p]},function(){
              
         });
         }
         
         $("#dia").html("考试成绩：" + score + "分</br>1、点击【确定】关闭窗口</br>2、点击【重考】按钮在次模拟考试！");
         $( "#Dialog" ).dialog( "open" );
	        
         $("#abcd").hide();
         $("#wode").hide();
         window.clearInterval(timer);
     }
     
     
     //点击交卷 
     function commit(){
     $( "#dialog" ).dialog( "open" );
	  event.preventDefault();

     }
     
     //下一题的方法
     function next(){
            if(nno==50){
                alert("本题已经是最后一题！");
            }else{
            $("#ull").find('li').eq(nno).click();
            
            }
     }
     
     //上一题的方法
     function up(){
         if(nno==1){
                alert("本题已经是第一题！");
            }else{
            $("#ull").find('li').eq((nno-2)).click();
            }
     }
     
     //答案选择
     function aaa(obj){
         
         $("#ull").find('li').eq((nno-1)).find('i').html(" "+$(obj).val());
         $("#answer").html($(obj).val());
         
     }
     
     
     //交卷弹窗1
     $( "#dialog" ).dialog({
	     autoOpen: false,
	     width: 400,
	     buttons: [
		   {
			    text: "确认交卷",
			    click: function() {
			    $( this ).dialog( "close" );
			      confirm();
				  
			   }
		 },
		 {
			text: "继续考试",
			click: function() {
				$( this ).dialog( "close" );
			}
		}
	]
});
     //交卷弹窗2
     $( "#Dialog" ).dialog({
	     autoOpen: false,
	     width: 400,
	     buttons: [
		  {
			text: "重考",
			click: function() {
				$( this ).dialog( "close" );
				location.reload();
			}
		},
			    
		 {
			text: "确认",
			click: function() {
				$( this ).dialog( "close" );
			}
		}
	]
});
  	  
  	  
  	  
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

}
 
   var timer;
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
    
    
        timer=setInterval("lastTime()", "1000");     
         // 定义存放生成随机数的数组 
         var arr = new Array(); 
         var lang = "";
         var wawa = "";
         var rand;
         //生成不重复 随机数
         for(var q = 0; q < 50; q++){
             rand = Math.floor(108+Math.random() * 96) ;
             for(var a = 0 ; a < arr.length; a++){
                 if(arr[a] == rand){ 
                    break; 
                  }
             }
             arr[q]=rand;
         }
         
         $.post("/driver_trainer_sys/CZX/QuestionTest/nextQuestion",{"qno":arr[0],"subject":"科目四"},function(data){
               $("#descri").html("[1]"+data.question.qDescription);
               $("#pg1").html(data.question.qAnswerA);
               $("#pg2").html(data.question.qAnswerB);
               $("#pg3").html(data.question.qAnswerC);
               $("#pg4").html(data.question.qAnswerD);
               $("#ull").find('li').eq((0)).attr("answer",data.question.qAnswerCorrect);
                $("#ull").find('li').eq(0).css("background-color","#ADD8E6"); 
           });
           
         
         //li里存放随机数
        for(var i = 0 ; i < arr.length; i++){ 
             wawa+="<li id="+arr[i]+" value='"+(i+1)+"' onclick='aa(this)' answer=''><b>"+(i+1)+"</b><i></i></li>";
         } 
         $("#ull").append(wawa);	
         
                        }; 
                      
    
  </script>
  </body>  
</html>