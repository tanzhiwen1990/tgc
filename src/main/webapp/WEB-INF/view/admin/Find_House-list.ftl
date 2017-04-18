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
<title>委托找房管理</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 资料管理 <span class="c-gray en">&gt;</span> 委托找房管理 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="text-c"> 
		<span class="select-box inline">
			<select name="" id="select" class="select">
				<option value="">全部分类</option>
				<option value="求租">求租</option>
				<option value="求售">求售</option>
			</select>
		</span>
		日期范围：
		<input type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'%y-%M-%d'})" id="logmin" class="input-text Wdate" style="width:180px;">
		-
		<input type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'#F{$dp.$D(\'logmin\')}',maxDate:'%y-%M-%d'})" id="logmax" class="input-text Wdate" style="width:180px;">
		<input type="text" class="input-text" style="width:250px" placeholder="输入公司名称" id="name" name="">
		<button type="submit" class="btn btn-success radius" id="search" name="search"><i class="Hui-iconfont">&#xe665;</i> 搜索</button>
	</div>
	<div class="cl pd-5 bg-1 bk-gray mt-20"> 
		<span class="r">共有数据：<strong id="sumNum">${page.total}</strong> 条</span> 
	</div>
	<div class="mt-20">
	<table class="table table-border table-bordered table-hover table-bg">
		<thead>
			<tr class="text-c">
				<th width="80">编号</th>
				<th width="">公司名称</th>
				<th width="120">房源类型</th>
				<th width="120">城市</th>
				<th width="120">区域</th>
				<th width="120">商圈</th>
				<th width="120">期望面积</th>
				<th width="120">期望价格</th>
				<th width="130">联系人</th>
				<th width="130">联系电话</th>
				<th width="160">提交时间</th>
				<th width="50">操作</th>
			</tr>
		</thead>
		<tbody id="pagetbody">
		<#list page.data as fh>
			<tr class="text-c">
				<td>${fh.find_house_id}</td>
				<td>${fh.find_house_company_name}</td>
				<td>${fh.find_house_type}</td>
				<td>${fh.find_house_city}</td>
				<td>${fh.find_house_district}</td>
				<td>${fh.find_house_trade_area}</td>
				<td>${fh.find_house_acreage}㎡</td>
			<#if fh.find_house_type == '求售'>
				<td>${fh.find_house_price}元/㎡</td>
			<#else>
				<td>${fh.find_house_price}元/月</td>
			</#if>
				<td>${fh.find_house_name}</td>
				<td>${fh.find_house_phone}</td>
				<td>${fh.find_house_time?string('yyyy-MM-dd HH:mm:ss')}</td>
				<td class="td-manage">
					<a style="text-decoration:none" href="javascript:;"  onclick="member_show('详情','${basePath}findhouse/findOneHouse?id=${fh.find_house_id}')" title="查看详情"><i class="Hui-iconfont">&#xe665;</i></a>
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
<script type="text/javascript">
$(function(){
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
	        url: "${basePath}" + "findhouse/ajaxPageFindHouse", 
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
				if(result.data[i].find_house_type == "求售"){
					test = "<td>"+result.data[i].find_house_price +"元</td>";
				} else {
					test = "<td>"+result.data[i].find_house_price +"元/㎡.月</td>";
				}
				var d = new Date();
				d.setTime(result.data[i].find_house_time);
				$("#pagetbody").append("<tr class='text-c'>" +
						  "<td>"+result.data[i].find_house_id +"</td>" +
						  "<td>"+result.data[i].find_house_company_name +"</td>" +
						  "<td>"+result.data[i].find_house_type +"</td>" +
						  "<td>"+result.data[i].find_house_city +"</td>" +
						  "<td>"+result.data[i].find_house_district +"</td>" +
						  "<td>"+result.data[i].find_house_trade_area +"</td>" +
						  "<td>"+result.data[i].find_house_acreage +"㎡</td>" +
						  test +
						  "<td>"+result.data[i].find_house_name +"</td>" +
						  "<td>"+result.data[i].find_house_phone +"</td>" +
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
});
/*查看*/
function member_show(title,url){
	layer_show(title,url,360,550);
}
function member(data){
	member_show('详情','${basePath}findhouse/findOneHouse?id=' + data);
}
</script> 
</body>
</html>