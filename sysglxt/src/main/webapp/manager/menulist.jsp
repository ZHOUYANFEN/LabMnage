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
   <script type="text/javascript" src="${pageContext.request.contextPath}/resources/sweetalert/sweetalert.min.js"></script>
    <!-- 弹窗css -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/sweetalert/sweetalert.css">
    <script src="${pageContext.request.contextPath}/resources/js/jquery.page.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    
    <style>
       a{ text-decoration:none;}
       a:hover{ text-decoration:none;}
       .tcdPageCode{padding: 15px 20px;text-align: left;color: #ccc;text-align:center;}
       .tcdPageCode a{display: inline-block;color: #428bca;display: inline-block;height: 25px; line-height: 25px;  padding: 0 10px;border: 1px solid #ddd; margin: 0 2px;border-radius: 4px;vertical-align: middle;}
       .tcdPageCode a:hover{text-decoration: none;border: 1px solid #428bca;}
       .tcdPageCode span.current{display: inline-block;height: 25px;line-height: 25px;padding: 0 10px;margin: 0 2px;color: #fff;background-color: #428bca; border: 1px solid #428bca;border-radius: 4px;vertical-align: middle;}
       .tcdPageCode span.disabled{ display: inline-block;height: 25px;line-height: 25px;padding: 0 10px;margin: 0 2px; color: #bfbfbf;background: #f2f2f2;border: 1px solid #bfbfbf;border-radius: 4px;vertical-align: middle;}
    </style>
    
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
    <div id="button_querymenu" style="margin-top:20px;margin-left:60px">
                     功能id:<input type="text" name="csy150" width="100px" id="csy150" >
                     功能名称:<input type="text" name="csy151" width="100px" id="csy151" >
         <div style="margin-right:190px;float:right" >
            <label style="font-family:'黑体';font-size:16px">人员类型：</label>
            <select style="width:150px;height:30px" id="csy010">              
            </select>
        </div>
        <button type="button" class="btn btn-default" aria-label="Left Align" style="float:right;margin-top:10px;margin-right:40px" onclick="queryMenuByCondition()">
            <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                      查询
        </button>        
    </div>
     <div id="button_querymenu" style="margin-top:50px;margin-left:5px">
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
        <div class="tcdPageCode"></div>
     </div>
    
</body>
<script type="text/javascript">
$(function(){
	init();
});
function init(){
	pageSize=10;
    queryAllmenu(1,pageSize);
    getCsy010();
    $.ajax({
        type:'POST',
        url:"${pageContext.request.contextPath}/menu/getMenuCount",
        success:function(data){
            $(".tcdPageCode").createPage({
                pageCount:Math.ceil((data.count/pageSize)),
                current:1,
                backFn:function(pageNum){
                    queryAllmenu(pageNum,pageSize);
                }
            }); 
        }
    });
}
	function queryAllmenu(pageNum,pageSize){
		$.ajax({
	        type:'POST',
	        url:"${pageContext.request.contextPath}/menu/queryAllMenu?pageNum="+pageNum+"&pageSize="+pageSize,
	        success:function(data){
	        	  $("#menuhead").siblings().remove();
	              for (var i = 0; i < data.list.length; i++) {
	            	  if(data.list[i].csy010==4){
	                        data.list[i].csy010='管理员';
	                    }
	                    if(data.list[i].csy010==1){
	                        data.list[i].csy010='学生';
	                    }
	                    if(data.list[i].csy010==2){
	                        data.list[i].csy010='科研人员';
	                    }
	                    if(data.list[i].csy010==3){
	                        data.list[i].csy010='教师';
	                    }
	                     $("#menulist").append(
	                                            "<tr><td style='width:20px'><input type='checkbox' id='"+data.list[i].csy150+"'/></td><td style='display:none'>"
	                                                    + data.list[i].csy150
	                                                    + "</td><td style='display:none'>"
	                                                    + data.list[i].csy157
	                                                    + "</td><td style='width:50px'>"
	                                                    + data.list[i].csy010
	                                                    + "</td><td style='width:50px'>"
	                                                    + data.list[i].csy151
	                                                    + "</td><td style='width:50px'>"
	                                                    + data.list[i].csy152
	                                                    + "</td><td style='width:50px'>"
	                                                    + data.list[i].csy153
	                                                    + "</td><td style='display:none'>"
	                                                    + data.list[i].csy154
	                                                    + "</td><td style='display:none'>"
	                                                    + data.list[i].csy155
	                                                    + "</td><td><button type='button' class='btn btn-primary btn-xs' onclick='deleteMenu("+data.list[i].csy150+")'>删除</button>&nbsp<button type='button' class='btn btn-primary btn-xs' onclick='changeMenu("+data.list[i].csy150+")'>修改</button></td></tr>");
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
		 swal({  
             title:"",  
             text:"确认删除这个菜单功能吗？",  
             type:"warning",  
             showCancelButton:"true",  
             showConfirmButton:"true",  
             confirmButtonText:"确定",  
             cancelButtonText:"取消",  
             animation:"slide-from-top"  
        }, function() {
			$.ajax({
				type:"POST",
				url:"${pageContext.request.contextPath}/menu/deleteMenuByCsy150?csy150="+menuid,
				success:function(data){
					if(data.statu==1){
						$("#menuhead").siblings().remove();
						init();
						sweetAlert("删除成功");
					}else{
						sweetAlert("删除失败");
					}
				}
			});
		});
	}
	/*批量删除功能菜单*/
	function deleteMenuBatch(){
		var id_array=new Array();  
		$("[type='checkbox']:checked").each(function(){  
		    id_array.push($(this).attr('id'));//向数组中添加元素  
		}); 
		if(id_array.length<=0){
            sweetAlert("还没有选择数据");
            return;
        }
		var idstr=id_array.join(',');//将数组元素连接起来以构建一个字符串  
		swal({  
            title:"",  
            text:"确认删除菜单功能吗？",  
            type:"warning",  
            showCancelButton:"true",  
            showConfirmButton:"true",  
            confirmButtonText:"确定",  
            cancelButtonText:"取消",  
            animation:"slide-from-top"  
       }, function() {
			$.ajax({
                type:"POST",
                url:"${pageContext.request.contextPath}/menu/deleteMenuBatch?ids="+idstr,
                success:function(data){
                    if(data.statu==1){
                        $("#menuhead").siblings().remove();
                        init();
                        sweetAlert("删除成功");
                    }else{
                        sweetAlert("删除失败");
                    }
                }
            });
        });
	}
	/*按条件查询菜单*/
	function queryMenuByCondition(){
		var csy010=$("#csy010").val();
		var csy150=$("#csy150").val();
		var csy151=$("#csy151").val();
		if(csy150==''){
			csy150=null;
		}
		if(csy151==''){
            csy151=null;
        }
		var sy15={
			"csy010":csy010,
			"csy150":csy150,
			"csy151":csy151
		};
		$.ajax({
			 type:"POST",
	         url:"${pageContext.request.contextPath}/menu/queryMenuByCondition",
	         contentType:"application/json;charset=utf-8",
	         data:JSON.stringify(sy15),
	         dataType:"json",
            success:function(data){
            	$("#menuhead").siblings().remove();
            	console.log(data);
            	for (var i = 0; i < data.length; i++) {
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
                       $("#menulist").append(
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
	function changeMenu(menuid){
		window.open('${pageContext.request.contextPath}/menu/changeMenu?csy150='+menuid, 'newwindow', 'height=500, width=1000, top=150, left=200, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no'); 
	}
</script>
</html>