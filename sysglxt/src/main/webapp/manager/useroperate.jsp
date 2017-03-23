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
    <div id="button_querymenu" style="margin-top:30px;margin-left:60px">
        <div style="float:left;margin-right:30px">
            <label style="font-family:'黑体';font-size:16px">用户类型：</label>
            <select style="width:100px;height:30px" id="csy010">              
            </select>     
        </div>                    
                     用户名:<input type="text" name="csy021" width="100px" id="csy021" >
                     密码:<input type="text" name="csy022" width="100px" id="csy022">
        <button type="button" class="btn btn-default" aria-label="Left Align" id="btnSave" style="float:right;margin-right:100px" onclick="queryUserByCondition()">
             <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                                 增加
        </button>        
    </div>
     <div id="button_operatemenu" style="margin-top:30px;margin-left:340px">
     <button type="button" class="btn btn-default" aria-label="Left Align" onclick="deleteMenuBatch()">
            <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                    批量删除
        </button>
        <button type="button" class="btn btn-default" aria-label="Left Align">
            <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                    批量增加
        </button>
        <button type="button" class="btn btn-default" aria-label="Left Align">
            <span class="glyphicon glyphicon-upload" aria-hidden="true"></span>
                    导入文件
        </button>
         <button type="button" class="btn btn-default" aria-label="Left Align">
            <span class="glyphicon glyphicon-download" aria-hidden="true"></span>
                    模板下载
        </button>
    </div>
     <div id="button_querymenu" style="margin-top:20px;margin-left:5px">
        <table class="table table-hover" id="sy02" style="font-size:10px" >
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
	getAllUser();
	getCsy010();
	});
	/*获取所有用户的信息 */
	function getAllUser(){
		$("#menuhead").siblings().remove();
		$.ajax({
            type:'POST',
            url:"${pageContext.request.contextPath}/userManager/getAllUser",
            success:function(data){
                for(var i=0;i<data.length;i++){
                	if(data[i].csy010==0){
                		data[i].csy010='管理员';
                	}
                	if(data[i].csy010==1){
                        data[i].csy010='学生';
                    }
                	if(data[i].csy010==2){
                        data[i].csy010='科研人员';
                    }
                	if(data[i].csy010==3){
                        data[i].csy010='教师';
                    }
                    $("#sy02").append("<tr style='width:800px;'><td style='width:20px'><input input type='checkbox' id='"+data[i].csy020+"'/></td><td >"+data[i].csy020+"</td><td >"+data[i].csy021+"</td><td >"+data[i].csy010+"</td><td><button type='button' class='btn btn-primary btn-xs' onclick='deleteUser("+data[i].csy020+")'>删除</button>&nbsp<button type='button' class='btn btn-primary btn-xs' onclick='changeMenu("+data[i].csy020+")'>修改</button></td></tr></tr>");
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
                	$("#csy010").append("<option value ='"+data[i].csy010+"'>"+data[i].csy011+" </option>")
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
	/*删除用户*/
	function deleteUser(userid){
		if(confirm("确认删除吗?")){
			$.ajax({
	            type:'POST',
	            url:"${pageContext.request.contextPath}/userManager/deleteUser?csy020="+userid,
	            success:function(data){
	            	if(data.statu==1){
                        $("#menuhead").siblings().remove();
                        getAllUser();
                        alert("删除成功");
                    }else{
                        alert("删除失败");
                    }
	            }
	        });
		}
	}
	/*批量删除人员信息*/
    function deleteMenuBatch(){
        var id_array=new Array();  
        $("[type='checkbox']:checked").each(function(){  
            id_array.push($(this).attr('id'));//向数组中添加元素  
        });  
        var idstr=id_array.join(',');//将数组元素连接起来以构建一个字符串  
        if(confirm("确认删除吗")){
            $.ajax({
                type:"POST",
                url:"${pageContext.request.contextPath}/userManager/deleteUserBatch?ids="+idstr,
                success:function(data){
                    if(data.statu==1){
                        $("#menuhead").siblings().remove();
                        getAllUser();
                        alert("删除成功");
                    }else{
                        alert("删除失败");
                    }
                }
            });
        }
    }
	
	/*单个增加用户*/
	function queryUserByCondition(){
		var csy010=$("#csy010").val();
        var csy021=$("#csy021").val();
        var csy022=$("#csy022").val();
        if(!(csy010&&csy021&&csy022)){
        	alert("所有信息必须填完");
        	return;
        }
        var sy02={
        	"csy010":csy010,
        	"csy021":csy021,
        	"csy022":csy022
        };
        $.ajax({
            type:"POST",
            url:"${pageContext.request.contextPath}/userManager/addUser",
            contentType:"application/json;charset=utf-8",
            data:JSON.stringify(sy02),
            dataType: "json",
            success:function(data){
              if(data.statu==1){
            	  $("#btnSave").attr("disabled",true);
            	  $("#menuhead").siblings().remove();
            	  getAllUser();
              }
              if(data.statu==0){
            	  alert("已经存在该用户，请重新添加");
            	  $("#csy021").val("");
            	  $("#csy022").val("");
            	  return;
              }
            }
        });
	}
</script>
</html>