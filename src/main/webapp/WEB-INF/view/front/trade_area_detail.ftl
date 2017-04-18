<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8" />
		<title>楼盘详情</title>
		<link rel="stylesheet" type="text/css" href="${basePath}static/tao/common.css" />
		<link rel="stylesheet" type="text/css" href="${basePath}static/tao/reset.css" />
		<link rel="stylesheet" type="text/css" href="${basePath}static/tao/house-details.css" />
		<script src="${basePath}static/js/common/jquery-3.1.0.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="${basePath}static/js/common/hot-room.js" type="text/javascript" charset="utf-8"></script>
		<link rel="icon"href="${basePath}static/img/tao/title-icon2.png" type="image/x-icon"/>
		<#include "/include/head.ftl">
	</head>

	<body>
		<div class="g-heard">
			<div class="m-content-warp">
				<p>咨询热线400-000-0000</p>
				<div class="btn-warp">
				</div>
			</div>
		</div>
		<div class="g-nav-warp">
			<div class="m-content-warp clearfix">
                <a href="${basePath}index"><img src="${basePath}static/img/tao/logo.png" /></a>
				<div class="nav">
					<a href="${basePath}index">首页</a>
					<a href="${basePath}index/findHouses" class="active">找房源</a>
					<a href="${basePath}index/findBuildings">热门楼盘</a>
					<a href="${basePath}index/findRoom">委托找楼</a>
					<a href="${basePath}index/house_resource">业主放盘</a>
				</div>
			</div>
		</div>
		<div class="m-location m-content-warp">
			<span>当前位置：</span>
			<a href="${basePath}index/findBuildings">热门楼盘</a>&gt;
			<a href="" class="active">楼盘详情</a>
		</div>
		<div class="m-content-warp">
			<div class="search-condition">
				<div class="seach-input clearfix">
					<input type="" placeholder="请输入楼盘名字或者商圈名字..." />
					<a href="javascript:;">搜索</a>
				</div>
			</div>
			<div class="house-content-tittle clearfix">
				<h1>${h.building_name}</h1>
				<p>房源编号：${h.building_id}</p>
				<a href="${basePath}index/findRoom">免费发布房源</a>
			</div>

			<div class="info clearfix">
				<div class="info-photo">
					<div id="playimages" class="play">
						<ul class="big_pic">
							<li><img src="${basePath}static/img/tao/banner.png" /></li>
							<li><img src="${basePath}static/img/tao/demo-1.png" /></li>
							<li><img src="${basePath}static/img/tao/hot-room-demo.png" /></li>
							<li><img src="${basePath}static/img/tao/hot-room-demo.png" /></li>
							<li><img src="${basePath}static/img/tao/banner.png" /></li>
							<li><img src="${basePath}static/img/tao/demo-1.png" /></li>
						</ul>
						<div id="small_pic" class="small_pic">
							<a class="mark_left" href="javascript:;"></a>
							<div class="small_pic_warp">
								<ul>
									<li style=" filter: alpha(opacity:100); opacity:1;"><img src="${basePath}static/img/tao/banner.png" /></li>
									<li><img src="${basePath}static/img/tao/demo-1.png" /></li>
									<li><img src="${basePath}static/img/tao/hot-room-demo.png" /></li>
									<li><img src="${basePath}static/img/tao/hot-room-demo.png" /></li>
									<li><img src="${basePath}static/img/tao/banner.png" /></li>
									<li><img src="${basePath}static/img/tao/demo-1.png" /></li>
								</ul>
							</div>
							<a class="mark_right" href="javascript:;"></a>
						</div>
					</div>
				</div>
				<div class="info-text">
					<ul class="house-info">
						<li><span class="info-tit">售<span class="pl2e"></span>价：</span><strong class="red price bold">${h.building_price}</strong>元/㎡</li>
						<li><span class="info-tit">楼盘概况:</span>${h.building_developers}<span class="splitline">|</span>${h.building_property}<span class="splitline">|</span>
							<span title="建筑面积">${h.building_acreage}㎡</span>

							<span class="splitline">|</span>${h.building_houseNum}

							<span class="splitline">|</span> ${h.building_year}

							<span class="splitline">|</span> ${h.building_level}

						</li>
						<li><span class="info-tit">楼<span class="pl2e"></span>盘：</span>
							<a  title="查看${h.building_name}更多出租房源" href="">
								${h.building_name}</a>
							<a  href="">江北</a>/
							<a  href="">黄泥磅</a>]</li>

						<li title="${h.building_addr}"><span class="info-tit">地<span class="pl2e"></span>址：</span>${h.building_addr}</li>

						<li title="楼盘介绍"><span class="info-tit">楼盘介绍：</span>${h.SEO_describe}</li>

					</ul>
					<div class="tel-wrap clearfix">
						<div class="tel red fl">
							4008908754<span>转</span>468917
						</div>
						<a name="look" class="btn-yuyue"  href="http://wpa.qq.com/msgrd?v=3&uin=304318122&site=qq&menu=yes">预约看房</a>
					</div>
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
			</div>
			<div class="anchor-nav clearfix">
				<ul class="clearfix" id="anchorNav">
					<li class="active">
						<a href="javascript:;">配套设施</a>
					</li>
					<li>
						<a href="javascript:;">楼盘图片</a>
					</li>
					<li>
						<a href="javascript:;">地图街景</a>
					</li>
					<li>
						<a href="javascript:;">热门楼盘</a>
					</li>
				</ul>
			</div>
			<div class="anchor-trigger  anchor-item">
				<div class="anchor-title">配套设施</div>
				<ul class="sheshi-warp clearfix">
					<li><p class="zuoji"></p><span>座机（2部）</span></li>
					<li><p class="diannao"></p><span>电脑（20台）</span></li>
					<li class="on"><p class="bangongzuo"></p><span>办公桌20张）</span></li>
					<li><p class="luyouqi"></p><span>路由器（2个）</span></li>
					<li><p class="touyinyi"></p><span>投影仪（2个）</span></li>
					<li class="on"><p class="mimaxiang"></p><span>密码箱（2个）</span></li>
					<li><p class="dayinji"></p><span>打印机</span></li>
					<li><p class="heiban"></p><span>黑板</span></li>
					<li><p class="yinshuiji"></p><span>饮水机</span></li>
				</ul>
			</div>
			<div class="anchor-trigger  anchor-item">
				<div class="anchor-title">楼盘图片</div>
				<p class="newhs-dmf-tabs-photo clearfix">
					<a class="turnpage_nav" href="javascript:;">实景图&nbsp;(5)</a>
				</p>
				<div class="hs-pics" id="hsPics">
					<ul class="clearfix">
					<#if picture?size lt 1>
					 <li>
							<a href="javascript:;">
							<#--
							TODO 无图片处理
							-->
								<img src="${basePath}static/img/tao/banner.png">
							</a>
						</li>
					</#if>
					<#list picture as p>
						<li>
							<a href="javascript:;">
								<img src="${basePath}${p.building_picture_addr}">
							</a>
						</li>
					</#list>
                     <#--
                     <li>
							<a href="javascript:;">
								<img src="http://yun200.qfangimg.com/group1/485x363/M00/50/CA/CvtcKlap4LyAQhUuABPHxIOiGUc077.png">
							</a>
						</li>
                     -->
						
					</ul>
				</div>
				<div class="m-page-warp">
					<a href="javascript:;" class="up-page un"></a>
					<a href="javascript:;" class="active">1</a>
					<a href="javascript:;">2</a>
					<a href="javascript:;">3</a>
					<a href="javascript:;">4</a>
					<a href="javascript:;" class="down-page"></a>
					<span>共20页</span>
				</div>
			</div>

			<div class="anchor-trigger  anchor-item">
				<div class="anchor-title">地图街景</div>
				<p class="map-text">交通：${b.building_traffic }</p>
				<div class="map-warp">
					<iframe id="rentid_208" src="${basePath}/index/map" width="1200px" height="415px" scrolling="no" frameborder="0"></iframe>
				</div>
			</div>
			<div class="anchor-trigger  anchor-item">
				<div class="anchor-title">热门楼盘</div>
				<div class="housepic-list clearfix">
				<#--
				   <dl>
						<dt><a href=""  title="紫荆商业广场 2号楼 1单元" class="">
               				 <img class="b-lazy b-error b-loaded" src="${basePath}static/img/tao/demo-1.png"></a></dt>
						<dd>
							<a href="" >紫荆商业广场</a>
						</dd>
						<dd>
							<span class="fr"><strong class="red bold">1850</strong>元/月</span> 1室0厅,36㎡
						</dd>
					</dl>
				-->
					<#list rList as b>
					   <dl>
						<dt><a href="${basePath}front/building/detail?id=${b.building_id}"  title="紫荆商业广场 2号楼 1单元" class="">
               				 <img class="b-lazy b-error b-loaded" src="${basePath}static/img/tao/demo-1.png"></a></dt>
						<dd>
							<a href="" >${b.building_name}</a>
						</dd>
						<dd>
							<span class="fr"><strong class="red bold">${b.building_price}</strong>元/㎡</span> ${b.building_developers},${b.building_acreage}㎡
						</dd>
					</dl>
					</#list>
					
				</div>
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
					<p class="link-warp">
						<a href="">关于我们</a><i>|</i>
						<a href="">联系我们</a><i>|</i>
						<a href="">人才招聘</a><i>|</i>
						<a href="">用户协议</a>
					</p>
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
			$(function() {
				var $top = $('#anchorNav').offset().top;
				var $top2 = $('.anchor-item').eq(1).offset().top - 78;
				var $top3 = $('.anchor-item').eq(2).offset().top - 78;

				if($(window).scrollTop() >= $top) {
					$('#anchorNav').addClass('fixed');
				}
				$(window).scroll(function() {

					if($(window).scrollTop() >= $top) {
						$('#anchorNav').addClass('fixed');
					} else {
						$('#anchorNav').removeClass('fixed');
					}
					if($(window).scrollTop() > $top2 && $(window).scrollTop() < $top3) {
						$('#anchorNav li').removeClass('active');
						$('#anchorNav li').eq(1).addClass('active')
					} else if($(window).scrollTop() > $top3 && $(window).scrollTop() < $top3+200) {
						$('#anchorNav li').removeClass('active');
						$('#anchorNav li').eq(2).addClass('active')
					} else if($(window).scrollTop() > $top3+200) {
						$('#anchorNav li').removeClass('active');
						$('#anchorNav li').eq(3).addClass('active')
					} else if($(window).scrollTop() < $top2) {
						$('#anchorNav li').removeClass('active');
						$('#anchorNav li').eq(0).addClass('active')
					}
				})
				$('#anchorNav li').click(function() {
					var $index = $(this).index();
					$(this).siblings().removeClass('active');
					$(this).addClass('active')
					$('.anchor-item')[$index].scrollIntoView(true);
					$(window).scrollTop($(window).scrollTop() - 30);
				})

			})
		</script>
	</body>

</html>