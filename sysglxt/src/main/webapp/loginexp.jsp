<%@ page import="java.nio.file.Path" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh" class="no-js">

<head>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">    
    <title>登录页面</title> 
           <!-- 引入JQuery -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-1.11.0.min.js"></script>       
        <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/bootstrap-3.3.7/dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap-3.3.7/dist/css/bootstrap.min.css " />
    <!-- 弹窗js -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/sweetalert/sweetalert.min.js"></script>
    <!-- 弹窗css -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/sweetalert/sweetalert.css">

    <!-- CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/login/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/login/css/supersized.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/login/css/style.css">

    <script src="${pageContext.request.contextPath }/resources/login/js/supersized.3.2.7.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/login/js/supersized-init.js"></script>


</head>

<body oncontextmenu="return false" style="font-family:'黑体';width:1300px;margin:0 auto">

<div class="page-container">
    <input hidden="hidden"  id="error" value="${error}"/>
    <h1 style="color:black">高校实验课程教学管理平台</h1>
<!--     <h1 style="color:black">登录</h1> -->
    <form action="${pageContext.request.contextPath }/userlogin/tologin" method="post">
        <div>
            <input type="text" name="csy021" class="username" placeholder="Username" autocomplete="off"/>
        </div>
        <div>
            <input type="password" name="csy022" class="password" placeholder="Password" oncontextmenu="return false"
                   onpaste="return false" />
        </div>
         <div style="margin-left:12px;margin-top:7px">
            <label style="color:black"><input type="radio" name="csy010" value="1" style="width:15px;height:15px;">学生</label>
            <label style="color:black"><input type="radio" name="csy010" value="2" style="width:15px;height:15px;">教师</label>
            <label style="color:black"><input type="radio" name="csy010" value="3" style="width:15px;height:15px;">科研</label>
            <label style="color:black"><input type="radio" name="csy010" value="4" style="width:15px;height:15px;">管理员</label>
          </div>   
        <button id="submit" type="submit" style="font-family:'黑体';font-size:20px">登录</button>
    </form>
</div>
<div class="alert" style="display:none">
    <h2>消息</h2>
    <div class="alert_con">
        <p id="ts"></p>
        <p style="line-height:40px"><a class="btn">确定</a></p>
    </div>
</div>


<script src="${pageContext.request.contextPath }/resources/login/js/supersized.3.2.7.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/login/js/supersized-init.js"></script>
<script>

    $(".btn").click(function(){
        is_hide();
    })
    var u = $("input[name=username]");
    var p = $("input[name=password]");
    $("#submit").click(function(){
        if(u.val() == '' || p.val() =='')
        {
            $("#ts").html("用户名或密码不能为空~");
            is_show();
            return false;
        }
        else{
            var reg = /^[0-9A-Za-z]+$/;
            if(!reg.exec(u.val()))
            {
                $("#ts").html("用户名错误");
                is_show();
                return false;
            }
        }
    });
    window.onload = function()
    {
        var error = $("#error").val() ;
        if(error != ""){
            $("#ts").html("用户名或密码错误！");
            is_show();
        }
        $(".connect p").eq(0).animate({"left":"0%"}, 600);
        $(".connect p").eq(1).animate({"left":"0%"}, 500);
    }
    function is_hide(){ $(".alert").animate({"top":"-40%"}, 300) }
    function is_show(){ $(".alert").show().animate({"top":"40%"}, 300) }
</script>
</body>

</html>
