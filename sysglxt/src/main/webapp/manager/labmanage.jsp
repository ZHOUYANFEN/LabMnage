<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>功能菜单列表</title> 
        <! <!-- 引入JQuery -->
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
    <!--树型结构主要样式-->
  
        
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css" /> 
    
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<body style="font-family:'黑体';font-size:16px">
    <div style="float:left;margin-left:30px;margin-top:40px; width:320px;height:600px;padding:0">
   
        <div class="tree" id="treelist">
            <div id="button_operatemenu" style="margin-left:50px" >
		        <button type="button" class="btn btn btn-primary" aria-label="Left Align" data-toggle='modal' data-target='#addLabType' onclick="toAdd()">
		            <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
		                            增加实验室类型
		        </button>
		    </div>
            <h3 align="center">实验室类型</h3>
        </div>          
    </div>
    <div style="float:right;margin-top:50px;margin-right:20px;width:600px">
	    <div id="button_operatemenu" style="margin-left:200px;">
	        <button type="button"  aria-label="Left Align" class='btn btn-primary btn-xs ' data-toggle='modal' data-target='#addLab' onclick="toAddLab()">
	            <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
	                             增加实验室
	        </button>
	        <button type="button" class="btn btn-primary btn-xs" aria-label="Left Align" onclick="deleteBatch()" >
	            <span class="glyphicon glyphicon-minus" aria-hidden="true"></span>
	                               删除实验室
	        </button>
	    </div>
	    <div id="list_lab" style="margin-top:30px;margin-left:5px">
	    <input id="csy100" hidden="hidden">
        <table class="table table-hover" id="sy11" style="font-size:10px" >
            <tr style="width:800px;" id="labhead">
                <td style="width:20px"><input id="allcheck" type="checkbox" onclick="setCheckbox()"/></td>
                <td >实验室名称</td>
                <td >实验室类别</td>
                <td >实验室位置</td>
                <td >开放时间</td>
                <td >是否开放</td>
                <td >实验室描述</td>
                <td >操作</td>
            </tr>
        </table>
     </div>
    </div>
    
    
    
    
    <div class="modal fade bs-example-modal-lg" id="addLab" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
      <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="myModalLabel">实验室信息</h4>
          </div>
          <div class="modal-body" style="height:200px">
            <input id="csy110_model" hidden="hidden">
            <div id="button_querymenu" style="margin-top:30px;margin-left:60px">
                <div style="margin-left:20px">
                    <label>实验室类型：</label>
                    <select style="width:122px;height:30px" id="csy100_model" >              
                    </select>     
                </div>                    
                <div style="margin-left:20px;margin-top:20px">
                     <div>
                        <lable>实验室名称:</lable><input type="text"  width="100px" id="csy111_model" maxlength="30">
                         <lable style="margin-left:20px">实验室位置:</lable><input type="text"  width="100px" id="csy112_model" maxlength="30">
                     </div>
                     <div style="margin-top:20px">
                     <lable>&nbsp;&nbsp;开放时间:</lable><select type="text" id="csy113_model" maxlength="30" style=" width:150px;height:30px"></select>
                     <lable style="margin-left:20px">&nbsp;是否开放:</lable>
                     <select style="width:122px;height:30px" id="csy114_model" >
                       <option selected="selected" value='0'>开放</option>
                       <option value='1'>不开放</option>
                     </select>   
                     <lable style="margin-left:20px">实验室说明:</lable><input type="text"  width="100px" id="csy115_model" maxlength="300">
                    </div>
                </div>
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            <button type="button" class="btn btn-primary" id="btnSaveLab_model" onclick="saveLab()">保存</button>
          </div>
        </div>
      </div>
    </div>
    
    
   <div class="modal fade bs-example-modal-lg" id="addLabType" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" >
      <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="myModalLabel">实验室类型信息</h4>
          </div>
          <div class="modal-body" style="height:200px">
            <input id="csy100_type_model" hidden="hidden">
            <div style="margin:40px;margin-left:200px">
             <lable>实验类型名称:</lable><input type="text" name="csy101_model" width="100px" id="csy101_model" maxlength="30">
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            <button type="button" class="btn btn-primary" id="btnSaveLabType_model" onclick="addLabType()">保存</button>
          </div>
        </div>
      </div>
    </div>
    
    
    
   
	
</body>
<script type="text/javascript">
$(function(){    
    queryType();
    queryCsy113();
});
function queryType(){
	/*查询实验室类型*/
    $.ajax({
        type:'post',
        url:"${pageContext.request.contextPath}/lab/queryLabType",
        success:function(data){
            for(var i=0;i<data.length;i++){
                $("#csy100_model").append("<option value ='"+data[i].csy100+"'>"+data[i].csy101+"</option>");
                $("#treelist").append(" <ul>"
                                        +"<li>"
                                        +"<span onclick='queryLabList("+data[i].csy100+")' id='"+data[i].csy100+"' style='width:150px;margin-left:-30px;cursor:pointer'><i class='icon-calendar' ></i> "+data[i].csy101+"</span>"
                                        +"&ndash;<button type='button' class='btn btn-primary btn-xs ' data-toggle='modal' data-target='#addLabType' onclick='changeType("+data[i].csy100+")'>修改</button>"
                                        +"&ndash;<button type='button' class='btn btn-primary btn-xs '  onclick='deleteType("+data[i].csy100+")'>删除</button>"
                                        +"</li>"
                                        +"</ul>");
            }
        }
    })
}
function queryCsy113(){
	 $.ajax({
	        type:'post',
	        url:"${pageContext.request.contextPath}/lab/queryCsy113",
	        success:function(data){
	            for(var i=0;i<data.length;i++){
	                $("#csy113_model").append("<option value ='"+data[i].csy113+"'>"+data[i].csy113+"</option>");
	            }
	        }
	    })
}
/*查询各实验室类型下的实验室*/
function queryLabList(csy100){
	$("#csy100").val(csy100);
	$.ajax({
        type:'post',
        url:"${pageContext.request.contextPath}/lab/queryLabList?csy100="+csy100,
        success:function(data){
        	$("#labhead").siblings().remove();
            for(var i=0;i<data.length;i++){
            	if(data[i].csy114==0){
            		data[i].csy114='开放';
            	}else{
            		data[i].csy114='暂不开放';
            	}
            	$("#sy11").append("<tr style='width:800px;'>"
					                +"<td style='width:20px'><input type='checkbox' id='"+data[i].csy110+"'/></td>"
					                +"<td >"+data[i].csy111+"</td>"
					                +"<td >"+data[i].csy101+"</td>"
					                +"<td >"+data[i].csy112+"</td>"
					                +"<td >"+data[i].csy113+"</td>"
					                +"<td >"+data[i].csy114+"</td>"
					                +"<td >"+data[i].csy115+"</td>"
					                +"<td>&nbsp<button type='button' class='btn btn-primary btn-xs ' data-toggle='modal' data-target='#addLab' onclick='changeLab("+data[i].csy110+")'>修改</button></td>"
					            +"</tr>");
            }
        }
	});
}
/*全选*/
function setCheckbox(){
	if($('#allcheck').is(':checked')){
        $("[type='checkbox']").attr("checked",true);
    }else{
        $("[type='checkbox']").attr("checked",false);
    }
}
/*跳转到添加实验室*/
function toAddLab(){
	 $("#btnSaveLab_model").attr("onclick","saveLab()");
}
 /*增加实验室*/
function saveLab(){
	 var csy100=$("#csy100_model").val();
	 var csy111=$("#csy111_model").val();
	 var csy112=$("#csy112_model").val();
	 var csy113=$("#csy113_model").val();
	 var csy114=$("#csy114_model").val();
	 var csy115=$("#csy115_model").val();
	 if(!(csy100&&csy111&&csy112&&csy113&&csy114)){
		 sweetAlert("请先完善信息");
		 return;
	 }
	 var sy11={
		"csy100":csy100,
	    "csy111":csy111,
	    "csy112":csy112,
	    "csy113":csy113,
	    "csy114":csy114,
	    "csy115":csy115	 
	 };
	 $.ajax({
         type:'post',
         url:"${pageContext.request.contextPath}/lab/validateLab",
         contentType:"application/json;charset=utf-8",
         data:JSON.stringify(sy11),
         dataType:"json",
         success:function(data){
	          if(data.statu=='success'){
	        	  $.ajax({
	                  type:'post',
	                  url:"${pageContext.request.contextPath}/lab/addLab",
	                  contentType:"application/json;charset=utf-8",
	                  data:JSON.stringify(sy11),
	                  dataType:"json",
	                  success:function(sdata){
	                         if(sdata.statu=="success"){
	                             $('#addLab').modal('toggle');
	                             sweetAlert("保存成功");
	                         }else{
	                             sweetAlert("保存失败");
	                         }
	                  }
	        	 });
	          }else{
	        	sweetAlert("该实验室重复");
	        	return;
	          }
         }
	 });
	
 }
 /*批量删除实验室*/
 function deleteBatch(){
	 var id_array=new Array();  
     $("[type='checkbox']:checked").each(function(){  
         id_array.push($(this).attr('id'));//向数组中添加元素  
     });
     if(id_array.length<=0){
         sweetAlert("还没有选择需要删除的信息");
         return;
     }
     var idstr=id_array.join(',');//将数组元素连接起来以构建一个字符串  
     if(confirm("确认删除吗")){
         $.ajax({
             type:"POST",
             url:"${pageContext.request.contextPath}/lab/deleteBatch?ids="+idstr,
             success:function(data){
                 if(data.statu=='success'){
                	 var csy100=$("#csy100").val();
                	 queryLabList(csy100);
                     sweetAlert("删除成功");
                 }else{
                     sweetAlert("删除失败");
                 }
             }
         });
     }
 }
 /*修改实验室信息*/
 function changeLab(csy110){
	 $("#btnSaveLab_model").attr("onclick","updateLab()");
	 $("#csy110_model").val(csy110);
	 $.ajax({
         type:"POST",
         url:"${pageContext.request.contextPath}/lab/queryLab?csy110="+csy110,
         success:function(data){
        	 $("#csy100_model").val(data.csy100);
             $("#csy111_model").val(data.csy111);
             $("#csy112_model").val(data.csy112);
             $("#csy113_model").val(data.csy113);
             $("#csy114_model").val(data.csy114);
             $("#csy115_model").val(data.csy115);
         }
	 });
 }
 /*更改实验室信息*/
 function updateLab(){
	 var csy110=$("#csy110_model").val();
	 var csy111=$("#csy111_model").val();
	 var csy112=$("#csy112_model").val();
	 var csy113=$("#csy113_model").val();
	 var csy114=$("#csy114_model").val();
	 var csy115=$("#csy115_model").val();
	 var csy100=$("#csy100_model").val();
	 var sy11={
		        "csy100":csy100,
		        "csy110":csy110,
		        "csy111":csy111,
		        "csy112":csy112,
		        "csy113":csy113,
		        "csy114":csy114,
		        "csy115":csy115  
		     };
	 $.ajax({
         type:'post',
         url:"${pageContext.request.contextPath}/lab/updateLab",
         contentType:"application/json;charset=utf-8",
         data:JSON.stringify(sy11),
         dataType:"json",
         success:function(sdata){
        	 if(sdata.statu=="success"){
        		 $('#addLab').modal('toggle');
                 sweetAlert("保存成功");
             }else{
                 sweetAlert("保存失败");
             }
         }
	 });
 }
 /*跳转修改类型*/
 function changeType(csy100,csy101){
	 var csy101= $('#'+csy100).text();
	 $("#csy101_model").val(csy101);
	 $("#csy100_type_model").val(csy100);
	 $("#btnSaveLabType_model").attr("onclick","changeLabType()");
 }
 /*修改类型*/
 function changeLabType(){
	 var csy101=$("#csy101_model").val();
	 var csy100=$("#csy100_type_model").val();
	 if(!csy101){
		 sweetAlert("请先输入修改后的类型");
		 return;
	 }	 
	 $.ajax({
         type:"POST",
         url:"${pageContext.request.contextPath}/lab/validateCsy101?csy101="+csy101,
         success:function(data){
        	 if(data.statu=='success'){
	        	 var sy10={
	        		        "csy100":csy100,
	        		        "csy101":csy101
	        		     };
				 $.ajax({
			         type:"POST",
			         url:"${pageContext.request.contextPath}/lab/updateType",
			         contentType:"application/json;charset=utf-8",
			         data:JSON.stringify(sy10),
			         dataType:"json",
			         success:function(updatedata){
			        	 if(updatedata.statu=='success'){
			                 $('#addLabType').modal('toggle');
			                 $("#treelist ul").remove();
			                 $("#csy100_model").empty();
			                 queryType();
			                 sweetAlert("修改成功");
			             }else{
			                 sweetAlert("修改失败");
			                 return;
			             }
			         }
				 });
        	 }else{
        		 sweetAlert("改名称已经存在");
        		 return;
        	 }
         }
	 });
 }
 /*跳转到添加类型*/
 function toAdd(){
	 $("#btnSaveLabType_model").attr("onclick","addLabType()");
 }
 /*添加类型*/
 function addLabType(){
	 var csy101=$("#csy101_model").val();
	 if(!csy101){
		 sweetAlert("请先填入类型名称");
		 return;
	 }
	 $.ajax({
         type:"POST",
         url:"${pageContext.request.contextPath}/lab/validateCsy101?csy101="+csy101,
         success:function(data){
        	 if(data.statu=='success'){
        		 var sy10={
        			"csy101":csy101	 
        		 };
	        	 $.ajax({
	                 type:"POST",
	                 url:"${pageContext.request.contextPath}/lab/addCsy101",
	                 contentType:"application/json;charset=utf-8",
	                 data:JSON.stringify(sy10),
	                 dataType:"json",
	                 success:function(adddata){
	                     if(adddata.statu=='success'){
	                    	 $('#addLabType').modal('toggle');
	                    	 $("#treelist ul").remove();
	                    	 $("#csy100_model").empty();
	                    	 queryType();
	                    	 sweetAlert("添加成功");
	                     }else{
	                    	 sweetAlert("添加失败");
	                    	 return;
	                     }
	                 }
	             });
        	 }else{
        		 sweetAlert("该类型已经存在");
        		 return;
        	 } 
         }
	 });
 }
 /*删除类型*/
 function deleteType(csy100){
	 swal({  
	         title:"",  
	         text:"确定删除吗？",  
	         type:"warning",  
	         showCancelButton:"true",  
	         showConfirmButton:"true",  
	         confirmButtonText:"确定",  
	         cancelButtonText:"取消",  
	         animation:"slide-from-top"  
        }, function() {
        	$.ajax({
                type:"POST",
                url:"${pageContext.request.contextPath}/lab/validateIsOkDelete?csy100="+csy100,
                success:function(data){
                	if(data.statu=='success'){
	                	$.ajax({
	                        type:"POST",
	                        url:"${pageContext.request.contextPath}/lab/deleteType?csy100="+csy100,
	                        contentType:"application/json;charset=utf-8",
	                        success:function(deletedata){
	                            if(deletedata.statu=='success'){
	                                $("#treelist ul").remove();
	                                $("#csy100_model").empty();
	                                queryType();
	                                sweetAlert("删除成功");
	                            }else{
	                                sweetAlert("删除失败");
	                            }
	                        }
	                    });
                	}else{
                		sweetAlert("该类型下还有实验室");
                	}
                }
        	});      	
        });
 }
</script>
</html>