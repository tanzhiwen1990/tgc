<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <title>联系我们</title>
    <link rel="stylesheet" type="text/css" href="${basePath}static/tao/common.css" />
	<link rel="stylesheet" type="text/css" href="${basePath}static/tao/reset.css" />
	<link rel="stylesheet" type="text/css" href="${basePath}static/tao/about.css" />
	<link rel="icon"href="${basePath}static/img/tao/title-icon2.png" type="image/x-icon"/>
	<script src="${basePath}static/js/common/jquery-3.1.0.min.js" type="text/javascript" charset="utf-8"></script>
	<#include "/include/head.ftl">
</head>
<body>
    <div class="g-nav-warp">
        <div class="m-content-warp clearfix nav-top">
            <a href="${basePath}index" ><img  class="logo-img" src="${basePath}static/img/tao/logo1.png" /></a>
            <div class="nav">
                <a href="${basePath}index" >首页</a>
				<a href="${basePath}index/findHouses"   >找房源</a>
				<a href="${basePath}index/findBuildings"  >热门楼盘</a>
				<a href="${basePath}index/findRoom"  >委托找楼</a>
				<a href="${basePath}index/house_resource"  >业主放盘</a>
            </div>
        </div>
    </div>
    <div class="about-head">
        <img src="${basePath}static/img/abouttop.gif" alt=""/>
    </div>
    <div class="about-main">
        <span><a class="about-tab" id="about-ab">关于我们</a><a class="about-tab" id="about-call">联系我们</a></span>
        <p class="about-main-ab" id="about">
            重庆韬工场企业管理有限公司为上韬地产商办业务平台，专注于商务办公、产业楼宇及配套商业、社区商业租售代理、营销策划、市场研究、互联网平台开发运营的综合性服务机构。其核心团队专注于写字楼和商业物业细分市场已经有9年的时间，从前期项目研判，产品定位，投资分析，全案营销策划代理，租售执行，后期资产运营管理各个阶段积累了大量的实操案例和资源。
        </p>
        <div id="call-us">
            <span class="about-main-call">咨询热线：023-64288028<br>
              联系邮箱：taogc@homesunto.com<br>
              联系地址：重庆市渝北区洪湖东路9号财富大厦-B座16-8</span>
            <img src="${basePath}static/img/address-map.png" alt=""/>
        </div>
        <#include "/include/footer.ftl">
    </div>
   
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
                document.title="关于我们";
            }else{ //联系我们
                $("#about").hide();
                $("#call-us").show();
                $("#about-call").addClass("active-about-a");
                document.title="联系我们";
            }
            $("#about-ab").click(function(){
                $("#about").show();
                $("#call-us").hide();
                $("#about-ab").addClass("active-about-a");
                $("#about-call").removeClass("active-about-a");
                document.title="关于我们";
            });
            $("#about-call").click(function(){
                $("#about").hide();
                $("#call-us").show();
                $("#about-call").addClass("active-about-a");
                $("#about-ab").removeClass("active-about-a");
                document.title="联系我们";
            });
        });

    </script>
    <#include "/include/stastics.ftl"/>
</body>
</html>