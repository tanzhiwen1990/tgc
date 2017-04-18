<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="${basePath}lib/html5.js"></script>
<script type="text/javascript" src="${basePath}lib/respond.min.js"></script>
<script type="text/javascript" src="${basePath}lib/PIE_IE678.js"></script>
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
<title>推荐列表</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 推荐管理 <span class="c-gray en">&gt;</span> 推荐列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="text-c"> 
		<span class="select-box inline">
			<select name="city" id="city" onchange="cityChange(this)">
				<option value="">选择城市</option>
				<#list cityList as cp>
				<option value="${cp.city_id}">${cp.city_name}</option>
				</#list>
			</select>
			<select name="district" id="district" onchange="districtChange(this)">
				<option value="">选择区县</option>
			</select>
			<select name="trade_Area" id="trade_Area">
				<option value="">选择商圈</option>
			</select>
			<select name="type" id="type">
				<option value="房源" selected>房源</option>
				<option value="楼盘">楼盘</option>
			</select>
			<select name="state" id="state">
				<option value="">状态</option>
				<option value="已上线">已上线</option>
				<option value="未上线">未上线</option>
			</select>
		日期范围：
		<input type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'%y-%M-%d'})" id="logmin" class="input-text Wdate" style="width:180px;">
		-
		<input type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'#F{$dp.$D(\'logmin\')}',maxDate:'%y-%M-%d'})" id="logmax" class="input-text Wdate" style="width:180px;">
		</span>
		<button name="" id="search" class="btn btn-success" type="submit"><i class="Hui-iconfont">&#xe665;</i> 搜索</button>
	</div>
	<div class="cl pd-5 bg-1 bk-gray mt-20"> 
	<span class="l">
		<a href="javascript:;" onclick="building_dels()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> 
	</span> 
	<span class="r">共有数据：<strong  id="sumNum">${page.total}</strong> 条</span> </div>
	<div class="mt-20">
		<table class="table table-border table-bordered table-bg table-hover">
			<thead>
				<tr class="text-c">
					<th width="40"><input name="" type="checkbox" value=""></th>
					<th width="80">编号</th>
					<th width="80">城市名称</th>
					<th width="80">区县地址</th>
					<th width="80">商圈名称</th>
					<th id="th_lou" width="80">楼盘名称</th>
					<th id="th_house" width="80">房源名称</th>
					<th width="80">更新人</th>
					<th width="80">更新时间</th>
					<th width="80">状态</th>
					<th width="70">编辑</th>
				</tr>
			</thead>
			<tbody id="pagetbody">
			<#list page.data as h>
				<tr class="text-c">
					<td><input name="" class='taid' type="checkbox" value="${h.recommend_id}"></td>
					<td>${h.recommend_id}</td>
					<td>${h.recommend_cityName}</td>
					<td>${h.recommend_districtName}</td>
					<td>${h.recommend_trade_areatName}</td>
					<td>${h.recommend_building_name}</td>
					<td>${h.recommend_house_name}</td>
					<td>${h.recommend_userName}</td>
					<td>${h.recommend_time?string('yyyy-MM-dd HH:mm:ss')}</td>
					<#if h.recommend_state == '已上线'>
						<td class="td-status"><span class="label label-success radius">已上线</span></td>
					<#else>
						<td class="td-status"><span class="label label-defaunt radius">未上线</span></td>
					</#if>
					<td class="td-manage">
					<#if h.recommend_state == '已上线'>
						<a style="text-decoration:none" onClick="recommend_stop(this,'${h.recommend_id}','${h.recommend_type}','${h.recommended_id}')" href="javascript:;" title="下线"><i class="Hui-iconfont">&#xe6de;</i></a> 
					<#else>
						<a style="text-decoration:none" onClick="recommend_start(this,'${h.recommend_id}','${h.recommend_type}','${h.recommended_id}')" href="javascript:;" title="上线"><i class="Hui-iconfont">&#xe603;</i></a> 
					</#if>
						<a style="text-decoration:none" class="ml-5" onClick="building_del(this,'${h.recommend_id}')" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a>
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
		var city = $("#city").find("option:selected").text().trim();
		var district = $("#district").find("option:selected").text().trim();
		var trade_Area = $("#trade_Area").find("option:selected").text().trim();
		if(city == "选择城市"){
			city = "";
		}
		if(district == "选择区县"){
			district = "";
		}
		if(trade_Area == "选择商圈"){
			trade_Area = "";
		}
		$.ajax({ 
	        type: "post", 
	        url: "${basePath}" + "recommend/ajaxpageRecommend", 
	        data: {
	        	beginNum : num,
	        	pageSize : ${page.pageSize},
	        	city : city,
	        	district : district,
	        	trade_Area : trade_Area,
	        	type : $("#type").val().trim(),
	        	state : $("#state").val().trim(),
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
		$("#th_house").remove();
			for(var i = 0 ; i<result.data.length ; i++){
				var test = "";
				var stateText = "";
				var d = new Date();
				d.setTime(result.data[i].recommend_time);
				if(result.data[i].recommend_state == "已上线"){
					test = '<td class="td-status"><span class="label label-success radius">已上线</span></td>';
				} else {
					test = '<td class="td-status"><span class="label label-defaunt radius">未上线</span></td>';
				}
				if(result.data[i].recommend_state == "已上线"){
					stateText = "<a style='text-decoration:none' onClick='recommend_stop(this,"+ result.data[i].recommend_id +",\""+ result.data[i].recommend_type +"\","+ result.data[i].recommended_id +")' href='javascript:;' title='下线'><i class='Hui-iconfont'>&#xe6de;</i></a>";
				} else {
					stateText = "<a style='text-decoration:none' onClick='recommend_start(this,"+ result.data[i].recommend_id +",\""+ result.data[i].recommend_type +"\","+ result.data[i].recommended_id +")' href='javascript:;' title='上线'><i class='Hui-iconfont'>&#xe603;</i></a>";
				}
				if(result.data[i].recommend_type == "房源"){
					$("#pagetbody").append("<tr class='text-c'>" +
						  "<td><input type='checkbox' class='taid' value='" +result.data[i].recommend_id+ "'></td>" +
						  "<td>"+result.data[i].recommend_id +"</td>" +
						  "<td>"+result.data[i].recommend_cityName +"</td>" +
						  "<td>"+result.data[i].recommend_districtName +"</td>" +
						  "<td>"+result.data[i].recommend_trade_areatName +"</td>" +
						  "<td>"+result.data[i].recommend_building_name +"</td>" +
						  "<td>"+result.data[i].recommend_house_name +"</td>" +
						  "<td>"+result.data[i].recommend_userName +"</td>" +
						  "<td>"+d.Format("yyyy-MM-dd hh:mm:ss") +"</td>" +
						  test +
						  "<td class='td-manage'>" +
						  stateText +
						  "<a style='text-decoration:none' class='ml-5' onClick='building_del(this,"+ result.data[i].recommend_id +")' href='javascript:;' title='删除'><i class='Hui-iconfont'>&#xe6e2;</i></a>" +
						  "</td> </tr>");
				} else {
					$("#pagetbody").append("<tr class='text-c'>" +
						  "<td><input type='checkbox' class='taid' value='" +result.data[i].recommend_id+ "'></td>" +
						  "<td>"+result.data[i].recommend_id +"</td>" +
						  "<td>"+result.data[i].recommend_cityName +"</td>" +
						  "<td>"+result.data[i].recommend_districtName +"</td>" +
						  "<td>"+result.data[i].recommend_trade_areatName +"</td>" +
						  "<td>"+result.data[i].recommend_building_name +"</td>" +
						  "<td>"+result.data[i].recommend_userName +"</td>" +
						  "<td>"+d.Format("yyyy-MM-dd hh:mm:ss") +"</td>" +
						  test +
						  "<td class='td-manage'>" +
						  stateText +
						  "<a style='text-decoration:none' class='ml-5' onClick='building_del(this,"+ result.data[i].recommend_id +")' href='javascript:;' title='删除'><i class='Hui-iconfont'>&#xe6e2;</i></a>" +
						  "</td> </tr>");
				}
			}
			if($("#type").val().trim() == "房源"){
				$("#th_lou").after("<th id='th_house' width='80'>房源名称</th>");
			} else {
				$("#th_house").remove();
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
	
	function cityChange(data,list){ 
		var cityText = $(data).children('option:selected').val();
		if(cityText.trim() == ""){
			$("#district").children().remove();
			$("#district").append("<option value=''>选择区县</option>");
			return;
		}
		$.ajax({ 
	        type: "post", 
	        url: "${basePath}" + "recommend/getCityList", 
	        data: {
	        	id : cityText
	        }, 
	        dataType: "json", 
	        success: function(result) { 
	        	$("#district").children().remove();
	        	var text = "<option value=''>选择区县</option>";
	        	for(var i = 0 ; i<result.data.length ; i++){
	        		text = text + "<option value='"+ result.data[i].district_id +"'>"+ result.data[i].district_name +"</option>";
	        	}
	        	$("#district").append(text);
	        }
		});
	}
	function districtChange(data,list){
		var districtText = $(data).children('option:selected').val();
		if(districtText.trim() == ""){
			$("#trade_Area").children().remove();
			$("#trade_Area").append("<option value=''>选择商圈</option>");
			return;
		}
		$.ajax({ 
	        type: "post", 
	        url: "${basePath}" + "recommend/getTrade_AreaList", 
	        data: {
	        	id : districtText
	        }, 
	        dataType: "json", 
	        success: function(result) { 
	        	$("[name=trade_Area]").children().remove();
	        	var text = "<option value=''>选择商圈</option>";
	        	for(var i = 0 ; i<result.data.length ; i++){
	        		text = text + "<option value='"+ result.data[i].trade_area_id +"'>"+ result.data[i].trade_area_name +"</option>";
	        	}
	        	$("[name=trade_Area]").append(text);
	        }
		});
	}
/*删除*/
function building_del(obj,id){
	layer.confirm('确认要删除吗？',function(index){
		$.ajax({ 
        	type: "post", 
        	url: "${basePath}" + "recommend/deleteRecommend", 
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
	        	url: "${basePath}" + "recommend/deleteRecommend", 
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
	function recommend_stop(obj,id,type,ided){
		layer.confirm('确认要下线吗？',function(index){
			$.ajax({ 
	        	type: "post", 
	        	url: "${basePath}" + "recommend/updateState", 
	        	data: {
	       			id : id,
	       			state : "未上线",
	       			type : type,
	       			ided : ided
	        	}, 
	        	dataType: "json", 
	        	success: function(result) { 
	        		if(result == 0){
	        			layer.msg('下线失败!',{icon: 5,time:2000});
	        		} else {
	        			$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="recommend_start(this,'+ id +',\''+type+'\',\''+ided+'\')" href="javascript:;" title="上线"><i class="Hui-iconfont">&#xe603;</i></a>');
						$(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">未上线</span>');
						$(obj).remove();
						layer.msg('已下线!',{icon: 5,time:2000});
	        		}
	        	}
			});
		});
	}
	
	/*上线*/
	function recommend_start(obj,id,type,ided){
		layer.confirm('确认要上线吗？',function(index){
			$.ajax({ 
	        	type: "post", 
	        	url: "${basePath}" + "recommend/updateState", 
	        	data: {
	       			id : id,
	       			state : "已上线",
	       			type : type,
	       			ided : ided
	        	}, 
	        	dataType: "json", 
	        	success: function(result) { 
	        		if(result == 0){
	        			layer.msg('上线失败!',{icon: 5,time:2000});
	        		} else {
	        			$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="recommend_stop(this,'+ id +',\''+type+'\',\''+ided+'\')" href="javascript:;" title="下线"><i class="Hui-iconfont">&#xe6de;</i></a>');
						$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已上线</span>');
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