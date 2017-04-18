<!DOCTYPE html>
<html>
<head>
		    <meta charset="utf-8" />
		    <meta name="keywords" content="${seo.keyword}">
			<meta name="title" content="${seo.title}">
			<meta name="description" content="${seo.description}">
		    <title>${seo.title?default('找房源')}</title>
		    <link rel="stylesheet" type="text/css" href="${basePath}static/tao/common.css"/>
		    <link rel="stylesheet" type="text/css" href="${basePath}static/tao/reset.css"/>
		    <link rel="stylesheet" type="text/css" href="${basePath}static/tao/looking-houses.css"/>
		    <link rel="icon"href="${basePath}static/img/taotitle-icon2.png"type="image/x-icon"/>
		    <script src="${basePath}static/js/common/jquery-3.1.0.min.js" type="text/javascript" charset="utf-8"></script>
		    <script type="text/javascript" src="${ctx}static/js/Validform_v5.3.2_min.js"></script>
		    <script type="text/javascript" src="${basePath}static/jquery.page.js"></script>
		    <script type="text/javascript" src="${basePath}/lib/layer/2.1/layer.js"></script>
		    <script type="text/javascript" src="${basePath}static/js/common/common.js"></script>
		    <link rel="icon"href="${basePath}static/img/tao/title-icon2.png" type="image/x-icon"/>
		    <#include "/include/head.ftl">
	</head>
	<body>
		
    <div class="g-nav-warp">
    <div class="m-content-warp clearfix nav-top">
      <a href="${basePath}index" ><img class="logo-img" src="${basePath}static/img/tao/logo1.png" /></a>
        
        <div class="nav">
            <a href="${basePath}index" >首页</a>
            <a href="${basePath}index/findHouses"  class="active">找房源</a>
            <a href="${basePath}index/findBuildings" >热门楼盘</a>
            <a href="${basePath}index/findRoom" >委托找楼</a>
            <a href="${basePath}index/house_resource" >业主放盘</a>
        </div>
    </div>
</div>
		<div class="clearfix l-main-warp">
            <div class="m-location" style="margin-top: 60px;">
                <!--<span>当前位置：</span>
                <a href="">找房源</a>&gt;<a href="" class="active">房源详情</a>-->
            </div>
			<div class="search-condition">
				<div class="seach-input clearfix">
					 <input type="text" id="keyword" value="${params.keyword}" onkeydown="application.keydown('${basePath}',event)" placeholder="请输入楼盘名字或者商圈名字..."/>
             <a href="javascript:;" onclick="application.submit('${basePath}')">搜索</a>
				</div>
				<div class="seach-title clearfix">
					<a href="${basePath}index/findMap" class="active" target="_blank">地图模式</a>
				</div>
				<div class="seach-lable-warp">
					<div class="seach-lable-item">
						<span>区域：</span>
						<div class="search-box">
							 <a href="${basePath}index/findHouses?keyword=${params.keyword}&type=${params.type}&houseType=${params.houseType}&price=${params.price}&mi=${params.mi}&style=${params.style}" <#if !params.districtId>class="active"</#if>>不限</a>
							<#list district as d>
			                    <a  href="${basePath}index/findHouses?keyword=${params.keyword}&type=${params.type}&districtId=${d.district_id}&houseType=${params.houseType}&price=${params.price}&mi=${params.mi}&style=${params.style}" <#if params.districtId==d.district_id>class="re"</#if>  name="${d.district_id}">${d.district_name}</a>
							</#list>
		                </div>
                     </div>
               
				
				   <div class="area-content-warp">
				     <#if params.districtId ??>
				    <div class="area-content clearfix" style="padding: 6px 0px;">
				   
	                    <a href="${basePath}index/findHouses?keyword=${params.keyword}&type=${params.type}&districtId=${params.districtId}&houseType=${params.houseType}&price=${params.price}&mi=${params.mi}&style=${params.style}" <#if !params.domainId>class="active"</#if>>不限</a>
	                
						<#list domain as r>
	                        <a href="${basePath}index/findHouses?keyword=${params.keyword}&type=${params.type}&districtId=${params.districtId}&domainId=${r.trade_area_id}&houseType=${params.houseType}&price=${params.price}&mi=${params.mi}&style=${params.style}"  name="${r.trade_area_id}" <#if r.trade_area_id == params.domainId>class="active"</#if>> ${r.trade_area_name}</a>
						</#list>
                   </div>
			     </#if>
					</div>
					<#--面积start-->
					<div class="seach-lable-item">
						<span>面积：</span>
						<div class="lable-box">
							<#assign flag=false>
		                    <a href="${basePath}index/findHouses?keyword=${params.keyword}&type=${params.type}&districtId=${params.districtId}&domainId=${params.domainId}&houseType=${params.houseType}&price=${params.price}&style=${params.style}" <#if !params.mi>class="active" <#assign flag=true></#if>>不限</a>
		                    <a href="${basePath}index/findHouses?keyword=${params.keyword}&type=${params.type}&districtId=${params.districtId}&domainId=${params.domainId}&houseType=${params.houseType}&price=${params.price}&style=${params.style}&mi=30-40" <#if params.mi=='30-40'>class="active" <#assign flag=true></#if>>30-40㎡</a>
		                    <a href="${basePath}index/findHouses?keyword=${params.keyword}&type=${params.type}&districtId=${params.districtId}&domainId=${params.domainId}&houseType=${params.houseType}&price=${params.price}&style=${params.style}&mi=40-50" <#if params.mi=='40-50'>class="active" <#assign flag=true></#if>>40-50㎡</a>
		                    <a href="${basePath}index/findHouses?keyword=${params.keyword}&type=${params.type}&districtId=${params.districtId}&domainId=${params.domainId}&houseType=${params.houseType}&price=${params.price}&style=${params.style}&mi=50-60" <#if params.mi=='50-60'>class="active" <#assign flag=true></#if>>50-60㎡</a>
		                    <a href="${basePath}index/findHouses?keyword=${params.keyword}&type=${params.type}&districtId=${params.districtId}&domainId=${params.domainId}&houseType=${params.houseType}&price=${params.price}&style=${params.style}&mi=60-70" <#if params.mi=='60-70'>class="active" <#assign flag=true></#if>>60-70㎡</a>
		                    <a href="${basePath}index/findHouses?keyword=${params.keyword}&type=${params.type}&districtId=${params.districtId}&domainId=${params.domainId}&houseType=${params.houseType}&price=${params.price}&style=${params.style}&mi=70-80" <#if params.mi=='70-80'>class="active" <#assign flag=true></#if>>70-80㎡</a>
		                    <a href="${basePath}index/findHouses?keyword=${params.keyword}&type=${params.type}&districtId=${params.districtId}&domainId=${params.domainId}&houseType=${params.houseType}&price=${params.price}&style=${params.style}&mi=80-100" <#if params.mi=='80-100'>class="active" <#assign flag=true></#if>>80-100㎡</a>
		                    <div class="price-range">
		                        <input type="text" id="fromMi" <#if !flag>value="${params.minMi}"</#if>>
		                        <span>-</span>
		                        <input type="text" id="toMi" <#if !flag>value="${params.maxMi}"</#if>>
		                        <span>㎡</span>
		                        <a href="javascript:;" id="defineMi" >确定 </a>
		                    </div>
						</div>
					</div>
					<#--面积end-->
                    <#--物业start-->
					<div class="seach-lable-item">
						<span>类型：</span>
						<div class="lable-box">
							<div class="lable-box" id="type">
			                    <a href="${basePath}index/findHouses?keyword=${params.keyword}&type=${params.type}&districtId=${params.districtId}&domainId=${params.domainId}&price=${params.price}&mi=${params.mi}&style=${params.style}" <#if !params.houseType>class="active"</#if>>不限</a>
							<#list property as p>
			                    <a href="${basePath}index/findHouses?keyword=${params.keyword}&type=${params.type}&districtId=${params.districtId}&domainId=${params.domainId}&houseType=${p.id}&price=${params.price}&mi=${params.mi}&style=${params.style}" <#if params.houseType==p.id>class="active"</#if> name="${p.id}">${p.type}</a>
							</#list>
							</div>
						</div>
				  </div>
				 <#--物业end-->
                 <#--租售start-->
				<div class="seach-lable-item">
                        <span>租售：</span>
                        <div class="lable-box">
                             <a href="${basePath}index/findHouses?keyword=${params.keyword}&type=${params.type}&districtId=${params.districtId}&domainId=${params.domainId}&houseType=${params.houseType}&mi=${params.mi}" <#if !params.style>class="active"</#if>>不限</a>
                             <a href="${basePath}index/findHouses?keyword=${params.keyword}&type=${params.type}&districtId=${params.districtId}&domainId=${params.domainId}&houseType=${params.houseType}&mi=${params.mi}&style=出租" <#if params.style=='出租'>class="active"</#if>>出租</a>
                             <a href="${basePath}index/findHouses?keyword=${params.keyword}&type=${params.type}&districtId=${params.districtId}&domainId=${params.domainId}&houseType=${params.houseType}&mi=${params.mi}&style=出售" <#if params.style=='出售'>class="active"</#if>>出售</a>
                        </div>
                    </div>
                    <#if params.style='出租'>
                    <div class="seach-lable-item clearfix change-price">
                        <span></span>
                        <div class="lable-box">
                           <#assign flag=false>
			                    <a href="${basePath}index/findHouses?keyword=${params.keyword}&type=${params.type}&districtId=${params.districtId}&domainId=${params.domainId}&houseType=${params.houseType}&mi=${params.mi}&style=${params.style}" <#if !params.price>class="active"</#if>>不限</a>
			                    <a href="${basePath}index/findHouses?keyword=${params.keyword}&type=${params.type}&districtId=${params.districtId}&domainId=${params.domainId}&houseType=${params.houseType}&price=0~35&mi=${params.mi}&style=${params.style}"  name="0~35" <#if params.price=='0~35'>class="active"<#assign flag=true></#if>>35元以下</a>
			                    <a href="${basePath}index/findHouses?keyword=${params.keyword}&type=${params.type}&districtId=${params.districtId}&domainId=${params.domainId}&houseType=${params.houseType}&price=35~55&mi=${params.mi}&style=${params.style}" name="35~55" <#if params.price=='35~55'>class="active"<#assign flag=true></#if>>35~55元</a>
			                    <a href="${basePath}index/findHouses?keyword=${params.keyword}&type=${params.type}&districtId=${params.districtId}&domainId=${params.domainId}&houseType=${params.houseType}&price=55~70&mi=${params.mi}&style=${params.style}" name="55~70" <#if params.price=='55~70'>class="active"<#assign flag=true></#if>>55~70元</a>
			                    <a href="${basePath}index/findHouses?keyword=${params.keyword}&type=${params.type}&districtId=${params.districtId}&domainId=${params.domainId}&houseType=${params.houseType}&price=70~85&mi=${params.mi}&style=${params.style}" name="70~85" <#if params.price=='70~85'>class="active"<#assign flag=true></#if>>70~85元</a>
			                    <a href="${basePath}index/findHouses?keyword=${params.keyword}&type=${params.type}&districtId=${params.districtId}&domainId=${params.domainId}&houseType=${params.houseType}&price=85~100&mi=${params.mi}&style=${params.style}" name="85~100" <#if params.price=='85~100'>class="active"<#assign flag=true></#if>>85~100元</a>
			                    <a href="${basePath}index/findHouses?keyword=${params.keyword}&type=${params.type}&districtId=${params.districtId}&domainId=${params.domainId}&houseType=${params.houseType}&price=100&mi=${params.mi}&style=${params.style}" name="100" <#if params.price=='100'>class="active"<#assign flag=true></#if>>100元/㎡·月以上</a>
								<div class="price-range">
									 <input type="text" id="fromPrice" <#if !flag>value="${params.minPrice}"</#if>>
				                        <span>-</span>
				                        <input type="text" id="toPrice" <#if !flag>value="${params.maxPrice}"</#if>>
				                        <span>元</span>
				                        <a href="javascript:;" id="definePrice" >确定</a>
								</div>
                        </div>
                    </div>
                    </#if>
					<#if params.style=='出售'>
					 <div class="seach-lable-item clearfix change-price">
                        <span></span>
                        <div class="lable-box">
                            <a href="${basePath}index/findHouses?keyword=${params.keyword}&type=${params.type}&districtId=${params.districtId}&domainId=${params.domainId}&houseType=${params.houseType}&mi=${params.mi}&style=${params.style}"  <#if !params.price>class="active"<#assign flag=true></#if>>不限</a>
                            <a href="${basePath}index/findHouses?keyword=${params.keyword}&type=${params.type}&districtId=${params.districtId}&domainId=${params.domainId}&houseType=${params.houseType}&price=0~10000&mi=${params.mi}&style=${params.style}"  <#if params.price=='0~10000'>class="active"<#assign flag=true></#if>>1万以下</a>
                            <a href="${basePath}index/findHouses?keyword=${params.keyword}&type=${params.type}&districtId=${params.districtId}&domainId=${params.domainId}&houseType=${params.houseType}&price=10000~15000&mi=${params.mi}&style=${params.style}"  <#if params.price=='10000~15000'>class="active"<#assign flag=true></#if>>1万~1.5万</a>
                            <a href="${basePath}index/findHouses?keyword=${params.keyword}&type=${params.type}&districtId=${params.districtId}&domainId=${params.domainId}&houseType=${params.houseType}&price=15000~20000&mi=${params.mi}&style=${params.style}"  <#if params.price=='15000~20000'>class="active"<#assign flag=true></#if>>1.5万~2万</a>
                            <a href="${basePath}index/findHouses?keyword=${params.keyword}&type=${params.type}&districtId=${params.districtId}&domainId=${params.domainId}&houseType=${params.houseType}&price=20000~25000&mi=${params.mi}&style=${params.style}"  <#if params.price=='20000~25000'>class="active"<#assign flag=true></#if>>2万~2.5万</a>
                            <a href="${basePath}index/findHouses?keyword=${params.keyword}&type=${params.type}&districtId=${params.districtId}&domainId=${params.domainId}&houseType=${params.houseType}&price=25000~30000&mi=${params.mi}&style=${params.style}"  <#if params.price=='25000~30000'>class="active"<#assign flag=true></#if>>2.5万~3万</a>
                            <a href="${basePath}index/findHouses?keyword=${params.keyword}&type=${params.type}&districtId=${params.districtId}&domainId=${params.domainId}&houseType=${params.houseType}&price=30000&mi=${params.mi}&style=${params.style}"  <#if params.price=='3000'>class="active"<#assign flag=true></#if>>3万元/m²以上</a>
                            <div class="price-range">
                                <input type="text" id="fromPrice" <#if !flag>value="${params.minPrice}"</#if>>
				                <span>-</span>
				                <input type="text" id="toPrice" <#if !flag>value="${params.maxPrice}"</#if>>
                                <span>元/m²</span>
                                <a href="javascript:;" id="definePrice">确定</a>
                            </div>
                        </div>
                    </div>
                    </#if>
                 <#--租售end-->
			</div>
			
			<div class="clearfix">
				<div class="house-warp">
				   
						<div class="house-title">
							<a href="javascript:;" <#if params.param='house_money'><#if params.sort='DESC'> class="cur" <#else> class="cur cur-up"</#if></#if> onclick="sort(this,'house_money')"><span>价格</span><i></i></a>
			                <a href="javascript:;" <#if params.param='house_mi'><#if params.sort='DESC'> class="cur" <#else> class="cur cur-up"</#if></#if>onclick="sort(this,'house_mi')"><span>面积</span><i></i></a>
			                <a href="javascript:;" <#if params.param='house_time'><#if params.sort='DESC'> class="cur" <#else> class="cur cur-up"</#if></#if>onclick="sort(this,'house_time')"><span>发布时间</span><i></i></a>
						</div>
						<#if page.data?size<1>
				         <div class="noneoffice">
                            <img src="${basePath}static/img/error1.png" style="height:216px;"/>
						</div>
                       <#else>
						<div class="house-content">
							<#list page.data as h>
							<div class="house-item">
								 <a class="img-warp" href="${basePath}front/house/detail?id=${h.house_id}">
                                    <img src="${basePath}${h.house_picture_addr}"/>
                                 </a>
								<div class="text-warp">
									 <h2><a href="${basePath}front/house/detail?id=${h.house_id}">${h.house_name}</a></h2>
                            <p>楼盘：<a href="${basePath}front/building/detail?id=${h.building_id}"><span>${h.building_name}</span></a></p>
                            <p>区域：<span >${h.district_name}</span>商圈：<span>${h.trade_area_name}</span>等级：<span >${h.building_level}</span></p>
						<p>详细地址： <span>${h.house_address}</span></p>
                            <p>选址顾问：<span >${h.house_linkman}</span>联系电话：<span>${h.house_phone}</span></p>
								</div>								
								<div class="rent">
									<p><i>${h.house_money}</i> <#if h.house_unit!="">${h.house_unit}<#else></i> 元/m².月</#if></p>
								</div>
								<div class="acreage">
									<p>${h.house_mi}m²</p>
									<span>建筑面积</span>
								</div>
								<div class="house-item-span">
								       <span>${h.house_style}</span>
								</div>
								
							</div>
						</#list>
						</div>
						</#if>
						<div class="m-page-warp" id="Pagination">
						   <#if page.pages gt 1><span>共${page.pages}页</span></#if>
						</div>
				</div>
				<div class="house-right">
					<a href="${basePath}index/findRoom" class="go-buy">我要租房/买房</a>
            <a href="${basePath}index/house_resource" class="go-lease">我要出租/出售</a>
					<div class="loupan-warp">
						<div class="warp-title">
							<p>最新品质楼盘</p>
							<a href="${basePath}index/findBuildings">更多&gt;&gt;</a>
						</div>
						<ul>
						<#list bList as b>
					<#if b_index<3>
						
                            <a href="${basePath}front/building/detail?id=${b.building_id}">${b.building_name}<span>[${b.trade_area_name}]</span></a>
                            <p><span>租：<a href="javascritpt:;">${b.rent}</a> 套</span><span>售：<a href="javascritpt:;">${b.sale}</a> 套</span></p>
                        </li>	
								</#if>
				</#list>
						</ul>
					</div>
					<div class="knowledge-warp">
						<div class="warp-title">
							<p>选址百科</p>
							<!--<a href="">更多&gt;&gt;</a>-->
						</div>
						<ul>
							<#list infoList as i>
				   <#if i_index<3>
                    <li><a href="${i.url}" >${i.title}</a></li>
                   </#if>
				</#list>
						</ul>
					</div>
				</div>
			</div>
			
<input type="hidden" value="${basePath}" id="ctx"/>
<#--期望区域Id-->
<input type="hidden" value="${t.district_id.district_id}" id="did"/>
<#--期望商圈Id-->
<input type="hidden" value="${t.trade_area_id}" id="tid"/>

<#--租金-->
<input type="hidden" value="${params.price}" id="price"/>
<#--物业类型-->
<input type="hidden" value="${params.mi}" id="mi"/>
<#--面积-->
<input type="hidden" value="${params.keyword}" id="keyword"/>

<#--类型-->
<input type="hidden" value="${params.houseType}" id="houseType"/>
<#--商圈-->
<input type="hidden" value="${params.domainId}" id="domainId"/>
<#--区域-->
<input type="hidden" value="${params.districtId}" id="districtId"/>
<#--租售-->
<input type="hidden" value="${params.style}" id="style"/>

<#include "/include/footer.ftl">
<#include "/include/stastics.ftl"/>
</body>
</html>
<script src="${basePath}static/js/common/jquery-3.1.0.min.js" type="text/javascript" charset="utf-8"></script>
<script src="${basePath}static/js/common/owl.carousel.min.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="${basePath}static/jquery.page.js"></script>
<script type="text/javascript" src="${basePath}static/DateFormat.js"></script>
<script type="text/javascript" src="${basePath}static/js/common/common.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
        $("#defineMi").click(function(){
            var minMi = $("#fromMi").val();
            var maxMi = $("#toMi").val();
            if(!minMi && !maxMi)return;
            if(Number(minMi).toString()=='NaN')return;
            if(Number(maxMi).toString()=='NaN')return;
            window.location.href='${basePath}index/findHouses?keyword=${params.keyword}&type=${params.type}&districtId=${params.districtId}&domainId=${params.domainId}&houseType=${params.houseType}&price=${params.price}&style=${params.style}&mi='+minMi+"-"+maxMi;
        });
        $("#definePrice").click(function(){
            var minPrice = $("#fromPrice").val();
            var maxPrice = $("#toPrice").val();
            if(!minPrice && !maxPrice)return;
            if(Number(minPrice).toString()=='NaN')return;
            if(Number(maxPrice).toString()=='NaN')return;
            
            window.location.href='${basePath}index/findHouses?keyword=${params.keyword}&type=${params.type}&districtId=${params.districtId}&domainId=${params.domainId}&houseType=${params.houseType}&mi=${params.mi}&style=${params.style}&price='+minPrice+"~"+maxPrice;
        });
        if(${page.pages} > 1){
        $("#Pagination").createPage({
            pageCount:${page.pages},//总页数
            current:${page.pageNum},//当前页
            backFn:function(num){
                window.location.href='${basePath}index/findHouses?keyword=${params.keyword}&type=${params.type}&districtId=${params.districtId}&domainId=${params.domainId}&houseType=${params.houseType}&price=${params.price}&mi=${params.mi}&style=${params.style}<#if params.param ??>&sort=${params.sort}&param=${params.param}</#if>&pageNum='+num;
            }
        });
         }
    });
    
    $('.house-title a').click(function(){
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

    //排序
		function sort(obj,param){
		    var c=$(obj).attr('class');
		    var districtid=$("#districtId").val();
		    var propertyid=$("#houseType").val();
		    var keyword=$("#keyword").val().trim();
		    var domainId=$("#domainId").val();
		    var price=$("#price").val();
		    var mi=$("#mi").val().trim();
		    var style=$("#style").val();
		    var paixu;
		    if(c=='cur'){
		      paixu="ASC"
		    }else{
		    //升序排列
		      paixu="DESC";
		    }
		     var con={
		      'districtid':districtid,
		      'domainId':domainId,
		      'mi':mi,
		      'price':price,
		      'propertyid':propertyid,
		      'keyword':keyword,
		      'style':style,
		      'paixu':paixu,
		      'param':param
		    }
		    //发送请求获取数据
		    window.location.href='${basePath}index/findHouses?keyword=${params.keyword}&type=${params.type}&districtId=${params.districtId}&domainId=${params.domainId}&houseType=${params.houseType}&price=${params.price}&mi=${params.mi}&style=${params.style}&sort='+paixu+'&param='+param;
			
}
</script>