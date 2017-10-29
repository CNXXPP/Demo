<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>学员学时</title>
    
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
  

</style>

</head>
<body >
  
 <section  >

<div class="Hui-article">
		<article class="cl pd-20">
			<div class="text-c">
			
				<h2>学时查询</h2>
			</div>
			<div class="cl pd-5 bg-1 bk-gray mt-20">
				
				
			</div>
			<div class="mt-20">
				<table class="table table-border table-bordered table-bg table-hover table-sort" id="example">
					<thead>
						<tr class="text-c">
						<th width="60">学员ID</th>
						<th width="60">学员姓名</th>
						<th width="60">现在所在科目</th>
<!-- 						<th width="60">总学时</th> -->
						<th width="60">科目一累计学时</th>
						<th width="60">科目二累计学时</th>
						<th width="60">科目三累计学时</th>
						<th width="60">科目四累计学时</th>
						</tr>
					</thead>

				<tbody>

				</tbody>
			</table>
		</div>
		
		</article>
	</div>
	</section> 
  
   

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
								"lengthMenu": [[5,10, 15,20], [5,10, 15,20,"All"]], //显示多少页    后面是内容显示多少  要相对应 (可以不加  默认10)
								
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
										url : "cw/selectStudyHours",
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
									"data" : "STU_ID"
								}, {
									"data" : "STU_NAME"
								}, {
									"data" : "SUB_NAME"
								},{
									"data" : "CT_SUB1"
								},{
									"data" : "CT_SUB2"
								},{
									"data" : "CT_SUB3"
								},{
									"data" : "CT_SUB4"
								},],
// 								columnDefs : [
// 										{
// 											targets : 4,
// 											render : function(data, type, row,
// 													meta) {
// 												return '<a type="button" class="btn btn-success" onclick=updateById(this) >修改</a><a type="button" class="btn btn-danger" onclick=delFromID(this) >删除</a><a type="button" class="btn btn-info" onclick=resetPwd(this) >重置密码</a>';
// 											}
// 										}, {
// 											"orderable" : false,
// 											"targets" : 4
// 										}, ],
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


		
		
	</script>
	<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>
