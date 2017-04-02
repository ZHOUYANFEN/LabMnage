<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>实验安排</title> 
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
    
    <!--树型结构主要样式-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" />
    	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css" />	
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-1.7.2.min.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
       
</head>
<body style="font-family:'黑体';font-size:16px">
	<div style="float:left;margin-left:30px;margin-top:40px; width:280px;height:600px;padding:0">
   
		<div class="tree" id="treelist">
		    <h3 align="center">实验安排</h3>
		</div>     		
	</div>
	
		
	<div id="arrangecontent" style="float:left;width:630px;height:500px;margin-left:330px;margin-top:-570px">
		<h2 align="center" id="csy081"></h2>
		<input id="csy080" hidden="hidden">
		&nbsp;&nbsp;&nbsp;<span style="font-size:12px" id="csy061"></span>
		&nbsp;&nbsp;&nbsp;<span style="font-size:12px" id="csy083"></span>
		&nbsp;&nbsp;&nbsp;<span style="font-size:12px" id="csy084"></span>
		&nbsp;&nbsp;&nbsp;<span style="font-size:12px" id="csy051"></span>
		<p style="font-size:14px" id="csy082"></p>
		<div>
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
        </div>
	
		<div style="float: right;margin-right: 260px;margin-top:40px"">
			<button type="button" class="btn btn-default" aria-label="Left Align" onclick="saveExp()" >
		          <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
		                     保存
		    </button>
		    <button type="button" class="btn btn-default" aria-label="Left Align" >
		          <span class="glyphicon glyphicon-minus" aria-hidden="true"></span>
		                     清空
		    </button>
	    </div>
    </div>
</body>
<script type="text/javascript">
    $(function(){
    	
        /*查询有实验安排的科目*/
    	$.ajax({
    		type:'post',
    		url:"${pageContext.request.contextPath}/student/queryExpArrange",
    		success:function(data){
    			for(var i=0;i<data.length;i++){
	    			$("#treelist").append(" <ul>"
	    				                    +"<li>"
	    				                    +"<span onclick='queryExpArrangeList("+data[i].csy060+",event)' id='"+data[i].csy060+"' style='width:200px;margin-left:-30px;cursor:pointer'><i class='icon-calendar' ></i> "+data[i].csy061+"</span>"                      
	    				                    +"</li>"
	    				                    +"</ul>");
    			}
    		}
    	})
    });
    /*查询实验安排列表*/
	function queryExpArrangeList(data,e){
		$('.tree li:has(ul)').addClass('parent_li').find(' > span').attr('title', 'Collapse this branch');
        var children = $("#"+data).parent('li.parent_li').find(' > ul');
        if (children.is(":visible")) {
              children.empty();
        	  $("#"+data).siblings().remove();
              children.hide('fast');
              $(this).attr('title', 'Expand this branch').find(' > i').addClass('icon-plus-sign').removeClass('icon-minus-sign');
        } else {
                children.show('fast');
                $(this).attr('title', 'Collapse this branch').find(' > i').addClass('icon-minus-sign').removeClass('icon-plus-sign');
                $.ajax({
                    type:'post',
                    url:"${pageContext.request.contextPath}/student/queryExpArrangeList?csy060="+data,
                    success:function(list){
                        for(var i=0;i<list.length;i++){
                            var csy083=new Date(parseInt(list[i].csy083)).toLocaleString().replace(/:\d{1,2}$/,' ').substring(0,9);
                            var csy084=new Date(parseInt(list[i].csy084)).toLocaleString().replace(/:\d{1,2}$/,' ').substring(0,9);
                            $("#"+data).after("<ul>"
                                              +"<li>"
                                              +"<span onclick='queryExpArrangeContent("+list[i].csy080+")' class='badge badge-success' style='cursor:pointer'><i class='icon-minus-sign'></i>"+list[i].csy081+"</span>"
                                              +"<ul>"
                                              +"<li>"
                                              +"<span><i class='icon-time'></i>"+csy083+"&ndash;"+csy084+"</span>"
                                              +"</li>"
                                              +"</ul>"
                                              +"</li>"                                 
                                              +"</ul>");
                        }
                    }
                });
            }
        e.stopPropagation();		
	}
    /*获取实验安排内容*/
    function queryExpArrangeContent(data){
    	$.ajax({
            type:'post',
            url:"${pageContext.request.contextPath}/student/queryExpArrangeContent?csy080="+data,
            success:function(data){
               $("#csy081").text(data[0].CSY081);
               $("#csy080").val(data[0].CSY080);
               $("#csy061").text("所属课程："+data[0].csy061);
               $("#csy051").text("指导教师："+data[0].csy051);
               $("#csy083").text("布置时间："+data[0].CSY083);
               $("#csy084").text("完成时间："+data[0].CSY084);
               $("#csy083").val(data[0].CSY083);
               $("#csy084").val(data[0].CSY084);
               $("#csy082").text("内容："+data[0].CSY082);
            }
        })
    }
    /*提交实验完成内容*/
    function saveExp(){
    	//获取html内容，     
        var csy080 =$("#csy080").val();
        var csy084 =$("#csy084").val().replace(/-/g,'/');
        var csy083 =$("#csy083").val().replace(/-/g,'/');
        var nowdate=new Date();
        if(!csy080){
        	sweetAlert("还没有选择实验课程");
        	return;
        }else{
        	if((new Date(csy084)).getTime()<nowdate||(new Date(csy083)).getTime()>nowdate){
        		sweetAlert("不在实验提交范围内，不能提交");
        		return;
        	}else{
        		 var csy091 = ue.getContent();
        		 if(!csy091){
        			 sweetAlert("内容为空，不能提交");
        			 return;
        		 }
        		 var sy09={
        			"csy080":csy080,
        			"csy091":csy091,
        		 };
        		 $.ajax({
        	            type:'post',
        	            url:"${pageContext.request.contextPath}/student/saveExp",
        	            contentType:"application/json;charset=utf-8",
        	            data:JSON.stringify(sy09),
        	            dataType:"json",
        	            success:function(data){
        	            	if(data.statu=="1"){
        	            		sweetAlert("提交成功");
        	            	}else{
        	            		sweetAlert("提交失败");
        	            	}
        	            }
        	     })
        	}
        }
    }
</script>
</html>