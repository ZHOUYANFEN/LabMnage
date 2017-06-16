<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
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
    .input{
    
    }

    </style>

  </head>
  
  <body  style="font-family:'黑体';font-size:16px">
  	<div style="width:280px;margin:10px">
		<span style="display:inline-block;margin-top:5px;">课程名称：</span> 
		<select
			id="select" name="select_class" class="form-control pull-right"
			style="width: 200px;padding:0;" onchange="changeClass(this.value)">
			<option>---请选择课程---</option>
		</select>
	</div>
     <div>
    	<form id="form" method="post" action="">
    		<table class="table table-hover" id="expInfo" style="font-size:10px">
    		<tr>
    			<th style="width:7%;text-align:center">学号</th>
    			<th style="width:7%;text-align:center">姓名</th>
    			<th style="width:7%;text-align:center">课程名称</th>
    			<th style="width:30%;text-align:center">分数</th>
    			<th style="width:6%;text-align:center">操作</th>
    			</tr>
    		</table>
    	</form>
    </div>
    <!-- 评分模态框 -->
      <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
  	    	<div class="modal-content">
  	      		<div class="modal-header">
  	        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
  	        		<span aria-hidden="true">&times;</span></button>
  	        		<h4 style="text-align: center" class="modal-title" id="myModalLabel">评分</h4>
  	        	</div>
  	        	<div class="modal-body" id="show">
  	      			<div  id="form2" style="padding-left:32%">
  	      			</div>
  	      		</div>
  	      		<div class="modal-footer" style="text-align: center">
  	      			<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>  	
  	      			<button type="button" class="submit-button btn btn-default">确认</button>        		
  	      		</div>
  	      	</div>
  	     </div>
    </div>
    <!-- 查看实验详情模态框 -->
      <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
  	    	<div class="modal-content">
  	      		<div class="modal-header">
  	        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
  	        		<span aria-hidden="true">&times;</span></button>
  	        		<h4 style="text-align: center" class="modal-title" id="myModalLabel">评分</h4>
  	        	</div>
  	        	<div class="modal-body" id="query">
  	      			<div  id="form3" style="padding-left:32%">
  	      			</div>
  	      		</div>
  	      		<div class="modal-footer" style="text-align: center">
  	      			<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>  	
  	      			<button type="button" class="submit-button2 btn btn-default" data-dismiss="modal">确认</button>        		
  	      		</div>
  	      	</div>
  	     </div>
    </div>
  </body>
  <script type="text/javascript">
  	$(function (){
  		$.ajax({
  			type:'POST',
  			url:"${pageContext.request.contextPath}/teacher/queryClassScore",
  			success:function(data){
  				$("#expInfo").siblings().remove();
  				var Data = data;
  				var sy04list;
  				var sy06List;
  				var sy07List;
  				var clearList;
  				for(var key in Data) {
  					if("Sy07"==key){
  						sy07List = Data[key];
  					}
  					if("Sy06"==key){
  						sy06List = Data[key];
  					}
  					if("Sy04"==key){
  						sy04list = Data[key];
  					}
  					if("Sy06Clear"==key){
  						clearList = Data[key];
  					}
  					
  				}
  				for(var i=0;i<sy07List.length;i++){
  					var studentName;
  					var className;
  					if(sy07List[i].csy040==sy04list[i].csy040){
  						studentName=sy04list[i].csy041;
  					}
  					if(sy07List[i].csy060==sy06List[i].csy060){
  						className=sy06List[i].csy061;
  					}
  					var score = sy07List[i].csy071;
  					if(score==null){
  						score = "未评分";
  					}
  					var studentClassName = sy07List[i].csy040+","+sy07List[i].csy060;
  					$("#expInfo").append("<tr style='width:800px;'>"
  					+"<td style='text-align:center;width:10%;'>"+sy07List[i].csy040+"</td>"
  					+"<td style='text-align:center;width:20%;'>"+studentName+"</td>"
  					+"<td style='text-align:center;width:20%;'>"+className+"</td>"
  					+"<td style='text-align:center;width:10%;'>"+sy07List[i].csy071+"</td>"
  					+"<td style='text-align:center;width:10%;'><input type='button' class='score-button btn btn-primary btn-xs' value='评分' onclick='addScore("+studentClassName+")'></td>"
  					+"<td style='display:none;text-align:center;width:10%;'><input type='button' class='edit-button btn btn-danger btn-xs' data-toggle='modal' data-target='#myModal1' value='修改'></td>"
  					+"</tr>");
  					
  				};
  				for(var i = 0;i<clearList.length;i++){
  					$("#select").append("<option id="+clearList[i].csy060+">"+clearList[i].csy061+"</option>")
  				}
  			},
  	
  		})
  	})
  	
  	/**
  	*评分
  	*/
  	function addScore(id){
  		$("#form2").empty();
  		var ids=id;
  		$.ajax({
  			type:'POST',
  			url:"${pageContext.request.contextPath}/teacher/queryStudentClass",
  			data: {'additems':ids.toString()}, 
  			success:function(data){
  				var Data = data;
  				var sy04;
  				var sy06;
  				var sy07;
  				for(var key in Data) {
  					if("Sy07"==key){
  						sy07 = Data[key];
  					}
  					if("Sy06"==key){
  						sy06 = Data[key];
  					}
  					if("Sy04"==key){
  						sy04 = Data[key];
  					}
  				}
  				$("#form2").siblings().remove();
					$("#form2").append("<p name="+sy07.csy040+" id='sy07csy040'>学号："+sy07.csy040+"</p>"
							+"<p>姓名："+sy04.csy041+"</p>"
							+"<p name="+sy07.csy060+" id='sy07csy060'>课程："+sy06.csy061+"</p>"
		      				+"<p>实验评分：<input class='input form-control' type='text' id='csy071' style='display:inline-block;width:80px;height:30px;'></p>"  					
		      				);
  			}
  			
  		})
  		$("#myModal").modal("show");
  	}

  	/**
  	*提交分数
  	*/
  	$("#myModal .submit-button").click(submitScore);
  	function submitScore(){
  		var csy040 = $("#sy07csy040").attr("name");
  		var csy060 = $("#sy07csy060").attr("name");
  		var csy071 = $("#csy071").val();
  		var resultList = new Array(); 
  		resultList.push(csy040);
  		resultList.push(csy060);
  		if(csy071==null){
  			sweetAlert("请输入分数");
  		}else{
  			resultList.push(csy071);
  		}
	  	if(csy071!=""){
	  		$("#myModal").modal("hide");
	  	}
 		$.ajax({
  			type:'POST',
  			url:"${pageContext.request.contextPath}/teacher/updateStudentClass",
  			contentType:"application/json;charset=utf-8",
  			data: {'additems':resultList.toString()}, 
  			success:function(data){
  				sweetAlert(data.Status);
  			}
  		});
  	}
  	
  	
  	
  </script>
</html>
