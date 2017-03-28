<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>实验安排</title> 
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

    <LINK href="${pageContext.request.contextPath}/resources/css/update8.css" type=text/css rel=stylesheet>
    <SCRIPT src="${pageContext.request.contextPath}/resources/js/update8.js" type=text/javascript></SCRIPT>   
</head>
<body style="font-family:'黑体';font-size:16px">
	<div style="float:left;margin-left:30px;margin-top:40px; width:200px;height:700px">
	  <input type="button" value="查看实验安排" onclick="queryExpArrange()">
		<DIV class='pnav-cnt' id="explist">
			<DIV class='pnav-box' id='letter-a'>
				<DIV class='box-title'>
					<A class="btn-fold " href="#"></A>
					<A class="btn-unfold hidden" href="#"></A> 
					  <SPAN class='pnav-letter'>数据结构</SPAN>
					  <SPANclass='cdgray'>共五个</SPAN>
				</DIV>
				<UL class="box-list hidden">
					<LI>
					   <A class=btn-fold href="#"></A> 
					   <A class="btn-unfold hidden" href="#"></A> 
					   <B> <A href="#" target='nt_phview'>实验一</A></B> 
					   <SPAN class=cdgray>链表实验</SPAN>
						<H2 class=hidden>
							<A href="#" target=nt_phview>链表实验</A>
						</H2>
					</LI>
				</UL>
			</DIV>
		</DIV>
	</div>
	<div id="arrangecontent"
		style="float:left;width:650px;height:700px;margin-left:290px;margin-top:-670px">
		<h1 align="center">实验名称</h1>
		&nbsp;&nbsp;&nbsp;<span style="font-size:12px">所属课程：</span>
		&nbsp;&nbsp;&nbsp;<span style="font-size:12px">布置时间：</span>
		&nbsp;&nbsp;&nbsp;<span style="font-size:12px">完成时间：</span>
		&nbsp;&nbsp;&nbsp;<span style="font-size:12px">教师：</span>
		<p style="font-size:14px">实验内容</p>
		<div>
            <!-- 加载编辑器的容器 -->
            <script id="container" name="content" type="text/plain"></script>
            <!-- 配置文件 -->
            <script type="text/javascript"
                src="${pageContext.request.contextPath}/resources/UEditor/ueditor.config.js"></script>
            <!-- 编辑器源码文件 -->
            <script type="text/javascript"
                src="${pageContext.request.contextPath}/resources/UEditor/ueditor.all.js"></script>
            <!-- 实例化编辑器 -->
            <script type="text/javascript">
                var ue = UE.getEditor('container');
            </script>
        </div>
	</div>

</body>
<script type="text/javascript">
	(function() {
		NTES("span.photo-search input[type=text]").addEvent("focus",
				function() {
					this.value == this.defaultValue && (this.value = "");
				}).addEvent("blur", function() {
			this.value == "" && (this.value = this.defaultValue);
		});
		NTES("div.pnav-box div.box-title a.btn-fold").addEvent(
				"click",
				function(e) {
					e.preventDefault();
					var eleTitle = NTES(this.parentNode);
					NTES(this).addCss("hidden");
					eleTitle.$("a.btn-unfold").removeCss("hidden");
					NTES(eleTitle.parentNode).$("ul.box-list").removeCss(
							"hidden");
				});
		NTES("div.pnav-box div.box-title a.btn-unfold")
				.addEvent(
						"click",
						function(e) {
							e.preventDefault();
							var eleTitle = NTES(this.parentNode);
							NTES(this).addCss("hidden");
							eleTitle.$("a.btn-fold").removeCss("hidden");
							NTES(eleTitle.parentNode).$("ul.box-list").addCss(
									"hidden");
						});
		NTES("div.pnav-box ul.box-list a.btn-fold").addEvent("click",
				function(e) {
					e.preventDefault();
					var eleTitle = NTES(this.parentNode);
					NTES(this).addCss("hidden");
					eleTitle.$("a.btn-unfold").removeCss("hidden");
					eleTitle.$("h2").removeCss("hidden");
				});
		NTES("div.pnav-box ul.box-list a.btn-unfold").addEvent("click",
				function(e) {
					e.preventDefault();
					var eleTitle = NTES(this.parentNode);
					NTES(this).addCss("hidden");
					eleTitle.$("a.btn-fold").removeCss("hidden");
					eleTitle.$("h2").addCss("hidden");
				});
		new NTES.ui.Slide(NTES("ul.photo-snav li"), NTES("div.photo-scnt"),
				"active", "mouseover", 6000);
	})();

	
	$(function(){
		$.ajax({
            type : 'POST',
            url : "${pageContext.request.contextPath}/student/queryExpArrange",
            success : function(data) {
                console.log(data);
                for (var i = 0; i < data.length; i++) {
                    $("#explist")
                            .append(
                                    "<div class='pnav-box' id='"+data[i].csy060+"'>"
                                            + "<div class='box-title'>"
                                            + "<a class='btn-fold' href='#'></a>"
                                            + "<a class='btn-unfold hidden' href='#'></a>"
                                            + "<span class='pnav-letter'>"
                                            + data[i].csy061
                                            + "</span>" + "</div>"
                                            + "</div>");
                }
            }
        });
	})
	function queryExpArrange(){
		$.ajax({
			type : 'POST',
            url : "${pageContext.request.contextPath}/student/queryExpArrange",
            success : function(data) {
                console.log(data);
                for (var i = 0; i < data.length; i++) {
                    $("#explist")
                            .append(
                                    "<div class='pnav-box' id='"+data[i].csy060+"'>"
                                            + "<div class='box-title'>"
                                            + "<a class='btn-fold' href='#'></a>"
                                            + "<a class='btn-unfold hidden' href='#'></a>"
                                            + "<span class='pnav-letter'>"
                                            + data[i].csy061
                                            + "</span>" + "</div>"
                                            + "</div>");
                }
            }
        });
	}
</script>
</html>