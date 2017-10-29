<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Sub3Regist.jsp' starting page</title>
    
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
<script type="text/javascript" charset="utf8"
	src="http://code.jquery.com/jquery-1.10.2.min.js"></script>

<!-- DataTables -->
<script type="text/javascript" charset="utf8"
	src="js/jquery.dataTables.js"></script>


<style>
th {
	font-size: 13;
	align: center;
}

td {
	align: center;
}

#textDiv {
	margin-top: 20px;
}

H3 {
	display: inline;
}

a {
	display: inline-block;
}
</style>

</head>
<body>

	<section>

	<div class="Hui-article">



		<div>

			<h2 style="display:inline">科三报名</h2>
			<!-- 			<img src="images/dahuangfeng.jpg" -->
			<!-- 				style="width:100px;height:100px;margin-left:100px;"> -->
			<div style="float:right;margin-right:40%">
				<!-- 				<h3>当前用户用户：</h3> -->
				<!-- 				<h3 id="name"></h3> -->
				</br> </br> <br>
			</div>

		</div>
		<div class="cl pd-5 bg-1 bk-gray mt-20"></div>

		<div id="textDiv">
			<table id="example" class="display" cellspacing="0" width="100%">

				<thead>
					<tr>
						<th>学员学号</th>
						<th>学员姓名</th>
						<th>当前科目</th>
						<th></th>
					</tr>
				</thead>
				<tbody></tbody>
			</table>


		</div>
	</div>
	</section>




	<script type="text/javascript">
	
			//提示信息
         $(function(){
         var id = "${school.schUuid}";
         var subName = "科目三";
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
				"sEmptyTable" : "当前没有可报名学员",
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
									// 					param.limit = data.length;//页面显示记录条数，在页面显示每页显示多少项的时候
									// 					param.start = data.start;//开始的记录序号
									// 					param.page = (data.start / data.length) + 1;//当前页码
									//console.log(param);
									//ajax请求数据
									$.ajax({
										type : "post",
										url : "jjn/getS3FullTimeStudent",
										cache : false, //禁用缓存
										data : {
											"schUuid" : id,
											"subName" : subName,
										}, //传入组装的参数
										dataType : "json",
										success : function(result) {
											console.log(result);
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
									"data" : "stuId"
								}, {
									"data" : "stuName"
								}, {
									"data" : ""
								}, ],
								columnDefs : [
										{
											targets : 2,
											render : function(data, type, row,
													meta) {
												return '<a type="button" class="btn btn-success" onclick=submitChange(this) >报名</a>';
											}
										}, {
											"orderable" : false,
											"targets" : 2
										}, ],
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
		});

		function submitChange(a) {
			var table = $('#example').DataTable();
		    var data = table.row($(a).parents('tr')).data();
		    var stuUuid = data.stuUuid;
		    var examSub="科目三";
		    var examStatus="未开始";
		     alert(stuUuid);
			$.post("jjn/examRegist", {
				"stuUuid" : stuUuid,
				"examSub":examSub,
				"examStatus":examStatus,
			}, function(msg) {

				if (msg.result == true) {
					alert("报名成功");
					location.reload();

				} else {
					alert("当前考试人数已满，请等待新的考试安排");
				}
			});
		}
	</script>
</body>
</html>
