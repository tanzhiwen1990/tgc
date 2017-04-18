<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<meta name="keywords" content="${ob.keyword}">
		<meta name="title" content="${ob.title}">
		<meta name="description" content="${ob.description}">
		<title>${ob.title}</title>
		<link rel="stylesheet" type="text/css" href="${basePath}static/tao/common.css"/>
		<link rel="stylesheet" type="text/css" href="${basePath}static/tao/reset.css"/>
		<link rel="stylesheet" type="text/css" href="${basePath}static/tao/news-details.css"/>
		<link rel="stylesheet" type="text/css" href="${basePath}static/tao/idangerous.swiper.css" />
		<script src="${basePath}static/js/common/jquery-3.1.0.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="${basePath}static/js/common/idangerous.swiper.min.js" type="text/javascript" charset="utf-8"></script>
		<link rel="icon"href="${basePath}static/img/tao/title-icon2.png" type="image/x-icon"/>
		<#include "/include/head.ftl">
	</head>
	<body>
		 <div class="g-nav-warp">
            <div class="m-content-warp clearfix nav-top"> 
                <a href="${basePath}index"><img class="logo-img" src="${basePath}static/img/tao/logo1.png" /></a>
				<div class="nav">
					<a href="${basePath}index" class="active">首页</a>
					<a href="${basePath}index/findHouses">找房源</a>
					<a href="${basePath}index/findBuildings">热门楼盘</a>
					<a href="${basePath}index/findRoom">委托找楼</a>
					<a href="${basePath}index/house_resource">业主放盘</a>
				</div>
			</div>
		</div>
		 <div class="l-main-warp">
            <div class="m-location">
                <span>当前位置：</span>
			<a href="${basePath}index">首页</a>&gt;<a href="javascript:;" class="active">资讯</a>
            </div>
			<div class="news-content">
				<h1>${ob.title}</h1>
				<div class="content-heard">
					<span>发布时间：${ob.realeaseDate?string('yyyy-MM-dd')}</span>
					<span>来源：<#if ob.source!=''>${ob.source}<#else>众享空间</#if></span>
				</div>
				${ob.content}
				<div class="content-footer clearfix">
					<div class="bdsharebuttonbox">
						<span>分享到:</span>
						<a href="#" class="bds_more" data-cmd="more"></a>
						<a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a>
						<a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a>
						<a href="#" class="bds_tqq" data-cmd="tqq" title="分享到腾讯微博"></a>
						<a href="#" class="bds_renren" data-cmd="renren" title="分享到人人网"></a>
						<a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a>
					</div>
				</div>
				<#if pre??>
				<p class="news-list"><span>上一篇：</span><a href="${basePath}${pre.url}">${pre.title}</a></p>
				</#if>
                
				<#if next??>
				<p class="news-list"><span>下一篇：</span><a href="${basePath}${next.url}">${next.title}</a></p>
				</#if>
			</div>
			
			<div class="news-hot">
				<div class="swiper-container" id="swiper">
					<div class="swiper-wrapper">
					  <#list infoList as i>
					    <#if i.url??>
					        <#if  i.url?contains("http://")>
						        <a class="swiper-slide" href="${i.url}" >
						     <#else>
						       <a class="swiper-slide" href="http://${i.url}" >
						     </#if>
						<#else>
						  <a class="swiper-slide" href="javascript:;">
						</#if>
                        <#if i.img??>
							<img src="${basePath}${i.img}">
						<#else>
						     <img src="${basePath}static/img/tao/hot-banner.png">
						</#if>
						</a>
					  </#list>
						
					</div>
					<div class="swiper-pagination-1"></div>
				</div>
				<div class="swiper-text">
				  <#list infoList as i>
				    <#if i_index==0>
					 <a href="${i.url}">${i.title}</a>
					 <#else>
					   <a href="${i.url}" style="display:none;">${i.title}</a>
					</#if>
				   </#list>
				</div>
				<div class="news-new">
					<p>最新资讯排行</p>
					<ul>
					 <#list latest as l>
						<li><a href="${l.url}">${l.title}</a></li>
					 </#list>
					</ul>
				</div>
		</div>
		<input type="hidden" value="${infoList?size}">
		<#include "/include/footer.ftl">
		</div>
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
			    var sum = $('#swiper').find('.swiper-wrapper').find('a').length;
				var mySwiper = new Swiper('#swiper', {
					slidesPerView: 'auto',
					pagination: '.swiper-pagination-1',
					autoplay: 5000,
					paginationClickable: true,
					loop: true,
					onSlideChangeEnd: function(swiper){
						var index;				      
				      if (mySwiper.activeIndex == sum+1) {
				      	index = 1;
				      } else if(mySwiper.activeIndex == 0){
				      	index = sum ;
				      }else{
				      	index = mySwiper.activeIndex;
				      }
				      	$('.swiper-text a').hide();
						$('.swiper-text a').eq(index-1).show();
				   } 
				});
			})
			
		</script>
		<#include "/include/stastics.ftl"/>
	</body>
</html>
