<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">   
    <title>课程管理</title>   
	<%@include  file="/common/pt_head.jsp"%>
	<script src="${pageContext.request.contextPath}/resources/js/jquery.page.js"></script>
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
  <body  style="font-family:'黑体';font-size:16px">
      <div>    
            <div id="button_querymenu" style="margin:10px 40px;">
                            课程名称:<input type="text" width="100px" id="search_csy061">
               <button type="button" class="btn btn-default" aria-label="Left Align" style="margin-right:100px" onclick="searchCource()">
                   <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                              查询
               </button>  
                <button type="button" class="btn btn-default" aria-label="Left Align"  id="addcourse_model" data-toggle='modal' data-target='#courseModal'>
                   <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                                            添加
               </button>
               <button type="button" id="del_model" class="btn btn-default" aria-label="Left Align" onclick="deleteCourseBatch()">
                   <span class="glyphicon glyphicon-minus" aria-hidden="true"></span>
                                            删除
               </button>         
           </div>
           <table class="table table-hover" id="courseInfo" style="font-size:10px">
	           <tr id="coursehead">
	               <th style="width:80px;text-align:center"><input type="checkbox" id="allChk" onclick="setCheckbox()"/></th>
	               <th style="width:80px;text-align:center">课程名称</th>
	               <th style="width:80px;text-align:center">课程代码</th>
	               <th style="width:80px;text-align:center">课时</th>
	               <th style="width:80px;text-align:center">学分</th>
	               <th style="width:120px;text-align:center">开放时间</th>
	               <!-- <th style="width:80px;text-align:center">班级</th> -->
	               <th style="width:80px;text-align:center">地点</th>
	               <th style="width:80px;text-align:center">备注</th>
	               <th style="width:80px;text-align:center">操作</th>
	           </tr>
	        </table>
           <div class="tcdPageCode"></div>
    </div>
    <div class="modal fade" id="courseModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span></button>
                        <h4 style="text-align: center" class="modal-title" id="myModalLabel">课程详情</h4>
                    </div>
                    <div class="modal-body" id="show" style="padding-left:130px">
                        <div class="text" style="margin-top:5px">                         
                            <lable style="width:150px">课程名称：</lable><input id="csy061" type="text" style="width:200px;" maxlength="30"/>
                        </div>  
                        <div class="text" style="margin-top:5px"><lable>课程代码：</lable><input id="csy06a" type="text" style="width:200px;" maxlength="30"/></div>       
                        <div class="text" style="margin-top:5px"><lable>课&nbsp;&nbsp;&nbsp;&nbsp;时：</lable></span><input id="csy062" type="number" style="width:200px;" maxlength="11" min="0"/></div>
                        <div class="text" style="margin-top:5px"><lable>学&nbsp;&nbsp;&nbsp;&nbsp;分：</lable><input id="csy063" type="number" style="width:200px;" maxlength="4" min="0"/></div>
                        <div class="text" style="margin-top:5px"><lable>开放时间：</lable><input id="csy064start" type="date" style="width:140px;"/><lable>--</lable><input id="csy064end" type="date" style="width:140px;"/></div>
                        <div class="text" style="margin-top:5px"><lable>地&nbsp;&nbsp;&nbsp;&nbsp;点：</lable><input id="csy066" type="text" style="width:200px;" maxlength="50"/></div>
                       <!--  <div  style="width:280px;">
                            <span style="display:inline-block;margin-top:5px;">班级：</span>
                            <select id="csy069" name="select_class" class="form-control pull-right" style="width: 200px;padding:0;">
                                <option>---请选择班级---</option>
                            </select>
                        </div>   -->
                        <div class="text" style="margin-top:5px"><lable>备&nbsp;&nbsp;&nbsp;&nbsp;注：</lable><input id="csy068" type="text" style="width:200px;" maxlength="50"/></div>
                        
                    <div class="modal-footer" >
                        <button type="button" class="btn btn-default" onclick="addCourse()">保存</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    
                    </div>
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
	    getCourse(1,pageSize);
	    $.ajax({
	        type:'POST',
	        url:"${pageContext.request.contextPath}/courseManage/getCourseCount",
	        success:function(data){
	            $(".tcdPageCode").createPage({
	                pageCount:Math.ceil((data.count/pageSize)),
	                current:1,
	                backFn:function(pageNum){
	                	getCourse(pageNum,pageSize);
	                }
	            }); 
	        }
	    });
	}
	/*获取课程信息*/
	function getCourse(pageNum,pageSize){
		  $("#coursehead").siblings().remove();
		  $.ajax({
	            type:'POST',
	            url:"${pageContext.request.contextPath}/courseManage/getCourse?pageNum="+pageNum+"&pageSize="+pageSize,
	            success:function(coursedata){
		            for(var i=0;i<coursedata.list.length;i++){
		               $("#courseInfo").append("<tr>"
							                       +"<td style='width:80px;text-align:center'><input type='checkbox' id='"+coursedata.list[i].csy060+"'/></td>"
							                       +"<td style='width:80px;text-align:center'>"+coursedata.list[i].csy061+"</td>"
							                       +"<td style='width:80px;text-align:center'>"+coursedata.list[i].csy06a+"</td>"
							                       +"<td style='width:80px;text-align:center'>"+coursedata.list[i].csy062+"</td>"
							                       +"<td style='width:80px;text-align:center'>"+coursedata.list[i].csy063+"</td>"
							                       +"<td style='width:120px;text-align:center'>"+coursedata.list[i].csy064+"</td>"
							                     /*   +"<td style='width:80px;text-align:center'>"+coursedata.list[i].csy069+"</td>" */
							                       +"<td style='width:80px;text-align:center'>"+coursedata.list[i].csy066+"</td>"
							                       +"<td style='width:80px;text-align:center'>"+coursedata.list[i].csy068+"</td>"
							                       +"<td style='width:80px;text-align:center'>"
							                       /*  +"<input type='button' class='apply-button btn btn-primary btn-xs' value='修改' data-toggle='modal' data-target='#myModal'>" */
							                        +"<input type='button' class='apply-button btn btn-primary btn-xs' style='margin-left:3px' value='删除' onclick='deleteCourse("+coursedata.list[i].csy060+")'>"
							                       +"</td>"							                    
							                  +"</tr>");
		            }
		        }
	        });
	}
	/*按条件查询课程*/
	function searchCource(){
		var csy061=$("#search_csy061").val();
		if(csy061){
			initByCondition(csy061);
		}else{
			init();
		}
	}
	/*按条件进行分页查询*/
	function initByCondition(csy061){
        pageSize=10;
        getCourseByCondition(csy061,1,pageSize);
        $.ajax({
            type:'POST',
            url:"${pageContext.request.contextPath}/courseManage/getCourseCountByCondition?csy061="+csy061,
            success:function(data){
            	if(data["count"]==0){
            		sweetAlert("没有这门课程");
            		init();
            	}else{
                	$(".tcdPageCode").createPage({
                    	pageCount:Math.ceil((data.count/pageSize)),
                    	current:1,
                   	 	backFn:function(pageNum){
                    		getCourseByCondition(csy061,pageNum,pageSize);
                    	}
                	});
            	}
            }
        });
    }
    /*获取课程信息*/
    function getCourseByCondition(csy061,pageNum,pageSize){
          $("#coursehead").siblings().remove();
          $.ajax({
                type:'POST',
                url:"${pageContext.request.contextPath}/courseManage/getCourseByCondition?csy061="+csy061+"&pageNum="+pageNum+"&pageSize="+pageSize,
                success:function(coursedata){
                    for(var i=0;i<coursedata.list.length;i++){
                       $("#courseInfo").append("<tr>"
                                                   +"<td style='width:80px;text-align:center'><input type='checkbox' id='"+coursedata.list[i].csy060+"'/></td>"
                                                   +"<td style='width:80px;text-align:center'>"+coursedata.list[i].csy061+"</td>"
                                                   +"<td style='width:80px;text-align:center'>"+coursedata.list[i].csy06a+"</td>"
                                                   +"<td style='width:80px;text-align:center'>"+coursedata.list[i].csy062+"</td>"
                                                   +"<td style='width:80px;text-align:center'>"+coursedata.list[i].csy063+"</td>"
                                                   +"<td style='width:120px;text-align:center'>"+coursedata.list[i].csy064+"</td>"
                                                 /*   +"<td style='width:80px;text-align:center'>"+coursedata.list[i].csy069+"</td>" */
                                                   +"<td style='width:80px;text-align:center'>"+coursedata.list[i].csy066+"</td>"
                                                   +"<td style='width:80px;text-align:center'>"+coursedata.list[i].csy068+"</td>"
                                                   +"<td style='width:80px;text-align:center'>"
                                                    /* +"<input type='button' class='apply-button btn btn-primary btn-xs' value='修改' data-toggle='modal' data-target='#myModal'>" */
                                                    +"<input type='button' class='apply-button btn btn-primary btn-xs' style='margin-left:3px' value='删除' onclick='deleteCourse("+coursedata.list[i].csy060+")'>"
                                                   +"</td>"                                             
                                              +"</tr>");
                    }
                }
            });
    }
    /*设置全选及全不选*/
    function setCheckbox(){
        if($('#allChk').is(':checked')){
            $("[type='checkbox']").attr("checked",true);
        }else{
            $("[type='checkbox']").attr("checked",false);
        }
    }
    /*添加课程*/
    function addCourse(){
    	var csy061=$("#csy061").val();
    	var csy062=$("#csy062").val();
    	var csy063=$("#csy063").val();
    	var csy064start=$("#csy064start").val();
    	var csy064end=$("#csy064end").val();
    	var csy064=csy064start+"-"+csy064end;
    	var csy066=$("#csy066").val();
    	var csy068=$("#csy068").val();
    	var csy06a=$("#csy06a").val();
    	if($("#csy064start").val()>$("#csy064end").val()){
    		sweetAlert("结束时间不能早于开始时间");
    		return;
    	}
    	if(csy061&&csy062&&csy063&&csy064&&csy066&&csy06a){
    		var sy06={
    			"csy061":csy061,
    			"csy062":csy062,
    			"csy063":csy063,
    			"csy064":csy064,
    			"csy066":csy066,
    			"csy068":csy068,
    			"csy06a":csy06a
    		};
    		$.ajax({
                type:'POST',
                url:"${pageContext.request.contextPath}/courseManage/validateCourse",
                contentType:"application/json;charset=utf-8",
                data:JSON.stringify(sy06),
                dataType: "json",
                success:function(validatedata){
                    if(validatedata.statu=="success"){
                    	 $.ajax({
                             type:'POST',
                             url:"${pageContext.request.contextPath}/courseManage/addCourse",
                             contentType:"application/json;charset=utf-8",
                             data:JSON.stringify(sy06),
                             dataType: "json",
                             success:function(data){
                                 if(data.statu=="success"){
                                     sweetAlert("添加成功");
                                     $("#courseModal").modal('hide');
                                     $(".text input").val("");
                                     init();
                                 }else{
                                     sweetAlert("添加失败");
                                 }
                             }
                         });                         
                    }else{
                        sweetAlert("已经存在该课程代码,请验证后再添加");
                    }
                }
    		});
    		
    	}else{
    		sweetAlert("信息不完善，请填完后再保存");
    	}

    }
    /*删除课程*/
    function deleteCourse(csy060){
    	 $.ajax({
             type:"POST",
             url:"${pageContext.request.contextPath}/courseManage/deleteCourse?csy060="+csy060,
             success:function(data){
            	  if(data.statu=="success"){
            		  sweetAlert("删除成功");
            		  init();
            	  }else{
            		  sweetAlert("删除失败");
            		  return;
            	  }
             }
    	 });
    }
    /* 批量删除课程 */
    function deleteCourseBatch(){
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
            text:"确认删除这些课程信息吗？",  
            type:"warning",  
            showCancelButton:"true",  
            showConfirmButton:"true",  
            confirmButtonText:"确定",  
            cancelButtonText:"取消",  
            animation:"slide-from-top"  
       }, function() {
            $.ajax({
                type:"POST",
                url:"${pageContext.request.contextPath}/courseManage/deleteCourseBatch?ids="+idstr,
                success:function(data){
                    if(data.statu=="success"){
                        $("#coursehead").siblings().remove();
                        init();
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
