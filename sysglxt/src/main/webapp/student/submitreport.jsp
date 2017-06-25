<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>成绩查看</title> 
      <%@include  file="/common/pt_head.jsp"%>
        
    <link href="${pageContext.request.contextPath}/resources/css/fileinput.css" media="all" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/resources/js/fileinput.js" type="text/javascript"></script>

    <link href="${pageContext.request.contextPath}/resources/css/jquery-ui-1.10.1.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/nigran.datepicker.css" rel="stylesheet">    
    <script src="${pageContext.request.contextPath}/resources/js/jquery-1.9.1.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-ui-1.10.1.min.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    
</head>
<body  style="font-family:'黑体';font-size:16px">
  
    <h2 align="center">实验列表</h2>
    <div id="button_querymenu" style="margin-top:20px">
     <div style="float:left;margin-bottom:3px">
            <!-- <label style="font-family:'黑体';font-size:16px">  -->课程名称:<!-- </label> -->
            <select style="width:122px;height:30px"  id="csy061"  class="form-control pull-right"></select>    
        </div>                    

                                         
        <button type="button" class="btn btn-default" aria-label="Left Align" style="float:right;margin-right:170px;margin-top:-5px" onclick="queryExp()">
            <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                                查询 
        </button>      
    </div>

    <div id="button_querymenu" style="margin-top:40px;margin-left:5px;width:950px">
        <table class="table table-hover" id="sy08" style="font-size:10px;margin-top:20px" >
            <tr style="width:600px;" id="menuhead">
                <th >课程</td>
                <th >实验名称</td>
                <th >布置时间</td>
                <th >截止时间</td>
               <!--  <th >完成状态</td> -->
                <th >操作</td>
            </tr>
        </table>      
    </div>

  <div class="modal fade bs-example-modal-lg" id="uploadPage" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
      <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="myModalLabel">上传实验报告</h4>
          </div>
          <div class="modal-body" style="height:550px">
                <div >
                    <h2 align="center" id="csy081"></h2>
			        <input id="csy080" hidden="hidden">
			        &nbsp;&nbsp;&nbsp;<span style="font-size:12px" id="csy061_model"></span>
			        &nbsp;&nbsp;&nbsp;<span style="font-size:12px" id="csy083"></span>
			        &nbsp;&nbsp;&nbsp;<span style="font-size:12px" id="csy084"></span>
			        &nbsp;&nbsp;&nbsp;<span style="font-size:12px" id="csy051"></span>
			        <p style="font-size:14px" id="csy082"></p>
                </div>
                <div class="form-group">
                    <input id="btnFile" name="btnFile" type="file" class="file" data-upload-url="${pageContext.request.contextPath}/student/uploadReport">
                </div>
				<hr>
        </div>
       <div class="modal-footer">
         <button class="btn btn-default" type="reset">刷新</button>        
         <button type="button" class="btn btn-primary" id="btnSave_model" onclick="saveReport()">提交</button>
         <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
       </div>
      </div>
    </div>
  </div>
  


</body>
<script>  
    $(function(){
    	/* $( "#csy084" ).datepicker({
            inline:true,
            showOtherMonths:true
        }).datepicker('widget').wrap('<div class="ll-skin-nigran"/>'); */
        queryExpList();
    	queryExpArrange();
    });
    function queryExpList(){
    	/*实验列表*/
        $.ajax({
            type:'post',
            url:"${pageContext.request.contextPath}/student/queryExpList",
            success:function(data){
            	 console.log(data);
                $("#menuhead").siblings().remove();
                for(var i=0;i<data.length;i++){
                if(data[i].csy096==1){
                    data[i].csy096='已完成';
                }else{
                    data[i].csy096='未完成';
                }
                 $("#sy08").append("<tr style='width:600px;margin-left:20px'>"
                                        +"<td >"+data[i].csy061+"</td>"
                                        +"<td >"+data[i].CSY081+"</td>"
                                        +"<td >"+data[i].CSY083+"</td>"
                                        +"<td >"+data[i].CSY084+"</td>"
                                        /* +"<td >"+data[i].csy096+"</td>" */
                                        +"<td ><button type='button' class='btn btn-primary btn-xs ' data-toggle='modal' data-target='#uploadPage' onclick='openUpload("+data[i].CSY080+")' >"
                                        +"<span class='glyphicon glyphicon-plus' aria-hidden='true'></span>"
                                        +"提交报告"
                                        +"</button></td>"
                                        +" </tr>");
                }
            }
        });
    }
    function queryExpArrange(){
    	/*实验课程列表*/
        $.ajax({
            type:'post',
            url:"${pageContext.request.contextPath}/student/queryExpArrange",
            success:function(data){
                for(var i=0;i<data.length;i++){
                    $("#csy061").append("<option value ='"+data[i].csy060+"'>"+data[i].csy061+" </option>");                  
                }
            }
        });
    }
    /*查询课程所属的实验*/
    function queryExp(){
    	var csy060=$("#csy061").val();
        var csy061=$("#csy061 >option:selected").text();
    	 $.ajax({
             type:"POST",
             url:"${pageContext.request.contextPath}/student/queryExpArrangeList?csy060="+csy060,
             success:function(data){
            	 console.log(data);
            	 $("#menuhead").siblings().remove();
                 for(var i=0;i<data.length;i++){
                  $("#sy08").append("<tr style='width:600px;margin-left:20px'>"
                                         +"<td >"+csy061+"</td>"
                                         +"<td >"+data[i].csy081+"</td>"
                                         +"<td >"+ (new Date(data[i].csy083).toLocaleDateString().replace(/\//g,"-").substr(0,9))+"</td>"
                                         +"<td >"+ (new Date(data[i].csy084).toLocaleDateString().replace(/\//g,"-").substr(0,9))+"</td>"
                              
                                         +"<td ><button type='button' class='btn btn-primary btn-xs ' data-toggle='modal' data-target='#uploadPage' onclick='openUpload("+data[i].csy080+")' >"
                                         +"<span class='glyphicon glyphicon-plus' aria-hidden='true'></span>"
                                         +"提交报告"
                                         +"</button></td>"
                                         +" </tr>");
                 }
             }
         });
    }
    /**打开提交报告页面*/
    function openUpload(csy080){
    	$.ajax({
            type:"POST",
            url:"${pageContext.request.contextPath}/student/queryExpArrangeContent?csy080="+csy080,
            success:function(data){
            	 $("#csy081").text(data[0].CSY081);
                 $("#csy080").val(data[0].CSY080);
                 $("#csy061_model").text("所属课程："+data[0].csy061);
                 $("#csy051").text("指导教师："+data[0].csy051);
                 $("#csy083").text("布置时间："+data[0].CSY083);
                 $("#csy084").text("完成时间："+data[0].CSY084);
                 $("#csy084").val(data[0].CSY084);
                 $("#csy083").val(data[0].CSY083);
                 $("#csy084").val(data[0].CSY084);
                 $("#csy082").html("内容："+data[0].CSY082);
            }
    	});
    }
    /**保存上传的实验报告*/
    function saveReport(){
    	var csy080 = $("#csy080").val();
    	var csy084 = $("#csy084").val();
    	if(myformatter(new Date())>csy084){
    		sweetAlert("超过提交时间，不能提交");
    		return;
    	}
    	$.ajax({
            type:"POST",
            url:"${pageContext.request.contextPath}/student/saveReport?csy080="+csy080,
            success:function(data){
            	if(data.statu==1){
            		 //$('#uploadPage').modal('toggle'); 
            		 sweetAlert("上传成功");
            		 $("#menuhead").siblings().remove();
            		 queryExpList();
            	}else{
            		sweetAlert("上传失败");
            	}
            }
    	});
    }
    /*时间处理*/
    function myformatter(date){  
        var y = date.getFullYear();  
        var m = date.getMonth()+1;  
        var d = date.getDate();  
        return y+'-'+(m<10?('0'+m):m)+'-'+(d<10?('0'+d):d);  
    }  
</script>
</html>