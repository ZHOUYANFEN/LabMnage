<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!-- <script type="text/javascript">
$(document).ready(function() {
    basePath = $("#xxxx").val();
});
</script> -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>文件上传</title>
    <link rel="stylesheet" href="queue/css/jquery.plupload.queue.css" type="text/css"></link>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery-easyui-1.5.1/jquery.min.js"></script>
	<script type="text/javascript" src="plupload.js"></script>
	<script type="text/javascript" src="plupload.html4.js"></script>
	<script type="text/javascript" src="plupload.html5.js"></script>
	<script type="text/javascript" src="plupload.flash.js"></script>
	<script type="text/javascript" src="zh_CN.js"></script>
    <script type="text/javascript" src="queue/jquery.plupload.queue.js"></script>
    
  	<body style="padding: 0;margin: 0;">
  	<input type="hidden" id="xxxx" value="${pageContext.request.contextPath}"/>
    <div id="uploader">&nbsp;</div>
	<script type="text/javascript">
	window.returnVal={files:[],errors:[]};
	$(function(){
		var type = 'file',
		chunk = eval('${param.chunk}'),
		max_file_size = '60mb',
		group='${param.group}',
		colose=true,maxFile=${empty param.maxFile?'1':param.maxFile},nowFile=1,
		filters =[];
		filters.push({title : "视频", extensions : "mp4,avi,flv,mov,wmv,3gp,asx,asf,mpg"});
		filters.push({title : "文档", extensions : "jpg,gif,zip,doc,docx,xls,xlsx,ppt,pptx,pdf"});
		filters.push({title : "图片", extensions : "jpeg,bmp,wmv9,rm,rmvb"});
		filters.push({title : "视频/文档", extensions : filters[0].extensions+filters[1].extensions+filters[2].extensions});

		$("#uploader").pluploadQueue($.extend({
			runtimes : 'flash,html4,html5',
			url : "${pageContext.request.contextPath}/userManager/uploadFile?group="+group,
			max_file_size : max_file_size,
			file_data_name:'file',
			headers: {Authorization: ""},
			urlstream_upload: true,
			unique_names:true,
			multi_selection:true,
			filters : [filters[${empty param.mime?'3':param.mime}]],
			flash_swf_url :"${pageContext.request.contextPath}/jui/plupload/plupload.flash.swf",
			init:{
				FileUploaded:function(uploader,file,response){
					if(response.response){
						var rs = eval("("+response.response+")");
						if(rs.success){
							file.newName=rs.msgBox.msgType;
							returnVal.files.push(file);
						}
						else returnVal.errors.push(rs.message);
					}
				},
				Error:function(upload,e){
					alert("上传出错:"+e.message+",错误码:"+e.code);
					colose=false;
				},
				UploadComplete:function(uploader,fs){
					if(colose)target.window("close");
				},
				FilesAdded: function(up, files) {
					if(nowFile>maxFile){
						this.trigger('Error', {
							code : plupload.FILE_SIZE_ERROR,
							message :'最多'+maxFile+'个文件'
						});
						$.each(files,function(i,file){
							up.removeFile(file);
						});
					}
					nowFile++;
				},FilesRemoved: function(up, files) {nowFile--}
			}
		},(chunk ? {chunk_size:'1mb'} : {})));
	})
	</script>
  </body>
</html>
