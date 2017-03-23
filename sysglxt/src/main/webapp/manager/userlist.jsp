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
   <script type="text/javascript" src="${pageContext.request.contextPath}/resources/sweetalert/sweetalert.min.js"></script>
    <!-- 弹窗css -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/sweetalert/sweetalert.css">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<body style="font-family:'黑体';font-size:16px">
    <div id="button_operatemenu" style="margin-top:50px;margin-left:340px">
        <button type="button" class="btn btn-default" aria-label="Left Align" onclick="toaddpage()">
            <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                             增加用户
        </button>
        <button type="button" class="btn btn-default" aria-label="Left Align" onclick="deleteMenuBatch()">
            <span class="glyphicon glyphicon-minus" aria-hidden="true"></span>
                               删除用户
        </button>
        <!-- <button type="button" class="btn btn-default" aria-label="Left Align">
            <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                             修改用户信息
        </button> -->
    </div>
    <div id="button_querymenu" style="margin-top:20px;margin-left:60px">                    
                     用户名:<input type="text" name="csy021" width="100px" id="csy021">
         <div style="margin-right:400px;float:right" >
            <label style="font-family:'黑体';font-size:16px">用户类型：</label>
            <select style="width:150px;height:30px" id="csy010">              
            </select>     
        </div>
        <button type="button" class="btn btn-default" aria-label="Left Align" style="float:right;margin-right:-400px" onclick="queryUserByCondition()">
            <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                                查询
        </button>  
        <button type="button" class="btn btn-default" aria-label="Left Align" style="float:right;margin-right:-500px" onclick="downloadUser()">
            <span class="glyphicon glyphicon-download-alt" aria-hidden="true"></span>
                              下载
        </button>      
    </div>
     <div id="button_querymenu" style="margin-top:30px;margin-left:5px">
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
                        sweetAlert("删除成功");
                    }else{
                        sweetAlert("删除失败");
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
                        sweetAlert("删除成功");
                    }else{
                        sweetAlert("删除失败");
                    }
                }
            });
        }
    }
	/*按条件查询用户*/
	function queryUserByCondition(){
		$("#menuhead").siblings().remove();
		var csy010=$("#csy010").val();
        var csy021=$("#csy021").val();
        if(csy021==''){
        	csy021=null;
        }
        var sy02={
        		"csy010":csy010,
        		"csy021":csy021
        };
        $.ajax({
            type:"POST",
            url:"${pageContext.request.contextPath}/userManager/queryMenuByCondition",
            contentType:"application/json;charset=utf-8",
            data:JSON.stringify(sy02),
            dataType:"json",
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
	/*下载用户列表*/
	function downloadUser(){
		//判断浏览器
		 if (!!window.ActiveXObject || "ActiveXObject" in window){
			var inTblId="sy02";
			var inWindow=null;
			try {   
	            var allStr = "";   
	            var curStr = "";   
	            if (inTblId != null && inTblId != "" && inTblId != "null") {   
	                curStr = getTblData(inTblId, inWindow);   
	            }   
	            if (curStr != null) {   
	                allStr += curStr;   
	            }else {   
	                sweetAlert("你要导出的表不存在！");   
	                return;   
	            }   
	            var fileName = getExcelFileName();   
	            doFileExport(fileName, allStr); 
	        }catch (e) {   
	            sweetAlert("导出发生异常:" + e.name + "->" + e.description + "!");   
	        }  
		}else{
			sweetAlert("请用ie浏览器进行下载");
			return;
		}
	}
	function getTblData(inTbl, inWindow) {   
        var rows = 0;   
        var tblDocument = document;   
        if (!!inWindow && inWindow != "") {   
            if (!document.all(inWindow)) {   
                return null;   
            }   
            else {   
                tblDocument = eval(inWindow).document;   
            }   
        }   
        var curTbl = tblDocument.getElementById(inTbl);   
        var outStr = "";   
        if (curTbl != null) {   
            for (var j = 0; j < curTbl.rows.length; j++) {   
                for (var i = 0; i < curTbl.rows[j].cells.length-1; i++) {   
                    if (i == 0 && rows > 0) {   
                        outStr += " \t";   
                        rows -= 1;   
                    }   
                    outStr += curTbl.rows[j].cells[i].innerText + "\t";   
                    if (curTbl.rows[j].cells[i].colSpan > 1) {   
                        for (var k = 0; k < curTbl.rows[j].cells[i].colSpan - 1; k++) {   
                            outStr += " \t";   
                        }   
                    }   
                    if (i == 0) {   
                        if (rows == 0 && curTbl.rows[j].cells[i].rowSpan > 1) {   
                            rows = curTbl.rows[j].cells[i].rowSpan - 1;   
                        }   
                    }   
                }   
                outStr += "\r\n";   
            }   
        }   
        else {   
            outStr = null;   
            sweetAlert(inTbl + "不存在!");   
        }   
        return outStr;   
    }
	/*获取名称*/
    function getExcelFileName() {   
        var d = new Date();   
        var curYear = d.getYear();   
        var curMonth = "" + (d.getMonth() + 1);   
        var curDate = "" + d.getDate();   
        var curHour = "" + d.getHours();   
        var curMinute = "" + d.getMinutes();   
        var curSecond = "" + d.getSeconds();   
        if (curMonth.length == 1) {   
            curMonth = "0" + curMonth;   
        }   
        if (curDate.length == 1) {   
            curDate = "0" + curDate;   
        }   
        if (curHour.length == 1) {   
            curHour = "0" + curHour;   
        }   
        if (curMinute.length == 1) {   
            curMinute = "0" + curMinute;   
        }   
        if (curSecond.length == 1) {   
            curSecond = "0" + curSecond;   
        }   
        var fileName = "用户信息" + "_" + (curYear+1990) + "年" + curMonth + "月" + curDate + "日" + "_"   
                       + curHour + "点" + curMinute + "分" + curSecond + "秒" + ".xls";   
        return fileName;   
    }   
    function doFileExport(inName, inStr) {   
        var xlsWin = null;   
        if (!!document.all("glbHideFrm")) {   
            xlsWin = glbHideFrm;   
        }   
        else {   
            var width = 6;   
            var height = 4;   
            var openPara = "left=" + (window.screen.width / 2 - width / 2)   
                           + ",top=" + (window.screen.height / 2 - height / 2)   
                           + ",scrollbars=no,width=" + width + ",height=" + height;   
            xlsWin = window.open("", "_blank", openPara);   
        }   
        xlsWin.document.write(inStr);   
        xlsWin.document.close();   
        xlsWin.document.execCommand('Saveas', true, inName);   
        xlsWin.close();   
    }  
	/*跳转到增加页面*/
	function toaddpage(){
	
		$(window.parent.document).find("name:iframe1").attr("src","${pageContext.request.contextPath}/manager/useroperate.jsp");
		
	}
</script>
</html>