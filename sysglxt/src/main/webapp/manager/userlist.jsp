<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>用户菜单列表</title> 
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
                    增加用户
        </button>
        <button type="button" class="btn btn-default" aria-label="Left Align" onclick="">
            <span class="glyphicon glyphicon-minus" aria-hidden="true"></span>
                    删除用户
        </button>
        <button type="button" class="btn btn-default" aria-label="Left Align">
            <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                    修改用户信息
        </button>
    </div>
    <div id="button_querymenu" style="margin-top:20px;margin-left:60px">
                     用户id:<input type="text" name="csy150" width="100px" >
                     用户名:<input type="text" name="csy151" width="100px">
         <div style="margin-right:190px;float:right" >
            <label style="font-family:'黑体';font-size:16px">用户类型：</label>
            <select style="width:150px;height:30px" id="csy010">              
            </select>
        </div>
        <button type="button" class="btn btn-default" aria-label="Left Align" style="float:right;margin-top:10px;margin-right:40px" onclick="">
            <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                      查询
        </button>        
    </div>
     <div id="button_querymenu" style="margin-top:50px;margin-left:5px">
        <table class="table table-hover" id="menulist" style="font-size:10px">
            <tr style="width:800px;" id="menuhead">
                <td style="width:20px"><input id="allcheck" type="checkbox" onclick="setCheckbox()"/></td>
                <td >用户id</td>
                <td >用户账号</td>
                <td >用户类型</td>
                <td >操作</td>
            </tr>
        </table>
     </div>
    
</body>
<script type="text/javascript">
$(function(){
	//queryAllmenu();
	//getCsy010()
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
	                                                    + "</td><td><button type='button' class='btn btn-primary btn-xs' onclick='deleteMenu("+data[i].csy150+")'>删除</button>&nbsp<button type='button' class='btn btn-primary btn-xs' onclick='changeMenu("+data[i].csy150+")'>修改</button></td></tr>");
	                        }
	                    }
	                });
	}
	/*获取人员类型*/
	function getCsy010(){
		$("#csy010").empty();
		$.ajax({
            type:'POST',
            url:"${pageContext.request.contextPath}/menu/getCsy010",
            success:function(data){
                for(var i=0;i<data.length;i++){
                	$("#csy010").append("<option value ='"+data[i].csy010+"'>"+data[i].csy011+"</option>")
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
	/*按条件查询菜单*/
	function queryMenuByCondition(){
		var csy010=$("#csy010").val();
		var csy150=$("#csy150").val();
		var csy151=$("#csy151").val();
		/* console.log(csy010+"==="+csy150+"==="+csy151);
		var param={};
		if(csy150){
			param["csy150"]=csy150;
		}
		if(csy151){
			param["csy151"]=csy151;
		}
		param["csy010"]=csy010;		 */
		$.ajax({
            type:"POST",
            url:"${pageContext.request.contextPath}/menu/queryMenuByCondition",
            dataType:'json',
            data:'{"csy010":'+csy010+',"csy150":'+csy150+',"csy151":'+csy151+'}',
            success:function(data){
                console.log(data);
            }
		});
	}
	function changeMenu(menuid){
		window.open('${pageContext.request.contextPath}/menu/changeMenu?csy150='+menuid, 'newwindow', 'height=500, width=1000, top=150, left=200, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no'); 
	}
</script>
</html>