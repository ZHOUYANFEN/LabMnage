<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>成绩查看</title> 
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
    
    
    
   <!--  <link href="http://www.jq22.com/jquery/bootstrap-3.3.4.css" rel="stylesheet"> -->
    <link href="${pageContext.request.contextPath}/resources/css/fileinput.css" media="all" rel="stylesheet" type="text/css" />
    <!-- <script src="http://www.jq22.com/jquery/1.11.1/jquery.min.js"></script> -->
    <script src="${pageContext.request.contextPath}/resources/js/fileinput.js" type="text/javascript"></script>
   <!--  <script src="http://www.jq22.com/jquery/bootstrap-3.3.4.js" type="text/javascript"></script> -->
    
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<body  style="font-family:'黑体';font-size:16px">
  
    <h2 align="center">实验安排</h2>


    <div id="button_querymenu" style="margin-top:30px;margin-left:5px;width:950px">
        <table class="table table-hover" id="sy08" style="font-size:10px;margin-top:20px" >
            <tr style="width:600px;" id="menuhead">
                <td >课程</td>
                <td >实验名称</td>
                <td >布置时间</td>
                <td >截止时间</td>
                <td >操作</td>
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
          <div class="modal-body" style="height:400px">
                <div class="form-group">
                    <input id="file-4" type="file" class="file" data-upload-url="#">
                </div>
				<hr>
        </div>
       <div class="modal-footer">
         <button class="btn btn-default" type="reset">刷新</button>        
         <button type="button" class="btn btn-primary" id="btnSave_model" onclick="saveAnoucement()">提交</button>
         <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
       </div>
      </div>
    </div>
  </div>
  


</body>
<script>
   /* 
    $("#file-4").fileinput({
        uploadExtraData: {kvId: '10'}
    });
    $(".btn-warning").on('click', function() {
        if ($('#file-4').attr('disabled')) {
            $('#file-4').fileinput('enable');
        } else {
            $('#file-4').fileinput('disable');
        }
    });    
    $(".btn-info").on('click', function() {
        $('#file-4').fileinput('refresh', {previewClass:'bg-info'});
    });

    $(document).ready(function() {
        $("#test-upload").fileinput({
            'showPreview' : false,
            'allowedFileExtensions' : ['jpg', 'png','gif'],
            'elErrorContainer': '#errorBlock'
        });

    }); */
    
    
    $(function(){
    	$.ajax({
    		type:'post',
    		url:"${pageContext.request.contextPath}/student/queryExpList",
    		success:function(data){
    			$("#menuhead").siblings().remove();
    			for(var i=0;i<data.length;i++){
    			 $("#sy08").append("<tr style='width:600px;margin-left:20px'>"
	    				                +"<td >"+data[i].csy061+"</td>"
	    				                +"<td >"+data[i].CSY081+"</td>"
	    				                +"<td >"+data[i].CSY083+"</td>"
	    				                +"<td >"+data[i].CSY084+"</td>"
	    				                +"<td ><button type='button' class='btn btn-primary btn-xs ' data-toggle='modal' data-target='#uploadPage'  >"
	    				                +"<span class='glyphicon glyphicon-plus' aria-hidden='true'></span>"
	    				                +"提交报告"
	    				                +"</button></td>"
	    				                +" </tr>");
    			}
    		},
    	});
    })
</script>
</html>