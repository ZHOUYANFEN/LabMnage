<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>课程表</title> 
    <%@include  file="/common/pt_head.jsp"%>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.page.js"></script>
    <style>
       a{ text-decoration:none;}
       a:hover{ text-decoration:none;}
       .tcdPageCode{padding: 15px 20px;text-align: left;color: #ccc;text-align:center;}
       .tcdPageCode a{display: inline-block;color: #428bca;display: inline-block;height: 25px; line-height: 25px;  padding: 0 10px;border: 1px solid #ddd; margin: 0 2px;border-radius: 4px;vertical-align: middle;}
       .tcdPageCode a:hover{text-decoration: none;border: 1px solid #428bca;}
       .tcdPageCode span.current{display: inline-block;height: 25px;line-height: 25px;padding: 0 10px;margin: 0 2px;color: #fff;background-color: #428bca; border: 1px solid #428bca;border-radius: 4px;vertical-align: middle;}
       .tcdPageCode span.disabled{ display: inline-block;height: 25px;line-height: 25px;padding: 0 10px;margin: 0 2px; color: #bfbfbf;background: #f2f2f2;border: 1px solid #bfbfbf;border-radius: 4px;vertical-align: middle;}
    </style>
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
               <!--  <td>班级</td> -->
                <td>备注</td>
            </tr>
        </table>
        <div class="tcdPageCode"></div>
     </div>
</body>
<script type="text/javascript">
  $(function(){
	 init();
  });
  function init(){
	  pageSize=10;
      syllabus(1,pageSize);
       $.ajax({
           type:'POST',
           url:"${pageContext.request.contextPath}/student/querySyllabusCount",
           success:function(data){
               $(".tcdPageCode").createPage({
                   pageCount:Math.ceil((data.count/pageSize)),
                   current:1,
                   backFn:function(pageNum){
                       syllabus(pageNum,pageSize);
                   }
               }); 
           }
       });     
  }
  function syllabus(pageNum,pageSize){
	  $.ajax({
          type:'POST',
          url:"${pageContext.request.contextPath}/student/syllabus?pageNum="+pageNum+"&pageSize="+pageSize,
          success:function(data){
              $("#syllabushead").siblings().remove();
              for(var i=0;i<data.list.length;i++){                 
                  $("#syllabuslist").append("<tr style='width:800px;'>"
                  +"<td>"+data.list[i].CSY061+"</td>"
                  +"<td>"+data.list[i].CSY050+"</td>"
                  +"<td>"+data.list[i].CSY062+"</td>"
                  +"<td>"+data.list[i].CSY063+"</td>"
                  +"<td>"+data.list[i].CSY064+"</td>"
                  +"<td>"+data.list[i].CSY066+"</td>"
                  /* +"<td>"+data.list[i].CSY069+"</td>" */
                  +"<td>"+data.list[i].CSY068+"</td>"
                  +"</tr>");
              }
          }
      });
  }
</script>
</html>