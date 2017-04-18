
<!DOCTYPE html>
<html>
	<head>
		<title>${seo.title}</title>
		<meta charset="utf-8">
		<meta name="keywords" content="${seo.keyword}">
		<meta name="title" content="${seo.title}">
		<meta name="description" content="${seo.description}">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
		<link rel="stylesheet" type="text/css" href="${basePath}static/mobile/css/reset.css">
		<link rel="stylesheet" type="text/css" href="${basePath}static/mobile/css/common.css" />
	    <link rel="stylesheet" type="text/css" href="${basePath}static/mobile/css/index.css" />
		<link rel="stylesheet" type="text/css" href="${basePath}static/mobile/css/swiper-3.3.1.min.css">
		
		<link rel="icon"href="${basePath}static/img/tao/title-icon2.png" type="image/x-icon"/>
		<#include "/include/head.ftl">
	</head>
		<body>
		<div class="g-heard">
			<div class="heard-title">
				<a href="${basePath}mobile">
				<img src="${basePath}static/mobile/img/logo.png"/>
				</a>
				<a href="javascript:;" class="nav-btn"></a>
			</div>
			<#include '/mobile/header.ftl'/>
		</div>
		<div class="m-seach-warp">
            <div class="lp-warp swiper-container">
                <div class="fy-content swiper-wrapper">
                    <#if banner ?? && (banner?size > 0)>
				    <#list banner as b>
				      <#if banner?size = 1>
				        <a <#if b.url !=""> href="${b.url}"  <#else> href="javascript:;" </#if> class="swiper-slide"><img src="${basePath}${b.pic}" /></a>
				        <a href="javascript:;"   class="swiper-slide"><img src="${basePath}static/img/tao/banner.png"/></a>
				       <#else>
				         <a <#if b.url !=""> href="${b.url}"  <#else> href="javascript:;" </#if>  class="swiper-slide"><img src="${basePath}${b.pic}"/ ></a>
				       </#if>
					</#list>
					<#else>
						<a href="javascript:;" class="swiper-slide"><img src="${basePath}static/mobile/img/banner.png" /></a>
					    <a href="javascript:;" class="swiper-slide"><img src="${basePath}static/mobile/img/banner.png" /></a>
					    <a href="javascript:;" class="swiper-slide"><img src="${basePath}static/mobile/img/banner.png" /></a>
					</#if>
                </div>
                <div class="swiper-pagination"></div>
            </div>
			<div class="input-warp">
				<input id="search" placeholder="请输入楼盘名字或者商圈名字.." value="${keyword}" onchange="application.search('${basePath}')"/>
				<button href="javascript:;" class="u-seach-btn" onclick="application.search('${basePath}')"></button>
			</div>
		</div>
		<div class="nav-warp">
			<a href="${basePath}index/findHouses">找房源</a>
			<a href="${basePath}index/findBuildings">热门楼盘</a>
			<a href="${basePath}index/findRoom">委托找楼</a>
			<a href="${basePath}index/house_resource">业主放盘</a>
		</div>
		<div class="m-content-warp">
			<div class="m-title">热门商圈</div>
			<div class="sq-warp swiper-container">
				<div class="sq-content swiper-wrapper">
				    <#list tList as t>
					<a href="${basePath}house/searchByTradeArea?id=${t.trade_area_id}" class="swiper-slide"><img src="${basePath}${t.trade_area_img}" />
						<p>${t.trade_area_name}</p>
					</a>
					</#list>
				</div>
			</div>
		</div>
		<div class="m-content-warp">
			<div class="m-title">热门楼盘</div>
			<div class="lp-warp swiper-container">
				<div class="fy-content swiper-wrapper">
				<#list  rList as b>
					<a href="${basePath}mBuilding/detail_b${b.building_id}.html" class="swiper-slide"><img src="${basePath}${b.building_picture_addr}" style="width:100%;height:240px;" /></a>
				</#list>
				</div>
				<div class="swiper-pagination"></div>
			</div>
		</div>
		<div class="m-content-warp">
			<div class="m-title">热门房源</div>
			<div class="fy-warp swiper-container">
				<div class="fy-content swiper-wrapper">
				<#list hList as h>
					<a href="${basePath}house/detail_h${h.house_id}.html" class="swiper-slide"><img src="${basePath}${h.house_picture_addr}" style="100%;height:240px;" /></a>
				</#list>
				</div>
				<div class="swiper-pagination"></div>
			</div>
		</div>
		<div class="m-content-warp">
			<div class="m-title"><span>行业资讯</span>
				<a href="javascript:;" class="change-btn" id="change-btn" onclick="sjShow()">换一批</a>
			</div>
			<div class="news-warp" id="article">
			<#--资讯-->
			<#list page.data as info>
				<a class="news-item" 
                <#if info.url?contains("http://")>
				   <#if info.url?contains("article")>href="${info.url}?type=1"<#else>href="${info.url}"</#if>
				<#else>
				   <#if info.url?contains("article")>href="http://${info.url}?type=1"<#else>href="http://${info.url}"</#if>
				</#if>
                 >
					<div class="img-warp">
					 <#if info.img ??>
						<img src="${basePath}${info.img}" />
					<#else>
					   <img src="${basePath}static/mobile/img/news.png" />
					</#if>
					</div>
					<div class="text-warp" style="width:100%;">
						<h2>${info.title}</h2>
						<span>[${info.updateDate?string('yyyy-MM-dd')}]</span>
					</div>
				</a>
			</#list>
			</div>
		</div>
		<div class="m-content-warp">
			<div class="m-title"><span>选址百科</span>
				<a href="javascript:;" class="change-btn" id="refresh-search" onclick="application.change('entrance')">换一批</a>
			</div>
			<div class="qa-warp" id="entrance">
			<#list pList as p>
			  <#if p.url?contains("article")>
				<a href="${p.url}?type=2" class="qa-item" style="display:none;">${p.title}?</a>
			 <#else>
			    <a href="${p.url}" class="qa-item" style="display:none;">${p.title}?</a>
			 </#if>
			</#list>
			</div>
		</div>
	<#include '/mobile/footer.ftl'/>
	<script type="text/javascript" src="${basePath}static/mobile/js/jquery-3.1.0.min.js"></script>
	<script type="text/javascript" src="${basePath}static/mobile/js/resposive.js"></script>
	<script type="text/javascript" src="${basePath}static/mobile/js/swiper.jquery.js"></script>
	<script type="text/javascript" src="${basePath}static/mobile/js/refresh.js"></script>
	<script type="text/javascript" src="${basePath}static/js/common/common.js"></script>
	<script type="text/javascript">
		$(function() {
		    resetbanner();
            $(window).resize(function(){
                resetbanner();
            });
			var mySwiper1 = new Swiper(".fy-warp,.lp-warp", {
				pagination: '.swiper-pagination',
				paginationClickable: true,
				autoplay: 3000,
				loop: true,
				dots:true,
				slidesPerView: "auto"
			});
			var mySwiper = new Swiper(".sq-warp", {
				autoplay: 3000,
				slidesPerView: "auto"
			});
            $(".swiper-pagination").css("display","none");
	
			//换一批功能实现
               $('#entrance').show(function () {
                  var showObject = $(this).children('a');
                  $.refresh({
                      object: showObject
                  });
              });
              
           //新闻资讯
         
		});
		 $('#refresh-search').click(function () {
                var showObject = $('#entrance').children('a');
                $.refresh({
                    object: showObject
                });
            });
         
         function sjShow(){
	        $("#article").children('a').hide();
	        var showCount=0;
	        var aArr=$("#article").children('a');
	        while(showCount<3){
	            var id=Math.floor(Math.random()*aArr.length);
	            var curDiv=$("#article").children('a').eq(id);
	            if(curDiv.css("display")=="none"){
	                curDiv.show();
	                showCount++;
	            }
	        }
		    }
		function resetbanner(){
            var windowwidth = $(window).width();
            var bannerheight = windowwidth/3.2;
            $(".m-seach-warp .swiper-wrapper a").css("height",bannerheight+"px");
        }
	</script>
	<#include '/mobile/stastics.ftl'/>
	</body>
</html>