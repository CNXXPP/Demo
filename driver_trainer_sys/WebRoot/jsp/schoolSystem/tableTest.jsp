<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'tableTest.jsp' starting page</title>
    
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
  

</style>

</head>
<body >
  
 <section  >

<div class="Hui-article">
		<article class="cl pd-20">
			<div class="text-c">
				
				<center><h2>公告中心</h2></center>
				
				
			</div>
			<div class="cl pd-5 bg-1 bk-gray mt-20">
				
				
			</div>
			<div class="mt-20">
				<table id="example" class="table table-border table-bordered table-bg table-hover table-sort">
				    <thead>
						<tr >
					
						    <th width = "80">标题</th>
						    <th width = "80">发布者</th>
						    <th width = "120">发布时间</th>
						    <th width = "120">查看</th>
						</tr>
					 </thead>
                     <tbody></tbody>
	

			   </table>
		  <!--  <input type="button" value="上一页" style="margin-left:40%" class="btn btn-primary radius"/>
		   0/1<input type="button" value="下一页" class="btn btn-primary radius"/> -->
		   <div id="context" style="display:none;background-color:rgba(255 ,246,143,0.5);position:fixed;width:100%;height:100%;top:10%;
    z-index:999;">
		       <input type="button" class="btn btn-danger" value="关闭" onclick="close()" style="margin-left:90%" />
		       <p id="text"></p>
		    </div>
		</div>
		
		</article>
	</div>
	</section> 
  
   

	
	<script type="text/javascript">
		
	$(function() {
		//提示信息
		var schUuid="${school.schUuid}";
		  var lang = {
			"sProcessing" : "处理中...",
			"sLengthMenu" : "每页 _MENU_ 项",
			"sZeroRecords" : "没有匹配结果",
			"sInfo" : "当前显示第 _START_ 至 _END_ 项，共 _TOTAL_ 项。",
			"sInfoEmpty" : "当前显示第 0 至 0 项，共 0 项",
			"sInfoFiltered" : "(由 _MAX_ 项结果过滤)",
			"sInfoPostFix" : "",
			"sSearch" : "搜索:",
			"bSort":false,
			"sUrl" : "",
			"sEmptyTable" : "当前没有公告",
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
								
								$.ajax({
									type : "post",
									url : "jjn/test",
									cache : false, //禁用缓存
									data : {"schUuid":schUuid}, //传入组装的参数
									dataType : "json",
									success : function(result) {
						
										callback(result);
									}
									
								});
							},
							//列表表头字段
							columns : [  {
								"data" : "anTitle"
							}, {
								"data" : "sender"																																																																																																																																																																																					
							}, {
								"data" : "anDate"
							},{
								"data" : ""
							}, ],
							columnDefs : [
									{
										targets : 3,
										render : function(data, type, row,
												meta) {
											return '<a type="button" class="btn btn-success" onclick=showContext(this) >查看</a><a type="button" class="btn btn-danger" onclick=delFromID(this) >删除</a>';
										}
									}, {
										"orderable" : false,
										"targets" : 3
									}, ],
						}).api(); 
 
    
		$("#context").click(function(){
			$("#context").css("display","none");
		});
	});
	
	 function showContext(a){
		var table = $('#example').DataTable();
		var data = table.row($(a).parents('tr')).data();
		$("#context").css("display","inline");
		$("#text").text(data.anContext);
		
	}
	
	function delFromID(a) {
			var table = $('#example').DataTable();
			var data = table.row($(a).parents('tr')).data();
			//alert(table.row($(a).parents('tr')).data().admId);
	
			if (confirm("确定要删除该公告？")) {
			
				table.row($(a).parents('tr')).remove().draw(); //移除该行
			
				$.post("jjn/delAnnounce", {
					"anUuid":data.anUuid,
				}, function(msg) {
					msg = msg.result;
					if (msg) {
						alert("删除成功");
					} else {
						alert("删除失败");
					}
				}); 
			}

		}
	
	
	</script>
	
</body>
</html>

