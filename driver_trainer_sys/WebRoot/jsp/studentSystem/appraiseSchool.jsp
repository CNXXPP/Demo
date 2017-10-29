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

<title>My JSP 'appraiseSchool.jsp' starting page</title>

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
h2 {
	display: inline;
	margin-right: 50px;
}

h3 {
	display: inline;
	margin-right: 50px;
}
#history{margin-top:30px;}
</style>
</head>

<body>
	<h2>您所在驾校:：</h2>
	<h2 id="schName"></h2>
	<img src="images/dahuangfeng.jpg" style="width:100px;height:100px" />
	<h3>综合评分:</h3>
	<h3 id="score"></h3>
	<a class="btn btn-primary radius" onclick="appraise()"><i
		class="Hui-iconfont">&#xe600;</i>我要评价</a>
	<div style="display:none" id="dialog" index="99999">
		<textarea class="textarea" placeholder="说点什么...最少输入10个字符" id="text"
			datatype="*10-100" dragonfly="true" nullmsg="备注不能为空！"
			onkeyup="textarealength(this,100)">
	     </textarea>
		<br>
		<br>
		 <h3 style="margin-left:2%">评分:</h3>
		 <input type="text" placeholder="请输入0-100分" id="pscore" class="input-text"/><br><br>
		 <input type="botton" class="btn btn-primary radius" id="btnSure"
			value="确认" />

	</div>
	<div style="background-color:black;height:5px;margin-top:5px"></div>
	<h2>历史评价:</h2>
	
      <table id="example" class="table table-border table-bordered table-bg table-hover table-sort">
				    <thead>
						<tr >
							<th >学生ID</th>
						    <th>评论内容</th>
						    <th >评价时间</th>
						    <th >评价分数</th>
						</tr>
					 </thead>
                     <tbody></tbody>
	

     </table>
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
		   $("#text").val("");
		   
		   var lang = {
					"sProcessing" : "处理中...",
					"sLengthMenu" : "每页 _MENU_ 项",
					"sZeroRecords" : "没有匹配结果",
					"sInfo" : "当前显示第 _START_ 至 _END_ 项，共 _TOTAL_ 项。",
					"sInfoEmpty" : "当前显示第 0 至 0 项，共 0 项",
					"sInfoFiltered" : "(由 _MAX_ 项结果过滤)",
					"sInfoPostFix" : "",
					"sSearch" : "搜索:",
					"sUrl" : "",
					"sEmptyTable" : "表中数据为空",
					"sLoadingRecords" : "载入中...",
					"sInfoThousands" : ",",
					"oPaginate" : {
						"sFirst" : "首页",
						"sPrevious" : "上页",
						"sNext" : "下页",
						"sLast" : "末页",
						"sJump" : "跳转"
					},
					"oAria" : {
						"sSortAscending" : ": 以升序排列此列",
						"sSortDescending" : ": 以降序排列此列"
					}
				};
				//初始化表格
				var table = $("#example")
						.dataTable(
								{
									language : lang,
									ajax : function(data, callback, settings) {
										//封装请求参数
										var param = {};
										
										//ajax请求数据
										$.ajax({
											type : "post",
											url : "grj/appraise/schoolAppraise",
											cache : false, //禁用缓存
											data : param, //传入组装的参数
											dataType : "json",
											success : function(result) {
												/* var returnData = {};
												returnData.data = result.data;//返回的数据列表
												console.log(returnData); 
												//调用DataTables提供的callback方法，代表数据已封装完成并传回DataTables进行渲染
												//此时的数据需确保正确无误，异常判断应在执行此回调前自行处理完毕*/
												/*以下动态添加  教练的资料*/
												$("#schName").text(result.data[0].SCH_NAME);
												$("#score").text(result.data[0].SCH_SCORE);
												callback(result);
											}
										});
									},
									//列表表头字段
									columns : [ {
										"data" : "STU_UUID"
									}, {
										"data" : "SCT_COMMENT"
									}, {
										"data" : "COMMENT_DATE"
									}, {
										"data" : "SCT_SCORE"
									}, ],
									columnDefs : [
											{
												"orderable" : false,
												"targets" : 3
											}, ],
								}).api();
		   
				/*验证学生评分是否合法  */
				$("#pscore").blur(function(){
					var nn=/^[0-9]{1,3}$/;
					if(!nn.exec($("#pscore").val()) || $("#pscore").val()>100 || $("#pscore").val() == 0){
						alert("只能输入整数1-100");
						$("#pscore").val("");
						
					}
					
				});
				
				$("#btnSure").click(function(){
					 if($("#text").val() == "" ){
						 alert("评价不能为空");
						 return ;
					 }
					 if($("#text").val().length < 10){
						 alert("评论长度不能小于10");
						 return;
					 }
					  if($("#pscore").val() == ""){
						 alert("评分不能为空") ;
						 return ;
					 } 
					 $.post("grj/appraise/addSchoolAppraise",
							 {"sctComment":$("#text").val(),"sctScore":$("#pscore").val()},
							 function(data){
								 
								 var msg = data.message;
								 alert(msg);
								 
								  if(msg == '抱歉你已经评价过了'){
									  $("#text").val("");
									  $("#pscore").val("");
									  $("#dialog").css("display", "none");
								 }else if(msg == '评价成功,感谢你的反馈'){
									location="jsp/studentSystem/appraiseSchool.jsp";
								 }
						 
					 });
				});
		   
		   
		   
	   });
	
	
	
	
	
		function appraise() {

			if ($("#dialog").css("display") == "none") {
				$("#dialog").css("display", "inline");
			} else {
				$("#dialog").css("display", "none");
			}

		}
	</script>
</body>
</html>
