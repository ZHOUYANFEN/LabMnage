<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
     <title>主页</title>
     <script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery-easyui-1.5.1/jquery.min.js"></script>
       <!-- 引入EasyUI -->
     <script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery-easyui-1.5.1/jquery.easyui.min.js"></script>
       <!-- 引入EasyUI的中文国际化js，让EasyUI支持中文 -->
     <script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery-easyui-1.5.1/locale/easyui-lang-zh_CN.js"></script>
       <!-- 引入EasyUI的样式文件-->
     <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/jquery-easyui-1.5.1/themes/default/easyui.css" type="text/css"/>
       <!-- 引入EasyUI的图标样式文件-->
     <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/jquery-easyui-1.5.1/themes/icon.css" type="text/css"/>
     <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap-3.3.7/dist/css/bootstrap.min.css" > 
     <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/carousel-style.css"/>
     <script src="${pageContext.request.contextPath}/resources/js/carousel.js" type="text/javascript"></script>
     
     
     <style>
        body{background-color: #232323}
     </style>
     <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<body style="font-family:'黑体';width:1000px;margin:0 auto">
  <div id="banner">
    <div class="bannerCon">
        <div class="before"><img src="${pageContext.request.contextPath}/resources/img/pre.png" alt="" /></div>
        <div class="after"><img src="${pageContext.request.contextPath}/resources/img/next.png" alt="" /></div>
        <div class="scroll">
            <div class="item">
                <div class="img-box">
                    <img src='${pageContext.request.contextPath}/resources/img/2.jpg' alt="" /> 
                </div>
            </div>
            
            <div class="item">
                <div class="img-box" style="transform: scale(1.1);">
                   <img src='${pageContext.request.contextPath}/resources/img/3.jpg' alt="" />  
                </div>
            </div>
            <div class="item">
                <div class="img-box">
                   <img src='${pageContext.request.contextPath}/resources/img/5.jpg' alt="" /> 
                </div>
            </div>
            <div class="item">
                <div class="img-box">
                    <img src='${pageContext.request.contextPath}/resources/img/6.jpg' alt="" /> 
                </div>
            </div>
            
            <div class="item">
                <div class="img-box">
                    <img src='${pageContext.request.contextPath}/resources/img/2.jpg' alt="" /> 
                </div>
            </div>
        </div> 
    </div>
  </div>

</body>
  
</html>