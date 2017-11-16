<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript" charset="utf8"
	src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
</head>
<body>

<script type="text/javascript">
	var a = [];
	var b = {
		name:"123",
		age : "asdfasdf"
	};
	var c = {
			name:"123",
			age : "asdfasdf"
		};
	a.push(b);
	a.push(c);
	var c={
			list:a
	};
	console.log(JSON.stringify(c));
	console.log(c);
	$.post("xp/testJson",{"json":JSON.stringify(c)},function(){
		
	});
</script>
</body>
</html>