//复选框事件  
//全选、取消全选的事件  
function checkall(){  
    if ($("#checkall").attr("checked")) {  
        $(":checkbox").attr("checked", true);  
    } else {  
        $(":checkbox").attr("checked", false);  
    }
} 

function delRecord(url){
	// 判断是否至少选择一项
	var checkedNum = $("input[name='ids']:checked").length;
	if(checkedNum == 0) {
		alert("请选择至少一项！");
		return;
	}
	// 批量选择
	if(confirm("确定要删除所选记录吗？")) {
		var checkedList = new Array();
		$("input[name='ids']:checked").each(function() {
			checkedList.push($(this).val());
		});
		$.ajax({
			type: "POST",
			url: url,
			data: {'ids':checkedList.toString()},
			success: function(result) {
				if(result.success){
					alert("删除成功");
					$("[name ='ids']:checkbox").attr("checked", false);
					window.location.reload();
				}else{
					alert("删除失败");
				}
			}
		});
	}
}
	
