<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>学习资源</title> 
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
    
    
    <link href="${pageContext.request.contextPath}/resources/css/jquery-ui-1.10.1.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/nigran.datepicker.css" rel="stylesheet">    
    <script src="${pageContext.request.contextPath}/resources/js/jquery-1.9.1.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-ui-1.10.1.min.js"></script>   
    
    <!--树型结构主要样式-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" />
        
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css" /> 
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-1.7.2.min.js"></script>
    
    
</head>
<body style="font-family:'黑体';font-size:16px">
    <!-- <div id="button_querymenu" style="margin-top:20px;margin-left:60px">                    
                     资源名称:<input type="text" name="csy021" width="100px" id="csy131">
                     资源类型:<input type="text" name="csy021" width="100px" id="csy132">
                     上传时间:
         <article style="float:right;margin-right:170px;margin-top:1px">
	        <div>
	            <input type="text" id="csy136" />
	        </div>
         </article>
        <button type="button" class="btn btn-default" aria-label="Left Align" style="float:right;margin-right:-280px" >
            <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                                查询 
        </button>      
    </div> -->

    <div style="float:left;margin-left:30px;margin-top:40px; width:280px;height:600px;padding:0">
   
        <div class="tree" id="treelist">
            <h3 align="center">资源列表</h3>
        </div>          
    </div>
    

    


    
</body>
    <script type="text/javascript">
        $(document).ready(function () {
           
           /*  $( "#csy136" ).datepicker({
                inline:true,
                showOtherMonths:true
            }).datepicker('widget').wrap('<div class="ll-skin-nigran"/>'); */
            
            
            $.ajax({
                type:'post',
                url:"${pageContext.request.contextPath}/student/queryResourceType",
                success:function(data){
                	for(var i=0;i<data.length;i++){
                        $("#treelist").append(" <ul>"
                                                +"<li>"
                                                +"<span onclick='queryResourceList("+data[i].csy130+",event)' id='"+data[i].csy130+"' style='width:200px;margin-left:-30px'><i class='icon-calendar' ></i> "+data[i].csy131+"</span>"                      
                                                +"</li>"
                                                +"</ul>");
                    }
                }
            });
        });
    </script>

</html>