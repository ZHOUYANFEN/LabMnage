<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>学生管理</title> 
    <%@include  file="/common/pt_head.jsp"%>
    
    
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
	        <button type="button" class="btn btn-default" aria-label="Left Align" id="addstudentBtn" data-toggle="modal" disabled="disabled" data-target="#studentlist" onclick="openwin()" style="margin-left:180px;margin-top:20px;float:left">
	            <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
	                            添加学生
	        </button> 
	        <button type="button" class="btn btn-default" aria-label="Left Align" id="delstudentBtn" onclick="deleteStudentInCourseBatch()" disabled="disabled" style="margin-left:290px;margin-top:-35px;float:left">
	            <span class="glyphicon glyphicon-minus" aria-hidden="true"></span>
	                            删除学生
	        </button>
        </div>
        
        <div >
         <p id="currentcourse" hidden="hidden"></p>
         <p id="currentcourseid" hidden="hidden"></p>
	        <table class="table table-hover" id="students" style="font-size:10px;">
	            <tr id="stuhead">
	                <td style="width:20px"><input id="allcheck" type="checkbox" onclick="setCheckbox('allcheck','students')"/></td>
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
	        <h4 style="text-align:center" id="model_head">添加学生</h4>
	    </div>
       <div style="height:470px;margin:20px 20px">
	      <div class="tree" id="treelist2" style="width:200px;float:left;margin-top:30px">
	       </div> 
	       <div style="float:right;width:650px;height:430px;">
	         <h5 align="center">学生列表</h5>
	         <table class="table table-hover" id="students_model" style="font-size:10px;">
                <tr id="students_head">
                    <td style="width:20px"><input id="allcheck_1" type="checkbox" onclick="setCheckbox('allcheck_1','students_model')"/></td>
                    <td >学号</td>
                    <td >姓名</td>
                    <td >学院</td>
                    <td >班级</td>
                </tr>
            </table> 
	       </div> 
       </div>
       <button type="button" class="btn btn-default" aria-label="Left Align" onclick="addStudentToCourse()"  style="margin-left:400px;margin-top:-35px;float:left">
                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                                添加
       </button> 
     <!--   <button type="button" class="btn btn-default" aria-label="Left Align" style="margin-left:430px;margin-top:-35px;float:left">
                <span class="glyphicon glyphicon-minus" aria-hidden="true"></span>
                                删除
       </button> -->
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
                                         +"<span onclick='queryStudentListByCourse(\""+data[i].csy060+"\",\""+data[i].csy061+"\")' id='"+data[i].csy061+"' style='width:180px;margin-left:-30px;cursor:pointer'><i class='icon-calendar' ></i> "+data[i].csy061+"</span>"                      
                                         +"</li>"
                                         +"</ul>");
             }
         }
     });
 });
 /*查询每个课程下对应的学生*/
 function queryStudentListByCourse(csy060,csy061){
	 $("#currentcourse").text(csy061);
	 $("#currentcourseid").text(csy060);
	 $("#addstudentBtn").attr("disabled",false);
	 $("#delstudentBtn").attr("disabled",false);
	 $.ajax({
         type:'post',
         url:"${pageContext.request.contextPath}/teacher/queryStudentListByCourse?csy060="+csy060,
         success:function(data){
        	 $("#stuhead").siblings().remove();
             for(var i=0;i<data.length;i++){
                 $("#students").append("<tr>"
                                       +"<td style='width:20px'><input  type='checkbox' id='"+data[i].csy040+"' /></td>"
                                       +"<td >"+data[i].csy040+"</td>"
                                       +"<td >"+data[i].csy041+"</td>"
                                       +"<td >"+data[i].csy042+"</td>"
                                       +"<td >"+data[i].csy043+"</td>"
                                       +"<td ><button type='button' class='btn btn-primary btn-xs ' onclick='deleteStudent(\""+data[i].csy040+"\","+csy060+")'>删除</button></td>"
                                       +"</tr>");
             }
         }
     });
 }
 function setCheckbox(chid,id){
	 if($('#'+chid).is(':checked')){
         $("[type='checkbox']","#"+id).attr("checked",true);
     }else{
         $("[type='checkbox']","#"+id).attr("checked",false);
     }
 }
 function openwin(){
	 var csy061= $("#currentcourse").text();
	 $("#model_head").text(csy061+"--->添加学生");
     $.ajax({
         type:'post',
         url:"${pageContext.request.contextPath}/teacher/queryCollege",
         success:function(data){
        	 $("#treelist2").empty();
             for(var i=0;i<data.length;i++){
                 $("#treelist2").append(" <ul style='padding-left:0;margin-left:-10px'>"
                                         +"<li >"
                                         +"<span onclick='queryClass(\"CSY042_"+data[i].aaa102+"\",event)' id='CSY042_"+data[i].aaa102+"' style='width:170px;cursor:pointer'><i class='icon-calendar' ></i> "+data[i].aaa103+"</span>"                      
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
           children.hide('fast');
           $(this).attr('title', 'Expand this branch').find(' > i').addClass('icon-plus-sign').removeClass('icon-minus-sign');
     } else {
             children.show('fast');
             $(this).attr('title', 'Collapse this branch').find(' > i').addClass('icon-minus-sign').removeClass('icon-plus-sign');
             $.ajax({
                 type:'post',
                 url:"${pageContext.request.contextPath}/teacher/queryClass?aaa105="+querydata,
                 success:function(data){
                     for(var i=0;i<data.length;i++){                          
                         $("#"+querydata).after("<ul style='margin-left:30px'>"
                                           +"<li>"
                                           +"<span onclick='queryStudentList(\""+data[i].aaa103+"\")' class='badge badge-success' style='cursor:pointer'><i class='icon-minus-sign'></i>"+data[i].aaa103+"</span>"  
                                           +"</li>"                                 
                                           +"</ul>");                                              
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
						                         +"<td style='width:20px'><input  type='checkbox' id='"+data[i].csy040+"' /></td>"
						                         +"<td >"+data[i].csy040+"</td>"
						                         +"<td >"+data[i].csy041+"</td>"
						                         +"<td >"+data[i].csy042+"</td>"
						                         +"<td >"+data[i].csy043+"</td>"
						                         +"</tr>");
             }
         }
     });
 }
 /*删除学生*/
 function deleteStudent(csy040,csy060){
	 var sy07={
			 'csy040':csy040,
			 'csy060':csy060
	 };
	 swal({  
         title:"",  
         text:"确认删除这个学生吗？",  
         type:"warning",  
         showCancelButton:"true",  
         showConfirmButton:"true",  
         confirmButtonText:"确定",  
         cancelButtonText:"取消",  
         animation:"slide-from-top"  
    }, function() {
		 $.ajax({
	         type:"POST",
	         url:"${pageContext.request.contextPath}/teacher/deleteStudent",
	         contentType:"application/json;charset=utf-8",
	         data:JSON.stringify(sy07),
	         dataType: "json",
	         success:function(data){
	        	 if(data.statu=="success"){
		        	 sweetAlert("删除成功");
		        	 var csy061 = $("#currentcourse").text();
		             if(!csy061){
		            	 sweetAlert("未知错误");
		             }else{
		            	 queryStudentListByCourse(csy060,csy061);
		             }
	        	 }else{
	        		 sweetAlert("删除失败");
	        	 }
	         }
		 });
    });
 }
 /*添加学生到*/
 function addStudentToCourse(){
	 var id_array=new Array();  
     $("[type='checkbox']:checked","#students_model").each(function(){  
         id_array.push($(this).attr('id'));//向数组中添加元素  
     });
     if(id_array.length<=0){
         sweetAlert("还没有选择数据");
         return;
     }
     var idstr=id_array.join(',');//将数组元素连接起来以构建一个字符串  
     var csy060 = $("#currentcourseid").text();
     var csy061 = $("#currentcourse").text();
     $.ajax({
         type:"POST",
         url:"${pageContext.request.contextPath}/teacher/validateStudentInCource?ids="+idstr+"&csy060="+csy060,
         success:function(data){
        	 var failList=data.failList;
        	 var failList_csy040Str=failList.join(",");
        	 var successList=data.successList;
             var successList_csy040Str=successList.join(",");
           	 swal({  
                    title:"",  
                    text:"学号为:"+failList_csy040Str+"的学生已经存在，确认添加学号为:"+successList_csy040Str+"的学生吗？",  
                    type:"warning",  
                    showCancelButton:"true",  
                    showConfirmButton:"true",  
                    confirmButtonText:"确定",  
                    cancelButtonText:"取消",  
                    animation:"slide-from-top"  
               }, function() {
            	   if(successList.length==0){
            		   sweetAlert("没有学生可以添加，请重新选择");
            	   }else{
	                    $.ajax({
	                        type:"POST",
	                        url:"${pageContext.request.contextPath}/teacher/addStudentToCourse?ids="+successList_csy040Str+"&csy060="+csy060,
	                        success:function(data){
	                            if(data.statu=='success'){
	                                $("#stuhead").siblings().remove();
	                                queryStudentListByCourse(csy060,csy061);
	                                sweetAlert("添加成功");
	                                $("#studentlist").modal('toggle');
	                            }else{
	                                sweetAlert("添加失败");
	                            }
	                        }
	                    });
            	   }
             });
         }
     });
     
 }
 /*批量删除学生*/
 function deleteStudentInCourseBatch(){
	 var id_array=new Array();  
     $("[type='checkbox']:checked","#students").each(function(){  
         id_array.push($(this).attr('id'));//向数组中添加元素  
     });
     if(id_array.length<=0){
         sweetAlert("还没有选择数据");
         return;
     }
     var idstr=id_array.join(',');//将数组元素连接起来以构建一个字符串  
     var csy060 = $("#currentcourseid").text();
     var csy061 = $("#currentcourse").text();
     swal({  
         title:"",  
         text:"确认删除这些学生吗？",  
         type:"warning",  
         showCancelButton:"true",  
         showConfirmButton:"true",  
         confirmButtonText:"确定",  
         cancelButtonText:"取消",  
         animation:"slide-from-top"  
    }, function() {
         $.ajax({
             type:"POST",
             url:"${pageContext.request.contextPath}/teacher/deleteStudentInCourseBatch?ids="+idstr+"&csy060="+csy060,
             success:function(data){
                 if(data.statu=="success"){
                	 queryStudentListByCourse(csy060,csy061);
                     sweetAlert("删除成功");
                 }else{
                     sweetAlert("删除失败");
                 }
             }
         });
    });
 }
</script>
</html>