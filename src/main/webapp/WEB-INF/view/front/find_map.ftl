<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8" />
		<title>地图找房</title>
		<link rel="stylesheet" type="text/css" href="${basePath}static/tao/common.css" />
		<link rel="stylesheet" type="text/css" href="${basePath}static/tao/reset.css" />
		<link rel="stylesheet" type="text/css" href="${basePath}static/tao/map-find.css" />
		<link rel="icon"href="img/title-icon2.png"type="image/x-icon"/>
		<script src="${basePath}static/js/common/jquery-3.1.0.min.js" type="text/javascript" charset="utf-8"></script>
		<link rel="icon"href="${basePath}static/img/tao/title-icon2.png" type="image/x-icon"/>
		<#include "/include/head.ftl">
		<style>
		.noneoffice {
			    float: left;
			    width: 100%;
			    text-align: center;
			    margin-top: 45%;
			}
			.noneoffice img{
			   height:216px;
			}
		</style>
	</head>

	<body>
		<div class="map-header clearfix">
			<div class="m-content-warp">
			<div class="map-logo fl">
                <a href="${basePath}index"  ><img src="${basePath}static/img/tao/logo1.png" /></a>
			</div>
			<div class="map-search fl">
				<div class="drop-menu-item js-drop-menu category fl" id="selectType">
					<p class="drop-menu-trigger">
						<span class="selected" id="propertyID">物业类型</span>
						<i class="icons-listings arrow-dft"></i>
					</p>
					<p class="drop-menu-list">
					  <a href="javascript:;" onclick="getPropertyID('','不限')">不限</a>
                      <#list property as p>
					  <#if p_index=0>
						<a href="javascript:;" onclick="getPropertyID(${p.id},'${p.type}')">${p.type}</a>
					  <#else>
					    <a href="javascript:;" onclick="getPropertyID(${p.id},'${p.type}')">${p.type}</a>
					  </#if>
					</#list>
					</p>
				</div>
				<div class="ipt-box fl">
					<input class="keywords" type="text" id="keyword"  onkeydown="keydown()" placeholder="请输入小区名或地址">
				</div>
				<p class="btn fl">
					<a href="javascript:;" id="search" onclick="findHouse()"></a>
				</p>
			</div>
			<div class="drop-menu-warp clearfix">
				<div class="drop-menu-item js-drop-menu category fl" id="selectType">
					<p class="drop-menu-trigger">
						<span class="selected" id="DistrictID" >区域</span>
						<i class="icons-listings arrow-dft"></i>
					</p>
					<p class="drop-menu-list">
					<#list district as d>
					  <#if d_index=0>
						<a href="javascript:;" onclick="getDistrictID(${d.district_id},'${d.district_name}')" class="cur">${d.district_name}</a>
					  <#else>
					    <a href="javascript:;" onclick="getDistrictID(${d.district_id},'${d.district_name}')" >${d.district_name}</a>
					  </#if>
					</#list>
					</p>
				</div>
			</div>
				<a href="${basePath}index/findHouses"    class="back-lie">返回列表</a>
			</div>
		
		</div>

		<div class="map-warp">
			<div id="allmap"></div>
			<div class="map-side">
				<div class="map-side-title">
					<a href="javascript:"; onclick="sort(this,'${basePath}','house_id')" class="cur">默认</a>
					<a href="javascript:;" onclick="sort(this,'${basePath}','house_money')">价格<i></i></a>
					<a href="javascript:;" onclick="sort(this,'${basePath}','house_time')">时间<i></i></a>
				</div>
				<div class="map-side-content" id="la">
				<#list list as h>
					<div class="map-side-item">
							<a class="img-warp" href="${basePath}front/house/detail?id=${h.house_id}">
								<img src="${basePath}${h.house_picture_addr}"/>
							</a>
							<div class="text-warp">
								<h2><a href="${basePath}front/house/detail?id=${h.house_id}">${h.house_name}</a></h2>
								<p class="pic">价格：${h.house_money}<span><#if h.house_unit!="">${h.house_unit}<#else>元/㎡.月</#if></span></p>
								<p>办公等级：<span>${h.building_level}</span> </p>
								<p>详细地址：<span>${h.house_address}</span></p>							
							</div>
					</div>
					
				</#list>
				</div>
			</div>
		</div>
<input type="hidden" value="${list}" id="result"/>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=SrPhCze2737ssZQjBy7XvI518aMak6ew"></script>
<script type="text/javascript" src="${basePath}static/js/findMap.js"></script>

<script type="text/javascript">
		$(function() {
			$('.map-side-content').height($(window).height()-167);
			$('.map-warp').height($(window).height()-129);
			$('#allmap').height($(window).height()-129);
			$('#allmap').width($(window).width()-459);
			//$('.map-side').height($(window).height()-129);
			$(window).resize(function(){
				$('.map-warp').height($(window).height()-129);
				$('#allmap').height($(window).height()-129);
				$('#allmap').width($(window).width()-459);
			})
			
			$('.map-side-title a').click(function(){
				if($(this).hasClass('cur')){
					if($(this).hasClass('cur-up')){
						$(this).removeClass('cur-up')
					}else{
						$(this).addClass('cur-up')
					}
				}else {
					$(this).siblings().removeClass('cur cur-up');
					$(this).addClass('cur');
				}
			})
		})
		//排序
		function sort(obj,base,con){
		    var c=$(obj).attr('class');
		    var districtid=$("#DistrictID").text();
		    var propertyid=$("#propertyID").attr("name");
		    var keyword=$("#keyword").val().trim();
		    var paixu;
		    if(c=='cur'){
		      paixu="ASC"
		    }else{
		    //升序排列
		      paixu="DESC";
		    }
			$.post(base+'front/building/sort',{'con':con,'paixu':paixu,'districtid':districtid,'propertyid':propertyid,'keyword':keyword},function(data){
			$('#la').empty();
			for(i=0;i<data.length;i++){
			     $('#la').append('<div class=\"map-side-item\"><a class=\"img-warp\" href=""><img src=\"${basePath}' +data[i].house_picture_addr +'\"/></a><div class=\"text-warp\"><h2><a href="">'+ data[i].house_name +'</a></h2><p class=\"pic\">'+ data[i].house_money +'<span>元/m²</span></p><p>办公等级：<span>'+ data[i].building_level +'</span> </p><p>详细地址：<span>'+ data[i].house_address +'</span></p></div></div>');
	   		}
	   	
			
 },"json")
}

//ajax请求区域数据
function ajaxDataDistrict(){
	var datas ="";
	$.ajax({ 
	    type: "post", 
	    url: "${basePath}" + "findMapHouse/findMapDistrict", 
	    dataType: "json",
	    success: function(result) {
	    	datas = datas + "[";
	    	for(var i = 0 ; i<result.data.length ; i++){
	    		if(i == (result.data.length-1)){
	    			datas = datas + '{"name":"'+result.data[i].district_name+'","r":"'+result.data[i].longitude+'","l":"'+result.data[i].latitude+'"}';
	    		} else {
	    			datas = datas + '{"name":"'+result.data[i].district_name+'","r":"'+result.data[i].longitude+'","l":"'+result.data[i].latitude+'"},';
	    		}
	    		
	    	}
	    	datas = datas + "]";
	    	var str1 = JSON.parse(datas);
	    	for (var i = 0; i < str1.length; i++) {
				mp.addOverlay(new ComplexCustomOverlay_1(new BMap.Point(str1[i].r,
						str1[i].l), str1[i].name));
			}
			
	    }
	    
	});   
}

var district_id ="";
var property_id ="";
var paixu ="";
var typeText = $("#keyword").val().trim();
function findHouse(){
	ajaxFindMap();
}

function keydown(){
    var keyword=$('#keyword').val().trim();
	if(event.keyCode==13){
       ajaxFindMap();
    }
}
function getPropertyID(id,name){
	$("#propertyID").text(name);
	$("#propertyID").attr("name",id);
	property_id = id;
	ajaxFindMap();
}
function getDistrictID(id,name){
	$("#DistrictID").text(name);
	$("#DistrictID").text();
	district_id =$("#DistrictID").text();
	mp.clearOverlays();
	ajaxDataHouse(district_id)

}
function ajaxFindMap(){
	var dataText = "";
	$.ajax({ 
        type: "post", 
        url: "${basePath}" + "findMapHouse/find", 
        data: {
        	"typeText":$("#keyword").val().trim(),
        	"district_id":district_id,
        	"property_id":property_id,
        	"paixu":paixu
        }, 
        dataType: "json", 
        success: function(result) {
        	$('#la').children().remove();
        	if(result.data.length<1){
        	  $('#la').append("<div class='noneoffice'><img src='${basePath}static/img/error1.png'/></div>" );
        	}else{
        	for(var i = 0 ; i<result.data.length ; i++){
        		dataText = "<div class='map-side-item'>" +
        					  "<a class='img-warp' href='${basePath}front/house/detail?id="+ result.data[i].house_id +"'>" +
        					  "<img src='${basePath}"+ result.data[i].house_picture_addr +"'/></a>" +
        					  "<div class='text-warp'>" +
        					  	"<h2><a href='${basePath}front/house/detail?id="+ result.data[i].house_id +"'>"+ result.data[i].house_name +"</a></h2>" +
        					  	"<p class='pic'>价格："+ result.data[i].house_money +"<span>元/m²</span></p>" +
        					  	"<p>办公等级：<span>"+ result.data[i].building_level +"</span> </p>" +
        					  	"<p>详细地址：<span>"+ result.data[i].house_address +"</span></p>" +
        					  "</div> </div> ";
        		$('#la').append(dataText);
        	}
        }
        	
        }
	});
	
}


  ajaxDataDistrict();
</script>
<#include "/include/stastics.ftl"/>
</body>
</html>