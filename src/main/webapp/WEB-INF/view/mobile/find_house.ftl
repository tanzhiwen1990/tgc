<!DOCTYPE html>
<html>

	<head>
		<title>找房源</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
		<link rel="stylesheet" type="text/css" href="${basePath}static/mobile/css/reset.css">
		<link rel="stylesheet" type="text/css" href="${basePath}static/mobile/css/find-house.css" />
		<link rel="stylesheet" type="text/css" href="${basePath}static/mobile/css/common.css"/>
		<link rel="stylesheet" type="text/css" href="${basePath}static/mobile/css/swiper-3.3.1.min.css">
		<script type="text/javascript" src="${basePath}static/mobile/js/jquery-3.1.0.min.js"></script>
		<script type="text/javascript" src="${basePath}static/mobile/js/resposive.js"></script>
		<script type="text/javascript" src="${basePath}static/mobile/js/swiper.jquery.js"></script>
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
				<span>找房源</span>
				<a href="javascript:;" class="nav-btn"></a>
			</div>
			<#include '/mobile/header.ftl'/>
		</div>
		<div class="seach-warp">
			<div class="input-warp">
				<input id="search" class="search" value="${params.keyword}"placeholder="请输入楼盘名字或者商圈名字.." onchange="application.search('${basePath}')" />
				<a href="javascript:;" class="u-seach-btn" onclick="application.search('${basePath}')"></a>
			</div>
		</div>
		<div class="label-content">
			<div class="label-warp">
				<a href="javascript:;" class="label-item"><span>区域</span><i></i></a>
				<a href="javascript:;" class="label-item"><span>租金</span><i></i></a>
				<a href="javascript:;" class="label-item"><span>面积</span><i></i></a>
				<a href="javascript:;" class="label-item"><span>类型</span><i></i></a>
			</div>
			<div class="chose-warp">
				<div class="chose-item" id="wrapper">
					<div class="lefe-wrapper" id="district">
					     <a href="javascript:;"  class="area-btn" class="active">不限</a>
						 <#list district as d>
							  <a href="javascript:;" class="area-btn" <#if params.districtId==d.district_id> class="active"</#if> name="${d.district_id}">${d.district_name}</a>
						   </#list>
						</div>
						<div class="right-wrapper">
						    <div class="right-item on" id="trade">
								<a href="javascript:;" <#if params.domainId==t.trade_area_id>class="active"</#if> >不限</a>
	                       </div>
						<#list domain as a>
						     <div class="right-item" id="trade">
						      <a href="javascript:;"  <#if params.domainId==t.trade_area_id>class="active"</#if> name="${t.trade_area_id}">不限</a>
						       <#list a as t>
								<a href="javascript:;"  <#if params.domainId==t.trade_area_id>class="active"</#if> name="${t.trade_area_id}">${t.trade_area_name}</a>
								</#list>
	                       </div>
						</#list>
						</div>
				</div>
				<div class="chose-item" id="pDiv">
				<#assign flag=false>
				    <a href="${basePath}mobile/searchByParams?keyword=${params.keyword}&type=${params.type}&districtId=${params.districtId}&domainId=${params.domainId}&houseType=${params.houseType}&price=0&mi=${params.mi}"   class="active" >不限</a>
					<a href="${basePath}mobile/searchByParams?keyword=${params.keyword}&type=${params.type}&districtId=${params.districtId}&domainId=${params.domainId}&houseType=${params.houseType}&price=0~35&mi=${params.mi}" <#if params.price=='0~35'>class="active" <#assign flag=true></#if>  class="chose-btn" name="0~35">35元/m²·月以下</a>
					<a href="${basePath}mobile/searchByParams?keyword=${params.keyword}&type=${params.type}&districtId=${params.districtId}&domainId=${params.domainId}&houseType=${params.houseType}&price=35~55&mi=${params.mi}" <#if params.price=='35~55'>class="active" <#assign flag=true></#if> class="chose-btn" name="35~55">35~55元/m²·月</a>
					<a href="${basePath}mobile/searchByParams?keyword=${params.keyword}&type=${params.type}&districtId=${params.districtId}&domainId=${params.domainId}&houseType=${params.houseType}&price=55~70&mi=${params.mi}" <#if params.price=='55~70'>class="active" <#assign flag=true></#if> class="chose-btn" name="55~70">55~70元/m²·月</a>
					<a href="${basePath}mobile/searchByParams?keyword=${params.keyword}&type=${params.type}&districtId=${params.districtId}&domainId=${params.domainId}&houseType=${params.houseType}&price=70~85&mi=${params.mi}" <#if params.price=='70~85'>class="active" <#assign flag=true></#if>  class="chose-btn" name="70~85">70~85元/m²·月</a>
					<a href="${basePath}mobile/searchByParams?keyword=${params.keyword}&type=${params.type}&districtId=${params.districtId}&domainId=${params.domainId}&houseType=${params.houseType}&price=85~100&mi=${params.mi}" <#if params.price=='85~100'>class="active" <#assign flag=true></#if>  class="chose-btn" name="85~100">85~100元/m²·月</a>
					<a href="${basePath}mobile/searchByParams?keyword=${params.keyword}&type=${params.type}&districtId=${params.districtId}&domainId=${params.domainId}&houseType=${params.houseType}&price=100&mi=${params.mi}" <#if params.price=='100'>class="active" <#assign flag=true></#if>  class="chose-btn" name="100">100元/m²·月以上</a>
				</div>
				<div class="chose-item" id="mDiv">
				<#assign flag=false>
				    <a href="${basePath}mobile/searchByParams?keyword=${params.keyword}&type=${params.type}&districtId=${params.districtId}&domainId=${params.domainId}&houseType=${params.houseType}&mi=0&price=${params.price}" class="active" >不限</a>
					<a href="${basePath}mobile/searchByParams?keyword=${params.keyword}&type=${params.type}&districtId=${params.districtId}&domainId=${params.domainId}&houseType=${params.houseType}&mi=0-50&price=${params.price}" <#if params.mi=='0-50'>class="active"<#assign flag=true></#if> class="chose-btn" name="0-50">50m²以下</a>
					<a href="${basePath}mobile/searchByParams?keyword=${params.keyword}&type=${params.type}&districtId=${params.districtId}&domainId=${params.domainId}&houseType=${params.houseType}&mi=50-70&price=${params.price}" <#if params.mi=='50-70'>class="active"<#assign flag=true></#if> class="chose-btn" name="50-70">50-70m²</a>
					<a href="${basePath}mobile/searchByParams?keyword=${params.keyword}&type=${params.type}&districtId=${params.districtId}&domainId=${params.domainId}&houseType=${params.houseType}&mi=70-90&price=${params.price}" <#if params.mi=='70-90'>class="active"<#assign flag=true></#if> class="chose-btn" name="70-90" >70-90m²</a>
					<a href="${basePath}mobile/searchByParams?keyword=${params.keyword}&type=${params.type}&districtId=${params.districtId}&domainId=${params.domainId}&houseType=${params.houseType}&mi=90-110&price=${params.price}" <#if params.mi=='90-110'>class="active"<#assign flag=true></#if> class="chose-btn" name="90-110">90-110m²</a>
					<a href="${basePath}mobile/searchByParams?keyword=${params.keyword}&type=${params.type}&districtId=${params.districtId}&domainId=${params.domainId}&houseType=${params.houseType}&mi=110-130&price=${params.price}" <#if params.mi=='110-130'>class="active"<#assign flag=true></#if> class="chose-btn" name="110-130">110-130m²</a>
					<a href="${basePath}mobile/searchByParams?keyword=${params.keyword}&type=${params.type}&districtId=${params.districtId}&domainId=${params.domainId}&houseType=${params.houseType}&mi=130-150&price=${params.price}" <#if params.mi=='130-150'>class="active"<#assign flag=true></#if> class="chose-btn" name="130-150">130-150m²</a>
					<a href="${basePath}mobile/searchByParams?keyword=${params.keyword}&type=${params.type}&districtId=${params.districtId}&domainId=${params.domainId}&houseType=${params.houseType}&mi=150&price=${params.price}" <#if params.mi=='150'>class="active"<#assign flag=true></#if> class="chose-btn" name="150">150m²以上</a>
				</div>
				<div class="chose-item" id="property">
				   <a href="${basePath}mobile/searchByParams?keyword=${params.keyword}&type=${params.type}&districtId=${params.districtId}&domainId=${params.domainId}&houseType=${p.id}&price=${params.price}&mi=${params.mi}" class="active" >不限</a>
				 <#list property as p>
					<a href="${basePath}mobile/searchByParams?keyword=${params.keyword}&type=${params.type}&districtId=${params.districtId}&domainId=${params.domainId}&houseType=${p.id}&price=${params.price}&mi=${params.mi}"  <#if params.houseType==p.id>class="active"</#if>  name="${p.id}">${p.type}</a>
				 </#list>
				</div>
			</div>
		</div>
		<div class="m-content-warp">
		<#if hList?size gte 1>
		<#list hList as h>
		  <div class="house-warp">
				<a class="house-item" href="${basePath}house/detail_h${h.house_id}.html">
					<div class="img-warp">
						<img src="${basePath}${h.house_picture_addr}" />
					</div>
					<div class="text-warp">
						<h2>${h.house_name}</h2>
						<p>${h.building_level}</p>
						<p>${h.house_mi}m²建面</p>
						<p><span>${h.house_money}</span><#if h.house_unit!="">${h.house_unit}<#else>元/m².月</#if> </p>
					</div>
				</a>
			</div>
		 </#list> 
		<#else>
		  <#--如果没有房源的情况下默认推荐房源-->
           <#--todo 无房源提示    没有合适的房源，为您推荐以下房源-->
                                      
		  <#list hot as h>
		  <div class="house-warp">
				<a class="house-item" href="${basePath}house/detail_h${h.house_id}.html">
					<div class="img-warp">
						<img src="${basePath}${h.house_picture_addr}" />
					</div>
					<div class="text-warp">
						<h2>${h.house_name}</h2>
						<p>${h.building_level}</p>
						<p>${h.house_mi}m²建面</p>
						<p><span>${h.house_money}</span> <#if h.house_unit!="">${h.house_unit}<#else>元/m².月</#if></p>
					</div>
				</a>
			</div>
		 </#list> 
		</#if>
		</div>
	<#include '/mobile/stastics.ftl'/>	
	<#include '/mobile/footer.ftl'/>
      <input type="hidden" value="${params.mi}" id="mi">
      <input type="hidden" value="${params.keyword}" id="keyword">
      <input type="hidden" value="${params.type}" id="type">
      <input type="hidden" value="${params.houseType}" id="houseType">
      <input type="hidden" value="${params.price}" id="price">
      <input type="hidden" value="${params.districtId}" id="districtId">
      <input type="hidden" value="${params.domainId}" id="domainId">
	</body>
		<script type="text/javascript">
		 var districtId=$("#districtId").val();
		 var domainId=$("#domainId").val();
		 var houseType=$("#houseType").val();
		 var mi=$("#mi").val();
		 var price=$("#price").val();
		 var type=$("#type").val();
		 var keyword=$("#keyword").val();
		$(function() {
			$('.label-item').click(function() {
				var index = $(this).index();
				if($(this).hasClass('on')) {
					$(this).removeClass('on');
					$('.chose-item').removeClass('on');
				} else {
					$(this).siblings().removeClass('on');
					$(this).addClass('on');
					$('.chose-item').removeClass('on').eq(index).addClass('on');
					domainId=$(this).attr("name");
				}

			})
			$('.chose-btn').click(function() {
				var $index = $(this).parents('.chose-item').index();
				var $text = $(this).text();
				$(this).siblings().removeClass('active');
				$(this).addClass('active');
				$(this).parents('.chose-item').removeClass('on')
				$('.label-item').removeClass('on');
				$('.label-item').eq($index).find("span").text($text);
				houseType=$(this).attr("name");
			})
			var dindex=-1;
			$('.area-btn').click(function() {
				var index = $(this).index();
				dindex=index;
				if(!$(this).hasClass('on')) {
					$(this).siblings().removeClass('on');
					$(this).siblings().removeClass('active');
					$(this).addClass('on');
					$('.right-item').removeClass('on');
					$('.right-item').eq(dindex).addClass('on').eq(index).addClass('active');
					districtId=$(this).attr("name");
					$("#districtId").val(districtId);
				}
			})
			
			$('.right-item a').click(function() {
				var index = $(this).index();
				if(!$(this).hasClass('on')) {
					$(this).siblings().removeClass('on');
					$(this).siblings().removeClass('active');
					$(this).addClass('active');
					$('.right-item').removeClass('on').eq(dindex).addClass('on');
					domainId=$(this).attr("name");
					districtId=$("#districtId").val();
					search();
				}
			})
		})
		
		function search(){
		   window.location.href="${basePath}mobile/searchByParams?keyword="+ keyword +"&type="+ type +"&districtId="+ districtId +"&domainId="+ domainId +"&houseType="+ houseType +"&price="+ price +"&mi="+ mi ;
		}
		
		$(document).ready(function(){
		    var name=$("#districtId").val();
		    var cur='';
		    var text='';
		    if(name==''){
		      cur=-1;
		    }else{
			    var obj=$("#district").find("a[name="+name+"]");
			    $(obj).siblings().removeClass("active");
			    $(obj).addClass("active");
				cur=$(obj).index();
				text=$(obj).text();
			}
			if(cur==-1){
			   $("#district a").eq(0).addClass("active");
			   $("#trade a").eq(0).show();
			}else{
		      var obj2=$(".right-wrapper div").eq(cur).find("a.active");
		      $(obj2).parent().siblings().hide();
		      $(obj2).parent().show();
		      if(obj2.index()==-1){
		        $('.label-item').eq(0).find("span").text($(obj).text());
		      }else{
		        if($(obj2).text()=='不限'){
			      $('.label-item').eq(0).find("span").text($(obj).text());
			  }else{
			     $('.label-item').eq(0).find("span").text($(obj).text());
			  }
			  }
			}
			
			//价格处理
			
			name=$("#price").val();
		    var cur='';
		    if(name==''){
		      cur=-1;
		    }else{
			   var pobj=$("#pDiv").find("a[name=\'"+name+"\']");
			    $(pobj).siblings().removeClass("active");
			    $(pobj).addClass("active");
				cur=$(pobj).index();
			}
			if(cur!=-1){
			    $(pobj).siblings().removeClass('active');
			    $(pobj).addClass('active');
			    $('.label-item').eq(1).find("span").text($(pobj).text())
			}
			
			//面积处理
			name=$("#mi").val();
		    var cur='';
		    if(name==''){
		      cur=-1;
		    }else{
			   var mobj=$("#mDiv").find("a[name=\'"+name+"\']");
			    $(mobj).siblings().removeClass("active");
			    $(mobj).addClass("active");
				cur=$(mobj).index();
			}
			if(cur!=-1){
			    $(mobj).siblings().removeClass('active');
			    $(mobj).addClass('active');
			    $('.label-item').eq(2).find("span").text($(mobj).text())
			}
			//物业类型初始化
			name=$("#houseType").val();
		    var cur='';
		    if(name==''){
		      cur=-1;
		    }else{
			   var mobj=$("#property").find("a[name="+name+"]");
			    $(mobj).siblings().removeClass("active");
			    $(mobj).addClass("active");
				cur=$(mobj).index();
			}
			if(cur!=-1){
			    $(mobj).siblings().removeClass('active');
			    $(mobj).addClass('active');
			    $('.label-item').eq(3).find("span").text($(mobj).text())
			}
		})
	</script>


</html>