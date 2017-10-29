<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'FirstQuestion.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="/driver_trainer_sys/js/jquery-2.2.1.js"></script>

  </head>
  <style>
  .button {
    background-color: #4CAF50;
    border: none;
    color: white;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
}
  </style>
  <body>
  
    <div style="position:absolute;top:0px;left:0px;width:100%;height:150px;">
        <div style="position:absolute;left:40px;top:5px">
            <span id="qq" style="font-size:23px"></span>    <span id="pg0" style="font-size:23px"></span>
        </div>
    </div>
    <div style="position:absolute;top:150px;left:0px;width:50%;height:300px;">
        <div style="position:absolute;left:40px">
            <span style="font-size:21px">A.</span>   <span id="pg1" style="font-size:21px"></span></br>
            <span style="font-size:21px">B.</span>   <span id="pg2" style="font-size:21px"></span></br>
            <span style="font-size:21px">C.</span>   <span id="pg3" style="font-size:21px"></span></br>
            <span style="font-size:21px">D.</span>   <span id="pg4" style="font-size:21px"></span></br>
        </div>
    </div>
    <div style="position:absolute;top:60px;left:50%;width:50%;height:300px;"">
        <div style="position:absolute;top:150px;">
            <input type="button" class="button" value="查看答案" onclick="check()"> <span id="pg5" style="font-size:21px;display:none" ></span>  
            &nbsp;&nbsp;&nbsp;&nbsp;<span>你的答案：</span><span id="wawa"></span></br></br></br>
            <input type="button" class="button" value="A" onclick="tt1()">
            <input type="button" class="button" value="B" onclick="tt2()">
            <input type="button" class="button" value="C" onclick="tt3()">
            <input type="button" class="button" value="D" onclick="tt4()"></br></br>
            <input type="button" class="button" value="上一题" onclick="up()">
            <input type="button" class="button" value="下一题" onclick="next()"> 跳转到：<input id="no" type="text" style="width:30px">题
            <input type="button" class="button"  value="确定" onclick="jumpno()">
            
        </div>
    </div>
  <script type="text/javascript">
      $(function(){
      $.post("/driver_trainer_sys/CZX/QuestionTest/getQuestion",{"subject":"科目一"},function(data){
          var a = data.question.qNo+1;
          $("#qq").html(a);
          $("#pg0").html("."+data.question.qDescription);
          $("#pg1").html(data.question.qAnswerA);
          $("#pg2").html(data.question.qAnswerB);
          $("#pg3").html(data.question.qAnswerC);
          $("#pg4").html(data.question.qAnswerD);
          $("#pg5").html(data.question.qAnswerCorrect);
      });      
      });
      
      //查看答案的方法
      function check(){
          $("#pg5").css("display", "inline");
      }
      function tt1(){
          $("#wawa").html("A");
      }
      function tt2(){
          $("#wawa").html("B");
      }
      function tt3(){
          $("#wawa").html("C");
      }
      function tt4(){
          $("#wawa").html("D");
      }
      
      //上一题的方法
      function up(){
          var b = $("#qq").text();
          if(b-2<0){
              alert("当前已经是第一题");
          }else{
              var c = b-2;
              $.post("/driver_trainer_sys/CZX/QuestionTest/nextQuestion",{"qno":c,
                                                                          "subject":"科目一"},function(data){
                  var a = data.question.qNo+1;
                  $("#qq").html(a);
                  $("#pg0").html("."+data.question.qDescription);
                  $("#pg1").html(data.question.qAnswerA);
                  $("#pg2").html(data.question.qAnswerB);
                  $("#pg3").html(data.question.qAnswerC);
                  $("#pg4").html(data.question.qAnswerD);
                  $("#pg5").css("display", "none");
                  $("#pg5").html(data.question.qAnswerCorrect);
                  $("#wawa").html("");
          }); 
           //记录当前题号
           $.post("/driver_trainer_sys/CZX/QuestionTest/recQNo",{"qno":c,
                                                                    "subject":"科目一"},function(){
                                                                    });
          }
      }
      //下一题的方法
      function next(){
          var d = $("#qq").text();
          if(d==105){
              alert("当前已经是最后一题");
          }else{
          $.post("/driver_trainer_sys/CZX/QuestionTest/nextQuestion",{"qno":d,
                                                                      "subject":"科目一"},function(data){
              var a = data.question.qNo+1;
              $("#qq").html(a);
              $("#pg0").html("."+data.question.qDescription);
              $("#pg1").html(data.question.qAnswerA);
              $("#pg2").html(data.question.qAnswerB);
              $("#pg3").html(data.question.qAnswerC);
              $("#pg4").html(data.question.qAnswerD);
              $("#pg5").css("display", "none");
              $("#pg5").html(data.question.qAnswerCorrect);
              $("#wawa").html("");
              
             
          }); 
          //记录当前题号
           $.post("/driver_trainer_sys/CZX/QuestionTest/recQNo",{"qno":d,
                                                                    "subject":"科目一"},function(){
                                                                    });
          }
      };
      
      //跳转题目的方法
      function jumpno(){
          var e = $("#no").val()-1;
          if(e<0||e>139){
              alert("请输入1-105之间的数字");
          }else{
          $.post("/driver_trainer_sys/CZX/QuestionTest/nextQuestion",{"qno":e,
                                                                      "subject":"科目一"},function(data){
              var a = data.question.qNo+1;
              $("#qq").html(a);
              $("#pg0").html("."+data.question.qDescription);
              $("#pg1").html(data.question.qAnswerA);
              $("#pg2").html(data.question.qAnswerB);
              $("#pg3").html(data.question.qAnswerC);
              $("#pg4").html(data.question.qAnswerD);
              $("#pg5").css("display", "none");
              $("#pg5").html(data.question.qAnswerCorrect);
              $("#wawa").html("");
              $("#no").val("");
          });
          //记录当前题号
           $.post("/driver_trainer_sys/CZX/QuestionTest/recQNo",{"qno":e,
                                                                    "subject":"科目一"},function(){
                                                                    });
                                                                      
          }
      }
  </script>
  </body>
</html>
