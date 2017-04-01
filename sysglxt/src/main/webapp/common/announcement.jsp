<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>公告</title> 
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
    <!-- 时间轴 -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/jquery.eeyellow.Timeline.css" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
       
</head>
<body style="font-family:'黑体';font-size:16px">
    
    <div class="container" >
        <div class="row">
            <div class="col-md-12">
                <div class="VivaTimeline">
                    <dl id="announcementlist">
                                
                    </dl>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.eeyellow.Timeline.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('.VivaTimeline').vivaTimeline({
                carousel: true,
                carouselTime: 3000
            });
            
            $.ajax({
            	type:'post',
            	url:"${pageContext.request.contextPath}/anouncement/queryanouncement",
            	success:function(data){
            		$("#announcementlist").empty();
            		if(data.length==0){
            			$("#announcementlist").append("<h2>暂无视频</h2>")
            		}
            		for(var i=0;i<data.length;i++){
            			if(i%2==0){
	            			$("#announcementlist").append("<dd class='pos-left clearfix'>"
	            				                         +"<div class='circ'></div>"
	            				                         +"<div class='time' style='width:200px'>"+ (new Date(data[i].csy142).toLocaleDateString().replace(/\//g,"-").substr(0,8))+"</div>"
	            				                         +"<div class='events'>"
	            				                         +"<div class='events-header'>"+data[i].csy141+"</div>"
	            				                         +"<div class='events-body'>"
	            				                         +"<div class='row'>"
	            				                         +"<div class='events-desc' >"+data[i].csy143+"</div>"
	            				                         +"</div>"                                   
	            				                         +"</div>"
	            				                         +"</div>"
	            				                         +"</dd>");
            			}else{
            				$("#announcementlist").append("<dd class='pos-right clearfix'>"
                                    +"<div class='circ'></div>"
                                    +"<div class='time' style='width:105px'>"+ (new Date(data[i].csy142).toLocaleDateString().replace(/\//g,"-").substr(0,8))+"</div>"
                                    +"<div class='events'>"
                                    +"<div class='events-header'>"+data[i].csy141+"</div>"
                                    +"<div class='events-body'>"
                                    +"<div class='row'>"
                                    +"<div class='col-md-6 pull-left'>"
                                    +"</div>"
                                    +"<div class='events-desc'>"
                                    +data[i].csy143
                                    +"</div>"
                                    +"</div>"                                   
                                    +"</div>"
                                    +"</div>"
                                    +"</dd>");
            			}
            			
            		}
            	}
            });
        });
    </script>
</body>


</html>