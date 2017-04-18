<!DOCTYPE html>
<html>

	<head>
		<title>${h.house_name}</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
		<link rel="stylesheet" type="text/css" href="${basePath}static/mobile/css/reset.css">
		<link rel="stylesheet" type="text/css" href="${basePath}static/mobile/css/house-details.css" />
		<link rel="stylesheet" type="text/css" href="${basePath}static/mobile/css/common.css"/>
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
				<span>房源详情</span>
				<a href="javascript:;" class="nav-btn"></a>
			</div>
			<ul class="heard-nav">
				<li><a href="${basePath}mobile">首页</a></li>
				<li><a href="${basePath}mobile/findHouses">找房源</a></li>
				<li><a href="${basePath}mobile/findBuildings">热门楼盘</a></li>
				<li><a href="${basePath}mobile/findRoom">委托找房</a></li>
				<li><a href="${basePath}mobile/house_resource">业主找房</a></li>
			</ul>
		</div>
		<div class="swiper-container swiper-details">
			<div class="swiper-wrapper">
			 <#if picture?size gte 1>
			 <#list picture as h>
				<a class="swiper-slide" href="javascript:;"><img src="${basePath}${h.house_picture_addr}" /></a>
			</#list>
            <#else>
               <#--没有图片处理-->
               <#--
               <a class="swiper-slide" href=""><img src="img/banner.png" /></a>
               -->
            </#if>
			</div>
			<div class="swiper-pagination"></div>
		</div>
		<div class="details-text">
			<h2 class="details-title">${h.house_name}</h2>
			<div class="details-num">
				<div class="details-num-item">
					<span>租金</span>
					<em>${h.house_money}<#if h.house_unit!="">${h.house_unit}<#else>元/m².月</#if></em>
				</div>
				
				<div class="details-num-item">
					<span>面积</span>
					<em>${h.house_mi}m²</em>
				</div>
			</div>
			<div class="details-details">
				<div><span>房屋概况:</span><p>${h.building_level}</p></div>
				<div><span>朝<i></i>向:</span><p><#if h.house_orientation!="">${h.house_orientation}<#else>南</#if></p></div>
				<div><span>装<i></i>修:</span><p>${h.house_decoration_type?default('暂无数据')}</p></div>
				<div><span>楼<i></i>盘:</span><p>${h.building_name}</p></div>
				<div><span>地<i></i>址:</span><p>${h.house_address}</p></div>
				<div><span>入驻时间:</span><p>${h.house_intime?default('立即入住')}</p></div>				
			</div>
			<div class="details-facilities">
				<p>配套设施:</p>
				<div class="facilities-warp">
				<#list facility as f>
				  <#if facility??>
					<div class="facilities-item on">
						<i></i>
						<p>${f.supporting_facilities_name}</br><span></span></p>
					</div>
					</#if>
				</#list>
                  <#--
                  <div class="facilities-item on">
						<i></i>
						<p>座机</br><span>(2台)</span></p>
					</div>
                  -->
					
				</div>
			</div>
		</div>
		<div class="map">
			<div class="map-text">
				<span>地图</span>
				<p>交通：${h.building_traffic}</p>
			</div>
			<div id="dituContent" style="width: 100%;height: 5rem;"></div>
		</div>
		<div class="m-content-warp">
			<div class="m-title"><span>热门房源</span>
			</div>
			<#list hs as r>
			 <#if r.house_id!=h.house_id>
			<div class="house-warp">
				<a class="house-item" href="${basePath}house/detail_h${r.house_id}.html">
					<div class="img-warp">
						<img src="${basePath}${r.house_picture_addr}" />
					</div>
					<div class="text-warp">
						<h2>${r.house_name}：${r.SEO_describe}</h2>
						<p>${r.building_level}</p>
						<p>${r.house_mi}m²建面</p>
						<p><span>${r.house_money}</span><#if h.house_unit!="">${h.house_unit}<#else>元/m².月</#if></p>
					</div>
				</a>
			</div>
			 </#if>
		    </#list>
          
		</div>
		<div class="fixed-botton">
			<a href="tel:${h.house_phone}" class="phone-house">电话预约看房</a>
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
		})
	</script>

</html>