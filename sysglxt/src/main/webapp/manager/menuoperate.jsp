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
		<button  type="button" class="btn btn-default" aria-label="Left Align" id="btnSave" onclick="savaMenu()" >
  			<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
  					保存
		</button>		
		<button type="button" class="btn btn-default" aria-label="Left Align">
  			<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
  					修改
		</button>
	</div>
	<div id="selectinput_type" style="margin-left:20spx;margin-top:80px">
		<div style="margin-left:50px" >
			<label>人员类型：</label>
			<select style="width:150px;height:30px" id="csy010" onchange="changeCsy150()">			 
            </select>
		</div>
		<div style="margin-left:50px;margin-top:20px;" >
            <label>菜单层级：</label>
            <select style="width:150px;height:30px" id="z_index" onchange="showCsy150()">
              <option value ="1">父级</option>
              <option value ="2">子级</option>
            </select>
        </div>
		<div style="margin-right:400px;float:right;margin-top:-30px;display:none" id="csy150_div">
            <label>父级菜单：</label>
            <select style="width:150px;height:30px" id="parentMenu" >
            </select>
        </div>
        <div style="margin-right:120px;float:right;margin-top:-30px;display:none"  >
            <label>子级菜单：</label>
            <select style="width:150px;height:30px;" id="childMenu">
              
            </select>
        </div>
	</div>
	<div id="input_value" style="margin-top:40px;margin-left:50px;padding:0">
		<label>功能id:</label><input type="text" id="csy157_txt" required="required" style="width:160px" maxlength="50">
		<label>功能名称:</label><input type="text" id="csy151_txt" required="required" style="width:160px" maxlength="50">
		<label>事件:</label><input type="text" id="csy152_txt" style="width:160px" style="float:right;margin-right:176px" maxlength="50">
		<label>页面:</label><input type="text" id="csy153_txt" style="width:160px" style="float:right;margin-right:176px" maxlength="50">
	</div>
</body>
<script type="text/javascript">
$(function(){
	getCsy010();
	getParentMenu(0);
})
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
/*获取父级菜单*/
function getParentMenu(csy010){
	$("#btnSave").attr("disabled",false);
	$("#parentMenu").empty();
	$.ajax({
        type:'POST',
        url:"${pageContext.request.contextPath}/menu/getParentMenu?csy010="+csy010,
        success:function(data){
            for(var i=0;i<data.length;i++){
                $("#parentMenu").append("<option value ='"+data[i].csy150+"'>"+data[i].csy151+"</option>")
            }
        }
    });
}
/*人员类型与父级菜单联动*/
 function changeCsy150(){
	var csy010=$("#csy010").val();
	getParentMenu(csy010);
}
/*显示或者隐藏父级菜单*/
 function showCsy150(){
	var z_index=$("#z_index").val();
	if(z_index==2){
		$("#csy150_div").css("display","block");
	}else{
		$("#csy150_div").css("display","none");
	}
}
/*保存菜单功能*/
function savaMenu(){
	var csy010=$("#csy010").val();
	var z_index= $("#z_index").val();
	var parentMenu;
	if(z_index==1){
		parentMenu=null;
	}else{
		parentMenu = $("#parentMenu").val();
	}	
	var csy157_txt= $("#csy157_txt").val();
	var csy151_txt= $("#csy151_txt").val();
	var csy152_txt= $("#csy152_txt").val();
	var csy153_txt= $("#csy153_txt").val();
	if(!(csy157_txt&&csy151_txt&&csy152_txt&&csy153_txt)){
		alert("菜单功能信息必须全部填写");
		return;
	}
	var array=new Array();
	array.push("csy010:"+csy010);
	array.push("z_index:"+z_index);
	array.push("parentMenu:"+parentMenu);
	array.push("csy151_txt:"+csy151_txt);
	array.push("csy152_txt:"+csy152_txt);
	array.push("csy153_txt:"+csy153_txt);
	array.push("csy157_txt:"+csy157_txt);
	var str=array.join(",");
	$.ajax({
        type:'POST',
        url:"${pageContext.request.contextPath}/menu/savaMenu?str="+str,
        success:function(data){
        	$("#btnSave").attr("disabled",true);
        }
    });
}
</script>
</html>

