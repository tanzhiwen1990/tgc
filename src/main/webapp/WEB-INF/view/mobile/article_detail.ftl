<!DOCTYPE html>
<html>
	<head>
		<title>${ob.title}</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
		<link rel="stylesheet" type="text/css" href="${basePath}static/mobile/css/reset.css">
		<link rel="stylesheet" type="text/css" href="${basePath}static/mobile/css/q-a.css" />
		<link rel="stylesheet" type="text/css" href="${basePath}static/mobile/css/common.css"/>
		<link rel="stylesheet" type="text/css" href="${basePath}static/mobile/css/swiper-3.3.1.min.css">
		<script type="text/javascript" src="${basePath}static/mobile/js/jquery-3.1.0.min.js"></script>
		<script type="text/javascript" src="${basePath}static/mobile/js/resposive.js"></script>
		<script type="text/javascript" src="${basePath}static/mobile/js/refresh.js"></script>
		<script type="text/javascript" src="${basePath}static/mobile/js/swiper.jquery.js"></script>
		<link rel="icon"href="${basePath}static/img/tao/title-icon2.png" type="image/x-icon"/>
		<#include "/include/head.ftl">
	</head>

	<body style="padding-top:0px;">
		<div class="qa-title">
			<a href="#"  onClick="javascript :history.back(-1);" class="back-btn"></a>
			<p><#if type=='1'>行业资讯<#else>选址百科</#if></p>
			<a href="javascript:;" ></a>
		</div>
		<div class="news-content">
			<h2>${ob.title}</h2>
			<div class="news-title">
				<span>来源:<#if ob.source!=''>${ob.source}<#else>众享空间</#if></span><span class="time">发布时间:${ob.realeaseDate?string("yyyy-MM-dd")}</span>
			</div>
			<p>${ob.content}</p>
		</div>
		<div class="m-content-warp">
			<div class="m-title"><span>最新资讯</span>
				<a href="javascript:;" class="change-btn" onclick="sjShow()">换一批</a>
			</div>
			<div class="news-warp" id="article">
			    <#if latest?size gt 0>
				   <#list latest as a>
				     <#if a.url?contains("article")><a class="news-item" href="${a.url}?type=1"><#else><a class="news-item" href="${a.url}"></#if>
					 <#if a.img ??>
						<div class="img-warp">
						<img src="${basePath}${a.img}" />
					    </div>
					  <#else>
					     <div class="img-warp">
						    <img src="${basePath}static/mobile/img/news.png" />
					    </div>
					  </#if>
						<div class="text-warp">
							<h2>${a.title}</h2>
							<span>[${a.updateDate?string('yyyy-MM-dd')}]</span>
						</div>
					</a>
					</#list>
				<#else>
				      暂无最新消息
				</#if>
			</div>
		</div>
		<#if hList?size gt 0>
		<div class="m-content-warp">
			<div class="m-title"><span>房源推荐</span>
				<a href="javascript:;" class="change-btn" id="refresh-search">换一批</a>
			</div>
			<div class="house-warp" id="entrance">
			<#list hList as h>
				<a class="house-item" href="${basePath}house/detail_h${h.house_id}.html"  style="display:none;">
					<div class="img-warp">
						<img src="${basePath}${h.house_picture_addr}" />
					</div>
					<div class="text-warp">
						<h2>${h.house_name}</h2>
						<p>${h.building_level}</p>
						<p><#if h.house_mi??>${h.house_mi}m²建面<#else>暂无数据</#if></p>
						<p><span>${h.house_money}</span><#if h.house_unit!="">${h.house_unit}<#else></i> 元/m².月</#if> </p>
					</div>
				</a>
			</#list>
			</div>
		</div>
      </#if>
     <#include '/mobile/footer.ftl'/>
     <#include '/mobile/stastics.ftl'/>
	</body>
	<script type="text/javascript">
		$(function() {
			var mySwiper = new Swiper(".swiper-container", {
				pagination: '.swiper-pagination',
				paginationClickable: true,
				autoplay: 5000,
				loop: true,
				slidesPerView: "auto"
			});
			
			//换一批功能实现
           $('#entrance').show(function () {
              var showObject = $(this).children('a');
              $.refresh({
                  object: showObject
              });
          });
          //新闻资讯
        
		})
		 $('#refresh-search').click(function () {
                var showObject = $('#entrance').children('a');
                $.refresh({
                    object: showObject
                });
            });
         
         function sjShow(){
	        $("#article").children('a').hide();
	        var showCount=0;
	        while(showCount<3){
	            var id=Math.floor(Math.random()*20);
	            var curDiv=$("#article").children('a').eq(id);
	            if(curDiv.css("display")=="none"){
	                curDiv.show();
	                showCount++;
	            }
	        }
		    }
	</script>

</html>