<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%

String path =request.getContextPath();

String basePath =request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<<link rel="stylesheet" type="text/css"
	href="<%=basePath%>ext/ext-theme-neptune/build/resources/ext-theme-neptune-all.css">

<script type="text/javascript" src="<%=basePath%>ext/ext-all.js"></script>

<script type="text/javascript" src="<%=basePath%>ext/ext-bootstrap.js"></script>

<script type="text/javascript" src="<%=basePath%>ext/ext-theme-neptune/build/ext-theme-neptune.js"></script>


<script type="text/javascript" src="<%=basePath%>js/jquery-1.7.1.js"></script>
<script type="text/javascript" src="<%=basePath%>js/treegridData.js"></script>
<script type="text/javascript" src="<%=basePath%>js/treegrid.js"></script>
</head>
<body>


</body>
</html>