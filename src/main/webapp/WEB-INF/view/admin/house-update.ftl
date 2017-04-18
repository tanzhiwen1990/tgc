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
    <link href="${basePath}lib/webuploader/0.1.5/webuploader.css" rel="stylesheet" type="text/css" />

    <link href="${basePath}lib/webuploader/0.1.5/webuploader.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="http://cache.amap.com/lbs/static/main1119.css"/>
    <script src="http://cache.amap.com/lbs/static/es5.min.js"></script>
    <script src="http://webapi.amap.com/maps?v=1.3&key=0005688d9e56e95e380a2803cf3f04d8"></script>
    <script type="text/javascript" src="http://cache.amap.com/lbs/static/addToolbar.js"></script>

</head>
<body>
<div class="page-container">
    <form action="" method="post" class="form form-horizontal" id="form-article-add">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>房源名称：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="${h.house_name}" placeholder="输入楼盘名称" id="house_name" name="house_name">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>所在城市：</label>
            <div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
				<select class="select" name="city" id="city" onchange="cityChange(this)">
                    <option value="">选择城市</option>
				<#list city as cp>
					<#if cp.city_id == h.building_id.trade_area_id.district_id.city_id.city_id>
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
				<select class="select" name="district" id="district"  onchange="districtChange(this)">
                    <option value="">选择区县</option>
				<#list cityList as cp>
					<#list cp.list as l>
						<#if l.district_id == h.building_id.trade_area_id.district_id.district_id>
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
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>所在商圈：</label>
            <div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
				<select class="select" name="trade_Area" id="trade_Area" onchange="trade_AreaChange(this)">
                    <option value="">选择商圈</option>
				<#list trade_AreaList as cp>
					<#if cp.trade_area_id == h.building_id.trade_area_id.trade_area_id>
                        <option value="${cp.trade_area_id}" selected>${cp.trade_area_name}</option>
					<#else>
                        <option value="${cp.trade_area_id}">${cp.trade_area_name}</option>
					</#if>
				</#list>
                </select>
				</span> </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>所在楼盘：</label>
            <div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
				<select class="select" size="1" name="building" id="building" onchange="buildingOnchange(this)">
                    <option value="">请选楼盘</option>
				<#list buildingList as cp>
					<#if cp.building_id = h.building_id.building_id>
                        <option value="${cp.building_id}" selected>${cp.building_name}</option>
					<#else>
                        <option value="${cp.building_id}">${cp.building_name}</option>
					</#if>
				</#list>
                </select>
				</span> </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>地址：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="${h.house_address}" placeholder="输入地址" id="house_address" name="house_address">
                <div class="formControls col-xs-8 col-sm-10" style= height:500px;">
                    <div id="container"></div>
                </div>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>房源类型：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <div class="skin-minimal">
                    <div class="radio-box">
                        <input type="radio" id="house_style_radio_1" value="出租" name="house_style" <#if h.house_style="出租">checked</#if>>
                        <label for="house_style_radio_1">出租</label>
                    </div>
                    <div class="radio-box">
                        <input type="radio" id="house_style_radio_2" value="出售" name="house_style" <#if h.house_style="出售">checked</#if>>
                        <label for="house_style_radio_2">出售</label>
                    </div>
                </div>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">房源配套设施：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <div class="skin-minimal">
				<#list listsf as sf>
                    <div class="check-box">
                        <input type="checkbox" name="sf_name" value="${sf.id}">
                        <label for="checkbox-1">${sf.name}</label>
                    </div>
				</#list>
                </div>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>价格：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="${h.house_money}" placeholder="输入价格" id="house_money" name="house_money" style=" width:230px">
				<span class="select-box" style="width: 120px">
				<select class="select" name="house_unit" id="house_unit">
                    <option value="" <#if !h.house_unit>selected</#if>>请选择单位</option>
                    <option value="元/m²" <#if h.house_unit="元/m²">selected</#if>>元/m²</option>
                    <option value="元/m²/天" <#if h.house_unit="元/m²/天">selected</#if>>元/m²/天</option>
                    <option value="元/月" <#if h.house_unit="元/月">selected</#if>>元/月</option>
                    <option value="元/m².月" <#if h.house_unit="元/m².月">selected</#if>>元/m².月</option>
                    <option value="万元" <#if h.house_unit="万元">selected</#if>>万元</option>
                </select>
				</span>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">详细信息：</label>
            <div class="formControls col-xs-8 col-sm-9">
                户型：<input type="text" name="house_type" id="house_type" placeholder="输入户型" value="${h.house_type}" class="input-text" style=" width:25%">室
                面积：<input type="text" name="house_mi" id="house_mi" placeholder="输入面积" value="${h.house_mi}" class="input-text" style=" width:25%">㎡
                楼层+房号：<input type="text" name="house_num" id="house_num" placeholder="输入楼层+房号，例如：12层-12~14号" value="${h.house_num}" class="input-text" style=" width:25%">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"></label>
            <div class="formControls col-xs-8 col-sm-9">
                朝向：<input type="text" name="house_orientation" id="house_orientation" placeholder="输入朝向" value="${h.house_orientation}" class="input-text" style=" width:25%">
                装修类型：<input type="text" name="house_decoration_type" id="house_decoration_type" placeholder="输入装修类型" value="${h.house_decoration_type}" class="input-text" style=" width:25%">
                入住时间：<input type="text" name="house_intime" id="house_intime" placeholder="输入入住时间" value="${h.house_intime}" class="input-text" style=" width:25%">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>联系人：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="${h.house_linkman}" placeholder="输入联系人" id="house_linkman" name="house_linkman">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>联系电话：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="${h.house_phone}" placeholder="输入联系电话" id="house_phone" name="house_phone">
            </div>
        </div>
        <div class="row cl">
            <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
                <button onClick="" class="btn btn-primary radius" type="submit"><i class="Hui-iconfont">&#xe632;</i> 修改</button>
            </div>
        </div>
        <input type="hidden" name="house_id" value="${h.house_id}">
    </form>
</div>

<script type="text/javascript" src="${basePath}lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="${basePath}lib/layer/2.1/layer.js"></script>
<script type="text/javascript" src="${basePath}lib/icheck/jquery.icheck.min.js"></script>
<script type="text/javascript" src="${basePath}lib/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="${basePath}lib/jquery.validation/1.14.0/jquery.validate.min.js"></script>
<script type="text/javascript" src="${basePath}lib/jquery.validation/1.14.0/validate-methods.js"></script>
<script type="text/javascript" src="${basePath}lib/jquery.validation/1.14.0/messages_zh.min.js"></script>
<script type="text/javascript" src="${basePath}static/h-ui/js/H-ui.js"></script>
<script type="text/javascript" src="${basePath}static/h-ui.admin/js/H-ui.admin.js"></script>
<script type="text/javascript" src="${basePath}static/h-ui.admin/js/comment.js"></script>
<script type="text/javascript" src="${basePath}lib/webuploader/0.1.5/webuploader.min.js"></script>
<script type="text/javascript">
    var map = new AMap.Map('container', {
        resizeEnable: true,
        zoom:11,
        center: ['${h.latitude}', '${h.longitude}']
    });
    var cityName = "";
    var districtName = "";
    var position = ['${h.latitude}', '${h.longitude}'];
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
                position[0] = e.lnglat.getLng();
                position[1] = e.lnglat.getLat();
                $('#house_address').val(result.address);
            });
        });
    });
    function buildingOnchange(data){
        $.ajax({
            type: "post",
            url: "${basePath}" + "house/getLocation",
            data: {
                id : $(data).val()
            },
            dataType: "json",
            success: function(result) {
                position = result.location.split(',');
                marker.setPosition(new AMap.LngLat(position[0],position[1]));
                map.setCenter(marker.getPosition());
            }
        });
    }
    $.ajax({
        type: "post",
        url: "${basePath}" + "house/getSurpporting_FacilitiesList",
        data:{id:'${h.house_id}'},
        dataType: "json",
        success: function(result) {
            for(var i = 0 ; i<result.data.length ; i++){
                $('input[name=sf_name]').each(function(){
                    if(result.data[i].supporting_facilities_id == $(this).val()){
                        $(this).iCheck('check');
                    }
                });
            }
        }
    });
    jQuery.validator.addMethod("isMobile", function(value, element) {
        var length = value.length;
        var mobile = /^(13[0-9]{9})|(18[0-9]{9})|(14[0-9]{9})|(17[0-9]{9})|(15[0-9]{9})$/;
        return this.optional(element) || (length == 11 && mobile.test(value));
    }, "请正确填写您的手机号码！");
    $("#form-article-add").validate({
        rules:{
            house_name:{
                required:true
            },
            building:{
                required:true
            },
            city:{
                required:true
            },
            district:{
                required:true
            },
            trade_Area:{
                required:true
            },
            house_style:{
                required:true
            },
            house_money:{
                required:true
            },
            house_address:{
                required:true
            },
            house_linkman:{
                required:true
            },
            house_phone:{
                required:true,
                isPhone : {}
            },
            house_type:{
                required:true
            },
            house_mi:{
             required:true,
              decimal: {  
		         integer: 10, //整数最大位数  
		         fraction:2  //小数点后最多位数  
              }
            }
        },
        messages:{
            house_name:{
                required:'请输入房源名称!'
            },
            building:{
                required:'请选择所属楼盘！'
            },
            city:{
                required:'请选所在城市！'
            },
            district:{
                required:'请选所在区县！'
            },
            trade_Area:{
                required:'请选所在商圈！'
            },
            house_style:{
                required:'请选择房源类型！'
            },
            house_money:{
                required:'请输入价格！'
            },
            house_address:{
                required:'请输入地址！'
            },
            house_linkman:{
                required:'请输入联系人！'
            },
            house_phone:{
                required:'请输入联系电话！',
                isPhone : '请输入座机号或者11位'
            },
             house_mi:{
              required:'请输入面积',
              decimal:'请输入数字且最多只能支持两位小数'
            }
        },
        onkeyup:false,
        focusCleanup:true,
        success:"valid",
        submitHandler:function(form){
            $.ajax({
                type: "post",
                url: "${basePath}" + "house/update",
                data:$(form).serialize() + "&position=" + position,
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
    function cityChange(data,list){
        var cityText = $(data).children('option:selected').val();
        cityName = $(data).children('option:selected').text();
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
        districtName = $(data).children('option:selected').text();
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
    $(function(){
        $('.skin-minimal input').iCheck({
            checkboxClass: 'icheckbox-blue',
            radioClass: 'iradio-blue',
            increaseArea: '20%'
        });
    });
    
     jQuery.validator.addMethod("decimal", function(value, element, param) {return this.optional(element) || new RegExp("^-?\\d{1," + (param.integer != null ? param.integer : "") + "}" + (param.fraction != null ? (param.fraction > 0 ? "(\\.\\d{1," + param.fraction + "})?$" : "$") : "(\\.\\d+)?$")).test(value);}, "numeric value out of bounds");
     //自定义函数验证手机号同时支持座机号验证
    jQuery.validator.addMethod("isPhone", function(value,element) {
		    var length = value.length;
		    var mobile =  /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1})|(14[0-9]{1})|(17[0-9]{1}))+\d{8})$/;
		    var tel = /^\d{3,4}-?\d{7,9}$/;
		
		    if(/-/.test(value)){
		        return this.optional(element) || tel.test(value);
		    }else{
		        return this.optional(element) || (length == 11 && mobile.test(value));
		    }
		
		}, "请正确填写您的联系电话");
      
</script>
</body>
</html>