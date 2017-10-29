<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<!DOCTYPE html>
<html lang="en" class="no-js">

    <head>
<base href="<%=basePath%>">
        <meta charset="utf-8">
        <title>登录(Login)</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">

        <!-- CSS -->
        <link rel="stylesheet" href="/driver_trainer_sys/css/reset.css">
        <link rel="stylesheet" href="/driver_trainer_sys/css/supersized.css">
        <link rel="stylesheet" href="/driver_trainer_sys/css/style.css">

        <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
            <script src="assets/js/html5.js"></script>
        <![endif]-->
<style type="text/css">



</style>
    </head>

    <body >
        <div >
        <h1 style="font-size:50px">机动车驾驶员网上理论考试平台</h1>
        </div>
        
        <div class="page-container">
            <h1>登录(Login)</h1>
            <form>
 	            <input type="text" id="pg1" name="stuIdentity" class="username" placeholder="请输入您的身份证！">
        	 <input type="password" id="pg2" name="stuPwd" class="password" placeholder="请输入您的密码！">
        	        <input type="Captcha" id="pg3" name="inputcode" class="Captcha" name="Captcha" placeholder="请输入验证码！">
                </br></br></br>
                <img src="xp/examination/authCode" width=100px height=40px title="点击更换" alt="验证码占位图" onclick="theoryAuthCode(this)"/>
                <button type="button" class="submit_button" onclick="login()">登录</button>
                <div class="error" id="wrong"><span>+</span></div>
           </form>
            
        </div>
		
        <!-- Javascript -->
        <script type="text/javascript" src="/driver_trainer_sys/js/jquery-2.2.1.js"></script>
        <script src="/driver_trainer_sys/js/supersized.3.2.7.min.js" ></script>
        <script src="/driver_trainer_sys/js/supersized-init.js" ></script>
        <script type="text/javascript" >
        
            $(function(){
                //当输入框发生内容的变化的时候，隐藏X
                $("#pg1").bind('input propertychange',function(){
                    $("#wrong").css("display","none");
                });
                $("#pg2").bind('input propertychange',function(){
                    $("#wrong").css("display","none");
                });
                $("#pg3").bind('input propertychange',function(){
                    $("#wrong").css("display","none");
                });
            });

            //判断身份证号码、密码、验证码不为空
            function login(){
                var username = $("#pg1").val();
                var password = $("#pg2").val();
                var code = $("#pg3").val();
                if(username == '') {
                    $("#wrong").css("top","27px");
                    $("#wrong").css("display","block");
                    alert("提示：身份证号码不能为空");
                    return false;
                }
		   
                if(password == '') {
                    $("#wrong").css("top","97px");
                    $("#wrong").css("display","block");
                    alert("提示：密码不能为空");
                    return false;
                }
                
                if(code == '') {
                    $("#wrong").css("top","167px");
                    $("#wrong").css("display","block");
                    alert("提示：验证码不能为空");
                    return false;
                }
                
                //判断输入的身份证。密码、验证码输入正确与否，登录到首页的方法
                $.post("xp/examination/login",{"stuIdentity":username,"stuPwd":password,"inputCode":code},
                                                          function(data){
                
                                                              if(data.result=="wrongId"){
                                                                  alert("提示：身份证号码不存在");
                                                                  $("#wrong").css("top","27px");
                                                                  $("#wrong").css("display","block");
                                                              }else if(data.result=="wrongPwd"){
                                                                  alert("提示：密码输入有误");
                                                                  $("#wrong").css("top","97px");
                                                                  $("#wrong").css("display","block");
                                                              }
                                                              else if(data.result=="wrongValideCode"){
                                                                  alert("提示：验证码输入有误");
                                                                  $("#wrong").css("top","167px");
                                                                  $("#wrong").css("display","block"); 
                                                              }else if(data.result=="success"){
                                                                 
                                                                  location= "jsp/examination/examPage.jsp";
                                                              }else if(data.result=="noRegister"){
                                                                 
                                                                  alert("考试未报名");
                                                              }else if(data.result=="examed"){
                                                                 
                                                                  alert("已完成考试");
                                                              }else if(data.result=="notStart"){
                                                                 
                                                                  alert("考试未开始");
                                                              }
                                                          });
           }
 
    
            //修改验证码
            function theoryAuthCode(image){
                
                image.src = "xp/examination/authCode?date=" + new Date().getTime();
            };
       </script>
    </body>
<div style="text-align:center;">

</div>

</html>


