<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
     <title>课程统计</title>
     <%@include  file="/common/pt_head.jsp"%>
    <!-- echarts -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/echarts/echarts.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<body style="font-family:'黑体';width:950px;margin:0 auto">
    <div id="main" style="width: 450px;height:300px;margin:20px auto"></div>
    <button type="button" class="btn btn-default" aria-label="Left Align" style="float:right;margin-right:30px" onclick="download()">
            <span class="glyphicon glyphicon-download-alt" aria-hidden="true"></span>
                              下载
     </button> 
    <div id="main_2" style="height:350px;margin-top:20px;margin-right:20px;">
        <table class="table table-hover" id="courselist" style="font-size:10px">
		  <tr id="coursehead">
		      <td>课程</td>
		      <td>开课教师</td>
		      <td>开课学院</td>		      
		      <td>班级</td>
		      <td>学时</td>
		      <td>学分</td>
		  </tr>
		</table>
    </div>
    <script type="text/javascript">
       $(function(){
            $.ajax({
                type:'post',
                url:"${pageContext.request.contextPath}/statistic/coursestatistics",
                success:function(coursedata){
                   var myChart = echarts.init(document.getElementById('main'));
                   option = {
                            // 基于准备好的dom，初始化echarts实例       
                       /*     color:['red'],
                           backgroundColor: '#FFFF99', */
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
                                               color: 'rgba(0, 0, 0, 0.7)'
                                           }
                                       }
                                   },
                                   labelLine: {
                                       normal: {
                                           lineStyle: {
                                               color: 'rgba(0, 0, 0, 0.7)'
                                           },
                                           smooth: 0.2,
                                           length: 10,
                                           length2: 20
                                       }
                                   },
                                   itemStyle: {
                                       normal: {
                                           color: '#FF0000',
                                           shadowBlur: 200,
                                           shadowColor: 'rgba(255, 255, 255, 0.3)'
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
                	   $.ajax({
                           type:'post',
                           url:"${pageContext.request.contextPath}/statistic/courselist?csy052="+param.name,
                           success:function(data){
                        	   $("#coursehead").siblings().remove();
                        	   for(var i=0;i<data.length;i++){
	                        	   $("#courselist").append("<tr>"
					                        	              +"<td>"+data[i].csy061+"</td>"
					                        	              +"<td>"+data[i].csy051+"</td>"
					                        	              +"<td>"+data[i].csy052+"</td>"         
					                        	              +"<td>"+data[i].csy069+"</td>"
					                        	              +"<td>"+data[i].csy062+"</td>"
					                        	              +"<td>"+data[i].csy063+"</td>"
					                        	              +"</tr>");
                        	   }
                           }
                	   });
                   });
                }
            });
            
        })
        
        
        
      /*下载*/
    function download(){
        //判断浏览器
         if (!!window.ActiveXObject || "ActiveXObject" in window){
            var inTblId="courselist";
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
        var fileName = "实验课程统计" + "_" + (curYear+1990) + "年" + curMonth + "月" + curDate + "日" + "_"   
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
