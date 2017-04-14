<%@ page import="java.nio.file.Path" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh" class="no-js">

<head>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">    
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap-3.3.7/dist/css/bootstrap.min.css " />
        <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/bootstrap-3.3.7/dist/js/bootstrap.min.js"></script>
    <!-- 弹窗js -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/sweetalert/sweetalert.min.js"></script>
    <!-- 弹窗css -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/sweetalert/sweetalert.css">

    <!-- CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/login/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/login/css/supersized.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/login/css/style.css">


</head>

<body oncontextmenu="return false">

<div class="page-container">
    <input type="hidden" id="error" value="${error}"/>
    <h1>登录</h1>
    <form action="${pageContext.request.contextPath }/loginAdmin" method="post">
        <div>
            <input type="text" name="userName" class="username" placeholder="Username" autocomplete="off"/>
        </div>
        <div>
            <input type="password" name="password" class="password" placeholder="Password" oncontextmenu="return false"
                   onpaste="return false" />
        </div>   
        <button id="submit" type="submit">登录</button>
    </form>
    <div class="connect">
        <p>You never know what you can do till you try.</p>
        <p style="margin-top:20px;">除非你亲自尝试一下,否则你永远不知道你能做什么。</p>
    </div>
</div>
<div class="alert" style="display:none">
    <h2>消息</h2>
    <div class="alert_con">
        <p id="ts"></p>
        <p style="line-height:70px"><a class="btn">确定</a></p>
    </div>
</div>

<!-- Javascript -->
<!-- <script src="http://apps.bdimg.com/libs/jquery/1.6.4/jquery.min.js" type="text/javascript"></script> -->
<script src="${pageContext.request.contextPath }/resources/login/js/supersized.3.2.7.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/login/js/supersized-init.js"></script>
<script>
    $(".btn").click(function(){
        is_hide();
    })
    var u = $("input[name=username]");
    var p = $("input[name=password]");
    $("#submit").live('click',function(){
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
        $(".connect p").eq(1).animate({"left":"0%"}, 400);
    }
    function is_hide(){ $(".alert").animate({"top":"-40%"}, 300) }
    function is_show(){ $(".alert").show().animate({"top":"45%"}, 300) }
</script>
</body>

</html>
