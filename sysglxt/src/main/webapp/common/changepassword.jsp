<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>用户菜单列表</title> 
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
<style type="text/css">
    
.fancybox-margin{margin-right:17px;}    

/* 注册页面 */

body,input,button,select,textarea,h1,h2,h3,h4,h5,h6 {
    font-family:'Helvetica Neue',STHeiti,'Microsoft YaHei',Helvetica,Arial,sans-serif
}

.btn-blue{height:40px;line-height:40px;padding:0;border:none;background-color: #66b7ff;color: #fff !important;}
.btn-blue:hover{background-color: #4DAAFF;}
.btn-blue:active{background-color: #339DFF;}
.aw-register-box{width: 714px;height: auto;margin:20px auto 40px;padding:50px 0;background:#fff;border:1px solid #b3b3b3;border-radius: 3px;text-align: center;}
.aw-register-box h1{margin:45px 0 0;font-size: 20px;color: #666666;}
.aw-register-box .mod-body{width: 390px;margin:0 auto;padding: 40px;}
.aw-register-box ul li{position:relative;line-height:30px;margin-bottom: 20px;}
.aw-register-box ul li input[type="text"], .aw-register-box ul li input[type="password"]{width:100%;height: 40px;line-height: 28px\0;padding-left:15px !important;box-shadow: none;border-color: #e6e6e6;}
.aw-register-box ul li.last{text-align: left;color:#666;}
.aw-register-box ul li.alert-danger i{margin-right: 5px;}
.aw-register-box ul li hr{margin:30px 0;}
.aw-register-box ul .aw-register-verify input{width: 190px !important;}
.aw-register-box ul .aw-register-verify img{cursor: pointer;}
.aw-register-box .more-information ul li{padding:5px 0;text-align: left;}
.aw-register-box .more-information .select_area{max-width: 120px;}
.aw-register-box .more-information-btn{position: absolute;left: 105px;top:-15px;width: 90px;background-color: #fff;color: #66b7ff;}
.aw-regiter-agreement{position:relative;width:712px;margin:10px 0 0 -201px;padding: 20px;background:#f5f5f5;}
.aw-register-agreement-txt{max-height: 200px;overflow-x:hidden;overflow-y:auto;}
/* 注册提示 */
.aw-register-box li span{position:absolute;top:0;right:-145px;width: 130px;padding:5px;font-size:12px;border-radius: 5px;overflow: hidden;text-align: left;}
.aw-reg-tips{line-height:15px;background: #EEF7FD;border: 1px solid #CFDDE6;color:#999;}
.aw-reg-err{line-height: 28px;background: #FFEAEA;border:1px solid #E5C3C4;color:#CC0000;}
.aw-reg-right{background: none;border: none;}

/* 开放接口注册页面 */
.aw-register-open-box{padding-top:30px;}
.aw-register-open-box p{width: 240px;text-align: left;margin: 0 auto 10px;}
.aw-register-open-box ul{padding-top:0px;}
.aw-register-open-tabs i{margin-left:5px;}
.aw-register-open-tabs.active .i-triangle-down{background-position: -210px -110px;}

/* iphone横屏幕 */
@media (max-width:640px){
    /*注册界面*/
    .aw-register-box .mod-body{width:100%;padding:10px;}
    .aw-register-box, .aw-register-box ul li{width: auto;}
}
@media (max-width:321px){
    .aw-register-box{width: 270px !important;}
    .aw-regiter-agreement{width: 240px;margin:10px 0 0;}
}

.aw-register-box .mod-head {
    padding-top:0px;
    background-position:center top;
    background-size:120px 120px
}
.aw-register-box .mod-head>img {
    display:none
}

ul,ol {
    margin:0;
    padding:0;
    list-style:none
}
</style>
</head>
<body>
<noscript unselectable="on" id="noscript">
    &lt;div class="aw-404 aw-404-wrap container"&gt;
        &lt;img src="http://wenda.bootcss.com/static/common/no-js.jpg"&gt;
        &lt;p&gt;你的浏览器禁用了JavaScript, 请开启后刷新浏览器获得更好的体验!&lt;/p&gt;
    &lt;/div&gt;
</noscript>

<div class="aw-register-box">
    <div class="mod-head">
        <h1>修改密码</h1>
    </div>
    <div class="mod-body">
        <form class="aw-register-form">
                                
            <ul>
                <li class="alert alert-danger hide error_message text-left">
                    <i class="icon icon-delete"></i> <em></em>
                </li>
                <li>
                    <input class="aw-register-name form-control" type="text" id="csy021" placeholder="用户名"  >
                </li>
                <li>
                    <input class="aw-register-pwd form-control" type="text" id="csy022" placeholder="密码" >
                    
                </li>
                <li>
                    <input class="aw-register-pwd form-control" type="password" id="new_csy022" placeholder="新密码"  >
                </li>
                <li>
                    <input class="aw-register-pwd form-control" type="password" id="new_csy022_1" placeholder="确认密码" >
                </li>
                               
                <li class="clearfix">
                    <button class="btn btn-large btn-blue btn-block" onclick="changePassword()">修改</button>
                </li>
            </ul>
        </form>
    </div>
    <div class="mod-footer"></div>
</div>

</body>
<script type="text/javascript">
/*修改密码*/
function changePassword(){
	var csy021=$("#csy021").val();
	var csy022=$("#csy022").val();
	var new_csy022=$("#new_csy022").val();
	var new_csy022_1=$("#new_csy022_1").val();
	if(new_csy022!=new_csy022_1){
		sweetAlert("两次密码不一样");
		return;
	}else{
		var sy02={
			"csy021":csy021,
			"csy022":csy022
		};
		$.ajax({
			type:'post',
			url:'${pageContext.request.contextPath}/user/validateUser',
			contentType:"application/json;charset=utf-8",
            data:JSON.stringify(sy02),
            dataType: "json",
            success:function(data){
                if(data.statu=='error'){
                    sweetAlert("账号或密码错误");
                    return;
                }
                var sy02_new={
                        "csy021":csy021,
                        "csy022":new_csy022
                    };
                $.ajax({
	                type:'post',
	                url:'${pageContext.request.contextPath}/user/changePassword',
	                contentType:"application/json;charset=utf-8",
	                data:JSON.stringify(sy02_new),
	                dataType: "json", 
	                success:function(data_1){
	                	   if(data_1.statu=='1'){
	                		   sweetAlert("修改成功");
	                		   return;
	                	   }else{
	                		   sweetAlert("修改失败");
	                	   }
	                }
                });
            }  
		});
	}
}
</script>
</html>