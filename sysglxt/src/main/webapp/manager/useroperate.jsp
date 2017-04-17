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
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/ajaxfileupload.js"></script>
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
    <input id="basePath" value="${pageContext.request.contextPath}" style="display:none">
    <div id="button_querymenu" style="margin-top:30px;margin-left:60px">
        <div style="float:left;margin-right:30px">
            <label style="font-family:'黑体';font-size:16px">用户类型：</label>
            <select style="width:122px;height:30px" id="csy010" onchange="setdiv()">              
            </select>     
        </div>                    
         <lable>用户名:</lable><input type="text" name="csy021" width="100px" id="csy021" maxlength="21">
         <lable>密码:</lable><input type="text" name="csy022" width="100px" id="csy022" maxlength="12" onchange="setSaveBtn">
         <button type="button" class="btn btn-default" aria-label="Left Align" id="btnSave" style="float:right;margin-right:100px;" onclick="addUser()" onchange="setSaveBtn()">
             <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                                 增加
        </button>  
         <div style="float:left; margin-top:10px" id="sy04_message">
	          <lable>学号:</lable><input type="text" name="csy040" width="80px" id="csy040" maxlength="20" onchange="setSaveBtn()">
	          <lable style="margin-left:37px"> 姓名:</lable><input type="text" name="csy041" width="80px" id="csy041" maxlength="20" onchange="setSaveBtn()">
	          <lable> 学院:</lable><input type="text" name="csy042" width="80px" id="csy042" maxlength="30" onchange="setSaveBtn()" onblur="validateCsy042(this)">
	          <lable>班级:</lable><input type="text" name="csy043" width="80px" id="csy043" maxlength="30" onchange="setSaveBtn()" onblur="validateCsy043(this)">
         </div>
         <div style="float:left; margin-top:10px" hidden="hidden" id="sy03_message">
              <lable style="margin-left:15px">姓名:</lable><input type="text" name="csy031" width="80px" id="csy031" maxlength="20" onchange="setSaveBtn()">
              <lable>职称:</lable><input type="text" name="csy032" width="80px" id="csy032" maxlength="30" onchange="setSaveBtn()">                   
         </div> 
         <div style="float:left; margin-top:10px" hidden="hidden"  id="sy05_message">        
              <lable> 姓名:</lable><input type="text" name="csy051" width="80px" id="csy051" maxlength="20" onchange="setSaveBtn()">
              <lable style="margin-left:37px"> 学院:</lable><input type="text" name="csy052" width="80px" id="csy052" maxlength="30" onchange="setSaveBtn()" onblur="validateCsy042(this)">
              <lable> 职称:</lable><input type="text" name="csy053" width="80px" id="csy053" maxlength="30" onchange="setSaveBtn()">
         </div>     
    </div>
     <div id="button_operatemenu" style="margin-top:50px;margin-left:100px">
        <button type="button" class="btn btn-default" aria-label="Left Align" onclick="deleteMenuBatch()">
            <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                    批量删除
        </button>
        <button type="button" class="btn btn-default" aria-label="Left Align" disabled="disabled" id="btnSaveBatch" onclick="addUserBacth()">
            <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                    批量增加
        </button>
         <button type="button" class="btn btn-default" aria-label="Left Align"  onclick="downloadExampl()">
            <span class="glyphicon glyphicon-download" aria-hidden="true"></span>
                    模板下载
        </button>
        <!--  <button type="button" class="btn btn-default" aria-label="Left Align" onclick="uploadFile()">
            <span class="glyphicon glyphicon-upload" aria-hidden="true"></span>
                    导入文件
        </button> -->
     </div>
     <div style="float:right;margin-right:300px;margin-top:-35px">
        <input type="file" id="btnFile" name="btnFile" class="btn btn-default" aria-label="Left Align" onchange="readExcel()">
            <span class="glyphicon glyphicon-upload" aria-hidden="true"></span>
                    导入文件
        </input>
     </div>
     <div id="button_querymenu" style="margin-top:30px;margin-left:5px">
        <table class="table table-hover" id="sy02" style="font-size:10px" >
            <tr style="width:800px;" id="menuhead">
                <td style="width:20px"><input id="allcheck" type="checkbox" onclick="setCheckbox()"/></td>
                <td >用户id</td>
                <td >用户账号</td>
                <td >用户类型</td>
                <td hidden="hidden">用户密码</td>
                <td style="width:300px">操作</td>
            </tr>
        </table>
        <div class="tcdPageCode"></div>

     </div>
    
    
    <!-- Modal -->
	<div class="modal fade bs-example-modal-lg" id="changerUserModel" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
	  <div class="modal-dialog modal-lg" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">详细信息</h4>
	      </div>
	      <div class="modal-body" style="height:200px">
	        <div id="button_querymenu" style="margin-top:30px;margin-left:60px">
                <div style="float:left;margin-right:30px">
                    <label style="font-family:'黑体';font-size:16px">用户类型：</label>
                    <select style="width:122px;height:30px" id="csy010_model" onchange="setdiv()">              
                    </select>     
                </div>                    
		         <lable>用户名:</lable><input type="text" name="csy021_model" width="100px" id="csy021_model" maxlength="21">
		         <lable>密码:</lable><input type="text" name="csy022_model" width="100px" id="csy022_model" maxlength="12"> 
		         <input type="text" name="csy02o_model" hidden="hidden" width="100px" id="csy020_model" maxlength="12"> 
		         <div style="margin-top:10px" id="sy04_message_model">
		              <div style="margin-left:100px">
		                  <lable>学号:</lable><input type="text" name="csy040_model" width="80px" id="csy040_model" maxlength="20" >
		                  <lable> 姓名:</lable><input type="text" name="csy041_model" width="80px" id="csy041_model" maxlength="20" >
		              </div>
		              <div style="margin-left:100px;margin-top:10px">
		                  <lable> 学院:</lable><input type="text" name="csy042_model" width="80px" id="csy042_model" maxlength="30" onblur="validateCsy042(this)">
		                  <lable>班级:</lable><input type="text" name="csy043_model" width="80px" id="csy043_model" maxlength="30" onblur="validateCsy043(this)">
		              </div>
		         </div>
		         <div style="float:left; margin-top:10px" hidden="hidden" id="sy03_message_model">
		              <lable>姓名:</lable><input type="text" name="csy031_model" width="80px" id="csy031_model" maxlength="20" >
		              <lable>职称:</lable><input type="text" name="csy032_model" width="80px" id="csy032_model" maxlength="30" >                   
		         </div> 
		         <div style="float:left; margin-top:10px" hidden="hidden"  id="sy05_message_model">        
		              <lable> 姓名:</lable><input type="text" name="csy051_model" width="80px" id="csy051_model" maxlength="20" >
		              <lable > 学院:</lable><input type="text" name="csy052_model" width="80px" id="csy052_model" maxlength="30" onblur="validateCsy042(this)">
		              <lable> 职称:</lable><input type="text" name="csy053_model" width="80px" id="csy053_model" maxlength="30">
		         </div>     
            </div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <button type="button" class="btn btn-primary" id="btnSave_model" onclick="saveChangeUser()">保存</button>
	      </div>
	    </div>
	  </div>
	</div>
</body>
<script type="text/javascript">
 
$(function(){
	pageSize=10;
	getAllUser(1,pageSize);
	getCsy010();
	$.ajax({
        type:'POST',
        url:"${pageContext.request.contextPath}/userManager/getUserCount",
        success:function(data){
        	$(".tcdPageCode").createPage({
                pageCount:Math.ceil((data.count/pageSize)),
                current:1,
                backFn:function(pageNum){
                    getAllUser(pageNum,pageSize);
                }
            }); 
        }
	});
	 
});
	/*获取所有用户的信息 */
	function getAllUser(pageNum,pageSize){
		$("#menuhead").siblings().remove();
		$.ajax({
            type:'POST',
            url:"${pageContext.request.contextPath}/userManager/getAllUser?pageNum="+pageNum+"&pageSize="+pageSize,
            success:function(data){
                for(var i=0;i<data.list.length;i++){
                    $("#sy02").append("<tr style='width:800px;'>"
                    		          +"<td style='width:20px'><input input type='checkbox' id='"+data.list[i].CSY020+"'/></td>"
                    		          +"<td >"+data.list[i].CSY020+"</td>"
                    		          +"<td >"+data.list[i].CSY021+"</td>"
                    		          +"<td >"+data.list[i].csy011+"</td>"                    		  
                    		          +"<td style='width:300px'><button type='button' class='btn btn-primary btn-xs' onclick='deleteUser("+data.list[i].CSY020+")'>删除</button>"
                    		          +"&nbsp<button type='button' class='btn btn-primary btn-xs ' data-toggle='modal' data-target='#changerUserModel' onclick='changeUser("+data.list[i].CSY020+","+data.list[i].CSY010+",true)'>修改</button>"
                    		          +"&nbsp<button type='button' class='btn btn-primary btn-xs ' data-toggle='modal' data-target='#changerUserModel' onclick='changeUser("+data.list[i].CSY020+","+data.list[i].CSY010+",false)'>详情</button></td>"
                    		          +"</tr>");
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
                	$("#csy010").append("<option value ='"+data[i].csy010+"'>"+data[i].csy011+" </option>");
                	$("#csy010_model").append("<option value ='"+data[i].csy010+"'>"+data[i].csy011+" </option>");
                	
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
		});
	}
	/*批量删除人员信息*/
    function deleteMenuBatch(){
        var id_array=new Array();  
        $("[type='checkbox']:checked").each(function(){  
            id_array.push($(this).attr('id'));//向数组中添加元素  
        });
        if(id_array.length<=0){
        	sweetAlert("还没有选择需要删除的信息");
        	return;
        }
        var idstr=id_array.join(',');//将数组元素连接起来以构建一个字符串  
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
        });
    }
	
	/*单个增加用户*/
	function addUser(){
		var csy010=$("#csy010").val();
        var csy021=$("#csy021").val();
        var csy022=$("#csy022").val();
        var sy02={
                "csy010":csy010,
                "csy021":csy021,
                "csy022":csy022
            };
        var csy040=$("#csy040").val();
        var csy041=$("#csy041").val();
        var csy042=$("#csy042").val();
        var csy043=$("#csy043").val();
        var sy04={
        		"csy040":csy040,
                "csy041":csy041,
                "csy042":csy042,
                "csy043":csy043
        };
        var csy031=$("#csy031").val();
        var csy032=$("#csy032").val();
        var sy03={
                "csy031":csy031,
                "csy032":csy032
        };
        var csy051=$("#csy051").val();
        var csy052=$("#csy052").val();
        var csy053=$("#csy052").val();
        var sy05={
                "csy051":csy051,
                "csy052":csy052,
                "csy053":csy053,
        };
        if(csy010==1){        	
        	if(!(csy010&&csy021&&csy022&&csy040&&csy041&&csy042&&csy043)){
                sweetAlert("所有信息必须填完");
                return;
            }      	      	
        }else if(csy010==2){
        	if(!(csy010&&csy021&&csy022&&csy051&&csy052&&csy053)){
                sweetAlert("所有信息必须填完");
                return;
            }   
        }else if(csy010==3){
            if(!(csy010&&csy021&&csy022&&csy031&&csy032)){
                sweetAlert("所有信息必须填完");
                return;
            }   
        }else if(csy010==4){
            if(!(csy010&&csy021&&csy022)){
                sweetAlert("所有信息必须填完");
                return;
            }   
        }
        var userMessage={
        		"sy02":sy02,
        		"sy03":sy03,
        		"sy04":sy04,
        		"sy05":sy05
        };
        $.ajax({
            type:"POST",
            url:"${pageContext.request.contextPath}/userManager/addUser",
            contentType:"application/json;charset=utf-8",
            data:JSON.stringify(userMessage),
            dataType: "json",
            success:function(data){
            	switch(data.statu){
            	case "20":
            		sweetAlert("添加用户失败");
            		break;
            	case "21":
            		/* sweetAlert("添加用户成功");
                    $("#btnSave").attr("disabled",true);
                    $("#menuhead").siblings().remove();
                    getAllUser(); */
            		break;
            	case "22":
            		sweetAlert("已经存在该用户");
            		break;                   
            	case "30":
            		sweetAlert("添加科研人员失败");
                    break;
                case "31":
                	sweetAlert("添加科研人员成功");
                    $("#btnSave").attr("disabled",true);
                    $("#menuhead").siblings().remove();
                    getAllUser();
                	break; 
                case "40":
                	sweetAlert("添加学生失败");
                    break;
                case "41":
                	sweetAlert("添加学生成功");
                    $("#btnSave").attr("disabled",true);
                    $("#menuhead").siblings().remove();
                    getAllUser();
                    break;
                case "42":
	                sweetAlert("已经存在该学生");
	                break;
                case "50":
                	sweetAlert("添加教师失败");
                    break;
                case "51":
                	sweetAlert("添加教师成功");
                    $("#btnSave").attr("disabled",true);
                    $("#menuhead").siblings().remove();
                    getAllUser();
                    break;     
                default:break;
            	}            
            }
        });
	}
	/*上传文件*/
	function uploadFile(){
		var file=$("#file").val();
		makerUpload(false,spAttach,1,file);
	}
	function spAttach(returnVal){
        if (returnVal.files && returnVal.files.length > 0) {
            $("#fk_files").empty();
            $.each(returnVal.files,function(i, n) {               
               
            });
        }
    }
	/*读取文件*/
	function readExcel(){
		var csy010=$("#csy010").val();
		 if (!(!!window.ActiveXObject || "ActiveXObject" in window)){
			 $.ajaxFileUpload({  
		            url:"${pageContext.request.contextPath}/userManager/readExcel?csy010="+csy010, //用于文件上传的服务器端请求地址  
		            secureuri: false, //一般设置为false  
		            fileElementId: 'btnFile', //文件上传空间的id属性  
		            dataType: 'json', //返回值类型 一般设置为json  
		            type:"post",
		            async : false,
		            success:function(data){
		            	console.log(data);
		            	if(data=="filefail"){
		            		sweetAlert("文件不符合要求，请重新上传");
		            		return;
		            	}else if(data=="error"){
		            		sweetAlert("文件太大，不能上传");
                            return;
		            	}
		            	sweetAlert("上传成功");
		            	$("#btnSaveBatch").attr("disabled",false);
		            	$("#csy010").attr("disabled",true);
		            	 if(csy010==1){
		            		 $("#sy02").empty();
			            	 $("#sy02").append("<tr style='width:800px;' id='menuhead'>"
			            			               +"<td >用户账号</td>"
			            			               +"<td >用户类型</td>"
			            			               +"<td >用户密码</td>"
			            			               +"<td >学号</td>"
			            			               +"<td >姓名</td>"
			            			               +"<td >学院</td>"
			            			               +"<td >班级</td>"
			            			               +"</tr>");
			            	for(var i=0;i<data.length;i++){
			            		$("#sy02").append("<tr style='width:800px;'>"
			            			              +"<td >"+data[i].sy02.csy021+"</td>"
			            			              +"<td >"+data[i].sy02.csy010+"</td>"
			            			              +"<td >"+data[i].sy02.csy022+"</td>"
			            			              +"<td >"+data[i].sy04.csy040+"</td>"
			            			              +"<td >"+data[i].sy04.csy041+"</td>"
			            			              +"<td >"+data[i].sy04.csy042+"</td>"
			            			              +"<td >"+data[i].sy04.csy043+"</td>"
			            			              +"</tr>");
			            	}
		            	 }else if(csy010==2){
		            		 $("#sy02").empty();
		            		 $("#sy02").append("<tr style='width:800px;' id='menuhead'>"
                                     +"<td >用户账号</td>"
                                     +"<td >用户类型</td>"
                                     +"<td >用户密码</td>"
                                     +"<td >姓名</td>"
                                     +"<td >学院</td>"
                                     +"<td >职称</td>"
                                     +"</tr>");
				              for(var i=0;i<data.length;i++){
				                  $("#sy02").append("<tr style='width:800px;'>"
				                                    +"<td >"+data[i].sy02.csy021+"</td>"
				                                    +"<td >"+data[i].sy02.csy010+"</td>"
				                                    +"<td >"+data[i].sy02.csy022+"</td>"
				                                    +"<td >"+data[i].sy05.csy051+"</td>"
				                                    +"<td >"+data[i].sy05.csy052+"</td>"
				                                    +"<td >"+data[i].sy05.csy053+"</td>"
				                                    +"</tr>");
				              }
		            	 }else if(csy010==3){
		            		 $("#sy02").empty();
                             $("#sy02").append("<tr style='width:800px;' id='menuhead'>"
                                     +"<td >用户账号</td>"
                                     +"<td >用户类型</td>"
                                     +"<td >用户密码</td>"
                                     +"<td >姓名</td>"
                                     +"<td >职称</td>"
                                     +"</tr>");
                              for(var i=0;i<data.length;i++){
                                  $("#sy02").append("<tr style='width:800px;'>"
                                                    +"<td >"+data[i].sy02.csy021+"</td>"
                                                    +"<td >"+data[i].sy02.csy010+"</td>"
                                                    +"<td >"+data[i].sy02.csy022+"</td>"
                                                    +"<td >"+data[i].sy03.csy031+"</td>"
                                                    +"<td >"+data[i].sy03.csy032+"</td>"
                                                    +"</tr>");
                              }
		            	 }else{
		            		 
		            	 }		            	
		            }, 
		            error : function(data,status,e) {
		                sweetAlert("暂时支持.xls格式文件上传");  
		            }  
			 });
		 }else{
			 sweetAlert("暂时不支持ie浏览器");
		 }
	}
	/*下载 批量上传用户信息的模板*/
	function downloadExampl(){
		 $.ajax({
	            type:"POST",
	            url:"${pageContext.request.contextPath}/userManager/downloadExampl",
	            async: false,
	            success:function(data){
	            	console.log(data);
	            	sweetAlert("下载成功");
	            }
		 });
	}
	/*设置添加信息的div*/
	function setdiv(){
		var csy010=$("#csy010").val();
		setHidden(csy010);
	}
	function setHidden(csy010){
		if(csy010=="1"){
            $("#sy04_message").attr("hidden",false);
            $("#sy03_message").attr("hidden","hidden");
            $("#sy05_message").attr("hidden","hidden");
        } else if(csy010=="2"){
            $("#sy04_message").attr("hidden","hidden");
            $("#sy03_message").attr("hidden","hidden");
            $("#sy05_message").attr("hidden",false);
        }else if(csy010=="3"){
            $("#sy04_message").attr("hidden","hidden");
            $("#sy03_message").attr("hidden",false);
            $("#sy05_message").attr("hidden","hidden");
        }else{
            $("#sy04_message").attr("hidden","hidden");
            $("#sy03_message").attr("hidden","hidden");
            $("#sy05_message").attr("hidden","hidden");
        }
	}
	/*用户详细信息及修改信息*/
	function changeUser(csy020,csy010,ischange){
		$("#csy010_model").val(csy010);
		setHidden(csy010);
		$("#csy021_model").attr("readonly","readonly");
		if(ischange==false){
			 $("#btnSave_model").attr("disabled","disabled");	
	         $("#csy022_model").attr("readonly","readonly");
			 $("#csy040_model").attr("readonly","readonly");
             $("#csy041_model").attr("readonly","readonly");
             $("#csy042_model").attr("readonly","readonly");
             $("#csy043_model").attr("readonly","readonly");
             $("#csy051_model").attr("readonly","readonly");
             $("#csy052_model").attr("readonly","readonly");
             $("#csy053_model").attr("readonly","readonly");
             $("#csy031_model").attr("readonly","readonly");
             $("#csy032_model").attr("readonly","readonly");
		}else{
			$("#csy022_model").removeAttr("readonly");
			$("#csy040_model").removeAttr("readonly");
			$("#csy041_model").removeAttr("readonly");
			$("#csy042_model").removeAttr("readonly");
			$("#csy043_model").removeAttr("readonly");
			$("#csy051_model").removeAttr("readonly");
			$("#csy052_model").removeAttr("readonly");
			$("#csy053_model").removeAttr("readonly");
			$("#csy031_model").removeAttr("readonly");
			$("#csy032_model").removeAttr("readonly");
		}
		var sy02={
				"csy010":csy010,
				"csy020":csy020
		}
		 $.ajax({
             type:"POST",
             url:"${pageContext.request.contextPath}/userManager/userDetail",
             contentType:"application/json;charset=utf-8",
             data:JSON.stringify(sy02),
             dataType: "json",
             success:function(data){
            	 $("#csy020_model").val(data.CSY020);
            	 $("#csy021_model").val(data.CSY021);
                 $("#csy022_model").val(data.CSY022);
            	 if(csy010==1){
	                 $("#csy040_model").val(data.CSY040);
	                 $("#csy041_model").val(data.CSY041);
	                 $("#csy042_model").val(data.CSY042);
	                 $("#csy043_model").val(data.CSY043);	                 	                 
            	 }else if(csy010==2){
            		 $("#csy051_model").val(data.CSY051);
                     $("#csy052_model").val(data.CSY052);
                     $("#csy053_model").val(data.CSY053);
            	 }else if(csy010==3){
            		 $("#csy031_model").val(data.CSY031);
                     $("#csy032_model").val(data.CSY032);
            	 }
                 
             }
      });
	} 
	/*批量添加数据信息*/
	function addUserBacth(){
		var isImport=$("#sy02 tr").find("input[type='checkbox']");
		var trcount=$("#sy02 tr").length;
		var csy010=$("#csy010").val();
		if(isImport.length<=0&&trcount>1){
			var listUserMessage=[];//表格全部数据
		    var tableData={};
		    $("#sy02 tr").each(function(trindex,tritem){//遍历每一行
		        tableData[trindex]=new Array();		       
		        $(tritem).find("td").each(function(tdindex,tditem){
		             tableData[trindex][tdindex]=$(tditem).text();//遍历每一个数据，并存入		                
		        });
		        if(trindex!=0){
		            var sy02={
			        	"csy021":tableData[trindex][0],
			        	"csy010":tableData[trindex][1],
			        	"csy022":tableData[trindex][2]
			        };
		            if(csy010==3){
			        	var sy03={
			        		"csy031":tableData[trindex][3],
	                        "csy032":tableData[trindex][4]	
			        	};
			        	var userMessage={
			                "sy02":sy02,
			                "sy03":sy03
			            };
			        	
		        	}else if(csy010==2){
		        		var sy05={
	                            "csy051":tableData[trindex][3],
	                            "csy052":tableData[trindex][4],
	                            "csy053":tableData[trindex][5] 
	                        };
	                    var userMessage={
	                            "sy02":sy02,
	                            "sy05":sy05
	                        };
		        	}else if(csy010==1){
		        		var sy04={
                                "csy040":tableData[trindex][3],
                                "csy041":tableData[trindex][4],
                                "csy042":tableData[trindex][5],
                                "csy043":tableData[trindex][6] 
                            };
                        var userMessage={
                                "sy02":sy02,
                                "sy04":sy04
                            };
		        	}else{
		        		var userMessage={
                                "sy02":sy02
                            };
		        	}
		           listUserMessage.push(userMessage);
		        }
		    });
			$.ajax({
		         type:"POST",
		         url:"${pageContext.request.contextPath}/userManager/addUserBacth?csy010="+csy010,
		         contentType:"application/json;charset=utf-8",
		         data:JSON.stringify(listUserMessage),
		         dataType: "json",
		         success:function(data){
		        	 switch(data.statu){
		                case "20":
		                    sweetAlert("添加用户失败");
		                    break;
		                case "22":
		                    sweetAlert("已经存在该用户");
		                    break;                   
		                case "30":
		                    sweetAlert("添加科研人员失败");
		                    break;
		                case "31":
		                    sweetAlert("添加科研人员成功");
		                    $("#btnSaveBatch").attr("disabled",true);
		                    creatTable();
		                    break;
		                case "40":
		                    sweetAlert("添加学生失败");
		                    break;
		                case "41":
		                    sweetAlert("添加学生成功");
		                    $("#btnSaveBatch").attr("disabled",true);
		                    creatTable();
		                    break;
		                case "42":
		                    sweetAlert("已经存在该学生");
		                    break;
		                case "50":
		                    sweetAlert("添加教师失败");
		                    break;
		                case "51":
		                    sweetAlert("添加教师成功");
		                    $("#btnSaveBatch").attr("disabled",true);
		                    creatTable();
		                    break;
		                default:break;
		                }
		         }
		    });
		}else{
			sweetAlert("请先导入数据后再操作");
			return;
		}
	    
	}
	function creatTable(){
		 $("#sy02").empty();
		 $("#sy02").append("<tr style='width:800px;' id='menuhead'>"
				          +"<td style='width:20px'><input id='allcheck' type='checkbox' onclick='setCheckbox()'/></td>"
				          +"<td >用户id</td>"
				          +"<td >用户账号</td>"
				          +"<td >用户类型</td>"
				          +"<td style='width:300px'>操作</td>"
				          +"</tr>");
         getAllUser();
	}
	/*保存修改后的用户信息*/
	function saveChangeUser(){
		var csy010=$("#csy010_model").val();
		var csy020=$("#csy020_model").val();
        var csy021=$("#csy021_model").val();
        var csy022=$("#csy022_model").val();
        var sy02={
                "csy010":csy010,
                "csy020":csy020,
                "csy021":csy021,
                "csy022":csy022
            };
        var csy040=$("#csy040_model").val();
        var csy041=$("#csy041_model").val();
        var csy042=$("#csy042_model").val();
        var csy043=$("#csy043_model").val();
        var sy04={
                "csy040":csy040,
                "csy041":csy041,
                "csy042":csy042,
                "csy043":csy043
        };
        var csy031=$("#csy031_model").val();
        var csy032=$("#csy032_model").val();
        var sy03={
                "csy031":csy031,
                "csy032":csy032
        };
        var csy051=$("#csy051_model").val();
        var csy052=$("#csy052_model").val();
        var csy053=$("#csy052_model").val();
        var sy05={
                "csy051":csy051,
                "csy052":csy052,
                "csy053":csy053,
        };
        var userMessage={
                "sy02":sy02,
                "sy03":sy03,
                "sy04":sy04,
                "sy05":sy05
        };
        //验证是否为空
        
        //提交保存信息
        $.ajax({
            type:"POST",
            url:"${pageContext.request.contextPath}/userManager/updateUser",
            contentType:"application/json;charset=utf-8",
            data:JSON.stringify(userMessage),
            dataType: "json",
            success:function(data){
                switch(data.statu){
                case "25":
                	sweetAlert("更新成功");
                	$("#menuhead").siblings().remove();
                	$("#btnSave_model").attr("disabled","disabled");
                    getAllUser(); 
                    break;
                case "24":
                case "34":
                case "44":
                case "54":
                case "ERROR":
                	sweetAlert("更新失败");
                	break;
                default:break;
                 
                }
            }
        });
	}
	/*设置保存按钮*/
	function setSaveBtn(){
		$("#btnSave").attr("disabled",false);
	}
	/*验证填写学院是否正确*/
	function validateCsy042(data){
		if(data.value!=''){
			 $.ajax({
		            type:"POST",
		            url:"${pageContext.request.contextPath}/userManager/validateCsy042?csy042="+data.value,
		            success:function(validata){
		            	if(validata.statu=='error'){
		            		sweetAlert('该学院名称有误');
		            		$("#"+data.id).val('');
		            	}
		            }
			 });
		}
	}
	/*验证填写的班级是否正确*/
	function validateCsy043(data){
		if(data.value!=''){
            $.ajax({
                   type:"POST",
                   url:"${pageContext.request.contextPath}/userManager/validateCsy043?csy043="+data.value,
                   success:function(validata){
                       if(validata.statu=='error'){
                           sweetAlert('该班级名称有误');
                           $("#"+data.id).val('');
                       }
                   }
            });
       }
	}
</script>
</html>