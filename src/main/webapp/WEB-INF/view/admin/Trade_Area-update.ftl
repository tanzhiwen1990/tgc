<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<LINK rel="Bookmark" href="/favicon.ico" >
<LINK rel="Shortcut Icon" href="/favicon.ico" />
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
<link rel="stylesheet" href="http://cache.amap.com/lbs/static/main1119.css"/>
<script src="http://cache.amap.com/lbs/static/es5.min.js"></script>
<script src="http://webapi.amap.com/maps?v=1.3&key=0005688d9e56e95e380a2803cf3f04d8"></script>
<script type="text/javascript" src="http://cache.amap.com/lbs/static/addToolbar.js"></script>
<title>商圈修改</title>
</head>
<body>
<article class="page-container">
	<form action="" onsubmit="return false" method="post" enctype="multipart/form-data" class="form form-horizontal" id="form-member-add">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>商圈名称：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${ta.trade_area_name}" placeholder="" id="name" name="name">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>商圈介绍：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<textarea name="tradAreaText" id="tradAreaText" cols="" rows="" class="textarea"  placeholder="介绍写点什么...最少输入10个字符！" onKeyUp="textarealength(this,200)">${ta.trade_area_text}</textarea>
				<p class="textarea-numberbar"><em class="textarea-length">0</em>/200</p>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>所在城市：</label>
			<div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
				<select class="select" size="1" id="city" name="city" onchange="cityChange()">
					<option value="">请选择城市</option>
				<#list cityList as cp>
					<#if cp.city_id == ta.district_id.city_id.city_id>
						<option value="${cp.city_id}" selected>${cp.city_name}</option>
					<#else>
						<option value="${cp.city_id}">${cp.city_name}</option>
					</#if>
				</#list>
				</select>
				</span> </div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>所在区县：</label>
			<div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
				<select class="select" id="district" name="district" onchange="districtChange(this)">
					<option value="" selected>请选择区县</option>
					<#list cityList as cp>
						<#list cp.list as l>
							<#if l.district_id == ta.district_id.district_id>
								<option value="${l.district_id}" selected>${l.district_name}</option>
							<#else>
								<option value="${l.district_id}">${l.district_name}</option>
							</#if>
						</#list>
					</#list>
				</select>
				</span> </div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>商圈地址：</label>
			<div class="formControls col-xs-8 col-sm-9">
			<#if ta.trade_area_addr??>
				<input type="text" class="input-text" value="${ta.trade_area_addr}" placeholder="商圈地址" id="district_addr" name="district_addr" disabled="disabled">
			<#else>
			    <input type="text" class="input-text" value="${trade_area_addr}" placeholder="商圈地址" id="district_addr" name="district_addr" disabled="disabled">
			</#if>
				<div class="formControls col-xs-8 col-sm-10" style= height:500px;">
					<div id="container"></div>
				</div>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>排序：</label>
			<div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
				<select class="select" size="1" name="sort" id="sort">
					<option value="">请选序号</option>
					<#list 1..6 as i>
						<#if ta.trade_area_sort == i>
							<option value="${i}" selected>${i}</option>
						<#else>
							<option value="${i}">${i}</option>
						</#if>
					</#list>
				</select>
				</span> </div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">是否热门：</label>
			<div class="formControls col-xs-8 col-sm-9 ">
				<div class="radio-box">
					<#if ta.trade_area_ishot == "否">
						<input name="ishot" value="否" type="radio" id="ishot-1" checked>
					<#else>
						<input name="ishot" value="否" type="radio" id="ishot-1">
					</#if>
					<label for="sex-1">否</label>
				</div>
				<div class="radio-box">
					<#if ta.trade_area_ishot == "是">
						<input name="ishot" value="是" type="radio" id="ishot-2" checked>
					<#else>
						<input name="ishot" value="是" type="radio" id="ishot-2">
					</#if>
					<label for="sex-2">是</label>
				</div>
			</div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>商圈预览图(大图,建议尺寸：高x宽：500 x 170)：</label>
			<img src="${basePath}${ta.trade_area_img}" name="trade_area_img" style="width:30%;"/>
		</div>
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>商圈预览图(大图,建议尺寸：高x宽：500 x 170)：</label>
			<div class="formControls col-xs-8 col-sm-9"> 
				<span class="btn-upload form-group" style="width: 545px;">
					<input class="input-text upload-url" type="text" name="uploadfile" id="uploadfile" readonly nullmsg="请添加商圈预览大图！">
					<a href="javascript:void();" class="btn btn-primary radius upload-btn"><i class="Hui-iconfont">&#xe642;</i>重新上传</a>
					<input type="file" multiple  name="file" class="input-file">
				</span>
			</div>
		</div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>商圈预览图(小图,建议尺寸：高x宽：250 x 170)：</label>
            <img src="${basePath}${ta.trade_area_img_small}" name="trade_area_img_small" style="width:20%;"/>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>商圈预览图(小图,建议尺寸：高x宽：250 x 170)：</label>
            <div class="formControls col-xs-8 col-sm-9">
				<span class="btn-upload form-group" style="width: 545px;">
					<input class="input-text upload-url" type="text" name="uploadfile" id="uploadfile1" readonly nullmsg="请添加商圈预览小图！">
					<a href="javascript:void();" class="btn btn-primary radius upload-btn"><i class="Hui-iconfont">&#xe642;</i>重新上传</a>
					<input type="file" multiple  name="trade_area_img_small" class="input-file">
				</span>
            </div>
        </div>

		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
				<input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
			</div>
		</div>
		<input type="hidden" name="id" value="${ta.trade_area_id}">
		<input type="hidden" id="longitude" name="longitude" value="${ta.longitude}">
		<input type="hidden" id="latitude" name="latitude" value="${ta.latitude}">
	</form>
</article>
<script type="text/javascript" src="${basePath}lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="${basePath}lib/layer/2.1/layer.js"></script> 
<script type="text/javascript" src="${basePath}lib/icheck/jquery.icheck.min.js"></script> 
<script type="text/javascript" src="${basePath}lib/jquery.validation/1.14.0/jquery.validate.min.js"></script> 
<script type="text/javascript" src="${basePath}lib/jquery.validation/1.14.0/validate-methods.js"></script> 
<script type="text/javascript" src="${basePath}lib/jquery.validation/1.14.0/messages_zh.min.js"></script> 
<script type="text/javascript" src="${basePath}static/h-ui/js/H-ui.js"></script> 
<script type="text/javascript" src="${basePath}static/h-ui.admin/js/H-ui.admin.js"></script> 
<script type="text/javascript" src="${basePath}static/jquery.form.js"></script> 
<script type="text/javascript">
var long = '${ta.longitude}';
var lat = '${ta.latitude}';
if(long == ""){
	long = '106.477428';
}
if(lat == ""){
	lat = '29.51923';
}
var map = new AMap.Map('container', {
    resizeEnable: true,
    zoom:11,
    center: [long, lat]
});
AMap.plugin('AMap.Geocoder', function() {
	var geocoder = new AMap.Geocoder({
		city : "010"//城市，默认：“全国”
	});
	marker = new AMap.Marker({
		map : map,
		bubble : true
	});
	map.on('click', function(e) {
		marker.setPosition(e.lnglat);
		$.get('${basePath}area/positiondetail', {
			longitude : e.lnglat.getLng(),
			latitude : e.lnglat.getLat()
		}, function(result) {
			if(result.success != "true"){
				layer.msg("定位失败");
				return;
			}
			$("#longitude").val(e.lnglat.getLng());
			$("#latitude").val(e.lnglat.getLat());
			$('#district_addr').val(result.address);
		});
	});
});
$(function(){
 
	$('.skin-minimal input').iCheck({
		checkboxClass: 'icheckbox-blue',
		radioClass: 'iradio-blue',
		increaseArea: '20%'
	});
	jQuery.validator.addMethod("fileType", function(value, element) {
		var tel = /(.gif|.jpg|.jpeg|.GIF|.JPG|.JPEG|.png|.PNG)$/;
		return this.optional(element) || (tel.test(value)); 
	}, "错误的上传文件格式！");  
	$("#form-member-add").validate({
		rules:{
			name:{
				required:true,
				minlength:2,
				maxlength:16
			},
			tradAreaText:{
				required:true,
				minlength:10,
				maxlength:200
			},
			city:{
				required:true
			},
			district:{
				required:true
			},
			sort:{
				required:true
			}
			
		},
		messages:{
			name:{
				required:'请输入商圈名称!'
			},
			tradAreaText:{
				required:'请输入商圈简介！',
				minlength:'商圈简介不能少于10个字！',
				maxlength:'商圈简介不能大于200个字！'
			},
			city:{
				required:'请所在选择城市！'
			},
			district:{
				required:'请所在选择区县！'
			},
			sort:{
				required:'请选择序号！'
			},
			
		},
		onkeyup:false,
		focusCleanup:true,
		success:"valid",
		submitHandler:function(form){
			$(form).ajaxSubmit({ 
		        type: "post", 
		        url: "${basePath}" + "Trade_Area/update", 
		        data: $(form).serialize(), 
		        dataType: "json", 
		        success: function(result) {
		        	if(result.data == 0){
		        		layer.msg('修改失败!',{icon: 5,time:2000});
		        	} else {
		        		layer.msg('修改成功!',{icon: 1,time:2000});
		        		//parent.location.replace(parent.location.href);
		        		setTimeout("parent.layer.close(parent.layer.getFrameIndex(window.name))",2000);
		        	}
		        }
			});
		}
	});
});
var cityName = "";
var districtName = "";
function cityChange(){ 
		var cityText = $("#city").children('option:selected').val();
		cityName = $(data).children('option:selected').text();
		if(cityText.trim() == ""){
			$("#district").children().remove();
			$("#district").append("<option value=''>请选择区县</option>");
			return;
		}
		$.ajax({ 
	        type: "post", 
	        url: "${basePath}" + "Trade_Area/getCityList", 
	        data: {
	        	id : cityText
	        }, 
	        dataType: "json", 
	        success: function(result) { 
	        	$("[name=district]").children().remove();
	        	var text = "<option value=''>请选择区县</option>";
	        	for(var i = 0 ; i<result.data.length ; i++){
	        		text = text + "<option value='"+ result.data[i].district_id +"'>"+ result.data[i].district_name +"</option>";
	        	}
	        	$("[name=district]").append(text);
	        }
		});
	}
function districtChange(data){
	districtName = $(data).children('option:selected').text();
	$.ajax({ 
        type: "post", 
        url: "${basePath}" + "area/reposition", 
        data: {
        	city : cityName,
        	address : districtName
        }, 
        dataType: "json", 
        success: function(result) {
        	position = result.location.split(',');
			marker.setPosition(new AMap.LngLat(position[0],position[1]));
			map.setCenter(marker.getPosition());
        }
	});
}
</script> 
</body>
</html>