<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<script type="text/javascript" src="lib/PIE_IE678.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="${basePath}static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="${basePath}static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="${basePath}lib/Hui-iconfont/1.0.7/iconfont.css" />
<link rel="stylesheet" type="text/css" href="${basePath}lib/icheck/icheck.css" />
<link rel="stylesheet" type="text/css" href="${basePath}static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="${basePath}static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>楼盘列表</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 楼盘管理 <span class="c-gray en">&gt;</span> 楼盘列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="text-c">
		<input type="text" name="" id="name" placeholder=" 编号/楼盘名称/楼盘地址" style="width:750px" class="input-text">
		<button name="" id="search" class="btn btn-success" type="submit"><i class="Hui-iconfont">&#xe665;</i> 搜索</button>
	</div>
	<div class="cl pd-5 bg-1 bk-gray mt-20"> 
	<span class="l">
		<a href="javascript:;" onclick="building_dels()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> 
		<a href="javascript:;" onclick="application.batchHot(this,'${basePath}/building/changeHot','是','','')" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 设置为热门</a> 
		<a href="javascript:;" onclick="application.batchHot(this,'${basePath}/building/changeHot','否','','')"  class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 设置为非热门</a> 
		<a class="btn btn-primary radius" onclick="building_add('添加楼盘','${basePath}building/goToAddBuilding')" href="javascript:;"><i class="Hui-iconfont">&#xe600;</i> 添加楼盘</a>
	</span> 
	<span class="r">共有数据：<strong>${page.total}</strong> 条</span> </div>
	<div class="mt-20">
		<table class="table table-border table-bordered table-bg table-hover">
			<thead>
				<tr class="text-c">
					<th width="40"><input name="" type="checkbox" value=""></th>
					<th width="80">编号</th>
					<th width="80">所在城市</th>
					<th width="80">所在区县</th>
					<th width="200">商圈名称</th>
					<th width="200">名称</th>
					<th width="300">地址</th>
					<th width="150">租金范围</th>
					<th width="100">售价</th>
					<th width="60">停车位</th>
					<th width="60">总建筑面积</th>
					<th width="60">状态</th>
					<th width="60">是否热门</th>
					<th width="100">编辑</th>
				</tr>
			</thead>
			<tbody id="pagetbody">
			<#list page.data as d>
				<tr class="text-c">
					<td><input name="" class="taid" type="checkbox" value="${d.building_id}"></td>
					<td>${d.building_id}</td>
					<td>${d.trade_area_id.district_id.city_id.city_name}</td>
					<td>${d.trade_area_id.district_id.district_name}</td>
					<td>${d.trade_area_id.trade_area_name}</td>
					<td>${d.building_name}</td>
					<td>${d.building_addr}</td>
					<td>${d.building_rent}元/平米*月</td>
					<#if fh.building_price == ''>
						<td>暂无售价</td>
					<#else>
						<td>${d.building_price}元/平米</td>
					</#if>
					<td>${d.building_car}个</td>
					<td>${d.building_acreage}㎡</td>
					<#if d.building_state == '已上线'>
						<td class="td-status"><span class="label label-success radius">已上线</span></td>
					<#else>
						<td class="td-status"><span class="label label-defaunt radius">未上线</span></td>
					</#if>
					 
					<#if d.building_isHot == '是'>
						<td ><span class="label label-danger radius">热门</span></td>
					<#else>
						 <td ><span class="label label-defaunt radius">非热门</span></td>
					</#if>
					
					<td class="td-manage">
					<#if d.building_state == '已上线'>
						<a style="text-decoration:none" id="hot" onClick="building_stop(this,'${d.building_id}')" href="javascript:;" title="下线"><i class="Hui-iconfont">&#xe6de;</i></a> 
					<#else>
						<a style="text-decoration:none" id="not" onClick="building_start(this,'${d.building_id}')" href="javascript:;" title="上线"><i class="Hui-iconfont">&#xe603;</i></a> 
					</#if>
                    <#if d.building_isHot == '是'>
	                 <a style="text-decoration:none" onClick="application.batchHot(this,'${basePath}/building/changeHot','否','${d.building_id}')" href="javascript:;" title="非热门"><i class="Hui-iconfont">&#xe615;</i>
					<#else>
	                 <a style="text-decoration:none" onClick="application.batchHot(this,'${basePath}/building/changeHot','是','${d.building_id}')" href="javascript:;" title="热门"><i class="Hui-iconfont">&#xe631;</i>
					</#if>
						<a style="text-decoration:none" class="ml-5" onClick="picture_edit('图片编辑','${basePath}building/goToPictureEdit','${d.building_id}')" href="javascript:;" title="图片编辑"><i class="Hui-iconfont">&#xe646;</i></a>
						<a style="text-decoration:none" class="ml-5" onClick="building_edit('编辑','${basePath}building/goToUpdatebuilding','${d.building_id}')" href="javascript:;" title="编辑"><i class="Hui-iconfont">&#xe6df;</i></a> 
						<a style="text-decoration:none" class="ml-5" onClick="building_del(this,${d.building_id})" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a>
					</td>
				</tr>
			</#list>
			</tbody>
		</table>
		<div class="page" style="float: left; margin: 10px 10px;">
			<a href="#">显示${page.pageNum}页，共${page.pages}页</a>
		</div>
		<div class="tcdPageCode"></div>
	</div>
</div>
<script type="text/javascript" src="${basePath}lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="${basePath}lib/layer/2.1/layer.js"></script> 
<script type="text/javascript" src="${basePath}lib/My97DatePicker/WdatePicker.js"></script> 
<script type="text/javascript" src="${basePath}lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="${basePath}static/h-ui/js/H-ui.js"></script> 
<script type="text/javascript" src="${basePath}static/h-ui.admin/js/H-ui.admin.js"></script>
<script type="text/javascript" src="${basePath}static/js/jquery.page.js"></script>
<script type="text/javascript" src="${basePath}static/js/common/common.js"></script>
<script type="text/javascript">
/*图片-编辑*/
function picture_edit(title,url,id){
	var index = layer.open({
		type: 2,
		title: title,
		content: url + "?id=" +id
	});
	layer.full(index);
}
$('.table-sort').dataTable({
	"aaSorting": [[ 1, "asc" ]],//默认第几个排序
	"bPaginate" : true
});
$(".tcdPageCode").createPage({
	pageCount:${page.pages},//总页数
    current:${page.pageNum},//当前页
    backFn:function(num){
    	ajaxPage(num);
    }
});

function ajaxPage(num){
	$.ajax({ 
        type: "post", 
        url: "${basePath}" + "building/ajaxPageBuilding", 
        data: {
        	beginNum : num,
        	pageSize : ${page.pageSize},
        	type : "",
        	name : $("#name").val().trim(),
        	beginTime : "",
        	endTime : ""
        }, 
        dataType: "json", 
        success: function(result) { 
        	change(result);
        }
	});
}
function building_edits(id){
	building_edit('编辑','${basePath}building/goToUpdatebuilding',id);
}
function change(result){
	$("#pagetbody").children().remove();
		for(var i = 0 ; i<result.data.length ; i++){
		
			var test = "";
			var stateText = "";
			var stateTexts = "";
			var ishot = "";
			if(result.data[i].building_price == ''){
				test = "暂无售价";
			} else {
				test = result.data[i].building_price + "元/平米";
			}
			if(result.data[i].building_state == "已上线"){
				stateText = '<td class="td-status"><span class="label label-success radius">已上线</span></td>';
			} else {
				stateText = '<td class="td-status"><span class="label label-defaunt radius">未上线</span></td>';
			}
			if(result.data[i].building_state == "已上线"){
				stateTexts = "<a style='text-decoration:none' onClick='building_stop(this,"+ result.data[i].building_id +")' href='javascript:;' title='下线'><i class='Hui-iconfont'>&#xe603;</i></a>";
			} else {
				stateTexts = "<a style='text-decoration:none' onClick='building_start(this,"+ result.data[i].building_id +")' href='javascript:;' title='上线'><i class='Hui-iconfont'>&#xe6de;</i></a>";
			}
			if(result.data[i].building_isHot == "是"){
				ishot = '<td><span class="label label-danger radius">热  门</span></td>';
				hotText="<a style=\"text-decoration:none\" onClick=\"application.batchHot(this,'${basePath}/building/changeHot','否',"+ result.data[i].building_id +")\" href=\"javascript:;\" title=\"非热门\"><i class=\"Hui-iconfont\">&#xe615;</i>";
			} else {
				ishot = '<td><span class="label label-defaunt radius">非热门</span></td>';
				hotText="<a style=\"text-decoration:none\" onClick=\"application.batchHot(this,'${basePath}/building/changeHot','是',"+ result.data[i].building_id +")\" href=\"javascript:;\" title=\"非热门\"><i class=\"Hui-iconfont\">&#xe631;</i>";
			}
			$("#pagetbody").append("<tr class='text-c'>" +
					  "<td><input name='' class='taid' type='checkbox' value="+ result.data[i].building_id +"></td>" +
					  "<td>"+result.data[i].building_id +"</td>" +
					  "<td>"+result.data[i].trade_area_id.district_id.city_id.city_name +"</td>" +
					  "<td>"+result.data[i].trade_area_id.district_id.district_name +"</td>" +
					  "<td>"+result.data[i].trade_area_id.trade_area_name +"</td>" +
					  "<td>"+result.data[i].building_name +"</td>" +
					  "<td>"+result.data[i].building_addr +"</td>" +
					  "<td>"+result.data[i].building_rent +"元/平米*月</td>" +
					  "<td>"+ test + "</td>" +
					  "<td>"+result.data[i].building_car +"个</td>" +
					  "<td>"+result.data[i].building_acreage +"㎡</td>" +
					  stateText + ishot +
					  "<td class='td-manage'>" +
					  stateTexts + hotText+
					  "<a style=\"text-decoration:none\" class=\"ml-5\" onClick=\"picture_edit('图片编辑','${basePath}building/goToPictureEdit','"+result.data[i].building_id+"')\" href=\"javascript:;\" title=\"图片编辑\"><i class=\"Hui-iconfont\">&#xe646;</i></a>"+
					  "<a style='text-decoration:none' class='ml-5' onClick='building_edits("+result.data[i].building_id+")' href='javascript:;' title='编辑'><i class='Hui-iconfont'>&#xe6df;</i></a>" +
					  "<a style='text-decoration:none' class='ml-5' onClick='building_del(this,"+ result.data[i].building_id +")' href='javascript:;' title='删除'><i class='Hui-iconfont'>&#xe6e2;</i></a>" +
					  "</td>" +
					  "</tr>");
		}
		$("#sumNum").text(result.total);
		$('.page').children().remove();
		$(".page").append("<a href='#'>显示"+result.pageNum+"页，共"+result.pages+"页</a>");
		$('.page').next().remove();
		$('.page').after("<div class='tcdPageCode'></div></div>");
		$(".tcdPageCode").createPage({
		    pageCount:result.pages,//总页数
		    current:result.pageNum,//当前页
		    backFn:function(num){
		    	ajaxPage(num);
		    }
		});
}
$('#search').click(function (){
	ajaxPage(1);
});

/*楼盘-添加*/
function building_add(title,url){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}

/*楼盘-查看*/
function building_show(title,url,id){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}

/*楼盘-编辑*/
function building_edit(title,url,id){
	var index = layer.open({
		type: 2,
		title: title,
		content: url+"?id="+id
	});
	layer.full(index);
}
/*楼盘-删除*/
function building_del(obj,id){
	layer.confirm('确认要删除吗？',function(index){
		$.ajax({ 
        	type: "post", 
        	url: "${basePath}" + "building/deleteHouse", 
        	data: {
        		ids : id
        	}, 
        	dataType: "json", 
        	success: function(result) { 
        		if (result.data == 0){
					layer.msg('删除失败!',{icon:5,time:2000});
        		} else {
        			$(obj).parents("tr").remove();
					layer.msg('已删除!',{icon:1,time:2000});
        		}
        	}
		});
	});
}
	function building_dels(){
		if($(".taid:checked").size() == 0){
			layer.msg('请选择要删除的内容!');
			return;
		}
		var ids = "";
		var i = 1;
		$(".taid:checked").each(function (){
			if(i == $(".taid:checked").size()){
				ids = ids + $(this).val();
			} else {
				ids = ids + $(this).val() + ",";
			}
			i++;
		});
		layer.confirm('确认要删除一条或多条内容吗？',function(index){
			$.ajax({ 
	        	type: "post", 
	        	url: "${basePath}" + "building/deleteHouse", 
	        	data: {
	        		ids : ids
	        	}, 
	        	dataType: "json", 
	        	success: function(result) { 
	        		if (result.data == 0){
						layer.msg('删除失败!',{icon:5,time:2000});
	        		} else {
						layer.msg('删除成功!',{icon:1,time:2000});
						location.replace(location.href);
	        		}
	        	}
			});
		});
	}
	/*下线*/
	function building_stop(obj,id){
		layer.confirm('确认要下线吗？',function(index){
			$.ajax({ 
	        	type: "post", 
	        	url: "${basePath}" + "building/updateState", 
	        	data: {
	       			id : id,
	       			state : "未上线"
	        	}, 
	        	dataType: "json", 
	        	success: function(result) { 
	        		if(result == 0){
	        			layer.msg('下线失败!',{icon: 5,time:2000});
	        		} else {
	        			$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="building_start(this,'+ id +')" href="javascript:;" title="上线"><i class="Hui-iconfont">&#xe603;</i></a>');
						$(obj).parents("tr").find(".td-status").eq(0).html('<span class="label label-defaunt radius">未上线</span>');
						$(obj).remove();
						layer.msg('已下线!',{icon: 5,time:2000});
	        		}
	        	}
			});
		});
	}
	
	/*上线*/
	function building_start(obj,id){
		layer.confirm('确认要上线吗？',function(index){
			$.ajax({ 
	        	type: "post", 
	        	url: "${basePath}" + "building/updateState", 
	        	data: {
	       			id : id,
	       			state : "已上线"
	        	}, 
	        	dataType: "json", 
	        	success: function(result) { 
	        		if(result == 0){
	        			layer.msg('上线失败!',{icon: 5,time:2000});
	        		} else {
	        			$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="building_stop(this,'+ id +')" href="javascript:;" title="下线"><i class="Hui-iconfont">&#xe6de;</i></a>');
						$(obj).parents("tr").find(".td-status").eq(0).html('<span class="label label-success radius">已上线</span>');
						$(obj).remove();
						layer.msg('已上线!',{icon: 6,time:2000});
	        		}
	        	}
			});
		});
	}

</script>
</body>
</html>