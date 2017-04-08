<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
     <title>实验室安排统计</title>
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
    <!-- echarts -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/echarts/echarts.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<body style="font-family:'黑体';width:950px;margin:0 auto">
    <div id="labtype" style="width: 400px;height:400px;margin-left:20px"></div>
	<div id="main_2" style="height:350px;margin-top:20px;margin-right:20px;">
	        <table class="table table-hover" id="lablist">
	          <tr id="labhead">
	              <td>实验室名称</td>
	              <td>实验室位置</td>
	              <td >开放时间</td>
	              <td>是否开放</td>           
	          </tr>
	        </table>
    </div>
   
    <script type="text/javascript">
        $(function(){
        	 $.ajax({
                 type:'post',
                 url:"${pageContext.request.contextPath}/statistic/labStatistics",
                 success:function(labdata){
                    var myChart = echarts.init(document.getElementById('labtype'));
                    option = {
                            title : {
                                text: '实验室统计图',
                                subtext: '实验室分布情况',
                                x:'center'
                            },
                            tooltip : {
                                trigger: 'item',
                                formatter: "{a} <br/>{b} : {c} ({d}%)"
                            },
                            legend: {
                                orient: 'vertical',
                                left: 'left',
                            },
                            series : [
                                {
                                    name: '实验室统计',
                                    type: 'pie',
                                    radius : '55%',
                                    center: ['50%', '60%'],
                                    data:labdata,
                                    itemStyle: {
                                        emphasis: {
                                            shadowBlur: 10,
                                            shadowOffsetX: 0,
                                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                                        }
                                    }
                                }
                            ]
                        };
                    // 使用刚指定的配置项和数据显示图表。
                    myChart.setOption(option);
                    myChart.on('click',function(param){
                    	console.log(param);
                    	 $.ajax({
                             type:'post',
                             url:"${pageContext.request.contextPath}/statistic/labList?csy100="+param.data.id,
                             success:function(labdata){
                            	 $("#labhead").siblings().remove();
                                 for(var i=0;i<labdata.length;i++){
                                     if(labdata[i].csy114==0){
                                    	 labdata[i].csy114='开放';
                                     }else{
                                    	 labdata[i].csy114='暂不开放';
                                     }
                                     $("#lablist").append("<tr style='width:800px;'>"                                                     
                                                         +"<td >"+labdata[i].csy111+"</td>"
                                                         +"<td >"+labdata[i].csy112+"</td>"
                                                         +"<td >"+labdata[i].csy113+"</td>"
                                                         +"<td >"+labdata[i].csy114+"</td>"                                                  
                                                     +"</tr>");
                                 }
                             }
                    	 });
                    });
                 }
             });
            
        })
       
    </script>
</body>

</html>
