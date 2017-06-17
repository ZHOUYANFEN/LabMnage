<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>公告</title> 
      <%@include  file="/common/pt_head.jsp"%>
    <!-- 时间轴 -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/jquery.eeyellow.Timeline.css" />
       
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
            			$("#announcementlist").append("<h2>暂无公告</h2>")
            		}
            		for(var i=0;i<data.length;i++){
            			if(i%2==0){
	            			$("#announcementlist").append("<dd class='pos-left clearfix'>"
	            				                         +"<div class='circ'></div>"
	            				                         +"<div class='time' style='width:200px'>"+ (new Date(data[i].csy142).toLocaleDateString().replace(/\//g,"-").substr(0,9))+"</div>"
	            				                         +"<div class='events'>"
	            				                         +"<div class='events-header'>"+data[i].csy141+"</div>"
	            				                         +"<div class='events-body' >"
	            				                         +"<div class='events-desc' >"+data[i].csy143+"</div>"                                 
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
                                    +"<div class='col-md-6 pull-left'>"
                                    +"</div>"
                                    +"<div class='events-desc'>"
                                    +data[i].csy143
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