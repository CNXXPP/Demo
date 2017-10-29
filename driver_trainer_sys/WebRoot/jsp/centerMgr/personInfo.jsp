<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'personInfo.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <div style="text-align: center">
    	<h1>欢迎使用福州驾驶员培训考试运营管理中心系统</h1>
    	<h2>个人信息</h2>
    	<h3>用户账号：${admin.admId }</h3>
    	<h3>用户姓名：${admin.admName }</h3>
    	<h3>用户角色：${adminMap.CHAR_TYPE }</h3>
    	<h3>上次登录时间：${adminMap.LAST_LOGIN_DATE }</h3>
    </div>
  </body>
</html>
