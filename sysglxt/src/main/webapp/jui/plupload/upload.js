function GetFrameWindow(frame){
	return frame && typeof(frame)=='object' && frame.tagName == 'IFRAME' && frame.contentWindow;
}
/**
 * 窗口控制，数据回显
 * */
function openWindow(param,callBack){
	var addWin = $('<div style="overflow: hidden;"/>');
	var upladoer = $('<iframe/>');
	upladoer.attr({'src':param.url,width:'100%',height:'100%',frameborder:'0',scrolling:'auto'});
	addWin.window($.extend({
		title:'提示',
		height:355,width:550,
		minimizable:false,
		modal:true,
		collapsible:false,
		inline:false,
		maximizable:false,
		resizable:false,
		content:upladoer,
		onClose:function(){
			var fw = GetFrameWindow(upladoer[0]);
			//alert("0---2"+fw.returnVal);
			callBack.call(this,fw.returnVal);
			$(this).window('destroy');
		},onOpen:function(){
			var target = $(this);
			setTimeout(function(){ 
				var fw = GetFrameWindow(upladoer[0]); 
				fw.target = target;
			},100);
		}
	},param));
}
/**
 * callback : 回调方法名称
 * maxFile : 能同时上传的文件个数
 * group ：用于磁盘存储文件分组
 * */
function makerUpload(chunk,callback,maxFile,group) {
	var basePath=$("#basePath").val();
	openWindow({url : basePath + '/jui/plupload/uploader.jsp?chunk='+ chunk+(undefined!=maxFile?'&maxFile='+maxFile:'')+'&group='+group,title : '上传文件'},
			function(returnVal) {
				if (returnVal.errors && returnVal.errors.length > 0)
					$.messager.alert('提示', "上传失败!"+ returnVal.errors.join(","));
				callback.call(this,returnVal);
			});
}