<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
     <title>成绩统计</title>
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
    <div id="main" style="width: 700px;height:600px;margin:50px auto"></div>
    <script type="text/javascript">
        $(function(){
            $.ajax({
                type:'post',
                url:"${pageContext.request.contextPath}/statistic/gradestatistics",
                success:function(scoredata){
                   var myChart = echarts.init(document.getElementById('main'));
                   option = {
                           title : {
                               text: '实验成绩统计图',
                               subtext: '',
                               x:'center'
                           },
                           tooltip : {
                               trigger: 'item',
                               formatter: "{a} <br/>{b} : {c} ({d}%)"
                           },
                           legend: {
                               orient: 'vertical',
                               left: 'left',
                               data: ['60以下','60--70','70--80','80--90','90--100']
                           },
                           series : [
                               {
                                   name: '成绩统计',
                                   type: 'pie',
                                   radius : '55%',
                                   center: ['50%', '60%'],
                                   data:scoredata,
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
                       
                   });
                }
            });
            
        })
        
    </script>
</body>

</html>
