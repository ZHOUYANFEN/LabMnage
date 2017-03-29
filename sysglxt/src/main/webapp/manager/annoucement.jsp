<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
     <title>公告管理</title>
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
</head>
<body>
<body style="font-family:'黑体';width:1300px;margin:0 auto">
    <div id="button_querymenu" style="margin-top:30px;margin-left:5px;width:400px">
        <div id="button_operatemenu" style="margin-top:50px;margin-left:160px">
	        <button type="button" class="btn btn-default" aria-label="Left Align" onclick="deleteMenuBatch()" >
	            <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
	                    批量删除
	        </button>
        </div>
        <table class="table table-hover" id="sy02" style="font-size:10px;margin-top:20px" >
            <tr style="width:800px;" id="menuhead">
                <td style="width:20px"><input id="allcheck" type="checkbox" onclick="setCheckbox()"/></td>
                <td >用户id</td>
                <td >用户账号</td>
                <td >用户类型</td>
                <td >操作</td>
            </tr>
        </table>
         
    </div>
    <div style="width:500px;float:right;margin-top:-50px;margin-right:325px">
	    <div>
	            <!-- 加载编辑器的容器 -->
	            <script id="container" name="content" type="text/plain"></script>
	            <!-- 配置文件 -->
	            <script type="text/javascript"
	                src="${pageContext.request.contextPath}/resources/UEditor/ueditor.config.js"></script>
	            <!-- 编辑器源码文件 -->
	            <script type="text/javascript"
	                src="${pageContext.request.contextPath}/resources/UEditor/ueditor.all.js"></script>
	            <!-- 实例化编辑器 -->
	            <script type="text/javascript">
	                ue = UE.getEditor('container');
	            </script>
	    </div>
	    
	    <div style="float: right;margin-right: 150px;margin-top:40px"">
	        <button type="button" class="btn btn-default" aria-label="Left Align" onclick="saveExp()" >
	              <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
	                         保存
	        </button>
	        <button type="button" class="btn btn-default" aria-label="Left Align" >
	              <span class="glyphicon glyphicon-minus" aria-hidden="true"></span>
	                         清空
	        </button>
	    </div>
    </div>
    
</body>
</html>