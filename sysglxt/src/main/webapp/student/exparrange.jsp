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
    <META http-equiv=X-UA-Compatible content=IE=EmulateIE7>

    <LINK href="${pageContext.request.contextPath}/resources/css/update8.css" type=text/css rel=stylesheet>
    
</head>
<body  style="font-family:'黑体';font-size:16px">
    <div style="float:left;margin-left:30px;margin-top:40px;" >
	    <DIV class='pnav-cnt' id="explist">
		    <DIV class='pnav-box' id='letter-a'>
			    <DIV class='box-title'>
			        <A class="btn-fold " href="#"></A>
			        <A class="btn-unfold hidden" href="#"></A>
			        <SPAN class='pnav-letter'>数据结构</SPAN>
			        <SPAN class='cDGray'>共五个</SPAN>
			    </DIV>
			    <UL class="box-list hidden">
			      <LI>
			        <A class=btn-fold href="#"></A>
			        <A class="btn-unfold hidden" href="#"></A>
			        <B>
			            <A href="#" target='NT_PHVIEW'>实验一</A>
			        </B>
			        <SPAN class=cDGray>链表实验</SPAN> 
			        <H2 class=hidden><A href="#" target=NT_PHVIEW>链表实验</A></H2>
			      </LI>     
			    </UL>
			</DIV>
	
		    <SCRIPT src="${pageContext.request.contextPath}/resources/js/update8.js" type=text/javascript></SCRIPT>
		
			<SCRIPT type=text/javascript>
			//<![CDATA[ 
			(function(){
			NTES("span.photo-search input[type=text]").addEvent("focus", function(){ this.value == this.defaultValue && (this.value = ""); }).addEvent("blur", function(){ this.value == "" && (this.value = this.defaultValue); });
			    NTES("div.pnav-box div.box-title a.btn-fold").addEvent("click", function(e){
			        e.preventDefault();
			        var eleTitle = NTES(this.parentNode);
			        NTES(this).addCss("hidden");
			        eleTitle.$("a.btn-unfold").removeCss("hidden");
			        NTES(eleTitle.parentNode).$("ul.box-list").removeCss("hidden");
			    });
			    NTES("div.pnav-box div.box-title a.btn-unfold").addEvent("click", function(e){
			        e.preventDefault();
			        var eleTitle = NTES(this.parentNode);
			        NTES(this).addCss("hidden");
			        eleTitle.$("a.btn-fold").removeCss("hidden");
			        NTES(eleTitle.parentNode).$("ul.box-list").addCss("hidden");
			    });
			    NTES("div.pnav-box ul.box-list a.btn-fold").addEvent("click", function(e){
			        e.preventDefault();
			        var eleTitle = NTES(this.parentNode);
			        NTES(this).addCss("hidden");
			        eleTitle.$("a.btn-unfold").removeCss("hidden");
			        eleTitle.$("h2").removeCss("hidden");
			    });
			    NTES("div.pnav-box ul.box-list a.btn-unfold").addEvent("click", function(e){
			        e.preventDefault();
			        var eleTitle = NTES(this.parentNode);
			        NTES(this).addCss("hidden");
			        eleTitle.$("a.btn-fold").removeCss("hidden");
			        eleTitle.$("h2").addCss("hidden");
			    });
			    new NTES.ui.Slide(NTES("ul.photo-snav li"), NTES("div.photo-scnt"), "active", "mouseover", 6000);
			})();
			//]]> 
			</SCRIPT>
		
	    </DIV>
    </div>
</body>
</html>