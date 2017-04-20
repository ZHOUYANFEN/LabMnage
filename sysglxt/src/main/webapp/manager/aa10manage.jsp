<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>码值管理</title> 
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
        <button type="button" class="btn btn-default" aria-label="Left Align" data-toggle='modal' data-target='#aa10_model'>
            <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                    增加码值
        </button>
        <button type="button" class="btn btn-default" aria-label="Left Align" onclick="deleteAa10Batch()">
            <span class="glyphicon glyphicon-minus" aria-hidden="true"></span>
                    删除码值
        </button>
        <button type="button" class="btn btn-default" aria-label="Left Align">
            <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                    批量导入
        </button>
    </div>
    <div id="button_querymenu" style="margin-top:20px;margin-left:60px">
        <label style="margin-left:5px;width:100px;text-align:right">代码类别:</label><input type="text" name="aaa100" width="100px" id="aaa100" >
        <label style="margin-left:5px;width:100px;text-align:right"> 代码总称:</label><input type="text" name="aaa101" width="100px" id="aaa101" >
        <label style="margin-left:5px;width:100px;text-align:right">代码名:</label><input type="text" name="aaa102" width="100px" id="aaa102" >   
         <button type="button" class="btn btn-default" aria-label="Left Align" style="margin-top:10px;margin-left:400px" >
            <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                      查询
        </button> 
    </div>
     <div id="button_querymenu" style="margin-top:30px;margin-left:5px">
        <table class="table table-hover" id="aa10list" style="font-size:10px">
            <tr style="width:800px;" id="aa10head">
                <td style="width:20px"><input id="allcheck" type="checkbox" onclick="setCheckbox()"/></td>
                <td >代码类别</td>
                <td >代码总称</td>
                <td >代码码值</td>
                <td >代码名</td>
                <td >备注</td>
                <td >操作</td>
            </tr>
        </table>
        <div class="tcdPageCode"></div>
     </div>
    <div class="modal fade bs-example-modal-lg" id="aa10_model" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
      <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="myModalLabel">码表管理</h4>
          </div>
          <div class="modal-body" style="height:200px">
             <div>
	             <label style="margin-left:5px;width:100px;text-align:right">代码类别:</label><input type="text" name="aaa100" width="100px" id="aaa100" >
	             <label style="margin-left:5px;width:100px;text-align:right"> 代码总称:</label><input type="text" name="aaa101" width="100px" id="aaa101" >
	             <label style="margin-left:5px;width:100px;text-align:right">代码码值:</label><input type="text" name="aaa102" width="100px" id="aaa102" >
            </div>
        <div style="margin-top:5px">
             <label style="margin-left:5px;width:100px;text-align:right">代码名:</label><input type="text" name="aaa103" width="100px" id="aaa103" >
             <label style="margin-left:5px;width:100px;text-align:right">备注(备用):</label><input type="text" name="aaa105" width="100px" id="aaa105" >                     
        </div>      
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            <button type="button" class="btn btn-primary" id="btnSave_model" >保存</button>
          </div>
        </div>
      </div>
    </div>
</body>
<script type="text/javascript">
$(function(){
	init();
});
function init(){
	pageSize=10;
    queryAa10(1,pageSize);
    $.ajax({
        type:'POST',
        url:"${pageContext.request.contextPath}/aa10/getAa10Count",
        success:function(data){
            $(".tcdPageCode").createPage({
                pageCount:Math.ceil((data.count/pageSize)),
                current:1,
                backFn:function(pageNum){
                    queryAa10(pageNum,pageSize);
                }
            }); 
        }
    });
}
	function queryAa10(pageNum,pageSize){
		$.ajax({
	        type:'POST',
	        url:"${pageContext.request.contextPath}/aa10/queryAa10?pageNum="+pageNum+"&pageSize="+pageSize,
	        success:function(data){
	        	  $("#aa10head").siblings().remove();
	              for (var i = 0; i < data.list.length; i++) {
	            	  $("#aa10list").append(
	            			          "<tr><td style='width:20px'><input type='checkbox' id='"+data.list[i].aaa100+"_"+data.list[i].aaa102+"'/></td>"
	            			          +"<td >"+ data.list[i].aaa100+"</td>"
	            			          +"<td >"+ data.list[i].aaa101+"</td>"
                                      +"<td >"+ data.list[i].aaa102+"</td>"
                                      +"<td >"+ data.list[i].aaa103+"</td>"
                                      +"<td >"+ data.list[i].aaa105+"</td>"
                                      +"<td><button type='button' class='btn btn-primary btn-xs' onclick=\"deleteAa10('"+data.list[i].aaa100+"','"+data.list[i].aaa102+"')\">删除</button>"
                                      +"&nbsp<button type='button' class='btn btn-primary btn-xs' onclick=\"changeAa10('"+data.list[i].aaa100+"','"+data.list[i].aaa102+"')\">修改</button></td></tr>");
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
	function deleteAa10(aaa100,aaa102){
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
				url:"${pageContext.request.contextPath}/aa10/deleteAa10?aaa100="+aaa100+"&aaa102="+aaa102,
				success:function(data){
					if(data.statu=='success'){
						$("#aa10head").siblings().remove();
						init();
						sweetAlert("删除成功");
					}else{
						sweetAlert("删除失败");
					}
				}
			});
		});
	}
	/*批量删除码值*/
	function deleteAa10Batch(){
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
            text:"确认删除码表吗？",  
            type:"warning",  
            showCancelButton:"true",  
            showConfirmButton:"true",  
            confirmButtonText:"确定",  
            cancelButtonText:"取消",  
            animation:"slide-from-top"  
       }, function() {
			$.ajax({
                type:"POST",
               // url:"${pageContext.request.contextPath}/menu/deleteMenuBatch?ids="+idstr,
                success:function(data){
                    if(data.statu==1){
                        $("#aa10head").siblings().remove();
                        //queryAllmenu();
                        sweetAlert("删除成功");
                    }else{
                        sweetAlert("删除失败");
                    }
                }
            });
        });
	}	
</script>
</html>