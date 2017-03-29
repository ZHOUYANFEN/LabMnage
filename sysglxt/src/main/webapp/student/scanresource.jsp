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
    <!-- 时间轴 -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/jquery.eeyellow.Timeline.css" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
       
</head>
<body style="font-family:'黑体';font-size:16px">
    <div id="button_querymenu" style="margin-top:20px;margin-left:60px">                    
                     资源名称:<input type="text" name="csy021" width="100px" id="csy131">
                     资源类型:<input type="text" name="csy021" width="100px" id="csy132">
                     上传时间:<input type="text" name="csy021" width="100px" id="csy136">
        <button type="button" class="btn btn-default" aria-label="Left Align" style="float:right;margin-right:70px" >
            <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                                查询 
        </button>      
    </div>
    <div class="container" >
        <div class="row">
            <div class="col-md-12">
                <div class="VivaTimeline">
                    <dl>
                        <dt>2016.12</dt>
                        <dd class="pos-left clearfix">
                            <div class="circ"></div>
                            <div class="time">12.23</div>
                            <div class="events">
                                <div class="events-header">资源一</div>
                                <div class="events-body">
                                    <div class="row">
                                        <div class="col-md-6 pull-left">
                                            <img class="events-object img-responsive img-rounded" src="${pageContext.request.contextPath}/resources/img/dog01.png" />
                                        </div>
                                        <div class="events-desc">
                                           
                                        </div>
                                    </div>                                    
                                </div>
                            </div>
                        </dd>
                        <dt>2017.3</dt>
                        <dd class="pos-right clearfix">
                            <div class="circ"></div>
                            <div class="time">3.21</div>
                            <div class="events">
                                <div class="events-header">资源二</div>
                                <div class="events-body">
                                    <div class="row">
                                        <div class="col-md-6 pull-left">
                                            <img class="events-object img-responsive img-rounded" src="${pageContext.request.contextPath}/resources/img/cat01.png" />
                                        </div>
                                        <div class="events-desc">
                                        </div>
                                    </div>                                    
                            </div>
                        </dd>
                        <dd class="pos-left clearfix">
                            <div class="circ"></div>
                            <div class="time">3.25</div>
                            <div class="events">
                                <div class="events-header">资源三</div>
                                <div class="events-body">
                                    <div class="row">
                                        <div class="col-md-6 pull-left">
                                            <img class="events-object img-responsive img-rounded" src="${pageContext.request.contextPath}/resources/img/rabbit01.png" />
                                        </div>
                                        <div class="events-desc">
                                        
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </dd>                        
                    </dl>
                </div>
            </div>
        </div>
    </div>





    <script src="${pageContext.request.contextPath}/resources/jquery/jquery-1.10.2.js"></script>
    <!-- <script src="http://www.jq22.com/jquery/bootstrap-3.3.4.js"></script> -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.eeyellow.Timeline.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('.VivaTimeline').vivaTimeline({
                carousel: true,
                carouselTime: 3000
            });
        });
    </script>
</body>


</html>