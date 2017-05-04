<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>学生管理</title> 
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
    
        <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/bootstrap-3.3.7/dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap-3.3.7/dist/css/bootstrap.min.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/sweetalert/sweetalert.min.js"></script>
    <!-- 弹窗css -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/sweetalert/sweetalert.css">

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
    
    
    <link href="${pageContext.request.contextPath}/resources/css/jquery-ui-1.10.1.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/nigran.datepicker.css" rel="stylesheet">    
    <script src="${pageContext.request.contextPath}/resources/js/jquery-1.9.1.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-ui-1.10.1.min.js"></script>   
    
    <!--树型结构主要样式-->        
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css" /> 
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-1.7.2.min.js"></script>
    <link href="${pageContext.request.contextPath}/resources/css/video-js.css" rel="stylesheet">

   <!--  <style>
        #csy134{ width: 640px; height: 264; margin-left: auto; margin-right: auto; margin-top: 100px; }
    </style> -->
    
</head>
<body  style="font-family:'黑体';font-size:16px">
  
   <div style="float:left;margin-left:30px;margin-top:40px; width:280px;height:600px;padding:0">
   
        <div class="tree" id="treelist">
            <h3 align="center">实验课程列表</h3>
        </div>          
    </div>
    
    <div style="float:right;margin-right:30px;margin-top:40px; width:600px;height:600px;padding:0;">
        <div>
	        <button type="button" class="btn btn-default" aria-label="Left Align" id="addstudentBtn" data-toggle="modal" hidden="hidden" data-target="#studentlist" onclick="openwin(true)" style="margin-left:180px;margin-top:20px;float:left">
	            <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
	                            添加学生
	        </button> 
	        <button type="button" class="btn btn-default" aria-label="Left Align" id="delstudentBtn" hidden="hidden" style="margin-left:290px;margin-top:-35px;float:left">
	            <span class="glyphicon glyphicon-minus" aria-hidden="true"></span>
	                            删除学生
	        </button>
        </div>
        
        <div >
         <p id="current" hidden="hidden"></p>
	        <table class="table table-hover" id="students" style="font-size:10px;">
	            <tr id="stuhead">
	                <td style="width:20px"><input id="allcheck" type="checkbox" onclick="setCheckbox()"/></td>
	                <td >学号</td>
	                <td >姓名</td>
	                <td >学院</td>
	                <td >班级</td>
	                <td >操作</td>
	            </tr>
	        </table>
        </div>
    </div>

 <div class="modal fade bs-example-modal-lg" id="studentlist" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
  <div class="modal-dialog modal-lg" role="document">
    
    <div class="modal-content" >
	    <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 style="text-align:center">添加学生</h4>
	    </div>
       <div style="height:470px;margin:20px 20px">
	      <div class="tree" id="treelist2" style="width:200px;float:left">
	       </div> 
	       <div style="float:right;width:650px;height:430px;">
	         <h5 align="center">学生列表</h5>
	         <table class="table table-hover" id="students_model" style="font-size:10px;">
                <tr id="students_head">
                    <td style="width:20px"><input id="allcheck" type="checkbox" onclick="setCheckbox()"/></td>
                    <td >学号</td>
                    <td >姓名</td>
                    <td >学院</td>
                    <td >班级</td>
                    <td >操作</td>
                </tr>
            </table> 
	       </div> 
       </div>
       <button type="button" class="btn btn-default" aria-label="Left Align"  style="margin-left:280px;margin-top:-35px;float:left">
                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                                添加
       </button> 
       <button type="button" class="btn btn-default" aria-label="Left Align" style="margin-left:390px;margin-top:-35px;float:left">
                <span class="glyphicon glyphicon-minus" aria-hidden="true"></span>
                                删除
       </button>
       <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
      </div>
    </div>
  </div>
</div>
  


</body>
<script>  
$(document).ready(function () {
     
     
     $.ajax({
         type:'post',
         url:"${pageContext.request.contextPath}/teacher/queryCourse",
         success:function(data){
             for(var i=0;i<data.length;i++){
                 $("#treelist").append(" <ul>"
                                         +"<li>"
                                         +"<span onclick='queryStudentListByCourse("+data[i].csy060+",\""+data[i].csy061+"\")' id='"+data[i].csy061+"' style='width:180px;margin-left:-30px;cursor:pointer'><i class='icon-calendar' ></i> "+data[i].csy061+"</span>"                      
                                         +"</li>"
                                         +"</ul>");
             }
         }
     });
 });
 /*查询每个课程下对应的学生*/
 function queryStudentListByCourse(csy060,csy061){
	 $("#current").text(csy061);
	 $("#addstudentBtn").attr("hidden","");
	 $("#delstudentBtn").attr("hidden","");
	 $.ajax({
         type:'post',
         url:"${pageContext.request.contextPath}/teacher/queryStudentListByCourse?csy060="+csy060,
         success:function(data){
        	 $("#stuhead").siblings().remove();
             for(var i=0;i<data.length;i++){
                 $("#students").append("<tr>"
                                       +"<td style='width:20px'><input  type='checkbox' /></td>"
                                       +"<td >"+data[i].csy040+"</td>"
                                       +"<td >"+data[i].csy041+"</td>"
                                       +"<td >"+data[i].csy042+"</td>"
                                       +"<td >"+data[i].csy043+"</td>"
                                       +"<td >操作</td>"
                                       +"</tr>");
             }
         }
     });
 }
 function setCheckbox(){
	 if($('#allcheck').is(':checked')){
         $("[type='checkbox']").attr("checked",true);
     }else{
         $("[type='checkbox']").attr("checked",false);
     }
 }
 function openwin(flag){

     $.ajax({
         type:'post',
         url:"${pageContext.request.contextPath}/teacher/queryCollege",
         success:function(data){
        	 $("#treelist2").empty();
             for(var i=0;i<data.length;i++){
                 $("#treelist2").append(" <ul style='padding-left:0'>"
                                         +"<li >"
                                         +"<span onclick='queryClass(\"CSY042_"+data[i].aaa102+"\",event)' id='\"CSY042_"+data[i].aaa102+"\"' style='width:170px;cursor:pointer'><i class='icon-calendar' ></i> "+data[i].aaa103+"</span>"                      
                                         +"</li>"
                                         +"</ul>");
             }
         }
     });
 }
 function queryClass(querydata,e){
	 $('.tree li:has(ul)').addClass('parent_li').find(' > span').attr('title', 'Collapse this branch');
     var children = $("#"+querydata).parent('li.parent_li').find(' > ul');
     if (children.is(":visible")) {
           children.empty();
           $("#"+querydata).empty();
           children.hide('fast');
           $(this).attr('title', 'Expand this branch').find(' > i').addClass('icon-plus-sign').removeClass('icon-minus-sign');
     } else {
             children.show('fast');
             $(this).attr('title', 'Collapse this branch').find(' > i').addClass('icon-minus-sign').removeClass('icon-plus-sign');
             $.ajax({
                 type:'post',
                 url:"${pageContext.request.contextPath}/teacher/queryClass?aaa105="+querydata,
                 success:function(data){
                     $("#"+querydata).empty();
                     for(var i=0;i<data.length;i++){                          
                         $("#"+querydata).after("<ul>"
                                           +"<li>"
                                           +"<span onclick='queryStudentList("+data[i].aaa103+")' class='badge badge-success' style='cursor:pointer'><i class='icon-minus-sign'></i>"+data[i].aaa103+"</span>"
                                           /* +"<ul>"
                                           +"<li>"
                                           +"<span><i class='icon-time'></i>"+(new Date(data[i].csy136).toLocaleDateString().replace(/\//g,"-").substr(0,8))+"</span>"
                                           +"</li>"
                                           +"</ul>" */
                                           +"</li>"                                 
                                           +"</ul>");
                         
                         /* $("#resourcelist").append("<tr onclick='queryResourceDetail("+data[i].csy130+")' data-toggle='modal' data-target='#rosourcedetail'>"
                                                         +"<td >"+data[i].csy131+"</td>"
                                                         +"<td >上传人</td>"
                                                         +"<td >"+data[i].csy133+"</td>"
                                                         +"<td >"+(new Date(data[i].csy136).toLocaleDateString().replace(/\//g,"-").substr(0,8))+"</td>"
                                                         +"<td><button type='button' class='btn btn-primary btn-xs'  onclick='queryResourceDetail("+data[i].csy130+")'>详情</button>"
                                                         +"&nbsp<button type='button' class='btn btn-primary btn-xs' onclick='${pageContext.request.contextPath}/student/download?csy130="+data[i].csy130+"'><span class='glyphicon glyphicon-download' aria-hidden='true'></span>下载</button></td>"
                                                         +"</tr>"); */
                     }
                 }
             });
         }
     e.stopPropagation();
 }
 /*查询班级下的学生*/
 function queryStudentList(aaa103){
	 $.ajax({
         type:'post',
         url:"${pageContext.request.contextPath}/teacher/queryStudentList?csy043="+aaa103,
         success:function(data){
             $("#students_head").siblings().remove();
             for(var i=0;i<data.length;i++){
                 $("#students_model").append("<tr>"
						                         +"<td style='width:20px'><input  type='checkbox' /></td>"
						                         +"<td >"+data[i].csy040+"</td>"
						                         +"<td >"+data[i].csy041+"</td>"
						                         +"<td >"+data[i].csy042+"</td>"
						                         +"<td >"+data[i].csy043+"</td>"
						                         +"<td >操作</td>"
						                         +"</tr>");
             }
         }
     });
 }
</script>
</html>