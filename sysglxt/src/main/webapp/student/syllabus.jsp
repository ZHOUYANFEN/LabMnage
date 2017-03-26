<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>课程表</title> 
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
</head>


<style type="text/css">
        *
        {
            font-size:12px;
            font-family: verdana, arial, helvetica, sans-serif;
            }
        ul
        {
            margin: 0px;
            padding: 0px;
            width: 100%;
            height:100%;
            display: block;
            clear: both;
            text-align: center;
        }
        ul li
        {
            float: left;
            list-style-type: none;
            border-top: #CBD8AC solid 1px;
            border-left: #CBD8AC solid 1px;
            width: 13%;
            vertical-align:middle;
            height:50px;
            padding-top:10px;
        }
        .border-r
        {
            border-right: #CBD8AC solid 1px;
        }
        .border-b
        {
            border-bottom: #CBD8AC solid 1px;
        }
        .border-l
        {
            border-right: #CBD8AC solid 1px;
            border-bottom: #CBD8AC solid 1px;
        }
    </style>
    <script type="text/javascript">
        $(document).ready(function(){
            //课程数据源 {星期(1,2,3,4,5,6),课程:[{课程名称,老师名称,节次,节次时间}]}
            var DataSource = [
                    {"weekday":1,"course":[
                        {"courseName":"语文课","teacherName":"李老师","pointName":1,"pointTime":"8:00~8:45"},
                        {"courseName":"英语课","teacherName":"张老师","pointName":2,"pointTime":"9:00~9:45"},
                        {"courseName":"数文课","teacherName":"孙老师","pointName":3,"pointTime":"10:00~10:45"},
                        {"courseName":"自习课","teacherName":"","pointName":4,"pointTime":"11:00~11:45"},
                        {"courseName":"语文课","teacherName":"李老师","pointName":5,"pointTime":"14:00~14:45"},
                        {"courseName":"英语课","teacherName":"张老师","pointName":6,"pointTime":"15:00~15:45"},
                        {"courseName":"数文课","teacherName":"孙老师","pointName":7,"pointTime":"16:00~16:45"},
                        {"courseName":"自习课","teacherName":"","pointName":8,"pointTime":"17:00~17:45"}                       
                    ]},
                    {"weekday":2,"course":[
                        {"courseName":"英语课","teacherName":"李老师","pointName":1,"pointTime":"8:00~8:45"},
                        {"courseName":"语文课","teacherName":"张老师","pointName":2,"pointTime":"9:00~9:45"},
                        {"courseName":"数文课","teacherName":"孙老师","pointName":3,"pointTime":"10:00~10:45"},
                        {"courseName":"自习课","teacherName":"","pointName":4,"pointTime":"11:00~11:45"},
                        {"courseName":"语文课","teacherName":"李老师","pointName":5,"pointTime":"14:00~14:45"},
                        {"courseName":"英语课","teacherName":"张老师","pointName":6,"pointTime":"15:00~15:45"},
                        {"courseName":"数文课","teacherName":"孙老师","pointName":7,"pointTime":"16:00~16:45"},
                        {"courseName":"自习课","teacherName":"","pointName":8,"pointTime":"17:00~17:45"}               
                    ]},
                    {"weekday":3,"course":[
                        {"courseName":"数学课","teacherName":"李老师","pointName":1,"pointTime":"8:00~8:45"},
                        {"courseName":"英语课","teacherName":"张老师","pointName":2,"pointTime":"9:00~9:45"},
                        {"courseName":"数文课","teacherName":"孙老师","pointName":3,"pointTime":"10:00~10:45"},
                        {"courseName":"自习课","teacherName":"","pointName":4,"pointTime":"11:00~11:45"},
                        {"courseName":"语文课","teacherName":"李老师","pointName":5,"pointTime":"14:00~14:45"},
                        {"courseName":"英语课","teacherName":"张老师","pointName":6,"pointTime":"15:00~15:45"},
                        {"courseName":"数文课","teacherName":"孙老师","pointName":7,"pointTime":"16:00~16:45"},
                        {"courseName":"自习课","teacherName":"","pointName":8,"pointTime":"17:00~17:45"}               
                    ]},
                    {"weekday":4,"course":[
                        {"courseName":"语文课","teacherName":"李老师","pointName":1,"pointTime":"8:00~8:45"},
                        {"courseName":"英语课","teacherName":"张老师","pointName":2,"pointTime":"9:00~9:45"},
                        {"courseName":"数文课","teacherName":"孙老师","pointName":3,"pointTime":"10:00~10:45"},
                        {"courseName":"自习课","teacherName":"","pointName":4,"pointTime":"11:00~11:45"},
                        {"courseName":"语文课","teacherName":"李老师","pointName":5,"pointTime":"14:00~14:45"},
                        {"courseName":"英语课","teacherName":"张老师","pointName":6,"pointTime":"15:00~15:45"},
                        {"courseName":"数文课","teacherName":"孙老师","pointName":7,"pointTime":"16:00~16:45"},
                        {"courseName":"自习课","teacherName":"","pointName":8,"pointTime":"17:00~17:45"}               
                    ]},
                    {"weekday":5,"course":[
                        {"courseName":"语文课","teacherName":"李老师","pointName":1,"pointTime":"8:00~8:45"},
                        {"courseName":"英语课","teacherName":"张老师","pointName":2,"pointTime":"9:00~9:45"},
                        {"courseName":"数文课","teacherName":"孙老师","pointName":3,"pointTime":"10:00~10:45"},
                        {"courseName":"自习课","teacherName":"","pointName":4,"pointTime":"11:00~11:45"},
                        {"courseName":"语文课","teacherName":"李老师","pointName":5,"pointTime":"14:00~14:45"},
                        {"courseName":"英语课","teacherName":"张老师","pointName":6,"pointTime":"15:00~15:45"},
                        {"courseName":"数文课","teacherName":"孙老师","pointName":7,"pointTime":"16:00~16:45"},
                        {"courseName":"自习课","teacherName":"","pointName":8,"pointTime":"17:00~17:45"}               
                    ]},
                    {"weekday":6,"course":[
                        {"courseName":"语文课","teacherName":"李老师","pointName":1,"pointTime":"8:00~8:45"},
                        {"courseName":"英语课","teacherName":"张老师","pointName":2,"pointTime":"9:00~9:45"},
                        {"courseName":"数文课","teacherName":"孙老师","pointName":3,"pointTime":"10:00~10:45"},
                        {"courseName":"自习课","teacherName":"","pointName":4,"pointTime":"11:00~11:45"},
                        {"courseName":"语文课","teacherName":"李老师","pointName":5,"pointTime":"14:00~14:45"},
                        {"courseName":"英语课","teacherName":"张老师","pointName":6,"pointTime":"15:00~15:45"},
                        {"courseName":"数文课","teacherName":"孙老师","pointName":7,"pointTime":"16:00~16:45"},
                        {"courseName":"自习课","teacherName":"","pointName":8,"pointTime":"17:00~17:45"}           
                    ]}
            
            ];
            
            $.each(DataSource,function(i,n){//遍历数据源 填充课程表信息
                $.each(n.course,function(j,k){//遍历当前星期(1,2,3,4,5,6)对应的课程信息
                    $("ul[name='point"+k.pointName+"'] li").eq(0).html("<span>第"+k.pointName+"节<br/>("+k.pointTime+")</span>");//填充节次
                    $("ul[name='point"+k.pointName+"'] li").eq(n.weekday).html("<span>"+k.courseName+"<br/>"+k.teacherName+"</span>");//填充当前老师,课程，听课群组信息
                    
                });
            });
        });     
    </script>
</head>

<body>
    <div style="margin-top:50px; margin-left:50px; height:99%;">
       <span>学期:2012期-夏&nbsp;&nbsp;第1周</span>
        <ul>
            <li>节次\星期</li>
            <li>星期一</li>
            <li>星期二</li>
            <li>星期三</li>
            <li>星期四</li>
            <li>星期五</li>
            <li class="border-r">星期六</li>
           
        </ul>
        <div style="clear:both; float:none;"></div>
        <ul name="point1">
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li class="border-r"></li>
        </ul>
         <div style="clear:both; float:none;"></div>
        <ul name="point2">
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li class="border-r"></li>
        </ul>
        <div style="clear:both; float:none;"></div>
        <ul name="point3">
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li class="border-r"></li>
        </ul>
         <div style="clear:both; float:none;"></div>
        <ul name="point4">
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li class="border-r"></li>
        </ul>
         <div style="clear:both; float:none;"></div>
        <ul>
            <li>--</li>
            <li>--</li>
            <li>--</li>
            <li>--</li>
            <li>--</li>
            <li>--</li>
            <li class="border-r">--</li>
        </ul>
         <div style="clear:both; float:none;"></div>
        <ul name="point5">
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li class="border-r"></li>
        </ul>
         <div style="clear:both; float:none;"></div>
        <ul name="point6">
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li class="border-r"></li>
        </ul>
         <div style="clear:both; float:none;"></div>
        <ul name="point7">
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li class="border-r"></li>
        </ul>
         <div style="clear:both; float:none;"></div>
        <ul name="point8">
            <li class="border-b"></li>
            <li class="border-b"></li>
            <li class="border-b"></li>
            <li class="border-b"></li>
            <li class="border-b"></li>
            <li class="border-b"></li>
            <li class="border-l"></li>
        </ul>
         <div style="clear:both; float:none;"></div>
    </div>
</body>
</html>