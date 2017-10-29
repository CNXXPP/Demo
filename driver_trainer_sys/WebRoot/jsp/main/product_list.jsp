<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>驾校展示</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="js/jquery-2.2.1.js"></script>
	
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

	<link href="jsp/main/css/animate.css" rel="stylesheet">
	<link href="jsp/main/css/style.css" rel="stylesheet">
	<script src="jsp/main/Script/wow.min.js" type="text/javascript"></script>
	
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
	if (!(/msie [6|7|8|9]/i.test(navigator.userAgent))){
		new WOW().init();
	};
	
	$(function(){
	
	
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
									url : "cw/allSchool",
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
								"data" : "SCH_NAME"
							}, {
								"data" : "SCH_INTRO"
							}, {
								"data" : "SCH_SCORE"
							},{
								"data" : "CREATE_DATE"
							},{
								"data" : "SCH_LOCATION"
							},{
								"data" : "SCH_PHONE"
							},{
								"data" : ""
							},],
								columnDefs : [
								{
									targets : 6,
									render : function(data, type, row,
											meta) {
										return '<a type="button" class="btn btn-success" onclick=applyById(this) >报名</a>';
									}
								}, {
									"orderable" : false,
									"targets" : 6
								}, ],
						}).api();
		
	});
	
	function applyById(a){
		
		var table = $("#example").DataTable();
		var data = table.row($(a).parents('tr')).data();
		
	 
        
		$.post("grj/student/savaSchUuid",
				{schUuid:data.SCH_UUID},
				function(result){
					location="jsp/studentSystem/studentRegister.jsp";
				}
				);
		
		
	}
	
	
	
	
	
	</script>
	
	<style type="text/css">
	
		#title{
			
			font-size:18px;
			font-weight:900;
		}
	
	</style>

  </head>
  
  <body>

    
    
    <nav>
    	<div class="top_big">
            <div class="top_left">
                <a href="#"><img src="jsp/main/img/logo.png"></a>
            	<div class="logo_zi">
                    <p id = "title">福州驾驶运营管理中心<p> 
                </div>
                <div class="clear"></div>  
            </div>
            <div class="top_right">
            	<ul>
                	<li><a href="jsp/main/index.jsp">首页</a></li>
                    <li class="active"><a href="jsp/main/product_list.jsp">驾校展示</a></li>
                    <li><a href="jsp/main/new_list.jsp">新闻资讯</a></li>
                	<li><a href="jsp/centerMgr/centerLogin.jsp">运管登录</a></li>
                    <li><a href="jsp/examination/login.jsp">正式考试</a></li>
                    <li><a href="jsp/login.jsp">驾校相关登录</a></li>
                    <li><a href="jsp/theorySystem/login.jsp">学习平台</a></li><div class="clear"></div>
                </ul>
            </div>
            <div class="clear"></div>
        <div>
    </nav>
    <!---------------------nav  end---------------------->
    
    
    <div class="zp_banner">
    	<div class="banner_p"><a href="#"><img src="jsp/main/img/news_banner.png"/></a></div>
        <div class="zp_banner_p bounceInRight wow" data-wow-duration="1.2s"><p>携手一起去创造驾校发展的美好明天</p></div>
    </div>
    
    
<!----------------zp_banner  end--------------------------------->    

	<div class="zp_content_big mb40">

			<div class="mt-20">
				<table class="table table-border table-bordered table-bg table-hover table-sort" id="example">
				<thead>
					<tr class="text-c">
						<th>驾校名字</th>
						<th>驾校简介</th>
						<th>驾校分数</th>
						<th>创建日期</th>
						<th>驾校地址</th>
						<th>驾校电话</th>
						<th></th>
					</tr>
				</thead>

				<tbody>

				</tbody>
			</table>
		</div>

    </div>
<!-----------------zp_content_big end--------------------------------->  

 
    
<footer class="pt20">
	<div class="footer pb50">
    	<div class="footer_left ml50">
        	<ul>
            	<li class="qq">
                	<a href="#"><img src="jsp/main/img/qq.png"/></a>
                     <div class="qq_erweima"></div>
                </li>
                <li class="wb">
                    <a href="#"><img src="jsp/main/img/wb.png"/></a>
                    <div class="wb_erweima"</div>
                </li>
                <li class="wx">
                	<a href="#"><img src="jsp/main/img/wx.png"/></a>
                 	<div class="wx_erweima"></div>
                </li>
            </ul>
           
        </div>
        <div class="footer_right">
        	<ul>
        	<li class="footer_li">
            	<div><a href="#"><img src="jsp/main/img/foot_icon_one.png"/> | 关于我们</a></div>
            	<ul>
                	<li><a href="#">了解我们</a></li>
                </ul>                
            </li>
            
            <li class="footer_li">
            	<div><a href="#"><img src="jsp/main/img/foot_icon_two.png"/> | 便民服务</a></div>
            	<ul>
                	<li><a href="#">试验室信息管理软件</a></li>

                </ul>                
            </li>
            
            <li class="footer_li">
            	<div><a href="#"><img src="jsp/main/img/foot_icon_three.png"/> | 人员招聘</a></div>
            	<ul>                	
                    <li><a href="#">Winform高级软件工程师</a></li>
                </ul>                
            </li><div class="clear"></div>
            
            </ul>
        </div>
        <div class="clear"></div>
    </div>


  </body>
</html>
