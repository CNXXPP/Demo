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

<title>My JSP 'studentNotice.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">

<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" type="text/css" href="css/jquery.dataTables.css">
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
<link rel="stylesheet" type="text/css"
	href="js/jquery-ui-1.12.1.custom/jquery-ui.min.css">

<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>

<script type="text/javascript"
	src="js/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
<!-- <script type="text/javascript" charset="utf8"
	src="http://code.jquery.com/jquery-1.10.2.min.js"></script> -->

<!-- DataTables -->
<script type="text/javascript" charset="utf8"
	src="js/jquery.dataTables.js"></script>

<style>
</style>

</head>
<body>

	<section>




	<div class="Hui-article">
		<article class="cl pd-20">
		<div class="text-c">

			<center>
				<h2>公告中心</h2>
			</center>


		</div>
		<div class="cl pd-5 bg-1 bk-gray mt-20"></div>
		<div class="mt-20">
			<table id="example"
				class="table table-border table-bordered table-bg table-hover table-sort">
				<thead>
					<tr class="text-c">
						<th width="80">ID</th>
						<th width="80">标题</th>
						<th width="80">发布者</th>
						<th width="120">发布时间</th>
						<th width="120">查看</th>
					</tr>
				</thead>
				<tbody></tbody>


			</table>
			<div id="dialog" title="发布内容">
				<p id="context"></p>
			</div>


		</div>

		</article>
	</div>
	</section>




	<script type="text/javascript">
		$(function() {
			//提示信息

			$("#dialog").dialog({
				autoOpen : false,
				width : 400,
				buttons : [ {
					text : "确认",
					click : function() {
						$(this).dialog("close");
					}
				}, {
					text : "取消",
					click : function() {
						$(this).dialog("close");
					}
				} ]
			});

			var lang = {
				"sProcessing" : "处理中...",
				"sLengthMenu" : "每页 _MENU_ 项",
				"sZeroRecords" : "没有匹配结果",
				"sInfo" : "当前显示第 _START_ 至 _END_ 项，共 _TOTAL_ 项。",
				"sInfoEmpty" : "当前显示第 0 至 0 项，共 0 项",
				"sInfoFiltered" : "(由 _MAX_ 项结果过滤)",
				"sInfoPostFix" : "",
				"sSearch" : "搜索:",
				"bSort" : false,
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

									$
											.ajax({
												type : "post",
												url : "grj/announcement/studentannouncement",
												cache : false, //禁用缓存
												data : param, //传入组装的参数
												dataType : "json",
												success : function(result) {
													/* alert(result);
													console.log(result); */
													//setTimeout仅为测试延迟效果
													//封装返回数据
													/* var returnData = {};
													returnData.data = result.data;//返回的数据列表
													console.log(returnData); */
													//调用DataTables提供的callback方法，代表数据已封装完成并传回DataTables进行渲染
													//此时的数据需确保正确无误，异常判断应在执行此回调前自行处理完毕
													/* alert(result.data.releaseTime);
													var mm=result.data;
													for(var i=0;i<mm.length;i++){
														alert(mm[i].releaseTime);
													} */
													callback(result);
												}

											});
								},
								//列表表头字段
								columns : [ {
									"data" : "uuid"
								}, {
									"data" : "title"
								}, {
									"data" : "promulgator"
								}, {
									"data" : "releaseTime"
								}, {
									"data" : ""
								}, ],
								columnDefs : [
										{
											targets : 4,
											render : function(data, type, row,
													meta) {
												return '<a type="button" class="btn btn-success" onclick=showContext(this) ><i class="Hui-iconfont">&#xe665;</i> 查看</a>';
											}
										}, {
											"orderable" : false,
											"targets" : 4
										}, ],
							}).api();

			
		});

		function showContext(a) {
			var table = $('#example').DataTable();
			var data = table.row($(a).parents('tr')).data();
			
			$("#context").text(data.conText);
			$("#dialog").dialog("open");

		}
	</script>

</body>
</html>
