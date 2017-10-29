<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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

<title>驾考登录</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />


<link href="css/login.css" rel="stylesheet" rev="stylesheet"
	type="text/css" media="all" />
<script type="text/javascript" src="js/jQuery1.7.js"></script>
<script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="js/jquery1.42.min.js"></script>
<script type="text/javascript" src="js/jquery.SuperSlide.js"></script>
<script type="text/javascript" src="js/Validform_v5.3.2_min.js"></script>


<script type="text/javascript">
	$(document).ready(function() {
		var $tab_li = $('#tab ul li');
		$tab_li.hover(function() {
			$(this).addClass('selected').siblings().removeClass('selected');
			var index = $tab_li.index(this);
			$('div.tab_box > div').eq(index).show().siblings().hide();
		});
	});
	 
	
</script>
<script type="text/javascript">

	$(function() {
	
	    $("#trainerSubmit").click(function(){
	    	
	       var id=$("#tea_username_hide").val();
	       var pwd=$("#tea_password_hide").val();
	       var code=$("#tea_code_hide").val();
        
	         $.ajax({
	         
	             url:"cw/trainerLogin",
	             data:{"traId":id,"traPwd":pwd,"code":code},
	             dataType:"json",
	             
	             success:function(imt){
	             
	               if(imt==null){
	               
	                 alert("账号不存在");
	                 $("#tea_code_hide").val("");
	               }else{
	                 
	                 location.href="jsp/trainerSystem/trainerPage.jsp";
	               
	               }
	             
	             
	             }
	         
	         
	         });

	    });
	
	
	
	
	 $("#studentLogin").click(function(){
	
		$.post("grj/login/studentLogin",
				{"stuId":$("#stu_username_hide").val(),"stuPwd":$("#stu_password_hide").val(),"code":$("#stu_code_hide").val()},
				function(data){
					$("#stuImg").attr("src","grj/student/studentAuthCode?date=" + new Date().getTime());
					var objtip = $(".stu_error_box");
					
					objtip.text(data.message);
				
					if("登陆成功" == data.message){
						location . href = "jsp/studentSystem/main.jsp";
					}
				});
		
	}); 
	
	/*驾校登陆*/

	
	    $("#schoolSubmit").click(function(){
           
	       var id=$("#sch_username_hide").val();
	       var pwd=$("#sch_password_hide").val();
	       var code=$("#sch_code_hide").val();
  
	         $.ajax({
	         
	             url:"jjn/schoolLogin",
	             data:{"schId":id,"schPwd":pwd,"authCode":code},
	        
	             
	             success:function(data){
	           
	             var res = data.res;
	             
	
	             if("check" == res){
	
	             location="/driver_trainer_sys/jsp/schoolSystem/DriverSchool.jsp";
	             }
	             if("id" == res){
	              
	             $(".sch_error_box").text("账号不存在");
	             $("#sch_username_hide").focus();
	              $("#schImg").attr("src","jjn/schoolAuthCode?date=" + new Date().getTime());
	             }
	             if("pwd" == res){
	            
	             $(".sch_error_box").text("密码错误");
	             $("#sch_password_hide").focus();
	               $("#schImg").attr("src","jjn/schoolAuthCode?date=" + new Date().getTime());
	             }
	              if("code" == res){
	             $("#sch_code_hide").focus();
	             $(".sch_error_box").text("验证码错误");
	               $("#schImg").attr("src","jjn/schoolAuthCode?date=" + new Date().getTime());
	             
	             }
	             
	             }
	         
	         
	         });

	    });
	
	/*驾校登陆*/
	
	
	
	
	 
	
		/*学生登录信息验证*/
		$("#stu_username_hide").focus(function() {
			var username = $(this).val();
			if (username == '输入学号') {
				$(this).val('');
			}
		});
		$("#stu_username_hide").focusout(function() {
			var username = $(this).val();
			if (username == '') {
				$(this).val('输入学号');
			}
		});
		$("#stu_password_hide").focus(function() {
			var username = $(this).val();
			if (username == '输入密码') {
				$(this).val('');
			}
		});
		$("#stu_password_hide").focusout(function() {
			var username = $(this).val();
			if (username == '') {
				$(this).val('输入密码');
			}
		});
		$("#stu_code_hide").focus(function() {
			var username = $(this).val();
			if (username == '输入验证码') {
				$(this).val('');
			}
		});
		$("#stu_code_hide").focusout(function() {
			var username = $(this).val();
			if (username == '') {
				$(this).val('输入验证码');
			}
		});
		$(".stu_login_error").Validform({
			tiptype : function(msg, o, cssctl) {
				var objtip = $(".stu_error_box");
				cssctl(objtip, o.type);
				objtip.text(msg);
			},
			ajaxPost : true
		});
		/*导师登录信息验证*/
		$("#tea_username_hide").focus(function() {
			var username = $(this).val();
			if (username == '输入教工号') {
				$(this).val('');
			}
		});
		$("#tea_username_hide").focusout(function() {
			var username = $(this).val();
			if (username == '') {
				$(this).val('输入教工号');
			}
		});
		$("#tea_password_hide").focus(function() {
			var username = $(this).val();
			if (username == '输入密码') {
				$(this).val('');
			}
		});
		$("#tea_password_hide").focusout(function() {
			var username = $(this).val();
			if (username == '') {
				$(this).val('输入密码');
			}
		});
		$("#tea_code_hide").focus(function() {
			var username = $(this).val();
			if (username == '输入验证码') {
				$(this).val('');
			}
		});
		$("#tea_code_hide").focusout(function() {
			var username = $(this).val();
			if (username == '') {
				$(this).val('输入验证码');
			}
		});
		$(".tea_login_error").Validform({
			tiptype : function(msg, o, cssctl) {
				var objtip = $(".tea_error_box");
				cssctl(objtip, o.type);
				objtip.text(msg);
			},
			ajaxPost : true
		});
		/*教务登录信息验证*/
	/*驾校信息验证*/
	$("#sch_username_hide").focus(function() {
			var username = $(this).val();
			if (username != '') {
				$(this).val('');
			}
		});
		$("#sch_username_hide").focusout(function() {
			var username = $(this).val();
			if (username == '') {
				$(this).val('输入学号');
			}
		});
		$("#sch_password_hide").focus(function() {
			var username = $(this).val();
			if (username != '') {
				$(this).val('');
			}
		});
		$("#sch_password_hide").focusout(function() {
			var username = $(this).val();
			if (username == '') {
				$(this).val('输入密码');
			}
		});
		$("#sch_code_hide").focus(function() {
			var username = $(this).val();
			if (username == '输入验证码') {
				$(this).val('');
			}
		});
		$("#sch_code_hide").focusout(function() {
			var username = $(this).val();
			if (username == '') {
				$(this).val('输入验证码');
			}
		});
	});
	
	
	
	
	
	
	//刷新验证码图片
	 function change(image) {
	 	//改变img的src即可，由于该URL并没有变化，因此追加动态参数伪装成变化的URL。
	 	image.src = "authCode?date=" + new Date().getTime();
	 }
	 
	 function trainerAuthCode(image){
	 
	  image.src = "cw/trainerAuthCode?date=" + new Date().getTime();	 
	 }
	
	 function authCode(image){
	
	 image.src = "grj/student/studentAuthCode?date=" + new Date().getTime();
	 
	 } 
	  function schooAuthCode(image){
	 
	  image.src = "jjn/schoolAuthCode?date=" + new Date().getTime();	 
	 }
	 
	
</script>
<script type="text/javascript">
	$(function() {
		$(".screenbg ul li").each(function() {
			$(this).css("opacity", "0");
		});
		$(".screenbg ul li:first").css("opacity", "1");
		var index = 0;
		var t;
		var li = $(".screenbg ul li");
		var number = li.size();
		function change(index) {
			li.css("visibility", "visible");
			li.eq(index).siblings().animate({
				opacity : 0
			}, 3000);
			li.eq(index).animate({
				opacity : 1
			}, 3000);
		}
		function show() {
			index = index + 1;
			if (index <= number - 1) {
				change(index);
			} else {
				index = 0;
				change(index);
			}
		}
		t = setInterval(show, 8000);
		//根据窗口宽度生成图片宽度
		var width = $(window).width();
		$(".screenbg ul img").css("width", width + "px");
	});
</script>

</head>

<body>


	<div id="tab">
		<ul class="tab_menu">
			<li class="selected">学员登录</li>
			<li>教练登录</li>
			<li>驾校登录</li>
		</ul>
		<div class="tab_box">
			<!-- 学员登录开始 -->
			<div>
				<div class="stu_error_box"></div>
				<form action="studentLogin" method="post" class="stu_login_error">
					<div id="username">
						<label>学&nbsp;&nbsp;&nbsp;号：</label> <input type="text"
							id="stu_username_hide" name="username" value="输入学号"
							nullmsg="学号不能为空！" datatype="s6-18" "
							sucmsg="学号验证通过！" />
						<!--ajaxurl="demo/valid.jsp"-->
					</div>
					<div id="password">
						<label>密&nbsp;&nbsp;&nbsp;码：</label> <input type="password"
							id="stu_password_hide" name="password" value="输入密码"
							nullmsg="密码不能为空！" datatype="*6-16" "
							sucmsg="密码验证通过！" />
					</div>
					<div id="code">
						<label id="tishi">验证码：</label> <input type="text" id="stu_code_hide"
							name="code" value="输入验证码" nullmsg="验证码不能为空！" datatype="*4-4"
							errormsg="验证码有4位数！" sucmsg="验证码验证通过！" /> <img  id="stuImg"
							src="grj/student/studentAuthCode?date=33" title="点击更换" alt="验证码占位图" onclick="authCode(this)"/>
					</div>
					<div id="remember">
						<input type="checkbox" name="remember"> <label>记住密码</label>
					</div>
					<div id="login">
						<button type="button" id="studentLogin">学生登录</button>
					</div>
				</form>
			</div>
			<!-- 学生登录结束-->
			<!-- 教练登录开始-->
			<div class="hide">
				<div class="tea_error_box"></div>

					<div id="username">
						<label>教练号：</label> <input type="text" id="tea_username_hide"
							name="username" value="输入教工号" nullmsg="教工号不能为空！" datatype="s5-5"
							errormsg="教练号为5位！" sucmsg="教练号验证通过！" />
						<!--ajaxurl="demo/valid.jsp"-->
					</div>
					<div id="password">
						<label>密&nbsp;&nbsp;&nbsp;码：</label> <input type="password"
							id="tea_password_hide" name="password" value="输入密码"
							nullmsg="密码不能为空！" datatype="*6-16" errormsg="密码范围在6~16位之间！"
							sucmsg="密码验证通过！" />
					</div>
					<div id="code">
						<label>验证码：</label> <input type="text" id="tea_code_hide"
							name="code" value="输入验证码" nullmsg="验证码不能为空！" datatype="*4-4"
							errormsg="验证码有4位数！" sucmsg="格式正确通过！" /> <img
					src="cw/trainerAuthCode?date=22" title="点击更换" alt="验证码占位图" id="co" onclick="trainerAuthCode(this)"/>

					</div>
					<div id="remember">
						<input type="checkbox" name="remember"> <label>记住密码</label>
					</div>
					<div id="login">
						<button type="button" id="trainerSubmit" >教练登录</button>
					</div>

			</div>
			<!-- 导师登录结束-->
			<!-- 驾校登录开始-->
				<div class="hide">
				<div class="sch_error_box"></div>
				<form action="schoolLogin" method="post" class="tea_login_error">
	
					<div id="username">
						<label>教练号：</label> <input type="text" id="sch_username_hide"
							name="username" value="输入帐号" nullmsg="教工号不能为空！" datatype="s5-5"
							errormsg="教练号为5位！" sucmsg="教练号验证通过！" />
						<!--ajaxurl="demo/valid.jsp"-->
					</div>
					<div id="password">
						<label>密&nbsp;&nbsp;&nbsp;码：</label> <input type="password"
							id="sch_password_hide" name="password" value="输入密码"
							nullmsg="密码不能为空！" datatype="*6-16" errormsg="密码范围在6~16位之间！"
							sucmsg="密码验证通过！" />
					</div>
					<div id="code">
						<label>验证码：</label> <input type="text" id="sch_code_hide"
							name="code" value="输入验证码" nullmsg="验证码不能为空！" datatype="*4-4"
							errormsg="验证码有4位数！" sucmsg="格式正确通过！" /> <img id="schImg"
					src="jjn/schoolAuthCode?date=66" title="点击更换" alt="验证码占位图" onclick="schooAuthCode(this)"/>

					</div>
					<div id="remember">
						<input type="checkbox" name="remember"> <label>记住密码</label>
					</div>
					<div id="login">
						<button type="button" id="schoolSubmit" >驾校登录</button>
					</div>
				</form>
			</div>
	</div>


	<div class="screenbg">
		<ul>
			<li><a href="javascript:;"><img src="images/3.jpg"></a></li>
			<li><a href="javascript:;"><img src="images/4.jpg"></a></li>
			<li><a href="javascript:;"><img src="images/5.jpg"></a></li>
		</ul>
	</div>



</body>
</html>
