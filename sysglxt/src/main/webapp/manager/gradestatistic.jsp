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
    <div id="main" style="width: 400px;height:200px;margin:10px auto"></div>
     <button type="button" class="btn btn-default" aria-label="Left Align" style="float:right;margin-right:30px" onclick="download()">
            <span class="glyphicon glyphicon-download-alt" aria-hidden="true"></span>
                              下载
     </button> 
	<div id="main_2" style="height:350px;margin-top:20px;margin-right:20px;">
	        <table class="table table-hover" id="classlist">
	          <tr id="classhead">
	              <td>班级名称</td>
	              <td>课程名称</td>
	              <td hidden="hidden">课程id</td>
	              <td>平均成绩</td>           
	              <td>学时</td>
	              <td>学分</td>
	          </tr>
	        </table>
    </div>
   
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
                 }
             });
            $.ajax({
                type:'post',
                url:"${pageContext.request.contextPath}/statistic/classGradestatistics",
                success:function(scoredata){
                	 $("#classhead").siblings().remove();
                     for(var i=0;i<scoredata.length;i++){
                         $("#classlist").append("<tr onclick=openEcharts('"+scoredata[i].csy043+"','"+scoredata[i].csy060+"')>"
					                                 +"<td>"+scoredata[i].csy043+"</td>"
					                                 +"<td>"+scoredata[i].csy061+"</td>"
					                                 +"<td hidden='hidden'>"+scoredata[i].csy060+"</td>"
					                                 +"<td>"+scoredata[i].csy071+"</td> "          
					                                 +"<td>"+scoredata[i].csy062+"</td>"
					                                 +"<td>"+scoredata[i].csy063+"</td>"
					                               +"</tr>");
                     }
                }
            });
        })
        function openEcharts(csy043,csy060){
        	$.ajax({
                type:'post',
                url:"${pageContext.request.contextPath}/statistic/classpeopleGradestatistics?csy043="+csy043+"&csy060="+csy060,
                success:function(scoredata){
                   console.log(scoredata);
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
                }
            });
        }
        /*下载*/
        function download(){
            //判断浏览器
             if (!!window.ActiveXObject || "ActiveXObject" in window){
                var inTblId="classlist";
                var inWindow=null;
                try {   
                    var allStr = "";   
                    var curStr = "";   
                    if (inTblId != null && inTblId != "" && inTblId != "null") {   
                        curStr = getTblData(inTblId, inWindow);   
                    }   
                    if (curStr != null) {   
                        allStr += curStr;   
                    }else {   
                        sweetAlert("你要导出的表不存在！");   
                        return;   
                    }   
                    var fileName = getExcelFileName();   
                    doFileExport(fileName, allStr); 
                }catch (e) {   
                    sweetAlert("导出发生异常:" + e.name + "->" + e.description + "!");   
                }  
            }else{
                sweetAlert("请用ie浏览器进行下载");
                return;
            }
        }
        function getTblData(inTbl, inWindow) {   
            var rows = 0;   
            var tblDocument = document;   
            if (!!inWindow && inWindow != "") {   
                if (!document.all(inWindow)) {   
                    return null;   
                }   
                else {   
                    tblDocument = eval(inWindow).document;   
                }   
            }   
            var curTbl = tblDocument.getElementById(inTbl);   
            var outStr = "";   
            if (curTbl != null) {   
                for (var j = 0; j < curTbl.rows.length; j++) {   
                    for (var i = 0; i < curTbl.rows[j].cells.length-1; i++) {   
                        if (i == 0 && rows > 0) {   
                            outStr += " \t";   
                            rows -= 1;   
                        }   
                        outStr += curTbl.rows[j].cells[i].innerText + "\t";   
                        if (curTbl.rows[j].cells[i].colSpan > 1) {   
                            for (var k = 0; k < curTbl.rows[j].cells[i].colSpan - 1; k++) {   
                                outStr += " \t";   
                            }   
                        }   
                        if (i == 0) {   
                            if (rows == 0 && curTbl.rows[j].cells[i].rowSpan > 1) {   
                                rows = curTbl.rows[j].cells[i].rowSpan - 1;   
                            }   
                        }   
                    }   
                    outStr += "\r\n";   
                }   
            }   
            else {   
                outStr = null;   
                sweetAlert(inTbl + "不存在!");   
            }   
            return outStr;   
        }
        /*获取名称*/
        function getExcelFileName() {   
            var d = new Date();   
            var curYear = d.getYear();   
            var curMonth = "" + (d.getMonth() + 1);   
            var curDate = "" + d.getDate();   
            var curHour = "" + d.getHours();   
            var curMinute = "" + d.getMinutes();   
            var curSecond = "" + d.getSeconds();   
            if (curMonth.length == 1) {   
                curMonth = "0" + curMonth;   
            }   
            if (curDate.length == 1) {   
                curDate = "0" + curDate;   
            }   
            if (curHour.length == 1) {   
                curHour = "0" + curHour;   
            }   
            if (curMinute.length == 1) {   
                curMinute = "0" + curMinute;   
            }   
            if (curSecond.length == 1) {   
                curSecond = "0" + curSecond;   
            }   
            var fileName = "成绩统计" + "_" + (curYear+1990) + "年" + curMonth + "月" + curDate + "日" + "_"   
                           + curHour + "点" + curMinute + "分" + curSecond + "秒" + ".xls";   
            return fileName;   
        }   
        function doFileExport(inName, inStr) {   
            var xlsWin = null;   
            if (!!document.all("glbHideFrm")) {   
                xlsWin = glbHideFrm;   
            }   
            else {   
                var width = 6;   
                var height = 4;   
                var openPara = "left=" + (window.screen.width / 2 - width / 2)   
                               + ",top=" + (window.screen.height / 2 - height / 2)   
                               + ",scrollbars=no,width=" + width + ",height=" + height;   
                xlsWin = window.open("", "_blank", openPara);   
            }   
            xlsWin.document.write(inStr);   
            xlsWin.document.close();   
            xlsWin.document.execCommand('Saveas', true, inName);   
            xlsWin.close();   
        }   
    </script>
</body>

</html>
