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

<title>My JSP 'studentInfo.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" type="text/css"
	href="css/jquery.dataTables.css">
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
<!-- jQuery -->
<script type="text/javascript" charset="utf8"
	src="http://code.jquery.com/jquery-1.10.2.min.js"></script>

<!-- DataTables -->
<script type="text/javascript" charset="utf8"
	src="js/jquery.dataTables.js"></script>
    <link rel="stylesheet" href="/driver_trainer_sys/layui/css/layui.css" media="all" />
	<link rel="stylesheet" href="/driver_trainer_sys/css/font_eolqem241z66flxr.css" media="all" />
	<link rel="stylesheet" href="/driver_trainer_sys/css/main1.css" media="all" />

	
<style>
th {
	font-size: 20;
	align: center;
}

td {
	align: center;
}

#textDiv {
	margin-top: 20px;
}

#textDiv1 {
	margin-top: 20px;
}
</style>

</head>
<body>
<div >
			<blockquote class="layui-elem-quote title"><span style="font-size:20px">学时信息</span></blockquote>
				<table class="layui-table">
				<tr>
				    <td style="background:#F5FFFA">学习阶段</td><td style="background:#F5FFFA">需要总学时</td><td style="background:#F5FFFA">网上学时</td><td style="background:#F5FFFA">未完成学时</td><td style="background:#F5FFFA">状态</td>
				</tr>
				<tr>
				    <td>第一部分</td><td >10学时</td><td id="time1"></td><td id="time2"></td><td id="state1"></td>
				</tr>
				<tr>
				    <td>第四部分</td><td>8学时</td><td id="time3"></td><td id="time4"></td><td id="state2"></td>
				</tr>
				</table>
			
		</div>
	
<blockquote class="layui-elem-quote title"><span style="font-size:20px">第一部分详细学时</span></blockquote>
	<div >
		<div id="textDiv">
			<table id="example" class="display" cellspacing="0" width="100%">
				<thead>
					<tr>
						<th>学习阶段</th>
						<th>学习结束时间</th>
						<th>学习学时</th>
					</tr>
				</thead>
				<tbody></tbody>
			</table>
		</div>
	</div>
	<blockquote class="layui-elem-quote title"><span style="font-size:20px">第四部分详细学时</span></blockquote>
	<div >
		<div id="textDiv1">
			<table id="example1" class="display" cellspacing="0" width="100%">
				<thead>
					<tr>
						<th>学习阶段</th>
						<th>学习结束时间</th>
						<th>学习学时</th>
					</tr>
				</thead>
				<tbody></tbody>
			</table>
		</div>
	</div>



	<script type="text/javascript">
		$(function() {
			//提示信息
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
								"lengthMenu": [[5,10, 15,20], [5,10, 15,20,"All"]],
								
								ajax : function(data, callback, settings) {
									//封装请求参数
									var param = {};
									 					/* param.limit = data.length;//页面显示记录条数，在页面显示每页显示多少项的时候
									 					param.start = data.start;//开始的记录序号
									 					param.page = (data.start / data.length) + 1;//当前页码
									console.log(param); */
									//ajax请求数据
									$.ajax({
										type : "post",
										url : "/driver_trainer_sys/CZX/CardTime/getFirstSubTime",
										cache : false, //禁用缓存
										data : param, //传入组装的参数
										dataType : "json",
										success : function(result) {
											//console.log(result);
											//setTimeout仅为测试延迟效果
											//封装返回数据
											var returnData = {};
											returnData.data = result.data;//返回的数据列表
											console.log(returnData);
											//调用DataTables提供的callback方法，代表数据已封装完成并传回DataTables进行渲染
											//此时的数据需确保正确无误，异常判断应在执行此回调前自行处理完毕
											callback(returnData);
										}
									});
								},
								//列表表头字段
								columns : [ {
									"data" : "SUB_NAME"
								}, {
									"data" : "CTR_DATE"
								}, {
									"data" : "CTR_TIME"
								} ],
								
							}).api();
			//此处需调用api()方法,否则返回的是JQuery对象而不是DataTables的API对象
			// 			$('#example tbody').on( 'click', 'tr', function () {
			// 		        if ( $(this).hasClass('selected') ) {
			// 		            $(this).removeClass('selected');
			// 		        }
			// 		        else {
			// 		            table.$('tr.selected').removeClass('selected');
			// 		            $(this).addClass('selected');
			// 		        }
			// 		    } );

			// 		    $('#button').click( function () {
			// 		        table.row('.selected').remove().draw( false );
			// 		    } );
		
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
			var table = $("#example1")
					.dataTable(
							{
								language : lang,
								"lengthMenu": [[5,10, 15,20], [5,10, 15,20,"All"]],
								
								ajax : function(data, callback, settings) {
									//封装请求参数
									var param = {};
									 					/* param.limit = data.length;//页面显示记录条数，在页面显示每页显示多少项的时候
									 					param.start = data.start;//开始的记录序号
									 					param.page = (data.start / data.length) + 1;//当前页码
									console.log(param); */
									//ajax请求数据
									$.ajax({
										type : "post",
										url : "/driver_trainer_sys/CZX/CardTime/getForthSubTime",
										cache : false, //禁用缓存
										data : param, //传入组装的参数
										dataType : "json",
										success : function(result) {
											//console.log(result);
											//setTimeout仅为测试延迟效果
											//封装返回数据
											var returnData = {};
											returnData.data = result.data;//返回的数据列表
											console.log(returnData);
											//调用DataTables提供的callback方法，代表数据已封装完成并传回DataTables进行渲染
											//此时的数据需确保正确无误，异常判断应在执行此回调前自行处理完毕
											callback(returnData);
										}
									});
								},
								//列表表头字段
								columns : [ {
									"data" : "SUB_NAME"
								}, {
									"data" : "CTR_DATE"
								}, {
									"data" : "CTR_TIME"
								} ],
								
							}).api();
			$.post("/driver_trainer_sys/CZX/CardTime/getCarTime",{"stuUuid": '${Student.stuUuid}'},function(data){
                 var hour1 = parseInt(data.StuCardTime.ctSub1 / 60);
                 var min1 = parseInt(data.StuCardTime.ctSub1 % 60);
                 var hour4 = parseInt(data.StuCardTime.ctSub4 / 60);
                 var min4=parseInt(data.StuCardTime.ctSub4 % 60);
                 $("#time1").html(hour1 + "学时" + min1 + "分钟");
                 $("#time3").html(hour4 + "学时" + min4 + "分钟");
                 var hour11 = parseInt((600 - data.StuCardTime.ctSub1) / 60);
                 var min11 = parseInt((600 - data.StuCardTime.ctSub1) % 60);
                 var hour44 = parseInt((480 - data.StuCardTime.ctSub4) / 60);
                 var min44 = parseInt((480 - data.StuCardTime.ctSub4) % 60);
                 $("#time2").html(hour11 + "学时" + min11 + "分钟");
                 $("#time4").html(hour44 + "学时" + min44 + "分钟");
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
       			
		});
	
	</script>
</body>
</html>
