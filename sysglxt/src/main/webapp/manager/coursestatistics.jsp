<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
     <title>课程统计</title>
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
    <div id="main" style="width: 450px;height:350px;margin-top:50px;margin-left:20px"></div>
     <div id="main_2" style="width: 450px;height:350px;float:right;margin-top:-350px;margin-right:20px;background-color:red"></div>
    <script type="text/javascript">
       $(function(){
            $.ajax({
                type:'post',
                url:"${pageContext.request.contextPath}/statistic/coursestatistics",
                success:function(coursedata){
                   var myChart = echarts.init(document.getElementById('main'));
                   option = {
                            // 基于准备好的dom，初始化echarts实例           
                           backgroundColor: '#2c343c',
                           title: {
                               text: '实验课程统计',
                               left: 'center',
                               top: 20,
                               textStyle: {
                                   color: '#ccc'
                               }
                           },
               
                           tooltip : {
                               trigger: 'item',
                               formatter: "{a} <br/>{b} : {c} ({d}%)"
                           },
               
                           visualMap: {
                               show: false,
                               min: 80,
                               max: 600,
                               inRange: {
                                   colorLightness: [0, 1]
                               }
                           },
                           series : [
                               {
                                   name:'各个学院实验安排',
                                   type:'pie',
                                   radius : '55%',
                                   center: ['50%', '50%'],
                                   data:coursedata.sort(function (a, b) { return a.value - b.value}),
                                   roseType: 'angle',
                                   label: {
                                       normal: {
                                           textStyle: {
                                               color: 'rgba(255, 255, 255, 0.3)'
                                           }
                                       }
                                   },
                                   labelLine: {
                                       normal: {
                                           lineStyle: {
                                               color: 'rgba(255, 255, 255, 0.3)'
                                           },
                                           smooth: 0.2,
                                           length: 10,
                                           length2: 20
                                       }
                                   },
                                   itemStyle: {
                                       normal: {
                                           color: '#c23531',
                                           shadowBlur: 200,
                                           shadowColor: 'rgba(0, 0, 0, 0.5)'
                                       }
                                   },
               
                                   animationType: 'scale',
                                   animationEasing: 'elasticOut',
                                   animationDelay: function (idx) {
                                       return Math.random() * 200;
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
