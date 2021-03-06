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
<title>物业管理</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 房产管理 <span class="c-gray en">&gt;</span> 物业管理 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="text-c"> <span class="select-box inline">
		<select name="" id="select" class="select">
			<option value="">全部分类</option>
			<option value="已上线">已上线</option>
			<option value="未上线">未上线</option>
		</select>
		</span> 日期范围：
		<input type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'%y-%M-%d'})" id="logmin" class="input-text Wdate" style="width:180px;">
		-
		<input type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'#F{$dp.$D(\'logmin\')}',maxDate:'%y-%M-%d'})" id="logmax" class="input-text Wdate" style="width:180px;">
		<button name="search" id="search" class="btn btn-success" type="submit"><i class="Hui-iconfont">&#xe665;</i> 搜索</button>
		
	</div>
	<div class="cl pd-5 bg-1 bk-gray mt-20"> 
		<span class="l">
			<a href="javascript:;" onclick="application.batchDelete('${basePath}/Property/delete')" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> 
		</span> 
		<a class="btn btn-primary radius" onClick="application.locationToUrl('物业添加','${basePath}/Property/addPage')" href="javascript:;"><i class="Hui-iconfont">&#xe600;</i> 添加</a>
		<span class="r">共有数据：<strong id="sumNum">${page.total}</strong> 条</span> 
	</div>
	<div class="mt-20">
		<table class="table table-border table-bordered table-bg table-hover">
			<thead>
				<tr class="text-c">
				    <th width="40"><input name="ids" type="checkbox" value=""></th>
					<th width="80">ID</th>
					<th width="80">物业名称</th>
					<th width="80">物业描述</th>
					<th width="150">更新人</th>
					<th width="100">更新时间</th>
					<th width="80">状态</th>
					<th width="100">操作</th>
				</tr>
			</thead>
			<tbody id="pagetbody">
			<#list page.data as ob>
				<tr class="text-c">
				    <td><input type="checkbox" class='taid' name="ids" value="${ob.id}"/></td>
					<td>${ob.id}</td>
					<td>${ob.type}</td>
				    <td>${ob.description}</td>
					<td>${ob.username}</td>
					<td>${ob.time?string('yyyy-MM-dd HH:mm:ss')}</td>
					<#if ob.state=='未上线'>
					  <td class="td-status"><span class="label label-defaunt radius">未上线</span></td>
					<#else>
					  <td class="td-status"><span class="label label-success radius">已上线</span></td>
					</#if>
				    <td class="td-manage">
					<#if ob.state == '已上线'>
						<a style="text-decoration:none"  onclick="application.changeStatus(this,'未上线',${ob.id},'${basePath}/Property/changeStatus')"><i class="Hui-iconfont">&#xe6de;</i></a> 
					<#else>
						<a style="text-decoration:none"  onclick="application.changeStatus(this,'已上线',${ob.id},'${basePath}/Property/changeStatus')"><i class="Hui-iconfont">&#xe603;</i></a> 
					</#if>
						<a style="text-decoration:none" class="ml-5" onclick="application.locationToUrl('物业编辑','${basePath}/Property/editPage?id=${ob.id}')" href="javascript:;" title="编辑"><i class="Hui-iconfont">&#xe6df;</i></a> 
						<a style="text-decoration:none" class="ml-5" onclick="application.deleteOne(this,'${ob.id}','${basePath}/Property/delete')" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a>
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
	        url: "${basePath}" + "Property/ajaxPage", 
	        data: {
	        	beginNum : num,
	        	pageSize : ${page.pageSize},
	        	type : "",
	        	name : "",
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
		    var btn="";
		    var status="";
		    if(result.data[i].state=="已上线"){
		     status = '<td class="td-status"><span class="label label-success radius">已上线</span></td>';
		     btn= "<a style='text-decoration:none' onClick=\"application.changeStatus(this,'未上线',"+result.data[i].id+",'${basePath}/Property/changeStatus')\" href='javascript:;' title='上线'><i class='Hui-iconfont'>&#xe6de;</i></a>";
            }else{
              btn= "<a style='text-decoration:none' onClick=\"application.changeStatus(this,'已上线',"+result.data[i].id+",'${basePath}/Property/changeStatus')\" href='javascript:;' title='下线'><i class='Hui-iconfont'>&#xe603;</i></a>";
              status='<td class="td-status"><span class="label label-defaunt radius">未上线</span></td>';
            }
			var d = new Date();
			d.setTime(result.data[i].time);
			$("#pagetbody").append("<tr class='text-c'>" +
			          "<td><input type='checkbox' class='taid' name='ids' value='"+result.data[i].id+"'/></td>" +
					  "<td>"+result.data[i].id +"</td>" +
					  "<td>"+result.data[i].type +"</td>" +
					  "<td>"+ result.data[i].description +"</td>" +
					  "<td>"+result.data[i].username +"</td>" +
					  "<td>"+d.Format("yyyy-MM-dd hh:mm:ss") +"</td>"+
					   status +
					  "<td class='td-manage'>" +
						  btn +
						  "<a style='text-decoration:none' class='ml-5' onclick=\"application.locationToUrl('物业编辑','${basePath}/Property/editPage?id="+result.data[i].id+"')\"  title='编辑'><i class='Hui-iconfont'>&#xe6df;</i></a> " +
						  "<a style='text-decoration:none' class='ml-5' onclick=\"application.deleteOne(this,"+result.data[i].id+",'${basePath}\/Property\/delete')\" href='javascript:;' title='删除'><i class='Hui-iconfont'>&#xe6e2;</i></a>" +
					  "</td></tr>");
					  
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