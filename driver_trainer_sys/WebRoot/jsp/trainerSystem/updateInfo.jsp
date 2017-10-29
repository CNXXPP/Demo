<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page language="java" import="java.util.*" contentType="text/html;charset=gb2312"%> 
<html>
<head>
<base href="<%=basePath%>">

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">


<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

<link rel="Bookmark" href="favicon.ico">
<link rel="Shortcut Icon" href="favicon.ico" />

<link rel="stylesheet" type="text/css"
	href="static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css"
	href="static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css"
	href="lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css"
	href="static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css"
	href="static/h-ui.admin/css/style.css" />

<style>
th {
	font-size: 13;
}

#textDiv {
	margin-top: 20px;
}

H3 {
	display: inline;
}
input{height:30px;}
#btnRest{width:200px;}
#btnSub{width:200px;}
</style>

</head>
<body>

	<div class="Hui-article">

		<div>

			<h2 style="display:inline">教练信息</h2>
			<img src="images/dahuangfeng.jpg"
				style="width:100px;height:100px;margin-left:100px;">
			<div style="float:right;margin-right:40%">
				<h3>教练姓名：</h3>
				<h3>${Trainer.traName}</h3>
				</br>
				</br>
				<h3 style="margin-top:2cm;">教练评分：</h3>
				<h3>${Trainer.traScore}</h3>
				<br>
			</div>

		</div>
		<div class="cl pd-5 bg-1 bk-gray mt-20"></div>

		<div id="textDiv">
		
				<table
					class="table table-border table-bordered table-bg table-hover table-sort">

					<tr class="text-c">
						<th width="23%">教练号:</th>
						<th width="23%">${Trainer.traId}</th>
						<th width="23%">姓名：</th>
						<th width="31%">${Trainer.traName}</th>
					</tr>

					<tr class="text-c">
						<th width="23%">雇佣时间：</th>
						<th width="23%">${map.HireDate}</th>
						<th width="23%">联系电话:</th>
						<th width="31%"><input type='text'id="traPhone" placeholder="${Trainer.traPhone}"/></th>
					</tr>
					<tr class="text-c">
						<th width="23%">性别</th>
						<th width="23%">${Trainer.traGender}</th>
						<th width="23%">驾照类型:</th>
						<th width="31%">${Trainer.drivingType}</th>
					</tr>
					<tr class="text-c">
						<th width="23%">名族</th>
						<th width="23%">汉</th>
						<th width="23%">上次登录时间</th>
						<th width="31%">${map.LastLoginDate}</th>
					</tr>
					<tr class="text-c">
						<th width="23%">教练简介：</th>
						<td width="23%" rowspan="3"><input type="text" id="traIntro" placeholder="${Trainer.traIntro}" style="width:100%"/></td>
		                 <td width="23%"></td>
		                 <td width="23%"></td>
					</tr>

				</table>
				<div style="margin-top:30px;">
				<input type="reset" value="取消" class="btn btn-danger radius" id="btnRest" />
				<input type="button" value="修改" class="btn btn-success" id="btnSub"  />
				</div>
		</div>
	</div>



	<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
	<script type="text/javascript" src="static/h-ui/js/H-ui.js"></script>
	<script type="text/javascript"
		src="static/h-ui.admin/js/H-ui.admin.page.js"></script>

	<script type="text/javascript"
		src="lib/My97DatePicker/4.8/WdatePicker.js"></script>
	<script type="text/javascript"
		src="lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
	
	
	
	
	<script type="text/javascript">
	
       $(function(){
       
          $("#btnSub").click(function(){

         var intro = $("#traIntro").val();
         var phone = $("#traPhone").val();
              $.ajax({
              
                 url:"cw/updateTrainer",
                 dataType:"json",
                 type:"post",
                 data:{"traPhone":$("#traPhone").val(),"traIntro":$("#traIntro").val()},
                 
                 success:function(data){
                 
                   if(data=="1"){
                   
                     $("#traIntro").attr('placeholder',intro);
                     $("#traIntro").val("");
                     $("#traPhone").attr('placeholder',phone);
                     $("#traPhone").val("");
                     
                   }else{
                    
                      alert("输入有问题,修改失败");
                   }
                 
                 }
              
              
              
              });
          
          
          });
          
          
          
          $("#btnRest").click(function(){
          
             alert();
          
          
          });
          
          
    
       });
	
		
	</script>
	

</body>
</html>
