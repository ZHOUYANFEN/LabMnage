<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<td colspan="8" style="text-align: left;">
<script type="text/javascript">
	function spAttach(returnVal){
		console.log(returnVal.files.length);
		if (returnVal.files && returnVal.files.length > 0) {
			$("#fk_files").empty();
			$.each(returnVal.files,function(i, n) {
				var appendHtml = "<a target='_blank' href='${ctx}/"+n.newName+"'>"+ n.name+ 
					"</a><input type='text' name='fileName' value ='"+ n.newName+
					"'/><span>&nbsp;;&nbsp;</span>";
				$("#fk_files").append(appendHtml);
			});
		}
	}
</script>
	<!-- <div>
		<a href="javascript:makerUpload(false,spAttach,5,'shiping')" title="最多5个(每个不超过60M)">选择附件</a>
		
	</div> -->
	<span id="fk_files"></span>
</td>