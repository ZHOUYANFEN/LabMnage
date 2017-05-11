<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>资源查看</title> 
    <%@include  file="/common/pt_head.jsp"%>
    
    
    <link href="${pageContext.request.contextPath}/resources/css/jquery-ui-1.10.1.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/nigran.datepicker.css" rel="stylesheet">    
    <script src="${pageContext.request.contextPath}/resources/js/jquery-1.9.1.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-ui-1.10.1.min.js"></script>   
    
    <!--树型结构主要样式-->        
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css" /> 
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-1.7.2.min.js"></script>
    <link href="${pageContext.request.contextPath}/resources/css/video-js.css" rel="stylesheet">
    <!-- If you'd like to support IE8 -->
    <script src="${pageContext.request.contextPath}/resources/js/videojs-ie8.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/video.min.js"></script>
    <style>
        #csy134{ width: 640px; height: 264; margin-left: auto; margin-right: auto; margin-top: 100px; }
    </style>
    
</head>
<body style="font-family:'黑体';font-size:16px">
    <!-- <div id="button_querymenu" style="margin-top:20px;margin-left:60px">                    
                     资源名称:<input type="text" name="csy021" width="100px" id="csy131">
                     资源类型:<input type="text" name="csy021" width="100px" id="csy132">
                     上传时间:
         <article style="float:right;margin-right:170px;margin-top:1px">
            <div>
                <input type="text" id="csy136" />
            </div>
         </article>
        <button type="button" class="btn btn-default" aria-label="Left Align" style="float:right;margin-right:-280px" >
            <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                                查询 
        </button>      
    </div> -->

    <div style="float:left;margin-left:30px;margin-top:40px; width:280px;height:600px;padding:0">
   
        <div class="tree" id="treelist">
            <h3 align="center">资源类型列表</h3>
        </div>          
    </div>
    
    <div style="float:right;margin-right:30px;margin-top:40px; width:600px;height:600px;padding:0;">
        
        <!-- <button type="button" class="btn btn-default" aria-label="Left Align"  onclick="download()" style="margin-left:250px;margin-top:20px">
            <span class="glyphicon glyphicon-download" aria-hidden="true"></span>
                            下载
        </button>  -->
        <h4 align="center">资源列表</h4>
         <table class="table table-hover" id="resourcelist" style="font-size:10px">
            <tr id="resorcehead">
                <td >资源名称</td>
                <td >上传人</td>
                <td >资源内容</td>
                <td >上传时间</td>
                <td >操作</td>
            </tr>
        </table>
    </div>
    
    <div class="modal fade bs-example-modal-lg" id="rosourcedetail" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
      <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="myModalLabel">资源详情</h4>
          </div>
          <div class="modal-body" style="height:500px">
            <h2 align='center' id='csy131'></h2>
            <input id='csy130' hidden='hidden' >
            <span style='font-size:12px' id='csy133'></span>
            <div style='font-size:12px;margin-top:10px;margin-left:140px' id='csy134_div'>
                  
                  
            </div>
            <button type="button" class="btn btn-default" aria-label="Left Align" id="download"  style="margin-left:370px;margin-top:20px">
                <span class="glyphicon glyphicon-download" aria-hidden="true"></span>
                                下载
            </button>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
          </div>
        </div>
      </div>
    </div>

    
</body>
    <script type="text/javascript">
   /*  var myPlayer = videojs('my-video');
    videojs("my-video").ready(function(){
        var myPlayer = this;
        myPlayer.play();
    }); */
        $(document).ready(function () {
           
           /*  $( "#csy136" ).datepicker({
                inline:true,
                showOtherMonths:true
            }).datepicker('widget').wrap('<div class="ll-skin-nigran"/>'); */
            
            
            $.ajax({
                type:'post',
                url:"${pageContext.request.contextPath}/resource/queryResourceType",
                success:function(data){
                    for(var i=0;i<data.length;i++){
                        $("#treelist").append(" <ul>"
                                                +"<li>"
                                                +"<span onclick='queryResourceList("+data[i].csy160+",event)' id='"+data[i].csy160+"' style='width:200px;margin-left:-30px;cursor:pointer'><i class='icon-calendar' ></i> "+data[i].csy161+"</span>"                      
                                                +"</li>"
                                                +"</ul>");
                    }
                }
            });
        });
        
        /*查询每个类型的资源*/
        function queryResourceList(csy160,e){
            $('.tree li:has(ul)').addClass('parent_li').find(' > span').attr('title', 'Collapse this branch');
            var children = $("#"+csy160).parent('li.parent_li').find(' > ul');
            if (children.is(":visible")) {
                  children.empty();
                  $("#"+csy160).siblings().remove();
                  children.hide('fast');
                  $(this).attr('title', 'Expand this branch').find(' > i').addClass('icon-plus-sign').removeClass('icon-minus-sign');
            } else {
                    children.show('fast');
                    $(this).attr('title', 'Collapse this branch').find(' > i').addClass('icon-minus-sign').removeClass('icon-plus-sign');
                    $.ajax({
                        type:'post',
                        url:"${pageContext.request.contextPath}/resource/queryResourceList?csy160="+csy160,
                        success:function(data){
                            $("#resorcehead").siblings().remove();
                            for(var i=0;i<data.length;i++){                          
                                $("#"+csy160).after("<ul>"
                                                  +"<li>"
                                                  +"<span onclick='queryResourceDetail("+data[i].csy130+")' class='badge badge-success' style='cursor:pointer'><i class='icon-minus-sign'></i>"+data[i].csy131+"</span>"
                                                  +"<ul>"
                                                  +"<li>"
                                                  +"<span><i class='icon-time'></i>"+(new Date(data[i].csy136).toLocaleDateString().replace(/\//g,"-").substr(0,8))+"</span>"
                                                  +"</li>"
                                                  +"</ul>"
                                                  +"</li>"                                 
                                                  +"</ul>");
                                
                                $("#resourcelist").append("<tr onclick='queryResourceDetail("+data[i].csy130+")' data-toggle='modal' data-target='#rosourcedetail'>"
                                                                +"<td >"+data[i].csy131+"</td>"
                                                                +"<td >上传人</td>"
                                                                +"<td >"+data[i].csy133+"</td>"
                                                                +"<td >"+(new Date(data[i].csy136).toLocaleDateString().replace(/\//g,"-").substr(0,8))+"</td>"
                                                                +"<td><button type='button' class='btn btn-primary btn-xs'  onclick='queryResourceDetail("+data[i].csy130+")'>详情</button>"
                                                                +"&nbsp<button type='button' class='btn btn-primary btn-xs' onclick='download("+data[i].csy130+")'><span class='glyphicon glyphicon-download' aria-hidden='true'></span>下载</button></td>"
                                                                +"</tr>");
                            }
                        }
                    });
                }
            e.stopPropagation();
            
        }
 
        /*查询每个资源的详情*/
        function queryResourceDetail(csy130){
            $("#download").attr("onclick","download("+csy130+")");
            $.ajax({
                type:'post',
                url:"${pageContext.request.contextPath}/student/queryResourceDetail?csy130="+csy130,
                success:function(data){
                    var type=data.csy134.substr(data.csy134.lastIndexOf(".")+1);
                    
                     $("#csy130").val(data.csy130);
                     $("#csy131").text(data.csy131);
                     $("#csy133").text(data.csy133);
                     $("#csy134_div").empty();
                     if((type=='mp4')||(type=='WebM')||(type=='ogg')){
                         $("#csy134_div").append("<video id='csy134_video' class='video-js' controls preload='auto' width='640px' height='300px' data-setup='{}'>"
                                 +" <source src='"+data.csy134+"' type='video/mp4'>"                   
                                 +"</video>");
                    }else{
                        $("#csy134_div").append("<div style='width:180px;height:170px'>"
                                                +"<img src='${pageContext.request.contextPath}/resources/file/"+type.toLowerCase()+".png' alt='' width='180px' height='170px' />"
                                                +"</div>");
                    }
              }
         });
                     
        }
        /*下载资源*/
        function download(csy130){
            $.ajax({
                type:'post',
                async: false,
                url:"${pageContext.request.contextPath}/student/download?csy130="+csy130,
                success:function(data){
                    
                }
            });
        }
    </script>

</html>