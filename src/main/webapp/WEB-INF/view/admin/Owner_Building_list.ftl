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
<title>业主放盘列表</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 资料管理 <span class="c-gray en">&gt;</span> 资料列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="text-c"> <span class="select-box inline">
		<select name="" id="select" class="select">
			<option value="">全部分类</option>
			<option value="出租">出租</option>
			<option value="出售">出售</option>
		</select>
		</span> 日期范围：
		<input type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'%y-%M-%d'})" id="logmin" class="input-text Wdate" style="width:180px;">
		-
		<input type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'#F{$dp.$D(\'logmin\')}',maxDate:'%y-%M-%d'})" id="logmax" class="input-text Wdate" style="width:180px;">
		<input type="text" name="" id="name" placeholder=" 大厦名称" style="width:250px" class="input-text">
		<button name="search" id="search" class="btn btn-success" type="submit"><i class="Hui-iconfont">&#xe665;</i> 搜索</button>
	</div>
	<div class="cl pd-5 bg-1 bk-gray mt-20"> 
		<!--<span class="l">
			<a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> 
		</span> -->
		<span class="r">共有数据：<strong id="sumNum">${page.total}</strong> 条</span> 
	</div>
	<div class="mt-20">
		<table class="table table-border table-bordered table-bg table-hover">
			<thead>
				<tr class="text-c">
					<th width="80">ID</th>
					<th>名称</th>
					<th width="80">类型</th>
					<th width="80">楼房号</th>
					<th width="80">建筑面积</th>
					<th width="150">出售/出租价格</th>
					<th width="100">联系人</th>
					<th width="120">联系电话</th>
					<th width="140">录入时间</th>
					<th width="120">操作</th>
				</tr>
			</thead>
			<tbody id="pagetbody">
			<#list page.data as ob>
				<tr class="text-c">
					<td>${ob.owner_building_id}</td>
					<td>${ob.owner_building_name}</td>
					<td>${ob.owner_building_type}</td>
					<td>${ob.owner_building_number}</td>
					<td>${ob.owner_building_mi}㎡</td>
					<td>${ob.owner_building_price}元</td>
					<td>${ob.owner_building_linkman}</td>
					<td>${ob.owner_building_phone}</td>
					<td>${ob.owner_building_time?string('yyyy-MM-dd HH:mm:ss')}</td>
					<td class="td-manage">
					<a style="text-decoration:none" href="javascript:;"  onclick="application.objLayer('详情','${basePath}OBuilding/detail?id=${ob.owner_building_id}','360','500')" title="查看详情"><i class="Hui-iconfont">&#xe665;</i></a>
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
<script type="text/javascript" src="${basePath}static/DateFormat.js"></script>
<script type="text/javascript" src="${basePath}static/js/common/common.js"></script>
<script type="text/javascript">
	$('.table-sort').dataTable({
		"aaSorting": [[ 0, "asc" ]],//默认第几个排序
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
	        url: "${basePath}" + "OBuilding/ajaxPage", 
	        data: {
	        	beginNum : num,
	        	pageSize : ${page.pageSize},
	        	type : $("#select").val().trim(),
	        	name : $("#name").val().trim(),
	        	beginTime : $("#logmin").val().trim(),
	        	endTime : $("#logmax").val().trim()
	        }, 
	        dataType: "json", 
	        success: function(result) { 
	        	change(result);
	        }
		});
	}
	function change(result){
		$("#pagetbody").children().remove();
		for(var i = 0 ; i<result.data.length ; i++){
			var test = "";
			if(result.data[i].owner_building_type == "出售"){
				test = "<td>"+result.data[i].owner_building_price +"元</td>";
			} else {
				test = "<td>"+result.data[i].owner_building_price +"元/㎡.月</td>";
			}
			var d = new Date();
			d.setTime(result.data[i].owner_building_time);
			$("#pagetbody").append("<tr class='text-c'>" +
					  "<td>"+result.data[i].owner_building_id +"</td>" +
					  "<td>"+result.data[i].owner_building_name +"</td>" +
					  "<td>"+result.data[i].owner_building_type +"</td>" +
					  "<td>"+result.data[i].owner_building_number +"</td>" +
					  "<td>"+result.data[i].owner_building_mi +"㎡</td>" +
					  test +
					  "<td>"+result.data[i].owner_building_linkman +"</td>" +
					  "<td>"+result.data[i].owner_building_phone +"</td>" +
					   "<td>"+ d.Format("yyyy-MM-dd hh:mm:ss") +"</td>" +
					  "<td class='td-manage'>" +
						 "<a style='text-decoration:none' href='javascript:;'  onclick='member("+result.data[i].find_house_id+")' title='查看详情'><i class='Hui-iconfont'>&#xe665;</i></a>" +
					  "</td>" + "</tr>");
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
</script> 
</body>
</html>