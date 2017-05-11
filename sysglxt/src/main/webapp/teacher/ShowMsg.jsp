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
    <%@include  file="/common/pt_head.jsp"%>

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
