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

#hidden {
	height: 80%;
	width: 80%;
	position: fixed;
	z-index: 2;
	background-color: #5A758B;
	opacity: 0.9;
	margin-left:10%;
	margin-top:5%;
}

#but {
	z-index: 100;
	float: right;
	
	width: 32px;
	height:33px
}
img{
	display: inline-block;
	width: 31%;
	height:100%;
}
</style>

</head>
<body>
	<div id="hidden" style="display:none">
<!-- 		<button class="btn btn-danger" id="but" type="button" onclick="but()"> -->
<!-- 			关闭</button> -->
		<img id="but" alt="" src="images/close222.png" onclick="a()">
	<img id="img1" alt="" src=""><img id="img2" alt="" src=""><img
				id="img3" alt="" src="">	

	</div>
	<section>

	<div class="Hui-article">



		<div>

			<h2 style="display:inline">考生信息</h2>
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
						<th>考试地点</th>
						<th>考试时间</th>
						<th>考试科目</th>
						<th>考试状态</th>
						<th>考生ID</th>
						<th>考生姓名</th>
						<th>考生性别</th>
						<th>考生身份证号</th>
						<th>考生所属驾校</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody></tbody>
			</table>
			
			<!-- <div style="visibility:hidden" id="edit">
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
						<option value="正常">正常</option>
						<option value="取消">取消</option>
						<option value="延期">延期</option>
						
					</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button class="btn btn-success" onclick="submitChange()">提交更改</button>
			</div> -->

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
										url : "xp/examMgr/examStuInfo",
										cache : false, //禁用缓存
										data : param, //传入组装的参数
										dataType : "json",
										success : function(result) {
											result = result.result;
											console.log(result);

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
									"data" : "EXAM_LOCATION"
								}, {
									"data" : "EXAM_DATE"
								}, {
									"data" : "EXAM_SUB"
								}, {
									"data" : "EXAM_STATUS"
								}, {
									"data" : "STU_ID"
								}, {
									"data" : "STU_NAME"
								}, {
									"data" : "STU_GENDER"
								}, {
									"data" : "STU_IDENTITY"
								}, {
									"data" : "SCH_NAME"
								}, {
									"data" : ""
								} ],
								columnDefs : [
										{
											targets : 9,
											render : function(data, type, row,
													meta) {
												return '<a type="button" class="btn btn-success" onclick=checkPho(this) >查看考试照片</a><a type="button" class="btn btn-danger" onclick=del(this) >取消考试资格</a>';
											}
										}, {
											"orderable" : false,
											"targets" : 9,
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
		}

		function del(a) {
			var table = $('#example').DataTable();
			data = table.row($(a).parents('tr')).data();
			if (!confirm("确定要删除该考生报名信息？")) {
				return false;
			}
			if(data.EXAM_STATUS != '未开始'){
				alert("删除失败，考试已开始！");
			}
			
			$.post("xp/examMgr/delExamRegister", {
				"stuIdentity" : data.STU_IDENTITY,
				"date" : data.EXAM_DATE,
				"sub" : data.EXAM_SUB,
				"loc" : data.EXAM_LOCATION
			}, function(map) {
				if (map.result == true) {
					alert("操作成功");
					table.row($(a).parents('tr')).remove().draw(); //移除该行
				}
			});
		}

		function checkPho(a) {
			var table = $('#example').DataTable();
			data = table.row($(a).parents('tr')).data();
			if (data.EXAM_STATUS != '已结束') {
				alert('考试未结束');
				return false;
			}
			$.post("xp/examMgr/getStuPhoInfo", {
				"stuIdentity" : data.STU_IDENTITY,
			}, function(map) {
				if (map.result == true) {
					
					$("#hidden").attr("style","display:block");
					$("#img1").attr("src", "xp/examMgr/getStuPho?index=0");
					$("#img2").attr("src", "xp/examMgr/getStuPho?index=1");
					$("#img3").attr("src", "xp/examMgr/getStuPho?index=2");
				}
			});
		}
		function a(){
			   
			   $("#hidden").attr("style","display:none");
		   
		   }	
	</script>
</body>

</html>
