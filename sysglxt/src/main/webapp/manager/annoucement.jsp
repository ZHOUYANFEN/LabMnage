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
<body style="font-family:'黑体';width:950px;margin:0 auto">
    <div id="button_querymenu" style="margin-top:30px;margin-left:5px;width:950px">
        <div id="button_operatemenu" style="margin-top:50px;margin-left:400px">
	        <button type="button" class="btn btn-default" aria-label="Left Align" onclick="deleteMenuBatch()" >
	            <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
	                    批量删除
	        </button>
	        <button type='button' class='btn btn-default ' data-toggle='modal' data-target='#openPage'  >
                  <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                             添加公告
            </button>
        </div>
        <table class="table table-hover" id="sy14" style="font-size:10px;margin-top:20px" >
            <tr style="width:600px;" id="menuhead">
                <td style="width:20px"><input id="allcheck" type="checkbox" onclick="setCheckbox()"/></td>
                <td >公告名称</td>
                <td >发布时间</td>
                <td >截止时间</td>
                <td >操作</td>
            </tr>
        </table>
         
    </div>

    
    
    <div class="modal fade bs-example-modal-lg" id="openPage" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
      <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="myModalLabel">发布公告</h4>
          </div>
          <div class="modal-body" style="height:400px">
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
       <div class="modal-footer">
         <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
         <button type="button" class="btn btn-primary" id="btnSave_model" onclick="saveAnoucement()">保存</button>
       </div>
      </div>
    </div>
  </div>
    
</body>
</html>