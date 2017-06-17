<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
     <title>实验室安排统计</title>
    <%@include  file="/common/pt_head.jsp"%>
    <!-- echarts -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/echarts/echarts.js"></script>
</head>
<body style="font-family:'黑体';font-size:16px;width:950px;margin:0 auto">
    <div id="labtype" style="width: 400px;height:400px;margin-left:20px"></div>
    <div id="labarrange" style="width: 400px;height:400px;margin-right:20px;margin-top:-400px;float:right"></div>
     <button type="button" class="btn btn-default" aria-label="Left Align" style="float:right;margin-right:30px" onclick="download()">
            <span class="glyphicon glyphicon-download-alt" aria-hidden="true"></span>
                              下载
     </button> 
	<div id="main_2" style="height:350px;margin-top:20px;margin-right:20px;">
	        <table class="table table-hover" id="lablist" style="font-size:10px">

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
                    	 $.ajax({
                             type:'post',
                             url:"${pageContext.request.contextPath}/statistic/labList?csy100="+param.data.id,
                             success:function(labdata){
                            	 $("#lablist").empty();
                            	 $("#lablist").append("<tr id='labhead'>"
				                                         +"<th>实验室名称</th>"
				                                         +"<th>实验室位置</th>"
				                                         +"<th>开放时间</th>"
				                                         +"<th>是否开放</th>"        
				                                         +"</tr>");
                            	 $("#labhead").siblings().remove();
                                 for(var i=0;i<labdata.length;i++){
                                   /*   if(labdata[i].csy114==0){
                                    	 labdata[i].csy114='开放';
                                     }else{
                                    	 labdata[i].csy114='暂不开放';
                                     } */
                                     $("#lablist").append("<tr style='width:800px;'>"                                                     
                                                         +"<td>"+labdata[i].csy111+"</td>"
                                                         +"<td>"+labdata[i].csy112+"</td>"
                                                         +"<td>"+labdata[i].csy113+"</td>"
                                                         +"<td>"+labdata[i].csy114+"</td>"                                                  
                                                     +"</tr>");
                                 }
                             }
                    	 });
                    });
                 }
             });
            
        	 
        	 $.ajax({
                 type:'post',
                 url:"${pageContext.request.contextPath}/statistic/labArrangeStatistics",
                 success:function(labarrangedata){
                    var myChart = echarts.init(document.getElementById('labarrange'));
                    option = {
                            title : {
                                text: '实验室安排统计图',
                                subtext: '实验室安排情况',
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
                                    name: '实验室安排统计统计',
                                    type: 'pie',
                                    radius : '55%',
                                    center: ['50%', '60%'],
                                    data:labarrangedata,
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
                         $.ajax({
                             type:'post',
                             url:"${pageContext.request.contextPath}/statistic/labArrangeListStatistics?csy010="+param.data.id,
                             success:function(labArrangeListData){
                            	 $("#lablist").empty();
                                  $("#lablist").append("<tr>"
                                                         +"<th>实验室名称</th>"
                                                         +"<th>申请人</th>"
                                                         +"<th>申请时间</th>"
                                                         +"<th>申请目的</th>"
                                                         +"<th>安排时间</th>"
                                                         +"</tr>");
                                 //$("#labarrange").siblings().remove();
                                 for(var i=0;i<labArrangeListData.length;i++){
                                	 if(param.data.id==2){
	                                     $("#lablist").append("<tr style='width:800px;'>"                                                     
	                                                         +"<td >"+labArrangeListData[i].csy111+"</td>"
	                                                         +"<td >"+labArrangeListData[i].csy051+"</td>"
	                                                         +"<td >"+labArrangeListData[i].csy121+"</td>"
	                                                         +"<td >"+labArrangeListData[i].csy122+"</td>"
	                                                         +"<td >"+labArrangeListData[i].csy126+"</td>"
	                                                     +"</tr>");
                                	 }else if(param.data.id==3){
                                		 $("#lablist").append("<tr style='width:800px;'>"                                                     
                                                 +"<td >"+labArrangeListData[i].csy111+"</td>"
                                                 +"<td >"+labArrangeListData[i].csy031+"</td>"
                                                 +"<td >"+labArrangeListData[i].csy121+"</td>"
                                                 +"<td >"+labArrangeListData[i].csy122+"</td>"
                                                 +"<td >"+labArrangeListData[i].csy126+"</td>"
                                             +"</tr>");
                                	 }
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
            var inTblId="lablist";
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
        var fileName = "实验室安排统计" + "_" + (curYear+1990) + "年" + curMonth + "月" + curDate + "日" + "_"   
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
