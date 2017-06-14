<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">   
    <title>课程管理</title>   
	<%@include  file="/common/pt_head.jsp"%>

  </head>
  
  <body  style="font-family:'黑体';font-size:16px">
     
  </body>
  <script type="text/javascript">
  	
  </script>
</html>
