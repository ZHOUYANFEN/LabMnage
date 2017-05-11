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
    		<table class="table table-hover" id="expInfo" style="font-size:10px">
    		<tr>
    			<th style="width:7%;text-align:center">课程名称</th>
    			<th style="width:7%;text-align:center">教师姓名</th>
    			<th style="width:9%;text-align:center">实验名称</th>
    			<th style="width:9%;text-align:center">学院名称</th>
    			<th style="width:30%;text-align:center">实验内容</th>
    			<th style="width:14%;text-align:center">布置时间</th>
    			<th style="width:14%;text-align:center">完成时间</th>
    			<th style="width:6%;text-align:center">操作</th>
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
  	        		<h4 style="text-align: center" class="modal-title" id="myModalLabel">实验详情</h4>
  	        	</div>
  	        	<div class="modal-body" id="show">
  	      			<div  id="form2" style="padding-left:32%">
  	      			<div class="text">学生学号：631306060220</div>
  	      			<div class="text">实验名称：数据结构</div>
  	      			<div class="text">布置时间：20170305</div>
  	      			<div class="text">完成时间：20170406</div>
  	      			<div class="textarea">实验内容：<textarea style="width:250px;height:48px"readonly="readonly">佛尔股尔康容光焕发很丰富能否快速开发吗发动机唧唧复唧唧附加费黑胡桃积极急急急急急急急急急急急急急急急急急急</textarea></div>
  	      			
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
  	$(function (){
  		$.ajax({
  			type:'POST',
  			url:"${pageContext.request.contextPath}/teacher/queryExp",
  			success:function(data){
  				$("#expInfo").siblings().remove();
  				for(var i=0;i<data.length;i++){
  					$("#expInfo").append("<tr style='width:800px;'>"
  					+"<td style='text-align:center'>"+data[i].csy061+"</td>"
  					+"<td style='text-align:center'>"+data[i].csy051+"</td>"
  					+"<td style='text-align:center'>"+data[i].csy081+"</td>"
  					+"<td style='text-align:center'>"+data[i].csy052+"</td>"
  					+"<td style='text-align:center'><div class='content'>"+data[i].csy082+"</div></td>"
  					+"<td style='text-align:center'>"+(new Date(data[i].csy083).toLocaleDateString().replace(/\//g,"-").substr(0,8))+"</td>"
  					+"<td style='text-align:center'>"+(new Date(data[i].csy084).toLocaleDateString().replace(/\//g,"-").substr(0,8))+"</td>"
  					+"<td style='text-align:center'><input type='button' class='btn btn-primary btn-xs' value='详情' id='apply' onclick='openExp("+data[i].csy080+")'></td>"
  					+"</tr>");
  				};
  			}
  		})
  	})
  	/**
  	*传入实验id，查询出有多少学生选择该实验课程
  	*/
  	function openExp(id){
  		$.ajax({
  			type:'POST',
  			url:"${pageContext.request.contextPath}/teacher/studentExp?="+id,
  			success:function(data){
  				$("#expInfo").siblings().remove();
  				for(var i=0;i<data.length;i++){
  					$("#expInfo").append( /*"<tr style='width:800px;'>"
  					+"<td style='text-align:center'>"+data[i].csy061+"</td>"
  					+"<td style='text-align:center'>"+data[i].csy051+"</td>"
  					+"<td style='text-align:center'>"+data[i].csy081+"</td>"
  					+"<td style='text-align:center'>"+data[i].csy052+"</td>"
  					+"<td style='text-align:center'><div class='content'>"+data[i].csy082+"</div></td>"
  					+"<td style='text-align:center'>"+data[i].csy083+"</td>"
  					+"<td style='text-align:center'>"+data[i].csy084+"</td>"
  					+"<td style='text-align:center'><input type='button' class='btn btn-primary btn-xs' value='详情' id='apply' onclick='openExp("+data[i].csy080+")'></td>"
  					+"</tr>" */);
  				};
  			}
  		})
  		
  	}
  	
  </script>
</html>
