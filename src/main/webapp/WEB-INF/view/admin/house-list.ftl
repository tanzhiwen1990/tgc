﻿﻿<!DOCTYPE HTML>
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
    <title>房源列表</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 房源管理 <span class="c-gray en">&gt;</span> 房源列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
    <div class="text-c">
		<span class="select-box inline">
			<select name="city" id="city" onchange="cityChange(this)">
                <option value="">选择城市</option>
			<#list cityList as cp>
                <option value="${cp.city_id}">${cp.city_name}</option>
			</#list>
            </select>
		</span>
		<span class="select-box inline">
			<select name="district" id="district" onchange="districtChange(this)">
                <option value="">选择区县</option>
            </select>
		</span>
		<span class="select-box inline">
			<select name="trade_Area" id="trade_Area" onchange="trade_AreaChange(this)">
                <option value="">选择商圈</option>
            </select>
		</span>
		<span class="select-box inline">
			<select name="building" id="building">
                <option value="">选择楼盘</option>
            </select>
		</span>
		<span class="select-box inline">
			<select name="type" id="type">
                <option value="">选择类型</option>
                <option value="出售">出售</option>
                <option value="出租">出租</option>
            </select>
		</span>
        <input type="text" name="name" id="name" placeholder=" 房源名称" style="width:250px" class="input-text">
        <button name="search" id="search" class="btn btn-success" type="submit"><i class="Hui-iconfont">&#xe665;</i> 搜索</button>
    </div>
    <div class="cl pd-5 bg-1 bk-gray mt-20">
	<span class="l">
		<a href="javascript:;" onclick="house_dels()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> 
		<a href="javascript:;" onclick="application.batchHot(this,'${basePath}/house/changeHot','是','')" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 设置为热门</a> 
		<a href="javascript:;" onclick="application.batchHot(this,'${basePath}/house/changeHot','否','')"  class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 设置为非热门</a> 
		<a class="btn btn-primary radius" onclick="house_add('添加房源','${basePath}/house/goToAddHouse')" href="javascript:;"><i class="Hui-iconfont">&#xe600;</i> 添加房源</a>
	</span>
        <span class="r">共有数据：<strong id="sumNum">${page.total}</strong> 条</span> </div>
    <div class="mt-20">
        <table class="table table-border table-bordered table-bg table-hover">
            <thead>
            <tr class="text-c">
                <th width="40"><input name="" type="checkbox" value=""></th>
                <th width="80">编号</th>
                <th width="80">城市</th>
                <th width="80">区县</th>
                <th width="100">商圈</th>
                <th width="100">楼盘名称</th>
                <th width="100">房源名称</th>
                <th width="100">楼层+房号</th>
                <th width="60">租售类型</th>
                <th width="60">状态</th>
                <th width="60">是否热门</th>
                <th width="70">操作</th>
            </tr>
            </thead>
            <tbody id="pagetbody">
			<#list page.data as h>
            <tr class="text-c">
                <td><input name="" class='taid' type="checkbox" value="${h.house_id}"></td>
                <td>${h.house_id}</td>
                <td>${h.building_id.trade_area_id.district_id.city_id.city_name}</td>
                <td>${h.building_id.trade_area_id.district_id.district_name}</td>
                <td>${h.building_id.trade_area_id.trade_area_name}</td>
                <td>${h.building_id.building_name}</td>
                <td>${h.house_name}</td>
                <td>${h.house_num}</td>
                <td>${h.house_style}</td>
				<#if h.house_state == '已上线'>
                    <td class="td-status"><span class="label label-success radius">已上线</span></td>
				<#else>
                    <td class="td-status"><span class="label label-defaunt radius">未上线</span></td>
				</#if>
                <#if h.house_ishot == '是'>
                    <td ><span class="label label-danger radius">热门</span></td>
				<#else>
                    <td ><span class="label label-defaunt radius">非热门</span></td>
				</#if>
                <td class="td-manage">
					<#if h.house_state == '已上线'>
                        <a style="text-decoration:none" onClick="house_stop(this,'${h.house_id}')" href="javascript:;" title="下线"><i class="Hui-iconfont">&#xe6de;</i></a>
					<#else>
                        <a style="text-decoration:none" onClick="house_start(this,'${h.house_id}')" href="javascript:;" title="上线"><i class="Hui-iconfont">&#xe603;</i></a>
					</#if>
                    <#if h.house_ishot == '是'>
	                 <a style="text-decoration:none" onClick="application.batchHot(this,'${basePath}/house/changeHot','否','${h.house_id}')" href="javascript:;" title="非热门"><i class="Hui-iconfont">&#xe615;</i>
					<#else>
	                 <a style="text-decoration:none" onClick="application.batchHot(this,'${basePath}/house/changeHot','是','${h.house_id}')" href="javascript:;" title="热门"><i class="Hui-iconfont">&#xe631;</i>
					</#if>
                    <a style="text-decoration:none" class="ml-5" onClick="application.picture_edit('图片编辑','${basePath}house/goToPictureEdit','${h.house_id}')" href="javascript:;" title="图片编辑"><i class="Hui-iconfont">&#xe646;</i></a>
                    <a style="text-decoration:none" class="ml-5" onClick="house_edit('编辑','${basePath}/house/goToUpdateHouse','${h.house_id}')" href="javascript:;" title="编辑"><i class="Hui-iconfont">&#xe6df;</i></a>
                    <a style="text-decoration:none" class="ml-5" onClick="house_del(this,'${h.house_id}')" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a>
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
<input type="hidden" value="${page.pageNum}" id="pagenum"/>
<input type="hidden" value="${page.pages}" id="total"/>
<script type="text/javascript" src="${basePath}lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="${basePath}lib/layer/2.1/layer.js"></script> 
<script type="text/javascript" src="${basePath}lib/My97DatePicker/WdatePicker.js"></script> 
<script type="text/javascript" src="${basePath}lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="${basePath}static/h-ui/js/H-ui.js"></script> 
<script type="text/javascript" src="${basePath}static/h-ui.admin/js/H-ui.admin.js"></script>
<script type="text/javascript" src="${basePath}static/js/jquery.page.js"></script>
<script type="text/javascript" src="${basePath}static/js/common/common.js"></script>
<script type="text/javascript">
    $('.table-sort').dataTable({
        "aaSorting": [[ 1, "asc" ]],//默认第几个排序
        "bPaginate" : true
    });
    $(".tcdPageCode").createPage({
        pageCount: ${page.pages},
        current: ${page.pageNum},
        backFn:function(num){
            ajaxPage(num);
        }
    });
    function ajaxPage(num){
        $.ajax({
            type: "post",
            url: "${basePath}" + "house/ajaxpagehouse",
            data: {
                beginNum : num,
                pageSize : ${page.pageSize},
                city : $("#city").val().trim(),
                district : $("#district").val().trim(),
                trade_Area : $("#trade_Area").val().trim(),
                building : $("#building").val().trim(),
                type : $("#type").val().trim(),
                name : $("#name").val().trim()
            },
            dataType: "json",
            success: function(result) {
                change(result);
            }
        });
    }
    function house_edits(id){
        house_edit('编辑','${basePath}/house/goToUpdateHouse',id);
    }
    function change(result){
        $("#pagetbody").children().remove();
        for(var i = 0 ; i<result.data.length ; i++){
            var test = "";
            var stateText = "";
            var ishot = "";
            if(result.data[i].house_state == "已上线"){
                test = '<td class="td-status"><span class="label label-success radius">已上线</span></td>';
            } else {
                test = '<td class="td-status"><span class="label label-defaunt radius">未上线</span></td>';
            }
            if(result.data[i].house_state == "已上线"){
                stateText = "<a style='text-decoration:none' onClick='house_stop(this,"+ result.data[i].house_id +")' href='javascript:;' title='下线'><i class='Hui-iconfont'>&#xe6de;</i></a>";
            } else {
                stateText = "<a style='text-decoration:none' onClick='house_start(this,"+ result.data[i].house_id +")' href='javascript:;' title='上线'><i class='Hui-iconfont'>&#xe603;</i></a>";
            }
            if(result.data[i].house_ishot == "是"){
                ishot = '<td><span class="label label-danger radius">热  门</span></td>';
                hotText="<a style=\"text-decoration:none\" onClick=\"application.batchHot(this,'${basePath}/house/changeHot','否',"+ result.data[i].house_id +")\" href=\"javascript:;\" title=\"非热门\"><i class=\"Hui-iconfont\">&#xe615;</i>";
            } else {
                ishot = '<td><span class="label label-defaunt radius">非热门</span></td>';
                hotText="<a style=\"text-decoration:none\" onClick=\"application.batchHot(this,'${basePath}/house/changeHot','是',"+ result.data[i].house_id +")\" href=\"javascript:;\" title=\"热门\"><i class=\"Hui-iconfont\">&#xe631;</i>";
            }
            $("#pagetbody").append("<tr class='text-c'>" +
            "<td><input type='checkbox' class='taid' value='" +result.data[i].house_id+ "'></td>" +
            "<td>"+result.data[i].house_id +"</td>" +
            "<td>"+result.data[i].building_id.trade_area_id.district_id.city_id.city_name +"</td>" +
            "<td>"+result.data[i].building_id.trade_area_id.district_id.district_name +"</td>" +
            "<td>"+result.data[i].building_id.trade_area_id.trade_area_name +"</td>" +
            "<td>"+result.data[i].building_id.building_name +"</td>" +
            "<td>"+result.data[i].house_name +"</td>" +
            "<td>"+result.data[i].house_num +"</td>" +
            "<td>"+result.data[i].house_style +"</td>" +
            test + ishot +
            "<td class='td-manage'>" +
            stateText + hotText +
            "<a style='text-decoration:none' class='ml-5' onClick=\"application.picture_edit('图片编辑','${basePath}house/goToPictureEdit',"+ result.data[i].house_id +")\"  title='图片编辑'><i class='Hui-iconfont'>&#xe646;</i></a>"+
            "<a style='text-decoration:none' class='ml-5' onClick='house_edits("+ result.data[i].house_id +")' href='javascript:;' title='编辑'><i class='Hui-iconfont'>&#xe6df;</i></a> " +
            "<a style='text-decoration:none' class='ml-5' onClick='house_del(this,"+ result.data[i].house_id +")' href='javascript:;' title='删除'><i class='Hui-iconfont'>&#xe6e2;</i></a>" +
            "</td> </tr>");
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
            url: "${basePath}" + "house/getCityList",
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
            $("#trade_Area").append("<option value=''>请选择商圈</option>");
            return;
        }
        $.ajax({
            type: "post",
            url: "${basePath}" + "house/getTrade_AreaList",
            data: {
                id : districtText
            },
            dataType: "json",
            success: function(result) {
                $("[name=trade_Area]").children().remove();
                var text = "<option value=''>请选择商圈</option>";
                for(var i = 0 ; i<result.data.length ; i++){
                    text = text + "<option value='"+ result.data[i].trade_area_id +"'>"+ result.data[i].trade_area_name +"</option>";
                }
                $("[name=trade_Area]").append(text);
            }
        });
    }
    function trade_AreaChange(data,list){
        var districtText = $(data).children('option:selected').val();
        if(districtText.trim() == ""){
            $("#building").children().remove();
            $("#building").append("<option value=''>请选择楼盘</option>");
            return;
        }
        $.ajax({
            type: "post",
            url: "${basePath}" + "house/getBuildingList",
            data: {
                id : districtText
            },
            dataType: "json",
            success: function(result) {
                $("[name=building]").children().remove();
                var text = "<option value=''>请选择楼盘</option>";
                for(var i = 0 ; i<result.data.length ; i++){
                    text = text + "<option value='"+ result.data[i].building_id +"'>"+ result.data[i].building_name +"</option>";
                }
                $("[name=building]").append(text);
            }
        });
    }
    /*房源-下线*/
    function house_stop(obj,id){
        layer.confirm('确认要下线吗？',function(index){
            $.ajax({
                type: "post",
                url: "${basePath}" + "house/updateState",
                data: {
                    id : id,
                    state : "未上线"
                },
                dataType: "json",
                success: function(result) {
                    if(result == 0){
                        layer.msg('下线失败!',{icon: 5,time:2000});
                    } else {
                        $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="house_start(this,'+ id +')" href="javascript:;" title="上线"><i class="Hui-iconfont">&#xe603;</i></a>');
                        $(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">未上线</span>');
                        $(obj).remove();
                        layer.msg('已下线!',{icon: 5,time:2000});
                    }
                }
            });
        });
    }

    /*房源-上线*/
    function house_start(obj,id){
        layer.confirm('确认要上线吗？',function(index){
            $.ajax({
                type: "post",
                url: "${basePath}" + "house/updateState",
                data: {
                    id : id,
                    state : "已上线"
                },
                dataType: "json",
                success: function(result) {
                    if(result == 0){
                        layer.msg('上线失败!',{icon: 5,time:2000});
                    } else {
                        $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="house_stop(this,'+ id +')" href="javascript:;" title="下线"><i class="Hui-iconfont">&#xe6de;</i></a>');
                        $(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已上线</span>');
                        $(obj).remove();
                        layer.msg('已上线!',{icon: 6,time:2000});
                    }
                }
            });
        });
    }
    /*房源-删除*/
    function house_del(obj,id){
        layer.confirm('确认要删除吗？',function(index){
            $.ajax({
                type: "post",
                url: "${basePath}" + "house/delete",
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
    /*房源-批量删除*/
    function house_dels(){
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
                url: "${basePath}" + "house/delete",
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
    /*房源-添加*/
    function house_add(title,url){
        var index = layer.open({
            type: 2,
            title: title,
            content: url
        });
        layer.full(index);
    }

    /*房源-查看*/
    function house_show(title,url,id){
        var index = layer.open({
            type: 2,
            title: title,
            content: url
        });
        layer.full(index);
    }

    /*房源-编辑*/
    function house_edit(title,url,id){
        var index = layer.open({
            type: 2,
            title: title,
            content: url+"?id="+id
        });
        layer.full(index);
    }
</script>
</body>
</html>