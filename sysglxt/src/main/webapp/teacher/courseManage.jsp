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

  </head>
  
  <body  style="font-family:'黑体';font-size:16px">
      <div>    
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
               <th style="width:80px;text-align:center">课时</th>
               <th style="width:80px;text-align:center">学分</th>
               <th style="width:80px;text-align:center">开放时间</th>
               <th style="width:80px;text-align:center">地点</th>
               <th style="width:80px;text-align:center">备注</th>
               <th style="width:80px;text-align:center">操作</th>
           </tr>
           </table>
           <div class="tcdPageCode"></div>
    </div>
  </body>
  <script type="text/javascript">
  	
  </script>
</html>
