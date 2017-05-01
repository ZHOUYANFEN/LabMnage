<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>实验报告评分</title>
    
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
    			<th style="width:7%;text-align:center">学号</th>
    			<th style="width:7%;text-align:center">实验名称</th>
    			<th style="width:9%;text-align:center">完成实验内容</th>
    			<th style="width:9%;text-align:center">完成实验时间</th>
    			<th style="width:30%;text-align:center">实验评分</th>
    			<th style="width:30%;text-align:center">附件</th>
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
  	      			<!-- <div class="text">学生学号：631306060220</div>
  	      			<div class="text">实验名称：数据结构</div>
  	      			<div class="text">布置时间：20170305</div>
  	      			<div class="text">完成时间：20170406</div>
  	      			<div class="textarea">实验内容：<textarea style="width:250px;height:48px"readonly="readonly">佛尔股尔康容光焕发很丰富能否快速开发吗发动机唧唧复唧唧附加费黑胡桃积极急急急急急急急急急急急急急急急急急急</textarea></div>
  	      			 -->
  	      			</div>
  	      		</div>
  	      		<div class="modal-footer" style="text-align: center">
  	      			<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>  	
  	      			<button type="button" class="submit-button btn btn-default" data-dismiss="modal">确认</button>        		
  	      		</div>
  	      	</div>
  	     </div>
    </div>
  </body>
  <script type="text/javascript">
  	$(function (){
  		$.ajax({
  			type:'POST',
  			url:"${pageContext.request.contextPath}/teacher/queryReport",
  			success:function(data){
  				$("#expInfo").siblings().remove();
  				for(var i=0;i<data.length;i++){
  					$("#expInfo").append("<tr style='width:800px;' class="+data[i].csy090+">"
  					+"<td style='text-align:center'>"+data[i].csy040+"</td>"
  					+"<td style='text-align:center'>"+data[i].csy080+"</td>"
  					+"<td style='text-align:center'>"+data[i].csy091+"</td>"
  					+"<td style='text-align:center'>"+(new Date(data[i].csy092).toLocaleDateString().replace(/\//g,"-").substr(0,8))+"</td>"
  					+"<td style='text-align:center'><div class='content'>"+data[i].csy094+"</div></td>"
  					+"<td style='text-align:center'><a>"+data[i].csy093+"</a></td>"
  					+"<td style='text-align:center'><input type='button' id="+data[i].csy090+" class='score-button btn btn-primary btn-xs' value='评分' data-toggle='modal' data-target='#myModal'></td>"
  					+"<td style='display:none;text-align:center'><input id="+data[i].csy090+1+" type='button' class='edit-button btn btn-danger btn-xs' data-toggle='modal' data-target='#myModal1' value='修改'></td>"
  					+"</tr>");
  				};
  				$("#expInfo .score-button").click(checkScore);
  			},
  	
  		})
  	})
  	
  	/**
  	*评分
  	*/
   $("#expInfo .score-button").click(checkScore); 
  	var index;
  	function checkScore(){
  		
  		$("#form2").empty();
  		var id = $(this).closest("tr").attr("class");
  		$.ajax({
  			type:'POST',
  			url:"${pageContext.request.contextPath}/teacher/queryStudentReport?id="+id,
  			success:function(data){
  				$("#form2").siblings().remove();
  					$("#form2").append("<pi>学号："+data.csy040+"</p>"
  	  						+"<p>实验名称："+data.csy080+"</p>"
  	  						+"<p>完成实验内容："+data.csy091+"</p>"
  		      				+"<p>完成实验时间："+data.csy092+"</p>"
  		      				+"<p>实验评分：<input class='input' type='text' name="+data.csy090+" id='csy094'></p>"  					
  		      				);
  				
  			}
  					
  		});
  		
  	}
  	$("#myModal .submit-button").click(submitScore);
  	function submitScore(){
/*  		$("#"+index).css("display","none");
  		$("#"+index+1).show(); */
  		var csy094 = $("#csy094").val();
  		var csy090 = $("#csy094").attr("name");
  		var sy09={
  				"csy094":csy094,
  				"csy090":csy090
  		}
 		$.ajax({
  			type:'POST',
  			url:"${pageContext.request.contextPath}/teacher/updateStudentReport?sy09="+sy09,
  			contentType:"application/json;charset=utf-8",
            data:JSON.stringify(sy09),
            dataType: "json",
  			success:function(data){
  				
  				
  			}
  					
  		});
  
  	}
  	
  </script>
</html>
