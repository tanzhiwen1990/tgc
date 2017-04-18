<!DOCTYPE html>
<html>

	<head>
		<title>知识问答</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
		<link rel="stylesheet" type="text/css" href="${basePath}static/mobile/css/reset.css">
		<link rel="stylesheet" type="text/css" href="${basePath}static/mobile/css/q-a.css" />
		<link rel="stylesheet" type="text/css" href="${basePath}static/mobile/css/common.css"/>
		<script type="text/javascript" src="${basePath}static/mobile/js/jquery-3.1.0.min.js"></script>
		<script type="text/javascript" src="${basePath}static/mobile/js/refresh.js"></script>
		<script type="text/javascript" src="${basePath}static/mobile/js/resposive.js"></script>
		<script type="text/javascript" src="${basePath}static/mobile/js/swiper.jquery.js"></script>
	</head>

	<body>
		<div class="qa-title">
			<a href="" class="back-btn" onclick="history.go(-1)"></a>
			<p>知识问答</p>
			
			<a href="javascript:;" ></a>
			
		</div>
		<div class="news-content">
			<h2>${obj.title} ？</h2>
			<p>${obj.content}</p>
		</div>
		<div class="m-content-warp">
			<div class="m-title"><span>最新资讯</span>
				<a href="javascript:;" class="change-btn" onclick="sjShow()">换一批</a>
			</div>
			<div class="news-warp" id="article">
			    <#if latest?size gt 0>
				   <#list latest as a>
					<a class="news-item" href="${basePath}${a.url}">
						<div class="img-warp">
							<img src="${basePath}static/mobile/img/banner.png" />
						</div>
						<div class="text-warp">
							<h2>${a.title}</h2>
							<span>[${a.realeaseDate?string("yyyy-MM-dd")}]</span>
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
				<a class="house-item" style="display:none;" href="${basePath}house/detail_h${h.house_id}.html">
					<div class="img-warp">
						<img src="${basePath}${h.house_picture_addr}" />
					</div>
					<div class="text-warp">
						<h2>${h.house_name}</h2>
						<p>${h.building_level}</p>
						<p><#if h.house_mi??>${h.house_mi}m²建面<#else>暂无数据</#if></p>
						<p><span>${h.house_money}</span>${h.house_unit}  </p>
					</div>
				</a>
			</#list>
			</div>
		
		</div>
		<a class="m-top-btn"></a>
      </#if>
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
          sjShow();
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