<!DOCTYPE html>
<html>

	<head>
		<title>热门楼盘</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
		<link rel="stylesheet" type="text/css" href="${basePath}static/mobile/css/reset.css">
		<link rel="stylesheet" type="text/css" href="${basePath}static/mobile/css/hot-house.css" />
		<link rel="stylesheet" type="text/css" href="${basePath}static/mobile/css/common.css"/>
		<script type="text/javascript" src="${basePath}static/mobile/js/jquery-3.1.0.min.js"></script>
		<script type="text/javascript" src="${basePath}static/mobile/js/resposive.js"></script>
		<script type="text/javascript" src="${basePath}static/js/common/common.js"></script>
		<link rel="icon"href="${basePath}static/img/tao/title-icon2.png" type="image/x-icon"/>
		<#include "/include/head.ftl">
	</head>

	<body>
		<div class="g-heard">
			<div class="heard-title">
				<a href="${basePath}mobile">
				<img src="${basePath}static/mobile/img/logo.png"/>
				</a>
				<span>热门楼盘</span>
				<a href="javascript:;" class="nav-btn"></a>
			</div>
			<#include '/mobile/header.ftl'/>
		</div>
		
		<div class="seach-warp">
			<div class="input-warp">
				<input  class="search" id="keyword" value="${params.keyword}"placeholder="请输入楼盘名字.." onchange="search()" />
				<a href="javascript:;"  id="search-btn" class="u-seach-btn" ></a>
			</div>
		</div>
		<div class="house-warp">
		 <#list page as b>
			<a class="house-item" href="${basePath}mBuilding/detail_b${b.building_id}.html">
				<div class="img-warp">
					<img src="${basePath}${b.building_picture_addr}" />
				</div>
				<div class="text-warp">
					<h2>${b.building_name}</h2>
					<p>${b.building_level}</p>
					<p>${b.building_acreage}<#if b.building_acreage??>m²建面</#if></p>
					<p>${b.building_rent}<#if b.building_rent_unit!="">${b.building_rent_unit}<#else>元/m².月</#if></p>
				</div>
			</a>
		</#list>
		</div>
		<#include '/mobile/footer.ftl'/>
		<#include '/mobile/stastics.ftl'/>
	</body>
	<script type="text/javascript">
       $(function(){
          $("#search-btn").click(function(){
             search();
        });
       })
       
       function search(){
         window.location.href='${basePath}mobile/findBuildings?keyword='+$("#keyword").val();
       }
       
	</script>

</html>