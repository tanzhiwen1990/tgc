<!DOCTYPE html>
<html>

	<head>
		<title>${b.building_name}</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
		<link rel="stylesheet" type="text/css" href="${basePath}static/mobile/css/reset.css">
		<link rel="stylesheet" type="text/css" href="${basePath}static/mobile/css/common.css"/>
		<link rel="stylesheet" type="text/css" href="${basePath}static/mobile/css/house-details.css" />
		<link rel="stylesheet" type="text/css" href="${basePath}static/mobile/css/swiper-3.3.1.min.css">
		<script type="text/javascript" src="${basePath}static/mobile/js/jquery-3.1.0.min.js"></script>
		<script type="text/javascript" src="${basePath}static/mobile/js/resposive.js"></script>
		<script type="text/javascript" src="${basePath}static/mobile/js/swiper.jquery.js"></script>
		<link rel="icon"href="${basePath}static/img/tao/title-icon2.png" type="image/x-icon"/>
		<#include "/include/head.ftl">
	</head>

	<body>
		<div class="g-heard">
			<div class="heard-title">
				<a href="${basePath}mobile">
				<img src="${basePath}static/mobile/img/logo.png"/>
				</a>
				<span>${b.building_name}</span>
				<a href="javascript:;" class="nav-btn"></a>
			</div>
			<#include '/mobile/header.ftl'/>
		</div>
		<div class="swiper-container swiper-details">
			<div class="swiper-wrapper">
			 <#if bPics?size gte 1>
			 <#list bPics as h>
				<a class="swiper-slide" href="javascript:;"><img src="${basePath}${h.building_picture_addr}" /></a>
			</#list>
            <#else>
               <#--没有图片处理-->
               <a class="swiper-slide" href=""><img src="${basePath}static/mobile/img/banner.png" /></a>
            </#if>
			</div>
			<div class="swiper-pagination" style="bottom:20px;"></div>
		</div>
		<div class="details-text">
			<h2 class="details-title">${b.building_name}</h2>
			<div class="details-num">
				<div class="details-num-item">
					<span>租金</span>
					<em>${b.building_rent}<#if b.building_rent_unit!="">${b.building_rent_unit}<#else>元/m².月</#if></em>
				</div>
				
				<div class="details-num-item">
					<span>售价</span>
					<em>${b.building_price?default("暂无数据")}<#if b.building_price ??><#if b.building_price_unit!="">${b.building_price_unit}<#else>元/㎡</#if></#if></em>
				</div>
				
				<div class="details-num-item">
					<span>物业费</span>
					<em>${b.building_property_money}<#if b.building_property_money??><#if b.building_property_unit!=''>${b.building_property_unit}<#else>元/月</#if></#if></em>
				</div>
			</div>
			<div class="details-details">
				<div><span>物业等级:</span><p>${b.building_level}</p></div>
				<div><span>物业类型:</span><p>${b.building_addr}</p></div>
				<div><span>物业公司</span><p>${b.building_property}</p></div>
				<div><span>楼盘地址:</span><p>${b.district_name}-${b.trade_area_name}</p></div>
				<div><span>停<em></em>车<em></em>费:</span><p>${b.building_car_money?default('暂无数据')}<#if b.building_car_money??>元</#if></p></div>
				<div><span>停<em></em>车<em></em>位:</span><p>${b.building_car?default('暂无数据')}<#if b.building_car??>个</#if></p></div>
				<div><span>开<em></em>发<em></em>商:</span><p>${b.building_developers?default('暂无数据')}</p></div>
				<div><span>竣工时间:</span><p>${b.building_repairtime?string('yyyy-MM-dd')}</p></div>
				<div><span>周边配套:</span><p>暂无数据</p></div>
			</div>		
		</div>
			<div class="details-facilities">
				<p>楼盘描述:</p>
				<div>${b.SEO_describe?default("暂无该楼盘的的描述信息")}</div>
			</div>
		</div>
		<div class="situation-wraaper">
			<h2><span>房源情况</span><a href="javascript:;" class="btn-warp"><span>最近出租</span><i></i></a><a href="javascript:;" class="sale-btn">最近出售</a></h2>
			<div class="situation">
			<#list rents as h>
				<a class="situation-item" href="${basePath}house/detail_h${h.house_id}.html">
					<img src="${basePath}${h.house_picture_addr}" alt="" />
					<p><span><em>${h.house_money}</em><#if h.house_unit!="">${h.house_unit}<#else>元/m².月</#if></span><i>${h.house_mi}<#if h.house_mi ??>m²</#if></i></p>
				</a>
		    </#list>
			</div>
			<div class="situation" style="display:none;">
			<#list sales as h>
				<a class="situation-item">
					<img src="${basePath}${h.house_picture_addr}" alt="" />
					<p><span><em>${h.house_money}</em><#if h.house_unit!="">${h.house_unit}<#else>元/m².月</#if></span><i>${h.house_mi}<#if h.house_mi ??>m²</#if></i></p>
				</a>
		    </#list>
			</div>
			<div class="details-facilities new-facilities">
				<p>楼盘描述:</p>
				<div>${b.building_SEO?default('暂无描述')}</div>
			</div>
		</div>
		<div class="map">
			<div class="map-text">
				<span>地图</span>
				<p>交通：${b.building_traffic?default("暂无")}</p>
			</div>
			<div id="dituContent" style="width: 100%;height: 5rem;"></div>
		</div>
		<div class="m-content-warp">
			<div class="m-title"><span>房源情况</span>
			</div>
			<div class="house-warp">
				
			<#list hList as h>
			<#if hList?size gt 0>
				<a class="house-item" href="${basePath}house/detail_h${h.house_id}.html">
					<div class="img-warp">
						<img src="${basePath}${h.house_picture_addr}"/>
					</div>
					<div class="text-warp">
					    <h2>${h.house_name}</h2>
						<p>${h.building_level}</p>
						<p>${h.house_mi}<#if h.house_mi ??>m²建面</#if></p>
						<p><span>${h.house_money}<#if h.house_unit!="">${h.house_unit}<#else>元/m².月</#if></p>
					</div>
				</a>
			<#else>
			暂无房源
			</#if>
			</#list>	
			</div>
		</div>
		<div class="fixed-botton">
			<a href="tel:023-64288028" class="phone-house">电话预约看房</a>
		</div>
     <#include '/mobile/stastics.ftl'/>
	</body>
	<script type="text/javascript" src="http://api.map.baidu.com/api?key=&v=1.1&services=true"></script>
	<script>
		
		 
		 function initMap(){
		      createMap();//创建地图
		      setMapEvent();//设置地图事件
		      addMapControl();//向地图添加控件
		      addMapOverlay();//向地图添加覆盖物
		    }
		    function createMap(){ 
		      map = new BMap.Map("dituContent"); 
		      map.centerAndZoom(new BMap.Point(${map.lng},${map.lat}),17);
		    }
		    function setMapEvent(){
		      map.enableScrollWheelZoom();
		      map.enableKeyboard();
		      map.enableDragging();
		      map.enableDoubleClickZoom()
		    }
		    function addClickHandler(target,window){
		      target.addEventListener("click",function(){
		        target.openInfoWindow(window);
		      });
		    }
		    function addMapOverlay(){
		      var markers = [
		        {content:"",title:"",imageOffset: {width:-23,height:-21},position:{lat:${map.lat},lng:${map.lng}}}
		      ];
		      for(var index = 0; index < markers.length; index++ ){
		        var point = new BMap.Point(markers[index].position.lng,markers[index].position.lat);
		        var marker = new BMap.Marker(point,{icon:new BMap.Icon("http://api.map.baidu.com/lbsapi/createmap/images/icon.png",new BMap.Size(20,25),{
		          imageOffset: new BMap.Size(markers[index].imageOffset.width,markers[index].imageOffset.height)
		        })});
		        var label = new BMap.Label(markers[index].title,{offset: new BMap.Size(25,5)});
		        var opts = {
		          width: 200,
		          title: markers[index].title,
		          enableMessage: false
		        };
		        var infoWindow = new BMap.InfoWindow(markers[index].content,opts);
		        marker.setLabel(label);
		        addClickHandler(marker,infoWindow);
		        map.addOverlay(marker);
		      };
		    }
		    //向地图添加控件
		    function addMapControl(){
		      var scaleControl = new BMap.ScaleControl({anchor:BMAP_ANCHOR_BOTTOM_LEFT});
		      scaleControl.setUnit(BMAP_UNIT_IMPERIAL);
//		      map.addControl(scaleControl);
		      var navControl = new BMap.NavigationControl({anchor:BMAP_ANCHOR_TOP_LEFT,type:BMAP_NAVIGATION_CONTROL_LARGE});
//		      map.addControl(navControl);
		      var overviewControl = new BMap.OverviewMapControl({anchor:BMAP_ANCHOR_BOTTOM_RIGHT,isOpen:true});
//		      map.addControl(overviewControl);
		    }
		    var map;
		      initMap()
			
			</script>
	<script type="text/javascript">
		$(function() {
			var mySwiper1 = new Swiper(".swiper-container", {
				pagination: '.swiper-pagination',
				paginationType: 'fraction',
				autoplay: 5000,
				loop: true
			});
			
			$('.btn-warp').click(function(){
				$('.sale-btn').toggle();
				//代做
			})
		})
	</script>

</html>