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

			<h2 style="display:inline">所有用户信息</h2>
			<!-- 			<img src="images/dahuangfeng.jpg" -->
			<!-- 				style="width:100px;height:100px;margin-left:100px;"> -->
			<div style="float:right;margin-right:40%">
				<h3>当前用户用户：</h3>
				<h3 id="name"></h3>
				</br> </br> <br>
			</div>

		</div>
		<div class="cl pd-5 bg-1 bk-gray mt-20"></div>

		<div id="textDiv">
			<table id="example" class="display" cellspacing="0" width="100%">

				<thead>
					<tr>
						<th>账号</th>
						<th>姓名</th>
						<th>创建时间</th>
						<th>角色</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody></tbody>
			</table>
			
		<div style="visibility:hidden" id="edit">
		&nbsp;&nbsp;&nbsp;账号 ：&nbsp;&nbsp;&nbsp;<input id="id"  type='value' disabled="true">
		&nbsp;&nbsp;&nbsp;(可选)用户名更改 ：&nbsp;&nbsp;&nbsp;<input id="n"  type='value'>
		&nbsp;&nbsp;&nbsp;(可选)角色项更改 :&nbsp;&nbsp;&nbsp; <select id="char">
					<option value="0">请选择</option>
					<option value="4">驾校管理员</option>
					<option value="3">考试安排员</option>
					<option value="2">公告管理员</option>
					<option value="5">考试审核员</option>
		</select>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class="btn btn-success" onclick="submitChange()">提交更改</button>
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
										url : "xp/centerMgr/showAllAdmin",
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
									"data" : "ADM_ID"
								}, {
									"data" : "ADM_NAME"
								}, {
									"data" : "ADM_DATE"
								}, {
									"data" : "CHAR_TYPE"
								},{
									"data" : ""
								}, ],
								columnDefs : [
										{
											targets : 4,
											render : function(data, type, row,
													meta) {
												return '<a type="button" class="btn btn-success" onclick=updateById(this) >修改</a><a type="button" class="btn btn-danger" onclick=delFromID(this) >删除</a><a type="button" class="btn btn-info" onclick=resetPwd(this) >重置密码</a>';
											}
										}, {
											"orderable" : false,
											"targets" : 4
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

		function delFromID(a) {
			var table = $('#example').DataTable();
			var data = table.row($(a).parents('tr')).data();
			//alert(table.row($(a).parents('tr')).data().admId);
			var admId = data.ADM_ID;
			if (admId == 10001) { //该用户为管理员
				alert("无法对自己进行操作");

				return false;
			}
			if (confirm("确定要删除该属性？")) {
				var pwd = prompt("请输入管理员密码:");
				// 		        	if(pwd == ${admin.admPwd}){
				table.row($(a).parents('tr')).remove().draw(); //移除该行
				$.post("xp/centerMgr/delAdmin", {
					"admId" : admId
				}, function(msg) {
					msg = msg.result;
					alert(msg);
					if (msg == "success") {
						alert("删除成功");
					} else {
						alert("删除失败");
					}
				})
				// 		        	}  
			}

		}
		function resetPwd(a) {
			var table = $('#example').DataTable();
			var data = table.row($(a).parents('tr')).data();
			//alert(table.row($(a).parents('tr')).data().admId);
			var admId = data.ADM_ID;
			if (admId == 10001) { //该用户为管理员
				alert("无法对自己进行操作");

				return false;
			}
			if (confirm("确定重置该用户密码？")) {
				var pwd = prompt("请输入管理员密码:");
				// 		        	if(pwd == ${admin.admPwd}){
				$.post("xp/centerMgr/resetAdminPwd", {
					"admId" : admId
				}, function(msg) {
					//alert(msg);
					msg = msg.result;
					if (msg == "success") {
						alert("密码重置成功");
					} else {
						alert("密码重置失败");
					}
				})
				// 		        	}  
			}

		}
		function updateById(a) {
			var table = $('#example').DataTable();
			var data = table.row($(a).parents('tr')).data();
			//alert(table.row($(a).parents('tr')).data().admId);
			var admId = data.ADM_ID;
			if (admId == 10001) { //该用户为管理员
				alert("无法对自己进行操作");

				return false;
			}	
			$("#edit").css("visibility","visible");
			$("#id").attr("value",admId);
			
		}
		function submitChange(){
			var amdId= $("#id").val()
			var newName = $("#n").val();
			var newCharNo = $("#char").val();
			
			$.post("xp/centerMgr/updateInfo",{"admId":amdId,"admName":newName,"charNo":newCharNo},function(msg){
				alert(msg.result);
			});
		}
	</script>
</body>
</html>
