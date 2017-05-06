<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>登录页面</title> 
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap-3.3.7/dist/css/bootstrap.min.css " />
    <!-- 弹窗js -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/sweetalert/sweetalert.min.js"></script>
    <!-- 弹窗css -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/sweetalert/sweetalert.css">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<body background="${pageContext.request.contextPath}/resources/img/log_bg2.jpg" >  
    <div id="log_form" style="background-color:white;width:300px;height:350px;border:1px solid blue;margin-right:100px;margin-top:100px;float:right;font-family:'黑体';border-radius:0.5">    
        <!-- 登陆表单 -->   
        <form id="log_form">
          <h3 style="align:center;color:#5A69A0;margin-left:30px">实验室资源管理平台</h3>    
          <div class="form-group" style="width:250px;margin-top:30px">
            <label for="username" style="font:16px;margin-left:20px">账号</label>
            <input type="text" class="form-control" id="username" placeholder="账号" style="margin-left:20px">
          </div>
          <div class="form-group"  style="width:250px">
            <label for="password" style="font:16px;margin-left:20px">密码</label>
            <input type="password"  class="form-control" id="password" placeholder="密码" style="margin-left:20px">
          </div>
          <div style="margin-left:42px">
            <label><input type="radio" name="usertype" value="1">学生</label>
            <label><input type="radio" name="usertype" value="2">教师</label>
            <label><input type="radio" name="usertype" value="3">科研</label>
            <label><input type="radio" name="usertype" value="4">管理员</label>
          </div>          
          <button  class="btn btn-default" type="button"  style="font:20px;margin-left:50px;width:80px;margin-top:20px" onclick="login()"><span class="glyphicon glyphicon-ok-circle" aria-hidden="true" style="top:2px"></span>登录</button>
          <button  class="btn btn-default" style="font:20px;margin-left:20px;width:80px;margin-top:20px"><span class="glyphicon glyphicon-remove-circle" aria-hidden="true" style="top:2px"></span>取消</button>
        </form>
    </div>
</body> 
</html>
<script type="text/javascript">
   function login(){
	   var csy010=$('input[name="usertype"]:checked').val();
	   var csy021=$('#username').val();
	   var csy022=$('#password').val();
	   if(!csy010){
		   sweetAlert("请选择人员类型");
		   return;
	   }
	   if(!csy021){
           sweetAlert("请输入账号");
           return;
       }
	   if(!csy022){
           sweetAlert("请输入密码");
           return;
       }
	   var sy02={
			   "csy010":csy010,
			   "csy021":csy021,
			   "csy022":csy022
	   };
	   
	   $.ajax({
		   type:"POST",
		   url:"${pageContext.request.contextPath}/login/toLogin",
		   contentType:"application/json;charset=utf-8",
		   data:JSON.stringify(sy02),
		   dataType: "json",
		   success:function(data){
			   if(data.statu=='error'){
				   sweetAlert("账号或密码错误");
				   return;
			   } 
			   window.location.href = "${pageContext.request.contextPath}/"+data.url;    
				   
              
            }  
	   });
   }
</script>