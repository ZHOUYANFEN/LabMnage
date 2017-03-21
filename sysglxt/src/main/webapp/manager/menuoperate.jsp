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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap-3.3.7/dist/css/bootstrap.min.css" />
        <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/bootstrap-3.3.7/dist/js/bootstrap.min.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<body style="font-family:'黑体';font-size:16px">
	<div id="button_operatemenu" style="margin-top:50px;margin-left:340px">
		<button type="button" class="btn btn-default" aria-label="Left Align">
  			<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
  					增加功能
		</button>
		<button type="button" class="btn btn-default" aria-label="Left Align">
  			<span class="glyphicon glyphicon-minus" aria-hidden="true"></span>
  					删除功能
		</button>
		<button type="button" class="btn btn-default" aria-label="Left Align">
  			<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
  					修改功能
		</button>
	</div>
	<div id="selectinput_type" style="margin-left:20spx;margin-top:80px">
		<div style="margin-left:50px" >
			<label>人员类型：</label>
			<select style="width:150px;height:30px" >
			  <option value ="volvo">Volvo</option>
			  <option value ="saab">Saab</option>
			  <option value="opel">Opel</option>
			  <option value="audi">Audi</option>
            </select>
		</div>
		<div style="margin-left:50px;margin-top:20px" >
            <label>菜单层级：</label>
            <select style="width:150px;height:30px" >
              <option value ="1">父级</option>
              <option value ="2">子级</option>
            </select>
        </div>
		<div style="margin-right:400px;float:right;margin-top:-30px" >
            <label>父级菜单：</label>
            <select style="width:150px;height:30px" 、>
              <option value ="volvo">Volvo</option>
              <option value ="saab">Saab</option>
              <option value="opel">Opel</option>
              <option value="audi">Audi</option>
            </select>
        </div>
        <div style="margin-right:120px;float:right;margin-top:-30px" >
            <label>子级菜单：</label>
            <select style="width:150px;height:30px" 、>
              <option value ="volvo">Volvo</option>
              <option value ="saab">Saab</option>
              <option value="opel">Opel</option>
              <option value="audi">Audi</option>
            </select>
        </div>
	</div>
	<div id="input_value" style="margin-top:40px;margin-left:50px;padding:0">
		功能id:<input type="text" name="menu_id" width="100px" >
		功能名称:<input type="text" name="menu_name" width="100px">
		事件:<input type="text" name="menu_page" width="100px" style="float:right;margin-right:176px">
		功能对应页面:<input type="text" name="menu_page" width="100px" style="float:right;margin-right:176px">
	</div>
	<div id="button_menu" style="margin-top:80px;margin-left:400px">
		<div class="btn-group" role="group">
    		<button type="button" class="btn btn-default" style="width:120px">
    			<span class="glyphicon glyphicon-ok-sign" aria-hidden="true"></span>
    			保存
    			</button>
  		</div>
  		<div class="btn-group" role="group">
    		<button type="button" class="btn btn-default" style="width:120px">
    			<span class="glyphicon glyphicon-remove-sign" aria-hidden="true"></span>
    			取消
    		</button>
  		</div>
	</div>
</body>

