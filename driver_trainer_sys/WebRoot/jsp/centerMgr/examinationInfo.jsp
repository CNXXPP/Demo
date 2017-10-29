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
<script language="javascript" type="text/javascript"
	src="My97DatePicker/WdatePicker.js"></script>


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

			<h2 style="display:inline">所有考试信息</h2>
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
						<th>考试时间</th>
						<th>考试科目</th>
						<th>考试地点</th>
						<th>考试人数</th>
						<th>考试状态</th>
						<th>考试安排员</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody></tbody>
			</table>

			<div style="visibility:hidden" id="edit">
				&nbsp;&nbsp;&nbsp;(可选)考试科目 :&nbsp;&nbsp;&nbsp; <select id="sub">
						<option value="科目一">科目一</option>
						<option value="科目二">科目二</option>
						<option value="科目三">科目三</option>
						<option value="科目四">科目四</option>
					</select>
				&nbsp;&nbsp;&nbsp;(可选)考试地点：&nbsp;&nbsp;&nbsp;<input id="loc"
					type='value'> &nbsp;&nbsp;&nbsp;(可选)考试人数
				:&nbsp;&nbsp;&nbsp; <input id="num" type='value'>
				&nbsp;&nbsp;&nbsp;(可选)考试时间 :&nbsp;&nbsp;&nbsp; <input id="date"
					class="Wdate" type="examDate"
					onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd HH:mm:ss'})">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(可选)考试状态：
				<select id="status">
						<option value="未开始">未开始</option>
						<option value="已开始">已开始</option>
						<option value="取消">取消</option>
						<option value="延期">延期</option>
						<option value="已结束">已结束</option>
						
					</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button class="btn btn-success" onclick="submitChange()">提交更改</button>
			</div>
			
		</div>
	</div>
	</section>




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
										url : "xp/examMgr/showAllExamInfo",
										cache : false, //禁用缓存
										data : param, //传入组装的参数
										dataType : "json",
										success : function(result) {
											result = result.result;
											console.log(result);
											// 											result = result.result;
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
									"data" : "EXAM_DATE"
								}, {
									"data" : "EXAM_SUB"
								}, {
									"data" : "EXAM_LOCATION"
								}, {
									"data" : "EXAM_MAX_NUM"
								}, {
									"data" : "EXAM_STATUS"
								}, {
									"data" : "ADM_NAME"
								}, {
									"data" : ""
								}, ],
								columnDefs : [
										{
											targets : 6,
											render : function(data, type, row,
													meta) {
												return '<a type="button" class="btn btn-success" onclick=updateInfo(this) >信息修改</a>';
											}
										}, {
											"orderable" : false,
											"targets" : 6,
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
		var data;
		function updateInfo(a) {
			var table = $('#example').DataTable();
		    data = table.row($(a).parents('tr')).data();
			//alert(table.row($(a).parents('tr')).data().admId);
			var schId = data.schId;
			$("#edit").css("visibility", "visible");
			$("#id").attr("value", schId);

		}
		 
		function submitChange() {
// 			alert($("#status option:selected").val());
			var regu = /^[1-9]\d*$/;
			var  examSub= $("#sub").val();
			var examLocation = $("#loc").val();
			var examMaxNum = $("#num").val();
			var examDate = $("#date").val();
			if(!regu.test(examMaxNum)){
				if(examMaxNum!=''){
					alert("考试人数请输入正整数！！！");
					return false;
				}
				
			}
			
			console.log(data.EXAM_DATE);
			console.log(data.EXAM_SUB);
			console.log(data.EXAM_LOCATION);
		
// 			location="xp/examMgr/updateExaminationInfo";
// 			$.post("xp/examMgr/updateExaminationInfo",{"examSub":examSub,"examLocation":examLocation,"examMaxNum":examMaxNum,"examDate":examDate},function(msg){
// 				alert("receive")
// 			});	
			$.ajax({
				url:"xp/examMgr/updateExaminationInfo",
				type:"post",
				data:{
					"examSub":examSub,"examLocation":examLocation,"examMaxNum":examMaxNum,"examDate":examDate,"examStatus":$("#status option:selected").val(),
					"date":data.EXAM_DATE,"sub":data.EXAM_SUB,"loc":data.EXAM_LOCATION
				},
				success:function(msg){
// 					alert(msg.result);
					if(msg.result==true){
						alert("修改成功");
						location.reload();
					}
				}
			})
		}
		
		function updateStatus(a){
			
		}
		
	</script>
</body>
</html>