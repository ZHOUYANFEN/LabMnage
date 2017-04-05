<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
     <title>主页</title>
     <script type="text/javascript" src="<c:url value="resources/jquery-easyui-1.5.1/jquery.min.js"/>"></script>
       <!-- 引入EasyUI -->
     <script type="text/javascript" src="<c:url value="resources/jquery-easyui-1.5.1/jquery.easyui.min.js"/>"></script>
       <!-- 引入EasyUI的中文国际化js，让EasyUI支持中文 -->
     <script type="text/javascript" src="<c:url value="resources/jquery-easyui-1.5.1/locale/easyui-lang-zh_CN.js"/>"></script>
       <!-- 引入EasyUI的样式文件-->
     <link rel="stylesheet" href="<c:url value="resources/jquery-easyui-1.5.1/themes/default/easyui.css"/>" type="text/css"/>
       <!-- 引入EasyUI的图标样式文件-->
     <link rel="stylesheet" href="<c:url value="resources/jquery-easyui-1.5.1/themes/icon.css"/>" type="text/css"/>
     <link rel="stylesheet" href="<c:url value="resources/bootstrap-3.3.7/dist/css/bootstrap.min.css"/>" >
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script type="text/javascript" src="<c:url value="resources/bootstrap-3.3.7/dist/js/bootstrap.min.js"/>"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/sweetalert/sweetalert.min.js"></script>
    <!-- 弹窗css -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/sweetalert/sweetalert.css">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<body>
<body style="font-family:'黑体';width:1300px;margin:0 auto">
    <div style="height:120px;margin-top:15px;background-image:url(<c:url value="resources/img/header_bg.png" />)">
        <div style="float:right;text-align:center;line-height:30px;margin-top:60px;margin-right:500px">
            <label style="font-size:30px;color:white">实验室资源管理平台</label>
        </div>
        <div style="float:right;margin-right:-620px;margin-top:90px" >
            <label style="color:white">
                <span class="glyphicon glyphicon-user" aria-hidden="true" style="top:2px"></span>
                <label id="welcomeuser">欢迎你:管理员 张三</label>
            </label>
            <a href="#" style="margin-left:20px;color:white">
                <span class="glyphicon glyphicon-off" aria-hidden="true" style="top:2px"></span>
                                      退出
            </a>
        </div>
    </div>
    <div id="center" style="height:40px;">
        <!-- <div id="head_menu" class="dropdown" style="float:right; margin-right:200px; text-align:center;line-height:40px">
            
        </div>  -->         
    </div>

    <div id="content" style="background-color:#F5F5F5;padding:30px">
        <div id="left" style=" width:220px;height:700px;">
            <div style="height:200px;background-color:white;overflow:auto" >
                <div style="height:40px;text-align:center;line-height:40px;font-size:16px">
                    <p class="bg-primary">
                        <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
                                                            个人信息
                    </p>                    
                </div>
                <div style="padding:20px">
                    <p id="username"><span class="glyphicon glyphicon-hand-right" aria-hidden="true"></span></p>
                    <p id="stunumber"><span class="glyphicon glyphicon-hand-right" aria-hidden="true"></span></p>
                    <!-- <p><span class="glyphicon glyphicon-hand-right" aria-hidden="true"></span>&nbsp专业：计算机科学与技术</p>-->
                    <p id="college"><span class="glyphicon glyphicon-hand-right" aria-hidden="true"></span></p> 
                </div>
            </div>
            <div style="height:150px;margin-top:30px;background-color:white;overflow:auto" >
                <div style="height:40px;text-align:center;line-height:40px;font-size:16px">
                    <p class="bg-primary" >
                        <span class="glyphicon glyphicon-tag" aria-hidden="true"></span>
                                                            今日安排
                    </p>                    
                </div>
            </div>
            <div id="left" style="height:200px;background-color:white;margin-top:30px;overflow:auto" >
                <div style="height:40px;text-align:center;line-height:40px;font-size:16px">
                    <p class="bg-primary">
                        <span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>
                                                          通知公告
                    </p>                    
                </div>  
            </div>
        </div>
        <div id="right" style="float:right;width:1000px;height:700px;background-color:white;margin-top:-700px">
               <iframe id="iframe1" name="iframe1" width="1000px" height="700px" style="border:none"></iframe>                              
        </div>
    </div>
</body>
<script>
   $(function(){
	   //先获取人员信息
	   
	   $.ajax({
            type:"POST",
            url:"${pageContext.request.contextPath}/menu/getUserInfo",
            success:function(data){
                console.log(data);
                //添加信息              
                if(data){
                	 if(data.sy03){
                         $("#welcomeuser").text("欢迎你，"+data.sy03.csy031);
                         $("#username").html("&nbsp姓名："+data.sy03.csy031);
                         $("#stunumber").attr("hidden","hidden");
                         $("#college").html("&nbsp职称："+data.sy03.csy032);                   
                     }else if(data.sy04){
                         $("#welcomeuser").text("欢迎你，"+data.sy04.csy041);
                         $("#username").html("&nbsp姓名："+data.sy04.csy041);
                         $("#stunumber").attr("hidden",false);
                         $("#stunumber").html("&nbsp学号："+data.sy04.csy040);
                         $("#college").html("&nbsp学院："+data.sy04.csy042);
                     }else if(data.sy05){
                         $("#welcomeuser").text("欢迎你，"+data.sy05.csy051);
                         $("#username").html("&nbsp姓名："+data.sy05.csy051);
                         $("#stunumber").attr("hidden",true);
                         $("#college").html("&nbsp职称："+data.sy05.csy052);
                     }else{
                         $("#welcomeuser").text("欢迎你，"+data.sy02.csy021);
                         $("#username").html("&nbsp姓名："+data.sy02.csy021);
                     }
                	 
	                $.ajax({
	                    type:"POST",
	                    url:"${pageContext.request.contextPath}/menu/queryMenu?csy010="+data.sy02.csy010,
	                    success:function(data){
	                        $("#center").empty();
	                        //循环添加父级菜单
	                        for(var i=0;i<data.length;i++){
	                            var margin="20px";
	                            if(i==data.length-1){
	                                margin="80px";
	                            }                   
	                            var div = $("<div id='head_menu' class='dropdown' style='float:right; margin-right:"+margin+"; text-align:center;line-height:40px'><a id='"+data[i].csy157+"'+ data-target='#' href='#' data-toggle='dropdown' role='button' aria-haspopup='true' aria-expanded='false' onclick='"+data[i].csy152+"'>"
	                                            + data[i].csy151
	                                            + "<span class='caret'></span></a></div>");
	                            $("#center").prepend(div);
	                        }
	                    }
	                });
                }else{
                	  window.location.href = "${pageContext.request.contextPath}/login.jsp"; 
                }
            }     
        });
	    /* $.ajax({
	    	type:"POST",
	    	url:"${pageContext.request.contextPath}/menu/queryMenu?csy010=1",
	    	success:function(data){
	    		$("#center").empty();
	    		//循环添加父级菜单
	    		for(var i=0;i<data.length;i++){
	    			var margin="20px";
	    			if(i==data.length-1){
	    				margin="80px";
	    			}	    			
	    			var div = $("<div id='head_menu' class='dropdown' style='float:right; margin-right:"+margin+"; text-align:center;line-height:40px'><a id='"+data[i].csy157+"'+ data-target='#' href='#' data-toggle='dropdown' role='button' aria-haspopup='true' aria-expanded='false' onclick='"+data[i].csy152+"'>"
									+ data[i].csy151
									+ "<span class='caret'></span></a></div>");
					$("#center").prepend(div);
				}
			}
		}); */

	});
	//添加子级菜单
	function selectMenu(menuid, csy155) {
		$.ajax({
					type : "POST",
					url : "${pageContext.request.contextPath}/menu/selectMenu?csy155="
							+ csy155,
					success : function(data) {
						var id = "#" + menuid;
						var next = $(id).next();
						if (next.get(0) != undefined
								&& next.get(0).tagName == 'UL') {
							next.remove();
						}
						if (data.length == 0) {
							return;
						}
						var ul = $("<ul class='dropdown-menu' aria-labelledby='"+menuid+"'></ul>");
						for (var i = 0; i < data.length; i++) {
							var li = $("<li id='"+data[i].csy157+"'><a onclick='"+data[i].csy152+"'>"
									+ data[i].csy151 + "</a></li>")
							ul.append(li);
						}
						$(id).after(ul);
						$('li.dropdown').mouseover(function() {
							$(this).addClass('open');
						}).mouseout(function() {
							$(this).removeClass('open');
						});
					}
				});
	}
	//打开菜单
	function openPage(pagename) {
		$("#iframe1").attr("src",
				"${pageContext.request.contextPath}/" + pagename);
	}
</script>
</html>