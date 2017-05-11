<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>成绩查看</title> 
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
   <h2 align="center">课程成绩</h2>
   <hr/>
   <div id="button_querymenu" style="margin-top:50px;margin-left:5px">
        <table class="table table-hover" id="syllabuslist" style="font-size:10px">
            <tr style="width:800px;" id="syllabushead">
                <td>课程名称</td>
                <td>教师</td>
                <td>课时</td>
                <td>学分</td>
                <td>班级</td>
                <td>成绩</td>
                <td>备注</td>
                <td>操作</td>
            </tr>
        </table>
        <div class="tcdPageCode"></div>
  </div>
  
   <div class="modal fade bs-example-modal-lg" id="gradedetail" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
      <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="myModalLabel">实验成绩详情</h4>
          </div>
          <div class="modal-body" style="height:400px">
                <table class="table table-hover" id="explist" style="font-size:10px">
            <tr style="width:800px;" id="gradeexp">
                <td>课程名称</td>
                <td>实验名称</td>
                <td>实验完成情况</td>
                <td>实验完成时间</td>
            </tr>
        </table>
        </div>
       <div class="modal-footer">
         <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
       </div>
      </div>
    </div>
  </div>
</body>
<script type="text/javascript">
  $(function(){
	   init(); 	 
  });
  function init(){
	  pageSize=10;
      queryGrade(1,pageSize);
       $.ajax({
           type:'POST',
           url:"${pageContext.request.contextPath}/student/getCount",
           success:function(data){
               $(".tcdPageCode").createPage({
                   pageCount:Math.ceil((data.count/pageSize)),
                   current:1,
                   backFn:function(pageNum){
                       queryGrade(pageNum,pageSize);
                   }
               }); 
           }
       });  
  }
  function queryGrade(pageNum,pageSize){
	  $.ajax({
          type:'POST',
          url:"${pageContext.request.contextPath}/student/queryGrade?pageNum="+pageNum+"&pageSize="+pageSize,
          success:function(data){
        	  $("#syllabushead").siblings().remove();
              for(var i=0;i<data.list.length;i++){             
                  $("#syllabuslist").append("<tr style='width:800px;'>"
                  +"<td>"+data.list[i].CSY061+"</td>"
                  +"<td>"+data.list[i].csy051+"</td>"
                  +"<td>"+data.list[i].CSY062+"</td>"
                  +"<td>"+data.list[i].CSY063+"</td>"
                  +"<td>"+data.list[i].CSY069+"</td>"
                  +"<td>"+data.list[i].csy071+"</td>"
                  +"<td>"+data.list[i].CSY068+"</td>"
                  +"<td ><button type='button' class='btn btn-primary btn-xs ' data-toggle='modal' data-target='#gradedetail'  onclick='queryGradeDetai("+data.list[i].CSY060+")'>"
                  +"<span class='glyphicon glyphicon-plus' aria-hidden='true'></span>"
                  +"详情"
                  +"</button></td>"
                  +"</tr>");
              }
          }
      });
  }
  /**查看详情*/
  function queryGradeDetai(csy060){
	  $.ajax({
          type:'POST',
          url:"${pageContext.request.contextPath}/student/queryGradeDetai?csy060="+csy060,
          success:function(data){
        	  $("#gradeexp").siblings().remove();
              for(var i=0;i<data.length;i++){
            	  $("#explist").append("<tr style='width:800px;' id='gradeexp'>"
						                  +"<td>"+data[i].csy061+"</td>"
						                  +"<td>"+data[i].csy081+"</td>"
						                  +"<td>"+data[i].csy094+"</td>"
						                  +"<td>"+data[i].csy092+"</td>"
						                  +"</tr>");
              }
          }
	  });
  }
</script>
</html>