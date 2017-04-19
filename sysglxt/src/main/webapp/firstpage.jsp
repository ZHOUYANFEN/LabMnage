<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>首页</title>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/carousel-style.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap-3.3.7/dist/css/bootstrap.min.css" />
        <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/bootstrap-3.3.7/dist/js/bootstrap.min.js"></script>
<!-- <style>
    body{background-color: #232323}
</style> -->
</head>
<body style="font-family:'黑体';font-size:16px">
<!--轮播图开始-->
<div id="banner">
    <div class="bannerCon">
        <div class="before"><img src="${pageContext.request.contextPath}/resources/img/pre.png" alt="" /></div>
        <div class="after"><img src="${pageContext.request.contextPath}/resources/img/next.png" alt="" /></div>
        <div class="scroll">
            <div class="item">
                <div class="img-box">
                    <img src='${pageContext.request.contextPath}/resources/img/6.jpg' alt="" /> 
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
<!--轮播图结束-->
<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/carousel.js" type="text/javascript"></script>
 <div style="margin-top:50px;">
	<address>
	  <h4 align='center'><strong>高校实验教学管理平台</strong><br></h4>
	    <h5 align='center'>付政俊 软件二班 631306050218 <br></h5>
	    <h5 align='center'>熊庆淋  计信<br></h5>
	</address>
    
 </div>
</body>
</html>
