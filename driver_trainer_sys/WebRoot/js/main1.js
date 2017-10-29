layui.config({
	base : "js/"
}).use(['form','element','layer','jquery'],function(){
	var form = layui.form(),
		layer = parent.layer === undefined ? layui.layer : parent.layer,
		element = layui.element(),
		$ = layui.jquery;

	$(".panel a").on("click",function(){
		window.parent.addTab($(this));
	})

	//动态获取文章总数和待审核文章数量,最新文章
	

	//图片总数
	

	//用户数
	

	//新消息
	


	//数字格式化
	

	//系统基本参数
	

	//填充数据方法
 	

})
