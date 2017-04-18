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
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>æ¥¼çåç§°ï¼</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="${b.building_name}" placeholder="è¾å¥æ¥¼çåç§°" id="building_name" name="building_name">
            </div>
        </div>
        
         <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>æ¥¼çä»ç»ï¼</label>
            <div class="formControls col-xs-8 col-sm-9">
                <textarea  name="SEO_describe" style="width:100%;height:200px;" placeholder="ä»ç»åç¹ä»ä¹...æå°è¾å¥10ä¸ªå­ç¬¦ï¼" onKeyUp="textarealength(this,10000)">${b.SEO_describe}</textarea>
                <p class="textarea-numberbar"><em class="textarea-length">0</em>/10000</p>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>æå¨åå¸ï¼</label>
            <div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
				<select class="select" size="1" id="city" name="city" onchange="cityChange(this)">
                    <option value="">è¯·éæ©åå¸</option>
				<#list city as cp>
					<#if cp.city_id == b.trade_area_id.district_id.city_id.city_id>
                        <option value="${cp.city_id}" selected>${cp.city_name}</option>
					<#else>
                        <option value="${cp.city_id}">${cp.city_name}</option>
					</#if>
				</#list>
                </select>
				</span> </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>æå¨åºå¿ï¼</label>
            <div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
				<select class="select" id="district" name="district"  onchange="districtChange(this)">
                    <option value="">è¯·éæ©åºå¿</option>
				<#list cityList as cp>
					<#list cp.list as l>
						<#if l.district_id == b.trade_area_id.district_id.district_id>
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
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>æå¨ååï¼</label>
            <div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
				<select class="select" size="1" id="Trade_Area" name="Trade_Area">
                    <option value="" selected>è¯·éæ©åå</option>
				<#list trade_AreaList as cp>
					<#if cp.trade_area_id == b.trade_area_id.trade_area_id>
                        <option value="${cp.trade_area_id}" selected>${cp.trade_area_name}</option>
					<#else>
                        <option value="${cp.trade_area_id}">${cp.trade_area_name}</option>
					</#if>
				</#list>
                </select>
				</span> </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>æ¥¼çå°åï¼</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="${b.building_addr}" placeholder="è¾å¥æ¥¼çå°å" id="building_addr" name="building_addr">
                <div class="formControls col-xs-8 col-sm-10" style= height:500px;">
                    <div id="container"></div>
                </div>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">è¯¦ç»ä¿¡æ¯ï¼</label>
            <div class="formControls col-xs-8 col-sm-9">
                å»ºç­å¹´ä»£ï¼<input type="text" name="building_year" id="building_year" placeholder="è¾å¥å»ºç­å¹´ä»£" value="${b.building_year}" class="input-text" style=" width:25%">å¹´
                åè½¦ä½ï¼<input type="text" name="building_car" id="building_car" placeholder="è¾å¥åè½¦ä½" value="${b.building_car}" class="input-text" style=" width:25%">ä¸ª
                åè½¦è´¹ç¨ï¼<input type="text" name="building_car_money" id="building_car_money" placeholder="è¾å¥åè½¦è´¹ç¨" value="${b.building_car_money}" class="input-text" style=" width:25%">å
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"></label>
            <div class="formControls col-xs-8 col-sm-9">
                ç©ä¸å¬å¸ï¼<input type="text" name="building_property" id="building_property" placeholder="è¾å¥ç©ä¸å¬å¸" value="${b.building_property}" class="input-text" style=" width:25%">
                å¼ååï¼<input type="text" name="building_developers" id="building_developers" placeholder="è¾å¥å¼åå" value="${b.building_developers}" class="input-text" style=" width:25%">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"></label>
            <div class="formControls col-xs-8 col-sm-9">
                ç«£å·¥æ¶é´ï¼<input type="text" name="building_repairtime" id="building_repairtime" placeholder="éæ©ç«£å·¥æ¶é´" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'%y-%M-%d'})" value="${b.building_repairtime}" id="logmin" class="input-text Wdate" style=" width:25%">
                æ»å»ºç­é¢ç§¯ï¼<input type="text" name="building_acreage" id="building_acreage" placeholder="è¾å¥æ»å»ºç­é¢ç§¯" value="${b.building_acreage}" class="input-text" style=" width:25%">ã¡
                çº§å«ï¼<input type="text" name="building_level" id="building_level" placeholder="è¾å¥çº§å«" value="${b.building_level}" class="input-text" style=" width:25%">
            </div>
        </div>
        
         <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>å®ä»·ï¼</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" placeholder="å®ä»·" value="${b.building_price}" id="building_price" name="building_price"  style=" width:51%">
                <span class="select-box" style="width: 120px">
				<select class="select" name="building_price_unit" id="building_price_unit">
				    <option value="å/mÂ²" <#if b.building_price_unit="å/mÂ²">selected</#if>>å/mÂ²</option>
				    <option value="ä¸å"<#if b.building_price_unit="ä¸å">selected</#if>>ä¸å</option>
                </select>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">ç§éèå´ï¼</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" id="min" placeholder="è¾å¥æä½ç§é" name="min" <#if b.building_rent?contains('-')> value="${b.building_rent?split("-")[0]}"<#else>value="${b.building_rent}"</#if> class="input-text"  style=" width:25%">-
                <input type="text"  id="max" placeholder="è¾å¥æé«ç§é" <#if b.building_rent?contains('-')>value="${b.building_rent?split("-")[1]}"</#if> class="input-text"  style=" width:25%">
				<span class="select-box" style="width: 120px">
				<select class="select" name="building_rent_unit" id="building_rent_unit">
                    <option value="å/mÂ²" <#if b.building_rent_unit="å/mÂ²">selected</#if>>å/mÂ²</option>
                    <option value="å/mÂ²/å¤©" <#if b.building_rent_unit="å/mÂ²/å¤©">selected</#if>>å/mÂ²/å¤©</option>
                    <option value="å/æ" <#if b.building_rent_unit="å/æ">selected</#if>>å/æ</option>
                    <option value="å/mÂ².æ" <#if b.building_rent_unit="å/mÂ².æ">selected</#if>>å/mÂ².æ</option>
                    <option value="ä¸å" <#if b.building_rent_unit="ä¸å">selected</#if>ä¸å</option>
                </select>
				</span>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>ç©ä¸ç±»åï¼</label>
            <div class="formControls col-xs-8 col-sm-9"> <span class="select-box"  style=" width:62%">
				<select class="select" size="1" id="property_id" name="property_id">
                    <option value="" selected>è¯·éæ©ç©ä¸ç±»å</option>
				<#list propertyList as pl>
					<#if pl.property_id == b.property_id.id>
                        <option value="${pl.property_id}" selected>${pl.property_type}</option>
					<#else>
                        <option value="${pl.property_id}">${pl.property_type}</option>
					</#if>
				</#list>
                </select>
				</span> 
				</div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>ç©ä¸è´¹ç¨ï¼</label>
            <div class="formControls col-xs-8 col-sm-9">
               <input type="text" name="building_property_money" id="building_property_money" value=${b.building_property_money} placeholder="è¾å¥ç©ä¸è´¹ç¨"  class="input-text" style=" width:51%"> 
                <span class="select-box" style="width: 120px">
				<select class="select" name="building_property_unit" id="building_property_unit">
				   <option value="å/mÂ²" <#if b.building_property_unit="å/mÂ².æ">selected</#if>>å/mÂ².æ</option>
                    <option value="å/æ" <#if b.building_property_unit="å/æ">selected</#if>>å/æ</option>
                </select>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>æåºå¼ï¼</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="${b.building_sort}" placeholder="" id="building_sort" name="building_sort">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">äº¤éç¶åµä»ç»ï¼</label>
            <div class="formControls col-xs-8 col-sm-9">
                <textarea name="building_traffic" id="building_traffic" cols="" rows="" class="textarea"  placeholder="äº¤éç¶åµä»ç»">${b.building_traffic}</textarea>
            </div>
        </div>
        <div class="row cl">
            <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
                <button class="btn btn-primary radius" type="submit">ä¿®æ¹</button>
            </div>
        </div>
        <input type="hidden" name="building_id" value="${b.building_id}">
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
        zoom:13,
        center: ['${b.latitude}', '${b.longitude}']
    });
    var cityName = "";
    var districtName = "";
    var position = ['${b.latitude}', '${b.longitude}'];
    AMap.plugin('AMap.Geocoder', function() {
        var geocoder = new AMap.Geocoder({
            city : "010"//åå¸ï¼é»è®¤ï¼âå¨å½â
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
                    layer.msg("å®ä½å¤±è´¥");
                    return;
                }
                position[0] = e.lnglat.getLng();
                position[1] = e.lnglat.getLat();
                $('#building_addr').val(result.address);
            });
        });
    });
    function cityChange(data,list){
        var cityText = $(data).children('option:selected').val();
        cityName = $(data).children('option:selected').text();
        if(cityText.trim() == ""){
            $("#district").children().remove();
            $("#district").append("<option value=''>è¯·éæ©åºå¿</option>");
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
                var text = "<option value=''>è¯·éæ©åºå¿</option>";
                for(var i = 0 ; i<result.data.length ; i++){
                    text = text + "<option value='"+ result.data[i].district_id +"'>"+ result.data[i].district_name +"</option>";
                }
                $("[name=district]").append(text);
            }
        });
    }
    function districtChange(data,list){
        var districtText = $(data).children('option:selected').val();
        districtName = $(data).children('option:selected').text();
        if(districtText.trim() == ""){
            $("#Trade_Area").children().remove();
            $("#Trade_Area").append("<option value=''>è¯·éæ©åå</option>");
            return;
        }
        $.ajax({
            type: "post",
            url: "${basePath}" + "building/getTrade_AreaList",
            data: {
                id : districtText
            },
            dataType: "json",
            success: function(result) {
                $("[name=Trade_Area]").children().remove();
                var text = "<option value=''>è¯·éæ©åå</option>";
                for(var i = 0 ; i<result.data.length ; i++){
                    text = text + "<option value='"+ result.data[i].trade_area_id +"'>"+ result.data[i].trade_area_name +"</option>";
                }
                $("[name=Trade_Area]").append(text);
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
    $("#form-article-add").validate({
        rules:{
            building_name:{
                required:true
            },
            building_addr:{
                required:true
            },
            city:{
                required:true
            },
            district:{
                required:true
            },
            Trade_Area:{
                required:true
            },
            building_sort:{
                required:true,
                digits:true
            },
            SEO_describe:{
                required:true,
				minlength:10,
				maxlength:10000
            },
           min:{
                required:true,
				digits:true
            },
            building_price:{
              required:true,
             
              }
        },
        messages:{
            building_name:{
                required:'è¯·è¾å¥æ¥¼çåç§°!'
            },
            building_addr:{
                required:'è¯·è¾å¥æ¥¼çå°åï¼'
            },
            city:{
                required:'è¯·æå¨éæ©åå¸ï¼'
            },
            district:{
                required:'è¯·æå¨éæ©åºå¿ï¼'
            },
            Trade_Area:{
                required:'è¯·æå¨éæ©ååï¼'
            },
            building_sort:{
                required:'è¯·éæ©åºå·ï¼'
            },
             SEO_describe:{
              required:'è¯·è¾å¥ååç®ä»ï¼',
			  minlength:'ååç®ä»ä¸è½å°äº10ä¸ªå­ï¼',
			  maxlength:'ååç®ä»ä¸è½å¤§äº10000ä¸ªå­ï¼'
            },
             min:{
                required:'è¯·è¾å¥ä»·æ ¼',
				digits:'è¯·è¾å¥æ´æ°'
            },
              building_price:{
              required:'è¯·è¾å¥å®ä»·'
            }
        },
        onkeyup:false,
        focusCleanup:true,
        success:"valid",
        submitHandler:function(form){
        var rent=$("#min").val();
        var max=$("#max").val();
        if(max!=''){
           rent+="-"+max;
        }
            $.ajax({
                type: "post",
                url: "${basePath}" + "building/update",
                data:$(form).serialize() + "&position=" + position+ "&building_rent=" + rent,
                dataType: "json",
                success: function(result) {
                    if(result.data == 0){
                        layer.msg('ä¿®æ¹å¤±è´¥!',{icon: 5,time:2000});
                    } else {
                        layer.msg('ä¿®æ¹æå!',{icon: 1,time:2000});
                        //parent.location.replace(parent.location.href);
                        setTimeout("parent.layer.close(parent.layer.getFrameIndex(window.name))",2000);
                    }
                }
            });
        }
    });
    $(function(){
        $('.skin-minimal input').iCheck({
            checkboxClass: 'icheckbox-blue',
            radioClass: 'iradio-blue',
            increaseArea: '20%'
        });
    });
    
     jQuery.validator.addMethod("decimal", function(value, element, param) {return this.optional(element) || new RegExp("^-?\\d{1," + (param.integer != null ? param.integer : "") + "}" + (param.fraction != null ? (param.fraction > 0 ? "(\\.\\d{1," + param.fraction + "})?$" : "$") : "(\\.\\d+)?$")).test(value);}, "numeric value out of bounds"); 
</script>
</body>
</html>