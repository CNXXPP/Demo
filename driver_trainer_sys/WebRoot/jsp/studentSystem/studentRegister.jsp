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

<title>My JSP 'studentRegister.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="Bookmark" href="favicon.ico" >
<link rel="Shortcut Icon" href="favicon.ico" />

<link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />
<link href="css/bootstrap.min.css" rel="stylesheet">


<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script> 
<script type="text/javascript" src="static/h-ui/js/H-ui.js"></script> 
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.page.js"></script> 

<!--/_footer /作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
 <script type="text/javascript" src="lib/jquery.validation/1.14.0/jquery.validate.js"></script> 
 <script type="text/javascript" src="lib/jquery.validation/1.14.0/validate-methods.js"></script> 
 <script type="text/javascript" src="lib/jquery.validation/1.14.0/messages_zh.js"></script>  
<style type="text/css">
  .step{ margin:0 auto; display:block; height:60px;}
.step li{ position:relative; text-align:center;}
.step .line_bg{ height:3px; background:#1a97d7; display:inline-block; width:50%; top:13px; position:absolute; z-index:1;}
.step .lbg-l{left:0;}
.step .lbg-r{right:0;}
.step .num{ position:relative; z-index:2; background:#fff;width:54px; height:30px;text-align:center; display:inline-block;}
.step .num em,.num i{width:24px; height:24px; display:inline-block; left:15px; top:2px;position:absolute;}
.step .num em{ background:#1a97d7;transform:rotate(45deg);-webkit-transform:rotate(45deg);-moz-transform:rotate(45deg);-ms-transform:rotate(45deg);-o-transform:rotate(45deg);z-index:2;}
.step .num i{  z-index:3; color:#fff; font-style:normal; font-weight:700; top:4px;}
.step .lbg-txt{ position:relative; color:#1a97d7; font-size:13px;}
.step .on .lbg-txt{color:#1a97d7;}
.step .on .line_bg,.step .on .num em{ background:#1a97d7}

</style>
</head>

 <div class="step">        	
                <ul>
                    <li class="col-xs-4 on">
                        <span class="num"><em class="f-r5"></em><i>1</i></span>                	
                        <span class="line_bg lbg-r"></span>
                        <p class="lbg-txt">填写账户信息</p>
                    </li>
                    <li class="col-xs-4">
                        <span class="num"><em class="f-r5"></em><i>2</i></span>
                        <span class="line_bg lbg-l"></span>
                        <span class="line_bg lbg-r"></span>
                        <p class="lbg-txt">支付</p>
                    </li>
                    <li class="col-xs-4">
                        <span class="num"><em class="f-r5"></em><i>3</i></span>
                        <span class="line_bg lbg-l"></span>
                        <p class="lbg-txt">注册成功</p>
                    </li>
                </ul>
            </div>
        	
<article class="cl pd-20">
	<form action="grj/student/studengRigester" method="post" class="form form-horizontal" id="form">
	
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>学员姓名：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text"  placeholder="请输入你的姓名" id="stuName" name="stuName" />
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>民族：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text"  placeholder="请输入你的民族" id="nation" name="nation"/>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>户籍所在地：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text"  placeholder="户籍所在地" id="identityLocation" name="identityLocation"/>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>现居住地：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text"  placeholder="户籍所在地" id="curLocation " name="curLocation" />
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>身份证号码：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text"  placeholder="请输入您的身份证号码" id="identity" name="identity"/>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">原准驾车型</label>
			<div class="formControls col-xs-8 col-sm-9"> <span class="select-box" style="width:150px;">
				<select class="select" name="formerType" size="1" id="formerType">
				    <option value="无" selected="selected">无</option>
					<option value="A1">A1（大型客车）</option>
					<option value="A2">A2（牵引车）</option>
					<option value="A3">A3（城市公交车）</option>
					<option value="B1">B1（中型客车）</option>
					<option value="B2">B2（大型货车）</option>
					<option value="C1" >C1（小型汽车）</option>
					<option value="C2">C2（小型自动挡汽车）</option>
					<option value="C3">C3（低速载货车）</option>
					<option value="C4">C4（三轮汽车）</option>
				</select>

				</span> </div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">报考准驾车型</label>
			<div class="formControls col-xs-8 col-sm-9"> <span class="select-box" style="width:150px;">
				<select class="select" name="drivingType" size="1" id="drivingType">
					<option value="A1">A1（大型客车）</option>
					<option value="A2">A2（牵引车）</option>
					<option value="A3">A3（城市公交车）</option>
					<option value="B1">B1（中型客车）</option>
					<option value="B2">B2（大型货车）</option>
					<option value="C1" selected="selected">C1（小型汽车）</option>
					<option value="C2">C2（小型自动挡汽车）</option>
					<option value="C3">C3（低速载货车）</option>
					<option value="C4">C4（三轮汽车）</option>
				</select>

				</span> </div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>出生日期：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="date" class="input-text"  placeholder="日期格式xxxx-xx-xx" id="stuBirthday" name="stuBirthday"/>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>初始密码：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="password" class="input-text" autocomplete="off" value="" placeholder="密码" id="password1" name="password">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>确认密码：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="password" class="input-text" autocomplete="off"  placeholder="确认新密码" id="password2" name="password2">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>性别：</label>
			<div class="formControls col-xs-8 col-sm-9 skin-minimal">
				<div class="radio-box">
					<input name="sex" type="radio" id="sex-1" checked value="男">
					<label for="sex-1">男</label>
				</div>
				<div class="radio-box">
					<input type="radio" id="sex-2" name="sex" value="女">
					<label for="sex-2">女</label>
				</div>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>手机：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="" placeholder="请输入手机号码" id="phone" name="phone">
			</div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3">教练：：</label>
			<div class="formControls col-xs-8 col-sm-9"> <span class="select-box" style="width:150px;">
				<select class="select" name="trainer" size="1" id="trainer">
					
				</select>

				</span> </div>
		</div>
				<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
				<input class="btn btn-primary radius" type="button" value="&nbsp;&nbsp;注册&nbsp;&nbsp;" onclick="check()">
			</div>
		</div>
	</form>
</article>


<script type="text/javascript">
$(function(){
	$('.skin-minimal input').iCheck({
		checkboxClass: 'icheckbox-blue',
		radioClass: 'iradio-blue',
		increaseArea: '20%'
	});
	
	$("#form-admin-add").validate({
		rules:{
			adminName:{
				required:true,
				minlength:4,
				maxlength:16
			},
			password:{
				required:true,
			},
			password2:{
				required:true,
				equalTo: "#password"
			},
			sex:{
				required:true,
			},
			phone:{
				required:true,
				isPhone:true,
			},
			email:{
				required:true,
				email:true,
			},
			adminRole:{
				required:true,
			},
		},
		onkeyup:false,
		focusCleanup:true,
		success:"valid",
		submitHandler:function(form){
			$(form).ajaxSubmit();
			var index = parent.layer.getFrameIndex(window.name);
			parent.$('.btn-refresh').click();
			parent.layer.close(index);
		}
	});
	
	
	/* 获取驾校的教练 */
	$.post(
	   "grj/student/getTrainers",
	   {"schUuid":'${schUuid}'},
	   function(data){
		   var msg = data.trainers;
		   for(var i = 0;i < msg.length;i++){
			   $("#trainer").append("<option value="+msg[i].traUuid+">"+msg[i].traName+"</option>");
		   }
	   }
	);
	
	
});

    function check(){
    	
    	if($("#stuName").val() == ""){
    		alert("学员名字不能为空");
    		return false;
    	}
    	if($("#nation").val() == ""){
    		alert("学员名族不能为空");
    		return false;
    	}
    	if($("#identityLocation").val() == ""){
    		alert("户籍所在地为空");
    		return false;
    	}
    	if($("#curLocation").val() == ""){
    		alert("现居住地为空");
    		return false;
    	}
    	if($("#identity").val() == ""){
    		alert("学员身份证号码不能为空");
    		return false;
    	}
    	if($("#identity").val().length < 18){
    		alert("学员身份证号码不合法");
    		return false;
    	}
    	if($("#stuBirthday").val() == ""){
    		alert("学员出生日期不能为空");
    		return false;
    	}
    	if($("#password1").val() == ""){
    		alert("学员密码框不能为空");
    		return false;
    	}
    	if($("#password1").val().length < 6){
    		alert("学员密码不能小于6位");
    		return false;
    	}
    	if($("#password2").val() == "" || $("#password1").val() != $("#password2").val()){
    		alert("学员重复输入密码错误");
    		return false;
    	}
    	if($("#phone").val() == ""){
    		alert("学员电话号码不能为空，如果自己没有使用电话可以填亲属的电话");
    		return false;
    	}
    	if($("#phone").val().length != 11){
    		alert("电话号码不合法(电话只能11位数字)");
    		return false;
    	}
    	$("#form").submit(); 
    }
</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>