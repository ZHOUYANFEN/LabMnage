<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>用户信息</title> 
     <%@include  file="/common/pt_head.jsp"%>
</head>
<body style="font-family:'黑体';font-size:16px">
    <div style="width:500px;height:600px;margin-left:250px;margin-top:20px;border:1px solid #B3B3B3" id="info">
      
    </div>
</body>
<script type="text/javascript">
    $(function(){
        $.ajax({
            type:'post',
            url:"${pageContext.request.contextPath}/user/getUserMessage",
            success:function(data){
            	$("#info").empty();
                if(data.sy02.csy010==1){
                	console.log(data);
                	$("#info").append("<h2 align='center'>个人信息</h2>"
                			                +"<div  style='margin-top:30px;margin-left:150px'>"
						                    +"<p>学号:"+data.sy04.csy040+"</p><hr/>"
						                    +"<p>姓名:"+data.sy04.csy041+"</p><hr/>"
						                    +"<p>学院:"+data.sy04.csy042+"</p><hr/>"
						                    +"<p>班级:"+data.sy04.csy043+"</p><hr/>"
						                    +"<p>用户类型:"+data.sy01.csy011+"</p>"
						                    +" </div>");
                	
                }else if(data.sy02.csy010==2){
                	$("#info").append("<h2 align='center'>个人信息</h2>"
                			+"<div  style='margin-top:30px;margin-left:150px'>"
                            +"<p>姓名:"+data.sy05.csy051+"</p><hr/>"
                            +"<p>学院:"+data.sy05.csy052+"</p><hr/>"
                            +"<p>职称:"+data.sy05.csy053+"</p><hr/>"
                            +"<p>用户类型:"+data.sy01.csy011+"</p><hr/>"
                            +" </div>");
                }else if(data.sy02.csy010==3){
                	$("#info").append("<h2 align='center'>个人信息</h2>"
                			+"<div  style='margin-top:30px;margin-left:150px'>"
                            +"<p>姓名:"+data.sy03.csy031+"</p><hr/>"
                            +"<p>职称："+data.sy03.csy032+"</p><hr/>"
                            +"<p>用户类型:"+data.sy01.csy011+"</p><hr/>"
                            +" </div>");
                }
            }
        });
    });
</script>
</html>