<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>功能菜单列表</title> 
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
        <button type="button" class="btn btn-default" aria-label="Left Align" onclick="deleteMenuBatch()">
            <span class="glyphicon glyphicon-minus" aria-hidden="true"></span>
                    删除功能
        </button>
        <button type="button" class="btn btn-default" aria-label="Left Align">
            <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                    修改功能
        </button>
    </div>
    <div id="button_querymenu" style="margin-top:20px;margin-left:200px">
                     功能id:<input type="text" name="menu_id" width="100px" >
                     功能名称:<input type="text" name="menu_name" width="100px">
        <button type="button" class="btn btn-default" aria-label="Left Align">
            <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                      查询
        </button>        
    </div>
     <div id="button_querymenu" style="margin-top:20px;margin-left:5px">
        <table class="table table-hover" id="menulist" style="font-size:10px">
            <tr style="width:800px;" id="menuhead">
                <td style="width:20px"><input id="allcheck" type="checkbox" onclick="setCheckbox()"/></td>
                <td style="display:none">id</td>
                <td style="display:none">标签id</td>
                <td style="width:50px">类型</td>
                <td style="width:50px">名称</td>
                <td style="width:50px">事件</td>
                <td style="width:50px">页面</td>
                <td style="display:none">层级</td>
                <td style="display:none">父级</td>
                <td style="width:50px">操作</td>
            </tr>
        </table>
     </div>
    
</body>
<script type="text/javascript">
$(function(){
	queryAllmenu();
	});
	function queryAllmenu(){
		$.ajax({
	        type:'POST',
	        url:"${pageContext.request.contextPath}/menu/queryAllMenu",
	        success:function(data){
	            
	              for (var i = 0; i < data.length; i++) {
	                            $("#menulist")
	                                    .append(
	                                            "<tr><td style='width:20px'><input type='checkbox' id='"+data[i].csy150+"'/></td><td style='display:none'>"
	                                                    + data[i].csy150
	                                                    + "</td><td style='display:none'>"
	                                                    + data[i].csy157
	                                                    + "</td><td style='width:50px'>"
	                                                    + data[i].csy010
	                                                    + "</td><td style='width:50px'>"
	                                                    + data[i].csy151
	                                                    + "</td><td style='width:50px'>"
	                                                    + data[i].csy152
	                                                    + "</td><td style='width:50px'>"
	                                                    + data[i].csy153
	                                                    + "</td><td style='display:none'>"
	                                                    + data[i].csy154
	                                                    + "</td><td style='display:none'>"
	                                                    + data[i].csy155
	                                                    + "</td><td><button type='button' class='btn btn-primary btn-xs' onclick='deleteMenu("+data[i].csy150+")'>删除</button>&nbsp<button type='button' class='btn btn-primary btn-xs' >修改</button></td></tr>");
	                        }
	                    }
	                });
	}
	/*设置全选及全不选*/
	function setCheckbox(){
		if($('#allcheck').is(':checked')){
			$("[type='checkbox']").attr("checked",true);
		}else{
			$("[type='checkbox']").attr("checked",false);
		}
	}
	/*删除菜单*/
	function deleteMenu(menuid){
		if(confirm("确认删除这个菜单功能吗")){
			$.ajax({
				type:"POST",
				url:"${pageContext.request.contextPath}/menu/deleteMenuByCsy150?csy150="+menuid,
				success:function(data){
					if(data.statu==1){
						$("#menuhead").siblings().remove();
						queryAllmenu();
						alert("删除成功");
					}else{
						alert("删除失败");
					}
				}
			});
		}
	}
	/*批量删除功能菜单*/
	function deleteMenuBatch(){
		var id_array=new Array();  
		$("[type='checkbox']:checked").each(function(){  
		    id_array.push($(this).attr('id'));//向数组中添加元素  
		});  
		var idstr=id_array.join(',');//将数组元素连接起来以构建一个字符串  
		if(confirm("确认删除这个菜单功能吗")){
			$.ajax({
                type:"POST",
                url:"${pageContext.request.contextPath}/menu/deleteMenuBatch?ids="+idstr,
                success:function(data){
                    if(data.statu==1){
                        $("#menuhead").siblings().remove();
                        queryAllmenu();
                        alert("删除成功");
                    }else{
                        alert("删除失败");
                    }
                }
            });
        }
	}
</script>
</html>