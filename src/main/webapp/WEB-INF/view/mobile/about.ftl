<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <title>众享空间</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <link rel="stylesheet" type="text/css" href="${basePath}static/mobile/css/reset.css">
	<link rel="stylesheet" type="text/css" href="${basePath}static/mobile/css/common.css"/>
	<link rel="stylesheet" type="text/css" href="${basePath}static/mobile/css/about.css" />
    
</head>
<body>
    <div class="g-heard">
        <div class="heard-title">
				<a href="${basePath}mobile">
				<img src="${basePath}static/mobile/img/logo.png"/>
				
				</a>
				 <span id="about-type-title"></span>
				<a href="javascript:;" class="nav-btn"></a>
			</div>
			<#include '/mobile/header.ftl'/>
    </div>
    <div class="about-head">
        <img src="${basePath}static/mobile/img/abouttop.gif" alt=""/>
    </div>
    <div class="about-main">
        <span><a class="" id="about-ab">关于我们</a><a class="" id="about-call">联系我们</a></span>
        <p class="about-main-ab" id="about">
            重庆韬工场企业管理有限公司为上韬地产商办业务平台，专注于商务办公、产业楼宇及配套商业、社区商业租售代理、营销策划、市场研究、互联网平台开发运营的综合性服务机构。其核心团队专注于写字楼和商业物业细分市场已经有9年的时间，从前期项目研判，产品定位，投资分析，全案营销策划代理，租售执行，后期资产运营管理各个阶段积累了大量的实操案例和资源。
        </p>
        <div id="call-us">
            <span class="about-main-call">咨询热线：023-64288028<br>
              联系邮箱：taogc@homesunto.com<br>
              联系地址：重庆市渝北区洪湖东路9号财富大厦-B座16-8</span>
            <img src="${basePath}static/img/address-map.png" alt=""/>
        </div>
    </div>
   <div class="page-bottom" style="position: absolute;bottom: 0;">
        <span class="bottom-bottom">Copyright 2016 www.zhongxiangspace.com. All Rights Reserved 渝ICP备16013565号-1</span>
    </div>
   <script type="text/javascript" src="${basePath}static/mobile/js/jquery-3.1.0.min.js"></script>
	<script type="text/javascript" src="${basePath}static/mobile/js/resposive.js"></script>
    <script type="text/javascript">
        $(function(){
            var para =window.location.search;
            var arr = new Array();
            arr = para.split("=");
            var location = arr[1];
            if(location == 1){ //关于我们
                $("#about").show();
                $("#call-us").hide();
                $("#about-ab").addClass("active-about-a");
                document.getElementById("about-type-title").innerText="关于我们";
            }else{ //联系我们
                $("#about").hide();
                $("#call-us").show();
                $("#about-call").addClass("active-about-a");
                document.getElementById("about-type-title").innerText="联系我们";
            }
            $("#about-ab").click(function(){
                $("#about").show();
                $("#call-us").hide();
                $("#about-ab").addClass("active-about-a");
                $("#about-call").removeClass("active-about-a");
                document.getElementById("about-type-title").innerText="关于我们";
            });
            $("#about-call").click(function(){
                $("#about").hide();
                $("#call-us").show();
                $("#about-call").addClass("active-about-a");
                $("#about-ab").removeClass("active-about-a");
                document.getElementById("about-type-title").innerText="联系我们";
            });
        });

    </script>
    <#include '/mobile/stastics.ftl'/>
</body>
</html>