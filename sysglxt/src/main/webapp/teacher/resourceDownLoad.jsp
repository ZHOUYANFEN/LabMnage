<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>资源下载</title>

<!-- 引入JQuery -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/jquery-easyui-1.5.1/jquery.min.js"></script>
<!-- 引入EasyUI -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/jquery-easyui-1.5.1/jquery.easyui.min.js"></script>
<!-- 引入EasyUI的中文国际化js，让EasyUI支持中文 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/jquery-easyui-1.5.1/locale/easyui-lang-zh_CN.js"></script>
<!-- 引入EasyUI的样式文件-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/jquery-easyui-1.5.1/themes/default/easyui.css"
	type="text/css" />
<!-- 引入EasyUI的图标样式文件-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/jquery-easyui-1.5.1/themes/icon.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/bootstrap-3.3.7/dist/css/bootstrap.min.css" />
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/bootstrap-3.3.7/dist/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/sweetalert/sweetalert.min.js"></script>
<!-- 弹窗css -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/sweetalert/sweetalert.css">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<style type="text/css">
body{
    padding:0 10px;
}
table{
    table-layout:fixed;
}
.text{
    word-break:keep-all;
    white-space:nowrap;
    overflow:hidden;
    text-overflow:ellipsis;
}
.file-operate{
    width:100%;
    display: flex;
    height:50px;
    align-items: center;
    justify-content: space-between;
}

#upload{
    background-color: rgb(18,183,245);
    width:72px;
    height:30px;
    border:none;
    color:#ffffff;
    letter-spacing: 3px;
}
#search{
    border:1px solid #ffffff;
    width:77px;
    height:28px;
}
#search:focus{
    outline: none;
}
.search-div{
    border: 1px solid rgba(119,119,119,0.6);
    height:30px;
    width:100px;
    padding-left: 3px;
}
.number-div{
}
#icon:hover{
    cursor: pointer;

}
#icon{
    position: relative;
}
.operate{
    display: flex;
    width:230px;
    align-items: center;
    justify-content: space-around;

}
.download{
    background-color: transparent;
    border: none;
}
.download:focus{
    outline: none;
}
.checkbox{
    display:inline-block;
    height:15px;
    width:15px;
    vertical-align:middle;
    position: absolute;
    top:-2px;
}
.checkbox-div{
    display: inline-block;
    position:relative;
    margin-right:5px;
    margin-left:-5px;
    height:15px;
    width:15px;
}
.select-num{
    position: fixed;
    bottom: 0;
    left:0;
    width: 100%;
    height:40px;
    line-height: 40px;
    background-color:rgba(119,119,119,0.1);
    border-top:1px solid rgba(119,119,119,0.5) ;
    vertical-align:middle;
    padding:0 20px;
}
.select-file{
    float: left;
}
#cancel-all {
    float: right;

}
#select-all{
    float: right;
}
.select-style{
    width: 40px;
    height:25px;
    line-height:26px;
    text-align: center;
    margin-left:15px;
    margin-top: 7px;
    cursor: pointer;
}
#title{
    width:76px;
    text-align: center;
    border: 1px solid rgba(119,119,119,0.6);
    font-size: 12px;
    color:black;
    border-radius: 2px;
    background-color:rgb(229,229,240) ;
}
</style>
</head>

<body  style="font-family:'黑体';font-size:16px">
	<div class="file-operate">
		<div class="number-div">
			共<span>523</span>个文件
		</div>
		<div class="operate">
			<div class="search-div">
				<span class="glyphicon glyphicon-search "></span> <input type="text"
					id="search" placeholder="搜索">
			</div>

			<div id="icon">
				<span class="glyphicon glyphicon-list"></span>
				<div id="title" style="position:absolute">进入批量模式</div>
			</div>

			<button id="upload">上传</button>
		</div>
	</div>
	<table class="table table-hover">
		<thead>
			<tr style="background-color: rgb(243,243,244);color:rgb(119,119,119)">
				<th style="width:30%">文件</th>
				<th style="width:20%">更新时间</th>
				<th style="width:13%">大小</th>
				<th style="width:15%">上传者</th>
				<th style="width:13%">下载次数</th>
				<th style="width:9%"></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td class="text"><div class="checkbox-div">
						<input type="checkbox" class="checkbox" />
					</div>2016本科生考取研究生信息统计12338889999</td>
				<td>2017-04-20</td>
				<td>45.25kb</td>
				<td>熊庆林</td>
				<td>10次</td>
				<td><button class="download">
						<span class="glyphicon glyphicon-save"></span>
					</button></td>
			</tr>
			<tr>
				<td class="text"><div class="checkbox-div">
					<input type="checkbox" class="checkbox" />
					</div>2016本科生考取研究生信息统计12338889999</td>
				<td>2017-04-20</td>
				<td>45.25kb</td>
				<td>熊庆林</td>
				<td>10次</td>
				<td><button class="download">
						<span class="glyphicon glyphicon-save"></span>
					</button></td>
			</tr>
		</tbody>
	</table>
	<div class="select-num">
		<div class="select-file">
			已选择<span id="select-file-num">0</span>个文件
		</div>
		<div id="cancel-all" class="select-style">取消</div>
		<div id="select-all" class="select-style">全选</div>
	</div>
</body>
<script type="text/javascript">
$(document).ready(function(){
    $(".checkbox-div").hide();
    $(".select-num").hide();
    $("#title").hide();
    var flag=true;
    $("#icon").on("click",function(){
        $("#title").css("display","none");
        if(flag==true) {
            $(".checkbox-div").show();
            $(".select-num").show();
            flag=false;
        }
        else if(flag==false){
            $(".checkbox-div").hide();
            $(".select-num").hide();
            flag=true;
        }
    });
    $("#select-all").on("click",function(){
        $(".checkbox").attr("checked","checked");
    });
    $("#cancel-all").on("click",function(){
        $(".checkbox").attr("checked",false);
        $(".checkbox-div").hide();
        $(".select-num").hide();
        flag=true;
    });
    $("#icon").on("mouseover",function(){

        $("#title").css({"top":"26px","left":"7px","display":"block"});
    });
    $("#icon").on("mouseout",function(){
        $("#title").css("display","none");
    })
})
</script>
</html>
