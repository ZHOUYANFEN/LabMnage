<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>课程表</title> 
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
   <h2 align="center">课程表</h2>
   <hr/>
   <div id="button_querymenu" style="margin-top:50px;margin-left:5px">
        <table class="table table-hover" id="syllabuslist" style="font-size:10px">
            <tr style="width:800px;" id="syllabushead">
                <td>课程名称</td>
                <td>教师</td>
                <td>课时</td>
                <td>学分</td>
                <td>开放时间</td>
                <td>地点</td>
                <td>班级</td>
                <td>备注</td>
            </tr>
        </table>
     </div>
</body>
<script type="text/javascript">
  $(function(){
	  $.ajax({
		  type:'POST',
		  url:"${pageContext.request.contextPath}/student/syllabus",
          success:function(data){
        	  $("#syllabushead").siblings().remove();
        	  for(var i=0;i<data.length;i++){        		  
        		  $("#syllabuslist").append("<tr style='width:800px;'>"
                  +"<td>"+data[i].CSY061+"</td>"
                  +"<td>"+data[i].CSY050+"</td>"
                  +"<td>"+data[i].CSY062+"</td>"
                  +"<td>"+data[i].CSY063+"</td>"
                  +"<td>"+data[i].CSY064+"</td>"
                  +"<td>"+data[i].CSY066+"</td>"
                  +"<td>"+data[i].CSY069+"</td>"
                  +"<td>"+data[i].CSY068+"</td>"
                  +"</tr>");
        	  }
          }
	  });
  });
</script>
</html>