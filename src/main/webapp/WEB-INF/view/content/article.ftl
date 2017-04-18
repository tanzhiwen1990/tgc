<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title></title>
		<link rel="stylesheet" type="text/css" href="${basePath}static/tao/common.css" />
		<link rel="stylesheet" type="text/css" href="${basePath}static/tao/reset.css" />
		<link rel="stylesheet" type="text/css" href="${basePath}static/tao/index.css" />
		<link rel="stylesheet" type="text/css" href="${basePath}static/tao/owl.carousel.min.css"/>
		<link rel="stylesheet" type="text/css" href="${basePath}static/tao/owl.theme.default.min.css"/>

	</head>

	<body>
			<#--
			<div class="g-heard">
					<div class="m-content-warp">
						<p>咨询热线400-000-0000</p>
						<div class="btn-warp">
							<!--<a href="">登录</a><i>|</i><a href="">注册</a>
						</div>
					</div>
				</div>
			-->
				
		<div class="g-nav-warp">
			<div class="m-content-warp clearfix">
				<img src="${basePath}static/img/tao/logo.png" />
				<div class="nav">
					<a href="${basePath}index" class="active">首页</a>
					<a href="${basePath}index/findHouses">找房源</a>
					<a href="${basePath}index/findBuildings">热门楼盘</a>
					<a href="${basePath}index/findRoom">委托找楼</a>
					<a href="${basePath}index/house_resource">业主放盘</a>
				</div>
			</div>
		</div>
		<div class="m-location m-content-warp">
			<span>当前位置：</span>
			<a href="">首页</a>&gt;<a href="" class="active">资讯</a>
		</div>
		<div class="m-content-warp clearfix">
			<div class="news-content">
				<h1>${title}</h1>
				<div class="content-heard">
					<span>发布时间：${realeaseDate?string('yyyy-mm-dd')}</span>
					<span>来源：${source}</span>
					<span>责任编辑：${source}</span>
				</div>
				<p class="text-content">
				  ${content}
				</p>
				
				<div class="content-footer clearfix">
					<span>来源：${source}</span>
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
				<p class="news-list"><span>上一篇：</span><a href="">米袋网：房地产将成为2016互联网金融兵家必争之地</a></p>
				<p class="news-list"><span>下一篇：</span><a href="">米袋网：房地产将成为2016互联网金融兵家必争之地</a></p>
			</div>
			<div class="news-hot">
				<div class="swiper-container" id="swiper">
					<div class="swiper-wrapper">
						<a class="swiper-slide" href="">
							<img src="img/hot-banner.png">
						</a>
						<a class="swiper-slide" href="">
							<img src="img/hot-banner.png">
						</a>
						<a class="swiper-slide" href="">
							<img src="img/hot-banner.png">
						</a>
						<a class="swiper-slide" href="">
							<img src="img/hot-banner.png">
						</a>
						<a class="swiper-slide" href="">
							<img src="img/hot-banner.png">
						</a>
					</div>
					<div class="swiper-pagination-1"></div>
				</div>
				<div class="swiper-text">
					<h2><a href=""></a></h2>
				</div>
				<div class="news-new">
					<p>最新资讯排行</p>
					<ul>
						<li><a href="">资讯名称资讯名称资讯名称资讯名称资讯名称资讯名称</a></li>
						<li><a href="">资讯名称资讯名称资讯名称资</a></li>
						<li><a href="">资讯名称资讯名称资讯名称资</a></li>
						<li><a href="">资讯名称资讯名称资讯名称资</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="g-footer">		
			<div class="footer-top">
				<div class="m-content-warp clearfix">
					<p>友情链接</p>
					<div class="link-warp clearfix">
						<a href="">万通融资</a>
						<a href="">万通融资</a>
					</div>
				</div>
			</div>
			<div class="footer-bottom">
				<div class="m-content-warp">
					<p class="link-warp"><a href="">关于我们</a><i>|</i><a href="">联系我们</a><i>|</i><a href="">人才招聘</a><i>|</i><a href="">用户协议</a></p>
					<p>Copyright © 2016 www.qfang.com. All Rights Reserved ICP备案号：粤ICP备05067219号-3</p>
				</div>
			</div>
			</div>
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
				var data = ["<h2><a href=''>11111</a></h2>",
							"<h2><a href=''>22222</a></h2>",
							"<h2><a href=''>33333</a></h2>",
							"<h2><a href=''>444</a></h2>",
							"<h2><a href=''>555555</a></h2>"]
				var sum = $('#swiper').find('.swiper-wrapper').find('a').length;
				$('.swiper-text').html(data[0])
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
				      	index = mySwiper.activeIndex
				      }
						$('.swiper-text').html(data[index-1])
				   } 
				});
			})
		</script>
	</body>
</html>
