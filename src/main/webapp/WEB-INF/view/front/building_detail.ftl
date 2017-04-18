<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>${b.building_name}</title>
    <link rel="stylesheet" type="text/css" href="${basePath}static/tao/common.css" />
    <link rel="stylesheet" type="text/css" href="${basePath}static/tao/reset.css" />
    <link rel="stylesheet" type="text/css" href="${basePath}static/tao/hot-room.css" />
    <link rel="stylesheet" type="text/css" href="${basePath}static/tao/owl.carousel.min.css"/>
	<link rel="stylesheet" type="text/css" href="${basePath}static/tao/owl.theme.default.min.css"/>
	<link rel="icon"href="${basePath}static/img/tao/title-icon2.png" type="image/x-icon"/>
    <#include "/include/head.ftl">
   

    <link rel="stylesheet" type="text/css" href="${basePath}static/tao/map.css"/>
    <style>
        div, form, ul, ol, li, span, p, dl, dt, dd {
            margin: 0;
            padding: 0;
            border: 0;
        }

        ul, ol, li {
            list-style: none;
        }

        body {
            font-family: Microsoft YaHei;
            font-size: 13px;
            color: #333;
            margin: 0;
        }
        
        

    </style>
    <style type="text/css">.BMap_mask{background:transparent url(about:blank);}.BMap_noscreen{display:none;}.BMap_button{cursor:pointer;}.BMap_zoomer{background-image:url(http://api.map.baidu.com/images/mapctrls1d3.gif);background-repeat:no-repeat;overflow:hidden;font-size:1px;position:absolute;width:7px;height:7px;}.BMap_stdMpCtrl div{position:absolute;}.BMap_stdMpPan{width:44px;height:44px;overflow:hidden;background:url(http://api.map.baidu.com/images/mapctrls2d0.png) no-repeat;}.BMap_ie6 .BMap_stdMpPan{background:none;}.BMap_ie6 .BMap_smcbg{left:0;width:44px;height:464px;filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src='http://api.map.baidu.com/images/mapctrls2d0.png');}.BMap_ie6 .BMap_stdMpPanBg{z-index:-1;}.BMap_stdMpPan .BMap_button{height:15px;width:15px;}.BMap_panN,.BMap_panW,.BMap_panE,.BMap_panS{overflow:hidden;}.BMap_panN{left:14px;top:0;}.BMap_panW{left:1px;top:12px;}.BMap_panE{left:27px;top:12px;}.BMap_panS{left:14px;top:25px;}.BMap_stdMpZoom{top:45px;overflow:hidden;}.BMap_stdMpZoom .BMap_button{width:22px;height:21px;left:12px;overflow:hidden;background-image:url(http://api.map.baidu.com/images/mapctrls2d0.png);background-repeat:no-repeat;z-index:10;}.BMap_ie6 .BMap_stdMpZoom .BMap_button{background:none;}.BMap_stdMpZoomIn{background-position:0 -221px;}.BMap_stdMpZoomOut{background-position:0 -265px;}.BMap_ie6 .BMap_stdMpZoomIn div{left:0;top:-221px;}.BMap_ie6 .BMap_stdMpZoomOut div{left:0;top:-265px;}.BMap_stdMpType4 .BMap_stdMpZoom .BMap_button{left:0;overflow:hidden;background:-webkit-gradient(linear,50% 0,50% 100%,from(rgba(255,255,255,0.85)),to(rgba(217,217,217,0.85)));z-index:10;-webkit-border-radius:22px;width:34px;height:34px;border:1px solid rgba(255,255,255,0.5);-webkit-box-shadow:0 2px 3.6px #CCC;display:-webkit-box;-webkit-box-align:center;-webkit-box-pack:center;-webkit-box-sizing:border-box;}.BMap_stdMpType4 .BMap_smcbg{position:static;background:url(http://api.map.baidu.com/images/mapctrls2d0_mb.png) 0 0 no-repeat;-webkit-background-size:24px 32px;}.BMap_stdMpType4 .BMap_stdMpZoomIn{background-position:0 0;}.BMap_stdMpType4 .BMap_stdMpZoomIn .BMap_smcbg{width:24px;height:24px;background-position:0 0;}.BMap_stdMpType4 .BMap_stdMpZoomOut{background-position:0 0;}.BMap_stdMpType4 .BMap_stdMpZoomOut .BMap_smcbg{width:24px;height:6px;background-position:0 -25px;}.BMap_stdMpSlider{width:37px;top:18px;}.BMap_stdMpSliderBgTop{left:18px;width:10px;overflow:hidden;background:url(http://api.map.baidu.com/images/mapctrls2d0.png) no-repeat -23px -226px;}.BMap_stdMpSliderBgBot{left:19px;height:8px;width:10px;top:124px;overflow:hidden;background:url(http://api.map.baidu.com/images/mapctrls2d0.png) no-repeat -33px bottom;}.BMap_ie6 .BMap_stdMpSliderBgTop,.BMap_ie6 .BMap_stdMpSliderBgBot{background:none;}.BMap_ie6 .BMap_stdMpSliderBgTop div{left:-23px;top:-226px;}.BMap_ie6 .BMap_stdMpSliderBgBot div{left:-33px;bottom:0;}.BMap_stdMpSliderMask{height:100%;width:24px;left:10px;cursor:pointer;}.BMap_stdMpSliderBar{height:11px;width:19px;left:13px;top:80px;overflow:hidden;background:url(http://api.map.baidu.com/images/mapctrls2d0.png) no-repeat 0 -309px;}.BMap_stdMpSliderBar.h{background:url(http://api.map.baidu.com/images/mapctrls2d0.png) no-repeat 0 -320px;}.BMap_ie6 .BMap_stdMpSliderBar,.BMap_ie6 .BMap_stdMpSliderBar.h{background:none;}.BMap_ie6 .BMap_stdMpSliderBar div{top:-309px;}.BMap_ie6 .BMap_stdMpSliderBar.h div{top:-320px;}.BMap_zlSt,.BMap_zlCity,.BMap_zlProv,.BMap_zlCountry{position:absolute;left:34px;height:21px;width:28px;background-image:url(http://api.map.baidu.com/images/mapctrls2d0.png);background-repeat:no-repeat;font-size:0;cursor:pointer;}.BMap_ie6 .BMap_zlSt,.BMap_ie6 .BMap_zlCity,.BMap_ie6 .BMap_zlProv,.BMap_ie6 .BMap_zlCountry{background:none;overflow:hidden;}.BMap_zlHolder{display:none;position:absolute;top:0;}.BMap_zlHolder.hvr{display:block;}.BMap_zlSt{background-position:0 -380px;top:21px;}.BMap_zlCity{background-position:0 -401px;top:57px;}.BMap_zlProv{background-position:0 -422px;top:81px;}.BMap_zlCountry{background-position:0 -443px;top:105px;}.BMap_ie6 .BMap_zlSt div{top:-380px;}.BMap_ie6 .BMap_zlCity div{top:-401px;}.BMap_ie6 .BMap_zlProv div{top:-422px;}.BMap_ie6 .BMap_zlCountry div{top:-443px;}.BMap_stdMpType1 .BMap_stdMpSlider,.BMap_stdMpType2 .BMap_stdMpSlider,.BMap_stdMpType3 .BMap_stdMpSlider,.BMap_stdMpType4 .BMap_stdMpSlider,.BMap_stdMpType2 .BMap_stdMpZoom,.BMap_stdMpType3 .BMap_stdMpPan,.BMap_stdMpType4 .BMap_stdMpPan{display:none;}.BMap_stdMpType3 .BMap_stdMpZoom{top:0;}.BMap_stdMpType4 .BMap_stdMpZoom{top:0;}.BMap_cpyCtrl a{font-size:11px;color:#7979CC;}.BMap_scaleCtrl{height:23px;overflow:hidden;}.BMap_scaleCtrl div.BMap_scaleTxt{font-size:11px;font-family:Arial,sans-serif;}.BMap_scaleCtrl div{position:absolute;overflow:hidden;}.BMap_scaleHBar img,.BMap_scaleLBar img,.BMap_scaleRBar img{position:absolute;width:37px;height:442px;left:0;}.BMap_scaleHBar{width:100%;height:5px;font-size:0;bottom:0;}.BMap_scaleHBar img{top:-437px;width:100%;}.BMap_scaleLBar,.BMap_scaleRBar{width:3px;height:9px;bottom:0;font-size:0;z-index:1;}.BMap_scaleLBar img{top:-427px;left:0;}.BMap_scaleRBar img{top:-427px;left:-5px;}.BMap_scaleLBar{left:0;}.BMap_scaleRBar{right:0;}.BMap_scaleTxt{text-align:center;width:100%;cursor:default;line-height:18px;}.BMap_omCtrl{background-color:#fff;overflow:hidden;}.BMap_omOutFrame{position:absolute;width:100%;height:100%;left:0;top:0;}.BMap_omInnFrame{position:absolute;border:1px solid #999;background-color:#ccc;overflow:hidden;}.BMap_omMapContainer{position:absolute;overflow:hidden;width:100%;height:100%;left:0;top:0;}.BMap_omViewMv{border-width:1px;border-style:solid;border-left-color:#84b0df;border-top-color:#adcff4;border-right-color:#274b8b;border-bottom-color:#274b8b;position:absolute;z-index:600;}.BMap_omViewInnFrame{border:1px solid #3e6bb8;}.BMap_omViewMask{width:1000px;height:1000px;position:absolute;left:0;top:0;background-color:#68c;opacity:.2;filter:progid:DXImageTransform.Microsoft.Alpha(opacity=20);}.BMap_omBtn{height:13px;width:13px;position:absolute;cursor:pointer;overflow:hidden;background:url(http://api.map.baidu.com/images/mapctrls1d3.gif) no-repeat;z-index:1210;}.anchorBR .BMap_omOutFrame{border-top:1px solid #999;border-left:1px solid #999;}.quad4 .BMap_omBtn{background-position:-26px -27px;}.quad4 .BMap_omBtn.hover{background-position:0 -27px;}.quad4 .BMap_omBtn.BMap_omBtnClosed{background-position:-39px -27px;}.quad4 .BMap_omBtn.BMap_omBtnClosed.hover{background-position:-13px -27px;}.anchorTR .BMap_omOutFrame{border-bottom:1px solid #999;border-left:1px solid #999;}.quad1 .BMap_omBtn{background-position:-39px -41px;}.quad1 .BMap_omBtn.hover{background-position:-13px -41px;}.quad1 .BMap_omBtn.BMap_omBtnClosed{background-position:-26px -41px;}.quad1 .BMap_omBtn.BMap_omBtnClosed.hover{background-position:0 -41px;}.anchorBL .BMap_omOutFrame{border-top:1px solid #999;border-right:1px solid #999;}.quad3 .BMap_omBtn{background-position:-27px -40px;}.quad3 .BMap_omBtn.hover{background-position:-1px -40px;}.quad3 .BMap_omBtn.BMap_omBtnClosed{background-position:-40px -40px;}.quad3 .BMap_omBtn.BMap_omBtnClosed.hover{background-position:-14px -40px;}.anchorTL .BMap_omOutFrame{border-bottom:1px solid #999;border-right:1px solid #999;}.quad2 .BMap_omBtn{background-position:-40px -28px;}.quad2 .BMap_omBtn.hover{background-position:-14px -28px;}.quad2 .BMap_omBtn.BMap_omBtnClosed{background-position:-27px -28px;}.quad2 .BMap_omBtn.BMap_omBtnClosed.hover{background-position:-1px -28px;}.anchorR .BMap_omOutFrame{border-bottom:1px solid #999;border-left:1px solid #999;border-top:1px solid #999;}.anchorL .BMap_omOutFrame{border-bottom:1px solid #999;border-right:1px solid #999;border-top:1px solid #999;}.anchorB .BMap_omOutFrame{border-top:1px solid #999;border-left:1px solid #999;border-right:1px solid #999;}.anchorT .BMap_omOutFrame{border-bottom:1px solid #999;border-right:1px solid #999;border-left:1px solid #999;}.anchorNon .BMap_omOutFrame,.withOffset .BMap_omOutFrame{border:1px solid #999;}.BMap_zoomMask0,.BMap_zoomMask1{position:absolute;left:0;top:0;width:100%;height:100%;background:transparent url(http://api.map.baidu.com/images/blank.gif);z-index:1000;}.BMap_contextMenu{position:absolute;border-top:1px solid #adbfe4;border-left:1px solid #adbfe4;border-right:1px solid #8ba4d8;border-bottom:1px solid #8ba4d8;padding:0;margin:0;width:auto;visibility:hidden;background:#fff;z-index:10000000;}.BMap_cmShadow{position:absolute;background:#000;opacity:.3;filter:alpha(opacity=30);visibility:hidden;z-index:9000000;}div.BMap_cmDivider{border-bottom:1px solid #adbfe4;font-size:0;padding:1px;margin:0 6px;}div.BMap_cmFstItem{margin-top:2px;}div.BMap_cmLstItem{margin-bottom:2px;}.BMap_shadow img{border:0 none;margin:0;padding:0;position:absolute;height:370px;width:1144px;}.BMap_pop .BMap_top{border-top:1px solid #ababab;background-color:#fff;}.BMap_pop .BMap_center{border-left:1px solid #ababab;border-right:1px solid #ababab;background-color:#fff;}.BMap_pop .BMap_bottom{border-bottom:1px solid #ababab;background-color:#fff;}.BMap_shadow,.BMap_shadow img,.BMap_shadow div{-moz-user-select:none;-webkit-user-select:none;}.BMap_checkbox{background:url(http://api.map.baidu.com/images/mapctrls1d3.gif);vertical-align:middle;display:inline-block;width:11px;height:11px;margin-right:4px;background-position:-14px 90px;}.BMap_checkbox.checked{background-position:-2px 90px;}.BMap_pop .BMap_top img,.BMap_pop .BMap_center img,.BMap_pop .BMap_bottom img{display:none;}@media print{.BMap_noprint{display:none;}.BMap_noscreen{display:block;}.BMap_mask{background:none;}.BMap_pop .BMap_top img,.BMap_pop .BMap_center img,.BMap_pop .BMap_bottom img{display:block;}}.BMap_vectex{cursor:pointer;width:11px;height:11px;position:absolute;background-repeat:no-repeat;background-position:0 0;}.BMap_vectex_nodeT{background-image:url(http://api.map.baidu.com/images/nodeT.gif);}.BMap_vectex_node{background-image:url(http://api.map.baidu.com/images/node.gif);}</style></head>
<body>
</head>

<body>
	<div class="g-nav-warp">
    <div class="m-content-warp clearfix nav-top"> 
		 <a href="${basePath}index" ><img  class="logo-img" src="${basePath}static/img/tao/logo1.png" /></a>
		<div class="nav">
			<a href="${basePath}index"  >首页</a>
			<a href="${basePath}index/findHouses" >找房源</a>
			<a href="${basePath}index/findBuildings"  class="active">热门楼盘</a>
			<a href="${basePath}index/findRoom" >委托找楼</a>
			<a href="${basePath}index/house_resource" >业主放盘</a>
		</div>
	</div>
</div>
<div class="hot-banner">
	<#if banner ?? && (banner?size > 0)>
	      <#if banner?size=1>
	        <div   style="position:absolute;width:100%;">
	         <#list banner as b>
	           <a <#if b.url !=""> href="${b.url}"  <#else> onclick="return false;" href="javascript:;" </#if>  class="item" target="_blank"><img src="${basePath}${b.pic}" style="width:100%;margin-top:79px;" /></a>
	          </#list>
	       </div>
           <#else>
	         <div class="swiper"  style="position:absolute;width:100%;">
	          <#list banner as b>
	             <a <#if b.url !=""> href="${b.url}"  <#else> onclick="return false;" href="javascript:;" </#if>  class="item" target="_blank"><img src="${basePath}${b.pic}"/></a>
	         </#list>
	         </div>
	       </#if>
	<#else>
	   <div style="position:absolute;width:100%;">
		   <a   onclick="return false;" href="javascript:;"  class="item"><img src="${basePath}static/img/tao/banner.jpg" style="width:100%;margin-top:79px;"/></a>
	   </div>
	</#if>
    <p class="hot-banner-text" style="position: absolute;z-index: 9;" ><span>${b.building_name}</span>${b.building_addr}<#if rents?size + sales?size gt 0><em>${rents?size+sales?size}</em>套空间租售中<#else><span style="margin-left:10px;font-size:28px;">房源正在上传中<span></#if></p>
</div>

<div class="clearfix m-main-warp">
	<div class="m-location"  style="margin:0px;">
	    <span>当前位置：</span>
	    <a href="${basePath}${banner?size}index/findBuildings" >热门楼盘</a>&gt;<a href="javascript:;" class="active">热门楼盘详情</a>
	</div>
<div class="hot-content">
    <div class="m-content-warp-min">
        <div class="hot-content-tittle clearfix">
            <div class="tittle-name"><h2>${b.building_name}</h2><span>[${b.district_name}-${b.trade_area_name}] ${b.building_addr}</span><a href="javascript:;"></a></div>
             <p class="tittle-distance"><i></i><span>距离<#if station.address??>${station.address?substring(1,station.address?length-1)}</#if>${station.name?substring(1,station.name?length-1)}${station.detail_info.distance}米</span></p>
        </div>
        <div class="anchor-nav clearfix">
            <ul class="clearfix" id="anchorNav">
                <li class="active">
                    <a href="javascript:;">基本信息</a>
                </li>
                
                <li>
                    <a href="javascript:;">房源情况</a>
                </li>
                <li>
                    <a href="javascript:;">楼盘相册</a>
                </li>
               
                 <li>
                    <a href="javascript:;">楼盘介绍</a>
                </li>
                <li>
                    <a href="javascript:;">周边配套</a>
                </li>
                <li>
                    <a href="javascript:;">热门楼盘</a>
                </li>
            </ul>
        </div>
        <div class="info clearfix anchor-item">
            <div class="info-photo">
                <div id="playimages" class="play">
                    <ul class="big_pic">
                    <#list bPics as p>
                        <#if p_index=0>
                            <li style="z-index:1;"><img src="${basePath}${p.building_picture_addr}" /></li>
                        <#else>
                            <li><img src="${basePath}${p.building_picture_addr}" /></li>
                        </#if>
                    </#list>
                    </ul>
                    <div id="small_pic" class="small_pic">
                        <a class="mark_left" href="javascript:;"></a>
                        <div class="small_pic_warp">
                            <ul >
                            <#list bPics as p>
                                <#if p_index=0>
                                    <li style=" filter: alpha(opacity:100); opacity:1;"><img src="${basePath}${p.building_picture_addr}" /></li>
                                <#else>
                                    <li><img src="${basePath}${p.building_picture_addr}" /></li>
                                </#if>
                            </#list>
                            </ul>
                        </div>
                        <a class="mark_right" href="javascript:;"></a>
                    </div>
                </div>
            </div>
            <div class="info-text"  style="width:485px;">
                <ul class="info-field-list clearfix">
                    <li>
								<span class="fl bold">租金：</span>
							</li>
							<li class="right">
								<span class="fl bold">售价：</span>
							</li>
							<li>
								<span class="total-price fl">
								<b class="color_f60">${b.building_rent}</b>
								<em><#if b.building_rent??><#if b.building_rent_unit!="">${b.building_rent_unit}<#else>元/㎡.月</#if></#if></em></span>
							</li>
							<li class="right">
								<span class="total-price fl"><b class="color_f60">${b.building_price?default("暂无数据")}</b><em><#if b.building_price ??><#if b.building_price_unit!="">${b.building_price_unit}<#else>元/㎡</#if></#if></em></span></span>
							</li>
							<li>
								<span class="field-text fl">所属地区：</span>
								<span class="fl">${b.district_name}-${b.trade_area_name}</span>
							</li>
						   <li class="right">
		                        <span class="field-text fl">建筑年代：</span>
		                        <span class="fl">${b.building_year?default('暂无数据')}<#if b.building_year??>年</#if></span>
		                    </li>
		                    <li>
		                        <span class="field-text fl">停<em class="gap-hfword"></em>车<em class="gap-hfword"></em>位：</span>
		                        <span class="fl">${b.building_car?default('暂无数据')}<#if b.building_car??>个</#if></span>
		                    </li>
							 <li class="right">
		                        <span class="field-text fl">停<em class="gap-hfword"></em>车<em class="gap-hfword"></em>费：</span>
		                        <span class="fl">${b.building_car_money?default('暂无数据')}<#if b.building_car_money??>元</#if></span>
		                    </li>
		                    <li>
		                        <span class="field-text fl">物业公司：</span>
		                        <span class="fl">${b.building_property?default('自主物业')}</span>
		                    </li>
							 <li class="right">
		                        <span class="field-text fl">物<em class="gap-hfword"></em>业<em class="gap-hfword"></em>费：</span>
		                        <span class="fl">${b.building_property_money}<#if b.building_property_money??><#if b.building_property_unit!=''>${b.building_property_unit}<#else>元/月</#if></#if></span>
		                    </li>
						</ul>
						
                <ul class="lou-info clearfix">
                    <li>
                        <span class="fl bold">楼盘信息：</span>
                    </li>
                    <li>
                        <span class="field-text fl">楼盘名称：</span>
                        <span class="fl">${b.building_name}</span>
                    </li>
                    <li class="right">
                        <span class="field-text fl">竣工时间：</span>
                        <span class="fl">${b.building_repairtime?string('yyyy-MM-dd')?default('暂无数据')}</span>
                    </li>
                   
                    <li >
                        <span class="field-text fl">总建筑面积：</span>
                        <span class="fl">${b.building_acreage}<#if b.building_property_money??>平方米</#if></span>
                    </li>
              
                    <li class="right">
                        <span class="field-text fl">开<em class="gap-hfword"></em>发<em class="gap-hfword"></em>商：</span>
								<span class="fl">
                                ${b.building_developers?default('自主开发')}
                                </span>
                    </li>
                   
                </ul>
                
            </div>
        </div>
        <div class="anchor-trigger anchor-item">
            <div class="anchor-title">房源情况</div>
            <div class="recent-type">
                <a href="javascript:;" class="recent-type-active" name="出租" >最近出租</a>
                <a href="javascript:;" name="出售" >最近出售</a>
            </div>
            <div class="area-wrapper">
                <ul class="area-ul clearfix" id="areaLinks">
                    <li class="area-title" onclick="hhh(this)">面积不限</li>
                    <li><a href="javascript:;" onclick="hhh(this)"  name="0-100">100平米以下</a></li>
                    <li><a href="javascript:;" onclick="hhh(this)"  name="100-150">100-150平米</a></li>
                    <li><a href="javascript:;" onclick="hhh(this)"  name="150-200">150-200平米</a></li>
                    <li><a href="javascript:;" onclick="hhh(this)"  name="200-300">200-300平米</a></li>
                    <li><a href="javascript:;" onclick="hhh(this)"  name="300-500">300-500平米</a></li>
                    <li><a href="javascript:;" onclick="hhh(this)"  name="500-1000">500-1000平米</a></li>
                    <li><a href="javascript:;" onclick="hhh(this)"  name="1000">1000平米以上</a></li>
                </ul>
            </div>
           
        </div>
        <div class="hs-list">
            <ul class="recent-house clearfix " id="rents">
            <#list rents as r>
                <#if rents?size lt 1>
                                                                    暂无符合条件的房源
                <#else>
                    <li>
                        <a href="${basePath}front/house/detail?id=${r.house_id}"  title="${r.house_name},${r.house_decoration_type},${r.house_mi}m²">
                            <img  src="${basePath}${r.house_picture_addr}">
                        </a>
                        <p class="recent-content">
                            <span class="recent-price">${r.house_money}</span><em><#if r.house_unit!=''>${r.house_unit}<#else><#if r.house_style='出售'>元/㎡<#else>元/㎡.月</#if></#if></em>
                            <span class="recent-area">${r.house_mi}<em>平米</em></span>
                        </p>
                    </li>
                </#if>

            </#list>
            </ul>
            <ul class="recent-house clearfix " id="sales" style="display:none;">
            <#list sales as r>
                <#if sales?size lt 1>
                    暂无符合条件的房源
                <#else>
                    <li>
                        <a href="${basePath}front/house/detail?id=${r.house_id}"  title="${r.house_name},${r.house_decoration_type},${r.house_mi}m²">
                            <img  src="${basePath}${r.house_picture_addr}">
                        </a>
                        <p class="recent-content">
                            <span class="recent-price">${r.house_money}</span><em><#if r.house_unit!=''>${r.house_unit}<#else><#if r.house_style='出售'>元/㎡<#else>元/㎡.月</#if></#if></em>
                            <span class="recent-area">${r.house_mi}<em>平米</em></span>
                        </p>
                    </li>
                </#if>
            </#list>
            </ul>
            <#--
            <p class="more-photo-info" id="more"><a href="${basePath}index/findHouses">查看更多房源</a></p>
            -->
        </div>
        <div class="anchor-trigger  anchor-item">
            <div class="anchor-title">楼盘相册</div>
            <p class="newhs-dmf-tabs-photo clearfix">
                <a class="turnpage_nav" href="javascript:;">实景图&nbsp;(${bPics?size})</a>
            </p>
            <div class="hs-pics" id="hsPics">
                <ul class="clearfix">
                <#list page.data as p>
                    <li>
                        <a href="javascript:void(0);">
                            <img src="${basePath}${p.building_picture_addr}">
                        </a>
                    </li>
                </#list>

                </ul>
            </div>
            <div class="m-page-warp" id="Pagination">
               <#if page.pages gt 1> <span>共${page.pages}页</span></#if>
            </div>

        </div>
       
        <div class="anchor-trigger anchor-item">
            <div class="anchor-title">
                楼盘介绍
            </div>
            <textarea id="des">${b.SEO_describe}</textarea>
         </div>
       
        <div class="mapWapper anchor-item">
            <div class="anchor-title">
               周边
            </div>
             <textarea id="textarea" style="padding-bottom:20px;" >${b.building_traffic}</textarea>
            <div class="map-warp">
                <div class="traffic">

                    <div class="search">

                        <div id="dszfxq_C05_04" style="width: 689px; height: 360px; overflow: hidden; position: relative; z-index: 0; background-color: rgb(243, 241, 236); color: rgb(0, 0, 0); text-align: left;"><div style="overflow: visible; position: absolute; z-index: 0; left: 0px; top: 0px; cursor: url(&quot;http://api.map.baidu.com/images/openhand.cur&quot;) 8 8, default;"><div class="BMap_mask" style="position: absolute; left: 0px; top: 0px; z-index: 9; overflow: hidden; user-select: none; width: 889px; height: 360px;"></div><div style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 200;"><div style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 800;"></div><div style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 700;"><span class="BMap_Marker BMap_noprint" unselectable="on" "="" style="position: absolute; padding: 0px; margin: 0px; border: 0px; cursor: pointer; background: url(&quot;http://api.map.baidu.com/images/blank.gif&quot;); width: 19px; height: 25px; left: 285px; top: 263px; z-index: -5919012;" title=""></span></div><div style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 600;"></div><div style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 500;"></div><div style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 400;"><span class="BMap_Marker" unselectable="on" style="position: absolute; padding: 0px; margin: 0px; border: 0px; width: 0px; height: 0px; left: 285px; top: 263px; z-index: -5919012;"><div style="position: absolute; margin: 0px; padding: 0px; width: 19px; height: 25px; overflow: hidden; left: 0px; top: -5px;"><img src="http://api.map.baidu.com/images/marker_red_sprite.png" style="border:none;left:0px; top:0px; position:absolute;"></div></span></div><div style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 300;"><span unselectable="on" style="position: absolute; padding: 0px; margin: 0px; border: 0px; width: 20px; height: 11px; left: 289px; top: 277px;"><div style="position: absolute; margin: 0px; padding: 0px; width: 20px; height: 11px; overflow: hidden; left: 4px; top: -4px;"><img src="http://api.map.baidu.com/images/marker_red_sprite.png" style="border:none;left:-19px; top:-13px; position:absolute;"></div></span></div><div style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 201;"></div><div style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 200;"><svg version="1.1" type="system" x="1889px" y="1360px" viewBox="-500 -500 1889 1360" style="position: absolute; top: -500px; left: -500px; width: 1889px; height: 1360px;"><path stroke-linejoin="round" stroke-linecap="round" fill-rule="evenodd" stroke="#3a6bdb" stroke-width="1" stroke-dasharray="none" fill="blue" stroke-opacity="0.3" fill-opacity="0.3" style="cursor: pointer; user-select: none;" d="M 295 245 L 288 245 281 247 275 249 269 253 264 257 260 262 256 268 254 274 252 281 252 288 252 294 254 301 256 307 260 313 264 318 269 322 275 326 281 328 288 330 295 330 301 330 308 328 314 326 320 322 325 318 330 313 333 307 336 301 337 294 338 288 337 281 336 274 333 268 330 262 325 257 320 253 314 249 308 247 301 245 295 245"></path></svg></div></div><div style="position: absolute; overflow: visible; top: 0px; left: 0px; z-index: 1;"><div style="position: absolute; overflow: visible; z-index: -100; left: 445px; top: 180px;"><img src="http://online4.map.bdimg.com/tile/?qt=tile&amp;x=1450&amp;y=419&amp;z=13&amp;styles=pl&amp;udt=20150518" style="position: absolute; border: none; width: 256px; height: 256px; left: 421px; top: -215px; max-width: none; opacity: 1;"><img src="http://online4.map.bdimg.com/tile/?qt=tile&amp;x=1446&amp;y=418&amp;z=13&amp;styles=pl&amp;udt=20150518" style="position: absolute; border: none; width: 256px; height: 256px; left: -603px; top: 41px; max-width: none; opacity: 1;"><img src="http://online3.map.bdimg.com/tile/?qt=tile&amp;x=1450&amp;y=418&amp;z=13&amp;styles=pl&amp;udt=20150518" style="position: absolute; border: none; width: 256px; height: 256px; left: 421px; top: 41px; max-width: none; opacity: 1;"><img src="http://online0.map.bdimg.com/tile/?qt=tile&amp;x=1446&amp;y=419&amp;z=13&amp;styles=pl&amp;udt=20150518" style="position: absolute; border: none; width: 256px; height: 256px; left: -603px; top: -215px; max-width: none; opacity: 1;"><img src="http://online2.map.bdimg.com/tile/?qt=tile&amp;x=1448&amp;y=419&amp;z=13&amp;styles=pl&amp;udt=20150518" style="position: absolute; border: none; width: 256px; height: 256px; left: -91px; top: -215px; max-width: none; opacity: 1;"><img src="http://online0.map.bdimg.com/tile/?qt=tile&amp;x=1447&amp;y=418&amp;z=13&amp;styles=pl&amp;udt=20150518" style="position: absolute; border: none; width: 256px; height: 256px; left: -347px; top: 41px; max-width: none; opacity: 1;"><img src="http://online2.map.bdimg.com/tile/?qt=tile&amp;x=1449&amp;y=418&amp;z=13&amp;styles=pl&amp;udt=20150518" style="position: absolute; border: none; width: 256px; height: 256px; left: 165px; top: 41px; max-width: none; opacity: 1;"><img src="http://online3.map.bdimg.com/tile/?qt=tile&amp;x=1449&amp;y=419&amp;z=13&amp;styles=pl&amp;udt=20150518" style="position: absolute; border: none; width: 256px; height: 256px; left: 165px; top: -215px; max-width: none; opacity: 1;"><img src="http://online1.map.bdimg.com/tile/?qt=tile&amp;x=1447&amp;y=419&amp;z=13&amp;styles=pl&amp;udt=20150518" style="position: absolute; border: none; width: 256px; height: 256px; left: -347px; top: -215px; max-width: none; opacity: 1;"><img src="http://online1.map.bdimg.com/tile/?qt=tile&amp;x=1448&amp;y=418&amp;z=13&amp;styles=pl&amp;udt=20150518" style="position: absolute; border: none; width: 256px; height: 256px; left: -91px; top: 41px; max-width: none; opacity: 1;"></div></div><div style="position: absolute; overflow: visible; top: 0px; left: 0px; z-index: 2;"></div></div><div class=" anchorBL" style="height: 32px; position: absolute; z-index: 10; text-size-adjust: none; bottom: 0px; right: auto; top: auto; left: 1px;"><a title="到百度地图查看此区域"  href="http://map.baidu.com/?sr=1" style="outline: none;"><img style="border:none;width:77px;height:32px" src="http://api.map.baidu.com/images/copyright_logo.png"></a></div><div id="zoomer" style="position:absolute;z-index:0;top:0px;left:0px;overflow:hidden;visibility:hidden;cursor:url(http://api.map.baidu.com/images/openhand.cur) 8 8,default"><div class="BMap_zoomer" style="top:0;left:0;"></div><div class="BMap_zoomer" style="top:0;right:0;"></div><div class="BMap_zoomer" style="bottom:0;left:0;"></div><div class="BMap_zoomer" style="bottom:0;right:0;"></div></div><div unselectable="on" class=" BMap_stdMpCtrl BMap_stdMpType0 BMap_noprint anchorTL" style="width: 62px; height: 192px; bottom: auto; right: auto; top: 10px; left: 10px; position: absolute; z-index: 1100; text-size-adjust: none;"><div class="BMap_stdMpPan" style="background-position: 0px 0px;"><div class="BMap_button BMap_panN" title="向上平移"></div><div class="BMap_button BMap_panW" title="向左平移"></div><div class="BMap_button BMap_panE" title="向右平移"></div><div class="BMap_button BMap_panS" title="向下平移"></div><div class="BMap_stdMpPanBg BMap_smcbg"></div></div><div class="BMap_stdMpZoom" style="height: 147px; width: 62px;"><div class="BMap_button BMap_stdMpZoomIn" title="放大一级" style="background-position: 0px -221px;"><div class="BMap_smcbg"></div></div><div class="BMap_button BMap_stdMpZoomOut" title="缩小一级" style="top: 126px; background-position: 0px -265px;"><div class="BMap_smcbg"></div></div><div class="BMap_stdMpSlider" style="height: 108px;"><div class="BMap_stdMpSliderBgTop" style="height: 108px;"><div class="BMap_smcbg"></div></div><div class="BMap_stdMpSliderBgBot" style="top: 37px; height: 75px;"></div><div class="BMap_stdMpSliderMask" title="放置到此级别"></div><div class="BMap_stdMpSliderBar" title="拖动缩放" style="cursor: url(&quot;http://api.map.baidu.com/images/openhand.cur&quot;) 8 8, default; top: 37px;"><div class="BMap_smcbg"></div></div></div><div class="BMap_zlHolder"><div class="BMap_zlSt"><div class="BMap_smcbg"></div></div><div class="BMap_zlCity"><div class="BMap_smcbg"></div></div><div class="BMap_zlProv"><div class="BMap_smcbg"></div></div><div class="BMap_zlCountry"><div class="BMap_smcbg"></div></div></div></div></div><div unselectable="on" class=" BMap_scaleCtrl BMap_noprint anchorBL" style="bottom: 18px; right: auto; top: auto; left: 81px; width: 76px; position: absolute; z-index: 10; text-size-adjust: none;"><div class="BMap_scaleTxt" unselectable="on" style="background-color: transparent; color: black;">2&nbsp;公里</div><div class="BMap_scaleBar BMap_scaleHBar" style="background-color: black;"><img style="border:none" src="http://api.map.baidu.com/images/mapctrls.png"></div><div class="BMap_scaleBar BMap_scaleLBar" style="background-color: black;"><img style="border:none" src="http://api.map.baidu.com/images/mapctrls.png"></div><div class="BMap_scaleBar BMap_scaleRBar" style="background-color: black;"><img style="border:none" src="http://api.map.baidu.com/images/mapctrls.png"></div></div><div unselectable="on" class=" BMap_cpyCtrl BMap_noprint anchorBL" style="cursor: default; white-space: nowrap; color: black; background: none; font-style: normal; font-variant: normal; font-weight: normal; font-stretch: normal; font-size: 11px; line-height: 15px; font-family: arial, sans-serif; bottom: 2px; right: auto; top: auto; left: 81px; position: absolute; z-index: 10; text-size-adjust: none;"><span _cid="1" style="display: inline;"><span style="font-size:11px">© 2015 Baidu&nbsp;- Data © <a  href="http://www.navinfo.com/" style="display:inline;">NavInfo</a> &amp; <a  href="http://www.cennavi.com.cn/" style="display:inline;">CenNavi</a> &amp; <a  href="http://www.365ditu.com/" style="display:inline;">道道通</a></span></span></div></div>

                        <div class="rt_search" style="margin-left:689px;">
                            <ul class="rt_searchNav">
                                <li class="on" id="dszfxq_C05_03">搜周边</li>
                                <li id="dszfxq_C05_05">查路线</li>
                            </ul>
                            <div class="rt_searchBox" style="display: block;" id="dszfxq_C05_04">
                                <ul class="aroundIndex">
                                    <li>
                                        <img src="${basePath}static/img/tao/bus.gif" width="45" height="45">公交</li>
                                    <li>
                                        <img src="${basePath}static/img/tao/subway.gif" width="45" height="45">地铁</li>
                                    <li>
                                        <img src="${basePath}static/img/tao/school.gif" width="45" height="45">学校</li>
                                    <li>
                                        <img src="${basePath}static/img/tao/market.gif" width="45" height="45">超市</li>
                                    <li>
                                        <img src="${basePath}static/img/tao/hosp.gif" width="45" height="45">医院</li>
                                    <li>
                                        <img src="${basePath}static/img/tao/food.gif" width="45" height="45">餐饮</li>
                                    <li>
                                        <img src="${basePath}static/img/tao/bank.gif" width="45" height="45">银行</li>
                                    <li>
                                        <img src="${basePath}static/img/tao/play.gif" width="45" height="45">娱乐</li>
                                </ul>
                                <div class="aroundInfor" style="display: none" id="">
                                    <h3 class="aroundNm"><a href="javascript:;">
                                        <img src="${basePath}static/img/tao/ardBack.gif" width="11" height="9">返回</a><strong></strong></h3>
                                    <div class="aroundCon">
                                        <div id="aroundinfo">
                                            <ul id="bus" style="display: none"></ul>
                                            <ul id="subway" style="display: none"></ul>
                                            <ul id="school" style="display: none"></ul>
                                            <ul id="supermarket" style="display: none"></ul>
                                            <ul id="hospital" style="display: none"></ul>
                                            <ul id="hotel" style="display: none"></ul>
                                            <ul id="bank" style="display: none"></ul>
                                            <ul id="play" style="display: none"></ul>
                                        </div>
                                        <div style="cursor: pointer" class="mapPage" id="fanye_P"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="rt_searchBox" style="display: none;" id="dszfxq_C05_06">
                                <ul class="trafficType">
                                    <li style="cursor: pointer" class="on"><span class="bus">公交</span></li>
                                    <li style="cursor: pointer"><span class="car">驾车</span></li>
                                    <li style="cursor: pointer"><span class="step">步行</span></li>
                                </ul>
                                <div class="searchBox">
                                    <div class="change_way"></div>
                                    <a class="btn" id="btnsearch" style="cursor: pointer">搜索</a>
                                    <ul class="inputBox">
                                        <li class="from">
                                            <input name="" type="text" id="sstartname" value="请输入关键字"></li>
                                        <li class="to">
                                            <input name="" type="text" id="sendname" value="${b.building_name}"></li>
                                    </ul>
                                </div>
                                <div class="trafficLine" id="bus_wrap">
                                </div>
                                <div class="trafficLine" id="drive_wrap"></div>
                                <div class="trafficLine" id="walk_wrap"></div>
                            </div>
                        </div>

                    </div>
                </div>
                 <script src="${basePath}static/js/common/jquery-3.1.0.min.js" type="text/javascript" charset="utf-8"></script>
                <script src="${basePath}static/js/common/detailmap.js" type="text/javascript"></script>
                <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=SrPhCze2737ssZQjBy7XvI518aMak6ew"></script>
                <script type="text/javascript" src="http://api.map.baidu.com/getscript?v=1.5&amp;ak=3a345e5b8b56a7f80605cd95d64634a8&amp;services=&amp;t=20150522094656"></script>
                <script type="text/javascript">
                    $(function () {
                        var mPoint=new BMap.Point(${map.lng}, ${map.lat});
                        var map=new DetailsMap({ container: "dszfxq_C05_04", cityName: "重庆", pointX: "${map.lng}", pointY: "${map.lat}", zoomIndex: 15 });					
	                    })
                </script>
            </div>

        </div>
        <div class="anchor-trigger  anchor-item">
            <div class="anchor-title">热门楼盘</div>
            <div class="hs-list">
                <ul class="clearfix recom-ul">
                <#list rList as r>
                    <#if rList?size lt 1>
                        暂无推荐
                    <#else>
                      <#if r.building_id != b.building_id>
                        <li>
                            <div class="photo">
                                <a href="${basePath}front/building/detail?id=${r.building_id}" >
                                    <img src="${basePath}${r.building_picture_addr}">
                                </a>
                                <div class="position_a recom-show">出租${r.rentNum}套 出售${r.saleNum}套</div>
                            </div>
                            <p class="recom-house title"><span class="hs-title"> <a href="javascript:;" >${r.building_name}</a></span></p>
                            <p class="recom-house recom-area">
                                <span>${r.district_name} ${r.trade_area_name} </span>
                            </p>
                            <p class="recom-house color_999">租金 :
                                <span class="recom-info">${r.building_rent}</span><em><#if r.building_rent_unit!="">${r.building_rent_unit}<#else>元/㎡.月</#if> </em>
                            </p>
                            <#if r.building_price ??>
                            <p class="recom-house color_999 pb_15">
						                                售价 :<span class="recom-info"> ${r.building_price}</span>
                                <em><#if r.building_price_unit!=''>${r.building_price_unit}<#else>元/㎡</#if> 起</em>
                            
                            </p>
                            </#if>
                        </li>
                        </#if>
                    </#if>
                </#list>
                </ul>
            </div>
            <#include "/include/footer.ftl">
        </div>
    </div>
</div>
</div>
<input type="hidden" value="${b.building_id}" id="bid">

<script src="${basePath}static/js/common/jquery-3.1.0.min.js" type="text/javascript" charset="utf-8"></script>
<script src="${basePath}static/js/common/owl.carousel.min.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="${basePath}static/jquery.page.js"></script>
<script src="${basePath}static/js/common/hot-room.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="${basePath}static/js/common/common.js"></script>
<script src="${basePath}static/js/common/hot-room.js" type="text/javascript" charset="utf-8"></script>

<script type="text/javascript">
			window._bd_share_config = {
				"common": {
					"bdSnsKey": {},
					"bdText": "",
					"bdMini": "2",
					"bdPic": "",
					"bdStyle": "0",
					"bdSize": "16"
				},
				"share": {}
			};
			with(document) 0[(getElementsByTagName('head')[0] || body).appendChild(createElement('script')).src = 'http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion=' + ~(-new Date() / 36e5)];
		</script>
<script type="text/javascript">
      $(function(){
      
         
	     resetbanner();
		$(window).resize(function(){
		       resetbanner();
		});
		    
	    $('.swiper').owlCarousel({
	        loop: true,
	        items:1,
	        dots:true,
	        autoplay:true,
	        autoplayTimeout:6000
		});
        var $top = $('#anchorNav').offset().top;
		var $top2 = $('.anchor-item').eq(1).offset().top-240;
		var $top0 = $('.anchor-item').eq(2).offset().top-180;
		var $top3 = $('.anchor-item').eq(3).offset().top-240;
		var $top4 = $('.anchor-item').eq(4).offset().top-225;
		var $top5 = $('.anchor-item').eq(5).offset().top-180;
		if($(window).scrollTop()>=$top){
				$('#anchorNav').addClass('fixed');
		}
		$(window).scroll(function(){	
			
			if($(window).scrollTop()>=$top){
				$('#anchorNav').addClass('fixed');
			}else{
				$('#anchorNav').removeClass('fixed');
			}
			if($(window).scrollTop()>$top2&&$(window).scrollTop()<$top0){
				$('#anchorNav li').removeClass('active');
				$('#anchorNav li').eq(1).addClass('active')
			}else if($(window).scrollTop()>$top0&&$(window).scrollTop()<$top3){
				$('#anchorNav li').removeClass('active');
				$('#anchorNav li').eq(2).addClass('active')
			}else if($(window).scrollTop()>$top3&&$(window).scrollTop()<$top4){
				$('#anchorNav li').removeClass('active');
				$('#anchorNav li').eq(3).addClass('active')
			}else if($(window).scrollTop()>$top4&&$(window).scrollTop()<$top5){
				$('#anchorNav li').removeClass('active');
				$('#anchorNav li').eq(4).addClass('active')
			}else if($(window).scrollTop()>$top5){
				$('#anchorNav li').removeClass('active');
				$('#anchorNav li').eq(5).addClass('active')
			}else if($(window).scrollTop()<$top2){
				$('#anchorNav li').removeClass('active');
				$('#anchorNav li').eq(0).addClass('active')
			}
		})

		$('#anchorNav li').click(function() {
			console.log($(window).scrollTop())
			var $index = $(this).index();
			$(this).siblings().removeClass('active');
			$(this).addClass('active')
			$('.anchor-item')[$index].scrollIntoView(true);
			$(window).scrollTop($(window).scrollTop() -110);
		})
        $('.recent-type a').click(function(){

            $(this).siblings().removeClass('recent-type-active');
            $(this).addClass('recent-type-active');
            var cur=$(this).index();
            $('.hs-list ul').siblings().hide();
            $('#more').show();
            $('.hs-list ul').eq(cur).show();

        });

       function resetbanner(){
		      var windowwidth = $(window).width();
		      var bannerheight = windowwidth/3.2;
		      $(".swiper .item").css("height",bannerheight+"px");
		      var spantop = bannerheight-20;
		      $(".hot-banner-text").css("top",spantop+"px");
		      var topheight = bannerheight+80;
		      $(".m-main-warp").css("top",topheight+"px");
		}
       
        var id=$('#bid').val();
        if(${page.pages}!=1){
           $("#Pagination").createPage({
            pageCount:${page.pages},//总页数
            current:${page.pageNum},//当前页
            backFn:function(num){
            if(num>${page.pages}||num<1){
               num=1;
            }
                ajaxPage(num);
            }
        });
        }
       

        function ajaxPage(num){
            $.ajax({
                type: "post",
                url: '${basePath}'+"front/building/ajaxPage",
                data: {
                    id : id,
                    beginNum : num,
                    pageSize : ${page.pageSize},
                },
                dataType: "json",
                success: function(result) {
                    change(result);
                }
            });
        }

        function change(result){
            $('.hs-pics ul').empty();
            for(i=0;i<result.data.length;i++){
                $('.hs-pics ul').append("<li><a href=\"javascript:void(0);\"><img src=\"${basePath}"+result.data[i].building_picture_addr+"\"></a></li>")
            }
             $(".m-page-warp").empty();
		     $('.hs-pics').after("<div class='m-page-warp' id='Pagination'></div>");
            $("#Pagination").createPage({
                pageCount:result.pages,//总页数
                current:result.pageNum,//当前页
                backFn:function(num){
	             if(num<1||num>${page.pages}){
	               num=1;
	             }
	                ajaxPage(num);
	            }
            });
        }
        
    })
    
     var count=0;
    function hhh(obj){
       var mi=$(obj).attr("name");
       var type=$(".recent-type").find(".recent-type-active").attr("name");
       $("#areaLinks li").removeClass("area-title");
       $("#areaLinks li a").removeClass("area-title");
       $(obj).addClass("area-title");
       var id="";
       if(count<3){
       count=count+1;
       }else{
       count=1;
       }
       if(type=="出租"){
         id="rents";
       }else{
         id="sales";
       }
       data={
        'mi':mi,
        'id':${b.building_id},
        'type':type,
        'beginNum':count,
        'pageSize':12
      }
      $.post('${basePath}front/building/search',data,function(result){
         $('#'+id).empty();
         for(i=0;i<result.data.length;i++){
         $('#'+id).append("<li><a href=\"${basePath}front/house/detail?id="+ result.data[i].house_id +"\" target=\"_blank\" title="+ result.data[i].house_name +","+ result.data[i].house_mi +"m²\">"+
                           " <img  src=\"${basePath}"+ result.data[i].house_picture_addr +"\">"+
                        "</a><p class=\"recent-content\">"+
                           " <span class=\"recent-price\">"+ result.data[i].house_money +"</span><em>元/月</em>"+
                            "<span class=\"recent-area\">"+ result.data[i].house_mi +"<em>平米</em></span> </p>"+
         "</li>")
         }
      },"json")
       
    }
    
    


   var des=document.getElementById("des");;
   var text=document.getElementById("textarea");
    autoTextarea(des);
    autoTextarea(text);

</script>
<#include "/include/stastics.ftl"/>
</body>

</html>