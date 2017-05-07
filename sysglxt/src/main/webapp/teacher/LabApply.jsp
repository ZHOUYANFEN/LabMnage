<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>实验室申请</title>
    
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

  <style>
  #form2{
  display:flex;
  flex-direction:column;
  padding-left:38%;
 
  }
  .input{
  border-radius:3px;
  border:1px solid rgb(229,229,229);
  }
  .text{
  margin:10px 0;
  }
  </style>
  </head>
  
  <body  style="font-family:'黑体';font-size:16px">
    <div>
    	<form id="form" method="post" action="">
    		<table class="table table-hover" id="labInfo" style="font-size:10px">
    		<tr>
    			<th style="text-align:center">序号</th>
    			<th style="text-align:center">实验室类别</th>
    			<th style="text-align:center">实验室名称</th>
    			<th style="text-align:center">实验室位置</th>
    			<th style="text-align:center">开放时间</th>
    			<th style="text-align:center">是否开放</th>
    			<th style="text-align:center">实验室描述</th>
    			<th style="text-align:center">操作</th>
    			</tr>
    		</table>
    	</form>
    </div>
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
  	    	<div class="modal-content">
  	      		<div class="modal-header">
  	        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
  	        		<span aria-hidden="true">&times;</span></button>
  	        		<h4 style="text-align: center" class="modal-title" id="myModalLabel">申&nbsp;&nbsp;&nbsp;请</h4>
  	        	</div>
  	        	<div class="modal-body" id="show">
  	      			<div  id="form2">
  	      			

  	      			</div>
  	      		</div>
  	      		<div class="modal-footer" style="text-align: center">
  	      			<button type="button" class="btn btn-default" data-dismiss="modal" onclick="aaa()">取消</button>
  	      			<button type="submit" class="btn btn-primary" data-dismiss="modal" onclick="applymsg()">确认</button>
  	      		</div>
  	      	</div>
  	     </div>
    </div>
     <div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
  	    	<div class="modal-content">
  	      		<div class="modal-header">
  	        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
  	        		<span aria-hidden="true">&times;</span></button>
  	        		<h4 style="text-align: center" class="modal-title" id="myModalLabel">实验室申请详情</h4>
  	        	</div>
  	        	<div class="modal-body" id="show">
  	      			<div  id="form3" style="padding-left:35%">

  	      			</div>
  	      		</div>
  	      		<div class="modal-footer" style="text-align: center">
  	      			<button type="button" class="btn btn-default" data-dismiss="modal" onclick="aaa()">取消</button>
  	      		
  	      		</div>
  	      	</div>
  	     </div>
    </div>
  </body>
  <script type="text/javascript">
  /*
  *显示实验室列表
  */
  	$(function(){
  		$.ajax({
  			type:'POST',
  			url:"${pageContext.request.contextPath}/teacher/queryLab",
  			success:function(data){
  				$("#labInfo").siblings().remove();
  				for(var i=0;i<data.length;i++){
  					$("#labInfo").append("<tr style='width:800px;' class="+data[i].CSY110+">"
  		  			+"<td style='text-align:center'>"+data[i].CSY110+"</td>"
  					+"<td style='text-align:center'>"+data[i].CSY101+"</td>"
  					+"<td style='text-align:center'>"+data[i].CSY111+"</td>"
  					+"<td style='text-align:center'>"+data[i].CSY112+"</td>"
  					+"<td style='text-align:center'>"+data[i].CSY113+"</td>"
  					+"<td style='text-align:center'>"+data[i].CSY114+"</td>"
  					+"<td style='text-align:center'>"+data[i].CSY115+"</td>"
  					+"<td style='text-align:center' id="+data[i].CSY110+" ><input type='button' class='apply-button btn btn-primary btn-xs' value='申请' data-toggle='modal' data-target='#myModal' onclick='applyById("+data[i].CSY110+")'></td>"
  					+"<td style='display:none;text-align:center' id="+data[i].CSY110+1+"><input type='button' class='edit-button btn btn-danger btn-xs' data-toggle='modal' data-target='#myModal1' value='详情'></td>"
  					+"</tr>");
  				};
  				$("#labInfo .edit-button").click(checkMsg);
  			}
  		
  		});
  		
  	});
    /**查询周次,返回复选框*/
    function queryWeek(){
    	var weekdata='';
    	$.ajax({
            type:'POST',
            async: false,
            url:"${pageContext.request.contextPath}/aa10/queryWeek",
            success:function(data){
            	for(var i=0;i<data.length;i++){
            		weekdata=weekdata+data[i].aaa103+"<input name='week' type='checkbox' value='"+data[i].aaa103+"'>&nbsp;";
            	}          
            }
    	});
    	return weekdata;
    }
   	var index;
   	/**
   	*申请实验室
   	*/
  	 function applyById(id){
  		 index=id;
  		 var weekdata=queryWeek();
  		$.ajax({
  			type:'POST',
  			url:"${pageContext.request.contextPath}/teacher/queryById?id="+id,
  			success:function(data){
  				$("#form2").empty();
  				$("#form2").append("<p><lable style='width:120px;text-align:right'>实验室序号：</lable><span id='csy110'>"+data.CSY110+"</span></p>"
  						+"<p><lable  style='width:120px;CSY110text-align:right'>实验室类别：</lable><span id='csy101'>"+data.CSY101+"</span></p>"
  						+"<p><lable  style='width:120px;text-align:right'>实验室名称：</lable><span id='csy111'>"+data.CSY111+"</span></p>"
	      				+"<p><lable style='width:120px;text-align:right'>实验室位置：</lable><span id='csy112'>"+data.CSY112+"</span></p>"
	      				/* +"<p>申&nbsp;请&nbsp;时&nbsp;间：<input class='input' type='text' name='date' id='csy121'></p>" */
	      				+"<p><lable  style='width:200px;text-align:right'>周次：</lable>"+weekdata+"</p>"
	      				+"<p><lable  style='width:200px;text-align:right'>申请目的：</lable><input class='input' type='text' name='text' id='csy122'></p>"
	      				+"<p><lable  style='width:120px;text-align:right'>备注：</lable><input class='input' type='text' id='csy123'></p>"
	      				
	      				);
  				//日历控件
	      		/* $( "#csy121" ).datepicker();  */	
	      	  	
	      	}
  			
  		});
  	 };
  	 /**
  	 *清空div
  	 */
  	 function aaa(){
  		 $("#form2").empty();
  	 };
  	 /**
  	 *确认提交申请
  	 */
  	 function applymsg(){
 		$("#"+index).css("display","none");
  		$("#"+index+1).show();
  		var csy110 = $("#csy110").text();//实验室id
  		 var week_array=new Array();  
  	     $("[name='week']:checked").each(function(){  
  	    	week_array.push($(this).attr('value'));//向数组中添加元素  
  	     });
  	     if(week_array.length<=0){
  	         sweetAlert("还没有选择周次");
  	         return;
  	     }
  	    var weekarray=week_array.join(',');//将数组元素连接起来以构建一个字符串  
  	  	var csy122 = $("#csy122").val();//申请目的
  	  	var csy123 = $("#csy123").val();//备注
  	  	var sy12={
  	  			"csy126":"week-"+weekarray,
  	  			"csy110":csy110,
  	  			"csy122":csy122,
  	  			"csy123":csy123
  	  	};

  	   $.ajax({
            type:'POST',
            url:"${pageContext.request.contextPath}/teacher/addLabArrange",
            contentType:"application/json;charset=utf-8",
            data:JSON.stringify(sy12),
            dataType: "json",
            success:function(data){
           	 if(data=='success'){
           		 sweetAlert("正在申请中");
           		  $("#form2").empty();
           	 }
            }
            
        
      });		 						
  	 }
  	 
  	 /*
  	 *查看详情
  	 */
  	 $("#labInfo .edit-button").click(checkMsg);
  	 function checkMsg(){
		$("#form3").empty();
  		var id = $(this).closest("tr").attr("class");
   		$.ajax({
  			type:'POST',
  			url:"${pageContext.request.contextPath}/teacher/queryEdit?id="+id,
  			success:function(data){
  				var date = new Date(data.sy12.csy121);
  				var dateTime = date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate();
  				var ispass="正在审批";
  				var checktime;
  				if(data.sy12.csy125==0){
  					ispass="正在审批"
  				}else {
  					ispass="申请通过";
  				}
  				if(data.sy12.csy124==null){
  					checktime="正在审批"
  				}else {
  					var checkdate = new Date(data.sy12.csy124);
  					checktime=checkdate.getFullYear()+"-"+(checkdate.getMonth()+1)+"-"+checkdate.getDate();
  				}
  				$("#form3").append("<p>实验室序号："+data.sy11.csy110+"</p>"
  						+"<p>实验室类别："+data.sy10.csy101+"</p>"
  						+"<p>实验室名称："+data.sy11.csy111+"</p>"
	      				+"<p>实验室位置："+data.sy11.csy112+"</p>"
	      				+"<p>实验室描述："+data.sy11.csy115+"</p>"
	      				+"<p>开放&nbsp;时间："+data.sy11.csy113+"</p>"
	      				+"<p>申&nbsp;请&nbsp;时&nbsp;间："+dateTime+"</p>"
	      				+"<p>申&nbsp;请&nbsp;目&nbsp;的："+data.sy12.csy122+"</p>"
	      				+"<p>审核时间："+checktime+"</p>"
	      				+"<p>是否通过："+ispass+"</p>"
	      				+"<p>备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注："+data.sy12.csy123+"</p>"
	      				      				
	      				);

  			}
  			
  		
  		});
  	 }
  </script>
</html>
