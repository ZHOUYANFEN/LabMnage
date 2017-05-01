<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>教师信息</title>
        <!-- 引入JQuery -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery-easyui-1.5.1/jquery.min.js"></script>
       <!-- 引入EasyUI -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery-easyui-1.5.1/jquery.easyui.min.js"></script>
       <!-- 引入EasyUI的中文国际化js，让EasyUI支持中文 -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery-easyui-1.5.1/locale/easyui-lang-zh_CN.js"></script>
       <!-- 引入EasyUI的样式文件-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/jquery-easyui-1.5.1/themes/default/easyui.css" type="text/css"/>
       <!-- 引入EasyUI的图标样式文件-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/jquery-easyui-1.5.1/themes/icon.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap-3.3.7/dist/css/bootstrap.min.css" />
        <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/bootstrap-3.3.7/dist/js/bootstrap.min.js"></script>
   <script type="text/javascript" src="${pageContext.request.contextPath}/resources/sweetalert/sweetalert.min.js"></script>
    <!-- 弹窗css -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/sweetalert/sweetalert.css">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

  </head>
  
  <body  style="font-family:'黑体';font-size:16px">
  	<h2>个人信息</h2>
    <form id="form" method="post" action="teacher/query" class="table table-hover">
		<table class="table table-hover" id="teacherList" style="font-size:10px">
			<tr style="width:800px;">
				<th width="60"><input type="checkbox" id="idAll" />序号</th>
				<th width="60">教师id</th>
				<th>姓名</th>
				<th>学院</th>
				<th>职称</th>
			</tr>
		</table>
  </body>
  <script type="text/javascript">
  $(function(){
	  $.ajax({
		  type:'POST',
		  url:"${pageContext.request.contextPath}/teacher/query",
          success:function(data){
        	  console.log(data)
        	  $("#teacherList").siblings().remove();
        	  for(var i=0;i<data.length;i++){        		  
        		  $("#teacherList").append("<tr style='width:800px;'>"
        		  +"<td><input type='checkbox' id='id' /></td>"
                  +"<td>"+data[i].csy020+"</td>"
                  +"<td>"+data[i].csy051+"</td>"
                  +"<td>"+data[i].csy052+"</td>"
                  +"<td>"+data[i].csy053+"</td>"
                  +"</tr>");
        	  }
          }
	  });
  });
  </script>
</html>
