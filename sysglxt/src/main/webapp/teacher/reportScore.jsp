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
		<span style="display:inline-block;margin-top:5px;">实验名称：</span> 
		<select
			id="select" name="select_class" class="form-control pull-right"
			style="width: 200px;padding:0;" onchange="changeClass(this.value)">
			<option value="defalut">---请选择课程---</option>
		</select>
	</div>
	<div>
    	<form id="form" method="post" action="">
    		<table class="table table-hover" id="expInfo" style="font-size:10px">
    		<tr>
    			<th style="width:7%;text-align:center">学号</th>
    			<th style="width:7%;text-align:center">姓名</th>
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
  	        		<h4 style="text-align: center" class="modal-title" id="myModalLabel">评分</h4>
  	        	</div>
  	        	<div class="modal-body" id="show">
  	      			<div  id="form2" style="padding-left:32%">
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
  		init();

  		
  	});
  	function init(){
  		$("#select option:not(:first)").remove("");
  		$("#expInfo tr:not(:first)").empty(""); 
  		$.ajax({
  			type:'POST',
  			url:"${pageContext.request.contextPath}/teacher/queryReport",
  			success:function(data){
  				$("#expInfo").siblings().remove();
  				var Data = data;
  				var reportlist;
  				var reportTypeList;
  				var studentList;
  				var clearList;
  				for(var key in Data) {
  					if("Sy09"==key){
  						reportlist = Data[key];
  					}
  					if("Sy08"==key){
  						reportTypeList = Data[key];
  					}
  					if("Sy04" == key){
  						studentList = Data[key];
  					}
  					if("Sy08Clear"==key){
  						clearList = Data[key];
  					}
  					
  					
  				}
  				for(var i=0;i<reportlist.length;i++){
  					var file = reportlist[i].csy093;
  					var filename = file.substring((file.lastIndexOf("//")+2),file.length);
  					var score = reportlist[i].csy094;
  					if(score==null){
  						score = "未评分";
  					}
  					var typename;
  					var content;
  					if(reportlist[i].csy080==reportTypeList[i].csy080){
  						typename = reportTypeList[i].csy081;
  						content = reportTypeList[i].csy082;
  					}
  					$("#expInfo").append("<tr style='width:800px;' class="+reportlist[i].csy090+">"
  					+"<td style='text-align:center;width:10%;'>"+reportlist[i].csy040+"</td>"
  					+"<td style='text-align:center;width:10%;'>"+studentList[i].csy041+"</td>"
  					+"<td style='text-align:center;width:20%;'>"+typename+"</td>"
  					+"<td style='text-align:center;width:20%;'>"+content+"</td>"
  					+"<td style='text-align:center;width:10%;'>"+(new Date(reportlist[i].csy092).toLocaleDateString().replace(/\//g,"-").substr(0,8))+"</td>"
  					+"<td style='text-align:center;width:10%;'><div class='content'>"+score+"</div></td>"
  					+"<td style='text-align:center;width:10%;'><a href='${pageContext.request.contextPath}/teacher/resourceDown?filepath=" + reportlist[i].csy093 + "'>"+filename+"</a></td>"
  					+"<td style='text-align:center;width:10%;'><input type='button' id="+reportlist[i].csy090+" class='score-button btn btn-primary btn-xs' value='评分' data-toggle='modal' data-target='#myModal'></td>"
  					+"<td style='display:none;text-align:center;width:10%;'><input id="+reportlist[i].csy090+1+" type='button' class='edit-button btn btn-danger btn-xs' data-toggle='modal' data-target='#myModal1' value='修改'></td>"
  					+"</tr>");
  				};
  				for(var i = 0;i<clearList.length;i++){
  					$("#select").append("<option value="+clearList[i].csy080+">"+clearList[i].csy081+"</option>")
  				}
  				$("#expInfo .score-button").click(checkScore);
  			},
  		})
  	}
  	//查询实验名
  	function changeClass(id){
  		
  		if(id=="defalut"){
  			init();
  		}else{
  			$("#expInfo tr:not(:first)").empty(""); 
  			$.ajax({
  	  			type:'POST',
  	  			url:"${pageContext.request.contextPath}/teacher/queryStudentReportByid?id="+id,
  	  			success:function(data){
  	  				var Data = data;
  	  				var reportlist;
  	  				var reportTypeList;
  	  				var studentList;
  	  				for(var key in Data) {
  	  					if("Sy09"==key){
  	  						reportlist = Data[key];
  	  					}
  	  					if("Sy08"==key){
  	  						reportTypeList = Data[key];
  	  					}
  	  					if("Sy04" == key){
  	  						studentList = Data[key];
  	  					}
  	  				}
  	  				console.log(reportlist);
  	  				console.log(reportTypeList);
  	  				console.log(studentList);
  	  				for(var i=0;i<reportlist.length;i++){
  	  					var file = reportlist[i].csy093;
  	  					var filename = file.substring((file.lastIndexOf("//")+2),file.length);
  	  					var score = reportlist[i].csy094;
  	  					if(score==null){
  	  						score = "未评分";
  	  					}
  	  					var typename;
  	  					var content;
  	  					if(reportlist[i].csy080==reportTypeList[i].csy080){
  	  						typename = reportTypeList[i].csy081;
  	  						content = reportTypeList[i].csy082;
  	  					}
  	  					$("#expInfo").append("<tr style='width:800px;' class="+reportlist[i].csy090+">"
  	  					+"<td style='text-align:center;width:10%;'>"+reportlist[i].csy040+"</td>"
  	  					+"<td style='text-align:center;width:10%;'>"+studentList[i].csy041+"</td>"
  	  					+"<td style='text-align:center;width:20%;'>"+typename+"</td>"
  	  					+"<td style='text-align:center;width:20%;'>"+content+"</td>"
  	  					+"<td style='text-align:center;width:10%;'>"+(new Date(reportlist[i].csy092).toLocaleDateString().replace(/\//g,"-").substr(0,8))+"</td>"
  	  					+"<td style='text-align:center;width:10%;'><div class='content'>"+score+"</div></td>"
  	  					+"<td style='text-align:center;width:10%;'><a href='${pageContext.request.contextPath}/teacher/resourceDown?filepath=" + reportlist[i].csy093 + "'>"+filename+"</a></td>"
  	  					+"<td style='text-align:center;width:10%;'><input type='button' id="+reportlist[i].csy090+" class='score-button btn btn-primary btn-xs' value='评分' data-toggle='modal' data-target='#myModal'></td>"
  	  					+"<td style='display:none;text-align:center;width:10%;'><input id="+reportlist[i].csy090+1+" type='button' class='edit-button btn btn-danger btn-xs' data-toggle='modal' data-target='#myModal1' value='修改'></td>"
  	  					+"</tr>");
  	  				};
  	  				$("#expInfo .score-button").click(checkScore);
  	  			}
  			});
  		}
  	}
  	
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
  				var Data = data;
  				console.log(Data);
  				var sy09;
  				var sy04;
  				for(var key in Data){
  					if("Sy09"==key){
  						sy09 = Data[key];
  					}
  					if("Sy04" == key){
  						sy04 = Data[key];
  					}
  				}
  				$("#form2").empty();
  				alert(sy09.csy040);
  				alert(sy04.csy041)
  					$("#form2").append("<p>学号："+sy09.csy040+"</p>"
  							+"<p>姓名："+sy04.csy041+"</p>"
  		      				+"<p>实验评分：<input class='input form-control' type='number' name="+sy09.csy090+" id='csy094' style='display:inline-block;width:80px;height:30px;'></p>"  					
  		      				);
  			}
  					
  		});
  		
  	}

  	/**
  	*提交
  	*/
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
            	sweetAlert(data.Status);
            	init();
            }
  		});
  	}
  	
  </script>
</html>
