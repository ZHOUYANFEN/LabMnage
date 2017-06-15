<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>实验安排</title>
    
	<%@include  file="/common/pt_head.jsp"%>
    <style>
    .content{
    overflow: hidden;
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    word-break: break-all;
    }
    .text{
    margin:15px auto;
    }
    .textarea{
    display:flex;
    align-items:flex-start;
    }
    </style>

  </head>
  
  <body  style="font-family:'黑体';font-size:16px">
     <div>
    	<form id="form" method="post" action="">
    	
		     <div id="button_querymenu" style="margin:10px 40px;">
		                     课程名称:<input type="text" width="100px" id="search_text">
		        <button type="button" class="btn btn-default" aria-label="Left Align" style="margin-right:100px" onclick="searchClass()">
		            <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
		                      查询
		        </button>  
		         <button type="button" class="btn btn-default" aria-label="Left Align"  id="add_model" data-toggle="modal">
                    <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                                             添加
                </button>
                <button type="button" id="del_model" class="btn btn-default" aria-label="Left Align" onclick="deleteMenuBatch()">
                    <span class="glyphicon glyphicon-minus" aria-hidden="true"></span>
                                             删除
                </button>         
		    </div>
    		<table class="table table-hover" id="expInfo" style="font-size:10px">
    		<tr>
    			<th style="width:80px;text-align:center"><input type="checkbox" id="allChk"/></th>
    			<th style="width:80px;text-align:center">课程名称</th>
    			<th style="width:80px;text-align:center">实验名称</th>
    			<th style="width:80px;text-align:center">学院名称</th>
    			<th style="width:80px;text-align:center">实验内容</th>
    			<th style="width:80px;text-align:center">布置时间</th>
    			<th style="width:80px;text-align:center">完成时间</th>
    			<th style="width:80px;text-align:center">操作</th>
    		</tr>
    		</table>
    		<!-- <div class="tcdPageCode"></div> -->
    	</form>
    </div>
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
	 	    	<div class="modal-content">
	 	      		<div class="modal-header">
	 	        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
	 	        		<span aria-hidden="true">&times;</span></button>
	 	        		<h4 style="text-align: center" class="modal-title" id="myModalLabel">实验详情</h4>
	 	        	</div>
	 	        	<div class="modal-body" id="show">
	 	      			<div  id="form2" style="padding-left:12%;margin:0 auto;">
	 	      			<div  style="width:280px;">
	 	      			    <span style="display:inline-block;margin-top:5px;">课程名称：</span>
	 	      				<select id="select" name="select_class" class="form-control pull-right" style="width: 200px;padding:0;">
	 	      					<option>---请选择课程---</option>
	 	      				</select>
	 	      			</div>  	      			
	 	      			<div class="text"><span>实验名称：</span><input id="expName" type="text" style="width:200px;"/></div>
	 	      			<div class="text">布置时间：<input id="startTime" type="date" style="width:200px;"/></div>
	 	      			<div class="text">完成时间：<input id="endTime" type="date" style="width:200px;"/></div>
	 	      			<div>
	 	      			    实验内容：
			            <!-- 加载编辑器的容器 -->
			            <script id="container" name="content" type="text/plain"></script>
			            <!-- 配置文件 -->
			            <script type="text/javascript"
			                src="${pageContext.request.contextPath}/resources/UEditor/ueditor.config.js"></script>
			            <!-- 编辑器源码文件 -->
			            <script type="text/javascript"
			                src="${pageContext.request.contextPath}/resources/UEditor/ueditor.all.js"></script>
			            <!-- 实例化编辑器 -->
			            <script type="text/javascript">
			                ue = UE.getEditor('container');
			            </script>
			            <!-- <textarea id="ue" rows="5" class="form-control" style="width:200px;"></textarea> -->
			        </div>
	 	      		</div>
	 	      		<div class="modal-footer" style="text-align: center">
	 	      		<button type="button" class="btn btn-default" onclick="addModal()">保存</button>
	 	      			<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
	 	      		
	 	      		</div>
	 	      	</div>
	 	     </div>
	   </div>
  </div>
  </body>
  <script type="text/javascript">
  	$(function (){
  		$.ajax({
  			type:'POST',
  			url:"${pageContext.request.contextPath}/teacher/queryExp",
  			success:function(data){
  				for(var i=0;i<data.length;i++){
  					$("#expInfo").append("<tr style='width:800px;'>"
  					+"<td style='text-align:center'><input type='checkbox' name='subChk' value='"+data[i].csy080+"'/></td> "
  					+"<td style='text-align:center'>"+data[i].csy061+"</td>"
  					+"<td style='text-align:center'>"+data[i].csy081+"</td>"
  					+"<td style='text-align:center'>"+data[i].csy052+"</td>"
  					+"<td style='text-align:center'><div class='content'>"+data[i].csy082+"</div></td>"
  					+"<td style='text-align:center'>"+(new Date(data[i].csy083).toLocaleDateString().replace(/\//g,"-").substr(0,8))+"</td>"
  					+"<td style='text-align:center'>"+(new Date(data[i].csy084).toLocaleDateString().replace(/\//g,"-").substr(0,8))+"</td>"
  					+"<td style='text-align:center'><input type='button' class='apply-button btn btn-primary btn-xs' value='修改' onclick=''>"
  					+"<input type='button' class='apply-button btn btn-primary btn-xs' value='删除' onclick='deleteModal()'></td>"
  					+"</tr>");
  				};
  			}
  		});
  		/**
  		*全选
  		*/
  		$("#allChk").click(function(){
  			$("input[name='subChk']").prop("checked",this.checked);
  		});
  		/**
  		* 单选
  		*/
  		var subChk = $("input[name='subChk']") 
  		subChk.click(function() { 
  			$("#allChk").prop("checked", subChk.length == subChk.filter(":checked").length ? true:false); 
  		}); 
  		/* 批量删除 */ 
  		
  		$("#del_model").click(function() { 
  			// 判断是否至少选择一项 
  			var checkedNum = $("input[name='subChk']:checked").length; 
  				if(checkedNum <= 0) { 
  					alert("请选择至少一项！"); 
  					return; 
  				} 
  				// 批量选择 
  				if(confirm("确定要删除所选项目？")) { 
  					var checkedList = new Array(); 
  					$("input[name='subChk']:checked").each(function() { 
  						checkedList.push($(this).val()); 
  					}); 
  					$.ajax({ 
  						type: "POST", 
  						url: "${pageContext.request.contextPath}/teacher/deleteExp", 
  						data: {'delitems':checkedList.toString()}, 
  			 			success: function(data) { 
  							$("[name ='subChk']:checkbox").attr("checked", false); 
  							sweetAlert(data.status);
  							window.location.reload(); 
  						} 
  					}); 
  				} 
  			}); 
 
 		$("#add_model").click(function(){
 			
  	  		$.ajax({
  	  			type:'POST',
  	  			url:"${pageContext.request.contextPath}/teacher/queryExp",
  	  			success:function(data){
  	  				for(var i=1;i<data.length;i++){
  	  					$("#myModal #select").append("<option>"+data[i].csy061+"</option>");
  	  				};
  	  				
  	  			}
  	  		});
  	  		$("#myModal").modal("show");
  	  		var className = $("#myModal #select").val();
  			/* console.log("xxxx"+className); */
  			$("#select option").each(function() { 
					var getText = $(this).text();
					/* console.log("text"+getText); */
					if($("#select option:contains("+getText+")").length > 1) {
						$("#select option:contains("+getText+"):gt(0)").remove();
					}
			});
  
  			
  	  	});

  	})
  	function deleteModal(){
  		// 判断是否至少选择一项 
  			var checkedNum = $("input[name='subChk']:checked").length; 
  				if(checkedNum <= 0) { 
  					sweetAlert("请选择至少一项！"); 
  					return; 
  				} 
  				// 批量选择 
  				if(confirm("确定要删除所选项目？")) { 
  					var checkedList = new Array(); 
  					$("input[name='subChk']:checked").each(function() { 
  						checkedList.push($(this).val()); 
  					}); 
  					$.ajax({ 
  						type: "POST", 
  						url: "${pageContext.request.contextPath}/teacher/deleteExp", 
  						data: {'delitems':checkedList.toString()}, 
  			 			success: function(data) { 
  							$("[name ='subChk']:checkbox").attr("checked", false); 
  							sweetAlert(data.status);
  							window.location.reload(); 
  						} 
  					}); 
  				} 
  		}
  	function addModal(){
	  	var className = $("#myModal #select").val();
	  	var expName = $("#expName").val();
	  	var startTime = $("#startTime").val();
	  	var endTime = $("#endTime").val();
	  	var csy091 = ue.getContent();
	  	var recordList = new Array(); 
	  	var date = new Date();
	  	var dateTime = date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate();
	  	/* alert(dateTime); */
	  	if(className=="---请选择课程---"){
	  		sweetAlert("请选择课程");
	  	} else{
	  		recordList.push(className);
		  	if(expName==""){
		  		sweetAlert("请输入实验名称");
		  	}else{
		  		recordList.push(expName);
		  		if(startTime==""){
		  			sweetAlert("请选择布置时间");
		  		}else{
		  			recordList.push(startTime);
		  			if(endTime==""){
		  				sweetAlert("请选择完成时间");
		  			}else{
		  				recordList.push(endTime);
		  				if(csy091==""){
		  					sweetAlert("请编写实验内容");
		  				}else{
		  					recordList.push(csy091);
		  					/* console.log(csy091); */
		  				}
		  			}
		  		}
		  	}
	  	}
	  	if(csy091!=""){
	  		$("#myModal").modal("hide");
	  	}
	  	$.ajax({
  			type:'POST',
  			url:"${pageContext.request.contextPath}/teacher/addExp",
  			data: {'additems':recordList.toString()}, 
  			success:function(data){
  				sweetAlert(data.status);
  			}
  		});
  		
  	}
  	function searchClass(){
  		var className = $("#search_text").val();
  		alert(className);
  		$.ajax({
  			type:'POST',
  			url:"${pageContext.request.contextPath}/teacher/searchExp",
  			data: {'searchitems':className.toString()}, 
  			success:function(data){
  				var Data = data;
  				var resultList;
  				var error;
  				for(var key in Data) {
  					alert(key);
  					if("error" == key){
  						error = Data[key];
  						sweetAlert(error[0]);
  					}else{
  						resultList = Data[key];
  						console.log(resultList);
  						$("#expInfo tr:not(:first)").empty(""); 
  		  				for(var i=0;i<resultList.length;i++){
  		  					$("#expInfo").append("<tr style='width:800px;'>"
  		  		  					+"<td style='text-align:center'><input type='checkbox' name='subChk' value='"+resultList[i].csy080+"'/></td> "
  		  		  					+"<td style='text-align:center'>"+resultList[i].csy061+"</td>"
  		  		  					+"<td style='text-align:center'>"+resultList[i].csy081+"</td>"
  		  		  					+"<td style='text-align:center'>"+resultList[i].csy052+"</td>"
  		  		  					+"<td style='text-align:center'><div class='content'>"+resultList[i].csy082+"</div></td>"
  		  		  					+"<td style='text-align:center'>"+(new Date(resultList[i].csy083).toLocaleDateString().replace(/\//g,"-").substr(0,8))+"</td>"
  		  		  					+"<td style='text-align:center'>"+(new Date(resultList[i].csy084).toLocaleDateString().replace(/\//g,"-").substr(0,8))+"</td>"
  		  		  					+"<td style='text-align:center'><input type='button' class='apply-button btn btn-primary btn-xs' value='修改' onclick=''>"
  		  		  					+"<input type='button' class='apply-button btn btn-primary btn-xs' value='删除' onclick='deleteModal()'></td>"
  		  		  					+"</tr>");
  		  				}
  					}
  				}

  			}
  		});
  	}

  	 


  	
  </script>
</html>
