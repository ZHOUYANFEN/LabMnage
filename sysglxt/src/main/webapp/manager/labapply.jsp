<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
     <title>实验室申请审核</title>
     <%@include  file="/common/pt_head.jsp"%>
    <!-- echarts -->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
<body style="font-family:'黑体';font-size:16px;width:950px;margin:0 auto">
     <div id="button_operatemenu" style="margin-top:50px;margin-left:400px">
        <button type="button" class="btn btn-default" aria-label="Left Align" data-toggle='modal' data-target='#addlabarrange' onclick="openadd()">
            <span class="glyphicon glyphicon-plus" aria-hidden="true" ></span>
                             增加实验室安排
        </button>
    </div>
	<div id="applyexp" style="height:350px;margin-top:20px;margin-right:20px;">
	        <table class="table table-hover" id="applylist" style="font-size:10px">
              <tr style="width:800px;" id="applyhead">
                <td style="width:20px"><input id="allcheck" type="checkbox" onclick="setCheckbox()"/></td>
                <th>实验室名称</th>
                <th>实验室位置</th>
                <th>实验室类别</th>
                <th>申请人</th>
                <th>申请时间</th>
                <th>申请目的</th>
                <th>备注</th>
                <th>操作</th>
            </tr>
	        </table>
	        <div class="tcdPageCode"></div>
    </div>
   
    
    
     <div class="modal fade bs-example-modal-lg" id="labapply" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
      <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="myModalLabel">实验室申请信息</h4>
          </div>
          <div class="modal-body" style="height:350px;width:600px;margin-left:80px">
            <div style="margin-left:250px" id="shenhe">
	           
	        </div>
	        <div id="button_operatemenu" style="margin-top:20px;margin-left:250px">
                <button type="button" class="btn btn-default" aria-label="Left Align" onclick="shenhe(true)">
                    <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                                             审核通过
                </button>
                <button type="button" class="btn btn-default" aria-label="Left Align" onclick="shenhe(false)">
                    <span class="glyphicon glyphicon-minus" aria-hidden="true"></span>
                                             审核不通过
                </button>
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>         
          </div>
        </div>
      </div>
    </div>
    
    <div class="modal fade bs-example-modal-lg" id="addlabarrange" tabindex="-2" role="dialog" aria-labelledby="myLargeModalLabel">
      <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="myModalLabel">新增实验室安排</h4>
          </div>
          <div class="modal-body" style="height:350px;width:1000px;margin-left:10px">                        
                 <div style="float:left;margin-right:30px;width:900px;margin-top:20px">
		            <label style='width:100px;text-align:right'> <span style="margin:0;padding:0;color:red" >*</span>申请人ID:</label>&nbsp;<input type="text" id="csy021_model" onchange="setPerson(this.value)" >
		            <input type="text" id="csy020_model" hidden="hidden" >
                    <label style='width:100px;text-align:right'>申请人姓名:</label>&nbsp;<input type="text" id="csy021_name" readonly="readonly"> 
                    <label style='width:100px;text-align:right'> <span style="margin:0;padding:0;color:red" >*</span>申请目的:</label>&nbsp;<input type="text" id="csy122_model" maxlength="50">    
		         </div> 
		         <div style="float:left;margin-right:30px;width:900px;margin-top:20px">
                    <label style='width:100px;text-align:right'>实验室类型:</label>&nbsp;<select style="width:172px;height:30px" id="csy100_model" onchange="queryLabList(this.value)"></select>
                    <label style='width:100px;text-align:right'>实验室名称:</label>&nbsp;<select style="width:172px;height:30px" id="csy111_model" onchange="setCsy(this.value)"></select>                  
                    <label style='width:100px;text-align:right'>实验室位置:</label >&nbsp;<input type="text" id="csy112_model" style="width:172px;height:30px" readonly="readonly">    
                 </div> 
                 <div style="float:left;margin-right:30px;width:900px;margin-top:20px">
                    <label style='width:100px;text-align:right' >备注:</label>&nbsp;<input type="text" style="width:600px" id="csy123_model" >
                    
                 </div> 
                 <div style="float:left;margin-right:30px;width:900px;margin-top:20px" id="week">
                    <label style='width:100px;text-align:right' ><span style="margin:0;padding:0;color:red">*</span>周次:</label>                  
                 </div> 
                 <div style="float:left;margin-right:30px;width:900px;margin-top:20px">
                    <label style='width:100px;text-align:right'> <span style="margin:0;padding:0;color:red" >*</span>安排时间:</label>&nbsp;<select id='csy126_time_model' style='width:172px;height:27px'></select> 
                 </div>                 
		         
           
            <div id="button_operatemenu" style="margin-top:20px;margin-left:400px;float:left;">
                <button type="button" class="btn btn-default" aria-label="Left Align" onclick="addArrage()">
                    <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                                             新增
                </button>
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>         
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
    	pageSize=20;
        queryLabApply(1,pageSize);
        $.ajax({
            type:'POST',
            url:"${pageContext.request.contextPath}/lab/queryLabApplyCount",
            success:function(data){
                $(".tcdPageCode").createPage({
                    pageCount:Math.ceil((data.count/pageSize)),
                    current:1,
                    backFn:function(pageNum){
                        queryLabApply(pageNum,pageSize);
                    }
                }); 
            }
        });        
    }
    function queryLabApply(pageNum,pageSize){
    	$.ajax({
            type:'post',
            url:'${pageContext.request.contextPath}/lab/queryLabApply?pageNum='+pageNum+'&pageSize='+pageSize,
            success:function(data){
                $("#applyhead").siblings().remove();
                for(var i=0;i<data.list.length;i++){
                	if(data.list[i].csy125==0){
	                    $("#applylist").append("<tr style='width:800px;' >"
	                                                +"<td style='width:20px'><input type='checkbox' /></td>"
	                                                +"<td>"+data.list[i].csy111+"</td>"
	                                                +"<td>"+data.list[i].csy112+"</td>"
	                                                +"<td>"+data.list[i].csy101+"</td>"
	                                                +"<td>"+data.list[i].csy021+"</td>"
	                                                +"<td>"+data.list[i].csy121+"</td>"
	                                                +"<td>"+data.list[i].csy122+"</td>"
	                                                +"<td>"+data.list[i].csy123+"</td>"
	                                                +"<td><button type='button' class='btn btn-primary btn-xs' data-toggle='modal' data-target='#labapply' onclick='shenheinfo("+data.list[i].csy120+")' >审核</button></td>"
	                                                +"</tr>");
                	}else if(data.list[i].csy125==1){
                		  $("#applylist").append("<tr style='width:800px;' >"
                                  +"<td style='width:20px'><input type='checkbox' /></td>"
                                  +"<td>"+data.list[i].csy111+"</td>"
                                  +"<td>"+data.list[i].csy112+"</td>"
                                  +"<td>"+data.list[i].csy101+"</td>"
                                  +"<td>"+data.list[i].csy021+"</td>"
                                  +"<td>"+data.list[i].csy121+"</td>"
                                  +"<td>"+data.list[i].csy122+"</td>"
                                  +"<td>"+data.list[i].csy123+"</td>"
                                  +"<td>审核通过</td>"
                                  +"</tr>");
                	}else if(data.list[i].csy125==2){
                		 $("#applylist").append("<tr style='width:800px;' >"
                                 +"<td style='width:20px'><input type='checkbox' /></td>"
                                 +"<td>"+data.list[i].csy111+"</td>"
                                 +"<td>"+data.list[i].csy112+"</td>"
                                 +"<td>"+data.list[i].csy101+"</td>"
                                 +"<td>"+data.list[i].csy021+"</td>"
                                 +"<td>"+data.list[i].csy121+"</td>"
                                 +"<td>"+data.list[i].csy122+"</td>"
                                 +"<td>"+data.list[i].csy123+"</td>"
                                 +"<td>审核不通过</td>"
                                 +"</tr>");
                    }
                  
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
    /*审核信息*/
    function shenheinfo(data){
    	$.ajax({
            type:'post',
            url:'${pageContext.request.contextPath}/lab/shenheinfo?csy120='+data,
            success:function(resultdata){
               	$("#shenhe").empty();
               	var csy126s = resultdata.csy126;
               	var csy126arr= csy126s.split(",");
               	var csy126div = "";
               	for (var i =0;i<csy126arr.length;i++){
               		csy126div+=("<p style='margin-left:110px;'><label>"+csy126arr[i]+"</label>");
               		csy126div+=("<select name='addweek' id='"+csy126arr[i]+"'>");
               		var options=gettime(resultdata.csy110,csy126arr[i]);
               		csy126div+=options;
               		csy126div+=("</select></p>");
               		
               	};
               	$("#shenhe").append("<input  id ='csy120_add' value='"+resultdata.csy120+"' hidden='hidden'>"
                    +"<p><label style='width:100px;text-align:right'>实验室名称:</label><label>"+resultdata.csy111+"</label></p>"
                    +"<p><label style='width:100px;text-align:right'>实验室类型:</label><label>"+resultdata.csy101+"</label></p>"
                    +"<p><label style='width:100px;text-align:right'>申请目的:</label><label>"+resultdata.csy122+"</label></p>"
                    +"<p><label style='width:100px;text-align:right' >备注:</label><label>"+resultdata.csy123+"</label></p>"
                    +"<p><label style='width:100px;text-align:right'>实验室位置:</label ><label>"+resultdata.csy112+"</label></p>"
                    //+"<p><label style='width:100px;text-align:right'>安排时间:</label><select id='csy126_time' style='width:150px;height:27px'></select></p>"
                    +"<p><label style='width:100px;text-align:right'>安排时间:</label></p>"
                    +csy126div
                );
               	//getcsy126(resultdata.csy110);               
          }
           
    	});
    }
   /*  function getcsy126(csy110){
    	 $.ajax({
             type:'post',           
             url:'${pageContext.request.contextPath}/lab/getcsy126?csy110='+csy110, 
             success:function(resultdata_1){
                 $("#csy126_time").empty();
                 for(var i=0;i<resultdata_1.length;i++){
                     $("#csy126_time").append("<option value='"+resultdata_1[i].aaa103+"'>"+resultdata_1[i].aaa103+"</option>");
                 }
             }
         });
    } */
    function gettime(csy110,week){     
    	var options="";
        $.ajax({
            type:'post',
            async: false,
            url:'${pageContext.request.contextPath}/lab/getcsy126?csy110='+csy110+'&week='+week, 
            success:function(data){                
                for(var i=0;i<data.length;i++){
                    options+="<option value='"+data[i].aaa103+"'>"+data[i].aaa103+"</option>";
                   // $("#csy126_time").append("<option value='"+resultdata_1[i].aaa103+"'>"+resultdata_1[i].aaa103+"</option>");
                }
            }
        });
        return options;
    }
    /*审核*/
    function shenhe(flag){
    	var csy120 = $("#csy120").val();
    	if(flag==true){
    		var csy120 = $("#csy120_add").val();
    		var week_array=new Array();  
            $("[name='addweek']").each(function(){  
                week_array.push($(this).attr('id')+$(this).val());//向数组中添加元素  
           });
           var weekarr=week_array.join(",");
           var sy12={
        	'csy120':csy120,
        	'csy126':weekarr,
        	'csy125':1
           };
           $.ajax({
               type:"POST",
               url:"${pageContext.request.contextPath}/lab/updateApply",
               contentType:"application/json;charset=utf-8",
               data:JSON.stringify(sy12),
               dataType: "json",
               success:function(data){
            	 if(data.statu=='success'){
            		 sweetAlert("审核通过");
            		 init();
            		 $("#labapply").modal('toggle');
            		 return;
            	 } else{
            		 sweetAlert("异常");
            		 return;
            	 }  
               }
           })
    	}else{
    		var csy120 = $("#csy120_add").val();
    		swal({  
                title:"",  
                text:"确认不通过这个申请吗？",  
                type:"warning",  
                showCancelButton:"true",  
                showConfirmButton:"true",  
                confirmButtonText:"确定",  
                cancelButtonText:"取消",  
                animation:"slide-from-top"  
           }, function() {
	    	   var sy12={
	    	            'csy120':csy120,
	    	            'csy125':2
	    	           };
   	           $.ajax({
   	               type:"POST",
   	               url:"${pageContext.request.contextPath}/lab/updateApply",
   	               contentType:"application/json;charset=utf-8",
   	               data:JSON.stringify(sy12),
   	               dataType: "json",
   	               success:function(data){
   	                 if(data.statu=='success'){
   	                     sweetAlert("审核不通过");
   	                     init();
   	                     $("#labapply").modal('toggle');
   	                     return;
   	                 } else{
   	                     sweetAlert("异常");
   	                     return;
   	                 }  
   	               }
   	           });
   	        });
    	}
    }
    /**查询周次,返回复选框*/
    function queryWeek(){
        var weekdata='';
        $.ajax({
            type:'POST',
            async: false,
            url:"${pageContext.request.contextPath}/aa10/queryWeek",
            success:function(data){
                for(var i=0;i<data.length;i++){
                    weekdata=weekdata+"<lable>"+data[i].aaa103+"<input name='week' type='checkbox' value='"+data[i].aaa103+"'>&nbsp;</lable>";
                }          
            }
        });
        return weekdata;
    }
    /*查询实验室类型*/
    function queryType(){
        /*查询实验室类型*/
        $.ajax({
            type:'post',
            url:"${pageContext.request.contextPath}/lab/queryLabType",
            success:function(data){
            	$("#csy100_model").empty();
                for(var i=0;i<data.length;i++){
                    $("#csy100_model").append("<option value ='"+data[i].csy100+"'>"+data[i].csy101+"</option>");
                    
                }
                var csy100=$("#csy100_model").val();
                queryLabList(csy100);
                
            }
        });
    }
    /*查询各实验室类型下的实验室*/
    function queryLabList(csy100){
        $("#csy100").val(csy100);
        $.ajax({
            type:'post',
            url:"${pageContext.request.contextPath}/lab/queryLabList?csy100="+csy100,
            success:function(data){
                $("#csy111_model").empty();
                for(var i=0;i<data.length;i++){
                	$("#csy111_model").append("<option value ='"+data[i].csy110+"'>"+data[i].csy111+"</option>");
                }
                var csy110=$("#csy111_model").val();
                setCsy126(csy110);
                setCsy112(csy110);
            }
        });
    }
    function setCsy(data){
    	setCsy112(data);
    	setCsy126(data);
    }
    /*查询有空时间*/
    function setCsy126(data){
    	$.ajax({
            type:'post',
            url:'${pageContext.request.contextPath}/lab/getcsy126?csy110='+data, 
            success:function(resultdata_1){
                $("#csy126_time_model").empty();
                for(var i=0;i<resultdata_1.length;i++){
                    $("#csy126_time_model").append("<option value='"+resultdata_1[i].aaa103+"'>"+resultdata_1[i].aaa103+"</option>");
                }
            }
        });
    }
    /*查询位置*/
    function setCsy112(data){
    	$.ajax({
            type:'POST',
            url:"${pageContext.request.contextPath}/teacher/queryById?id="+data,
            success:function(resultdata){
                $("#csy112_model").val(resultdata.CSY112);
            }
    	});
    }
    /*设置周次*/
    function openadd(){
    	queryType();
    	$("#week").empty();
    	$("#week").append("<label style='width:100px;text-align:right' ><span style='margin:0;padding:0;color:red'>*</span>周次:</label>"+queryWeek());
    }
    /*设置用户信息*/
    function setPerson(data){
    	$.ajax({
            type:'POST',
            url:"${pageContext.request.contextPath}/userManager/queryUserById?csy021="+data,
            success:function(resultdata){
            	if(resultdata.name){
            		$("#csy020_model").val(resultdata.csy020);
            	    $("#csy021_name").val(resultdata.name);
            	}else{
            		sweetAlert("没有该用户，请输入正确的用户");
            		$("#csy021").val("");
            		 $("#csy021_name").val("");
            	}
            }
        });
    }
    /*添加实验室安排*/
    function addArrage(){
    	var week_array=new Array();  
    	 $("[name='week']:checked").each(function(){  
    		 week_array.push($(this).attr('value'));//向数组中添加元素  
        });
        if(week_array.length<=0){
            sweetAlert("还没有选择周次");
            return;
        }
        var csy126_time = $("#csy126_time_model").val();
        for(var i = 0;i<week_array.length;i++){
        	week_array[i]=week_array[i]+":"+csy126_time;
        }
        var weekarr=week_array.join(",");
    	var csy020 = $("#csy020_model").val();
    	var csy110 = $("#csy111_model").val();
    	var csy122 = $("#csy122_model").val();
    	var csy123 = $("#csy123_model").val();
    	if(week_array&&csy020&&csy110&&csy122&&csy123){
	    	var sy12 = {
	    		'csy020':csy020,
	    		'csy110':csy110,
	    		'csy122':csy122,
	    		'csy123':csy123,
	    		'csy126':weekarr
	    	};
	    	 swal({  
	             title:"",  
	             text:"确认添加这个实验室安排吗？",  
	             type:"warning",  
	             showCancelButton:"true",  
	             showConfirmButton:"true",  
	             confirmButtonText:"确定",  
	             cancelButtonText:"取消",  
	             animation:"slide-from-top"  
	        }, function() {
	        	$.ajax({
	                type:"POST",
	                url:"${pageContext.request.contextPath}/lab/addLabApply",
	                contentType:"application/json;charset=utf-8",
	                data:JSON.stringify(sy12),
	                dataType: "json",
	                success:function(data){
	                	if(data.statu=="success"){
	                		sweetAlert("添加成功");
	                		$("#addlabarrange").modal('toggle');
	                		init();
	                	}else{
	                		sweetAlert("添加失败");
	                	}
	                }
	        	});
	        });
    	}else{
    		 sweetAlert("填写的信息不完整");
             return;
    	}
   }
 </script>
</html>
