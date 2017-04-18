<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<meta name="keywords" content="${seo.keyword}">
		<meta name="title" content="${seo.title}">
		<meta name="description" content="${seo.description}">
		<title>${seo.title?default('众享空间')}</title>
		<link rel="stylesheet" type="text/css" href="${basePath}static/tao/common.css" />
		<link rel="stylesheet" type="text/css" href="${basePath}static/tao/reset.css" />
		<link rel="stylesheet" type="text/css" href="${basePath}static/tao/index.css" />
		<link rel="stylesheet" type="text/css" href="${basePath}static/tao/owl.carousel.min.css"/>
		<link rel="stylesheet" type="text/css" href="${basePath}static/tao/owl.theme.default.min.css"/>
		<link rel="icon"href="${basePath}static/img/tao/title-icon2.png" type="image/x-icon"/>
		<#include "/include/head.ftl">

	</head>

	<body>
	       
		<img src="${basePath}static/img/tao/bgimg4.png" id="bgimg" alt=""/>
		<div id="left-code">
		     <img src="${basePath}static/img/tao/weixin.jpg" alt=""/>
		     <img src="${basePath}static/img/tao/wechat.png" alt=""/>
             <span>扫一扫-关注我们</span>

		</div>
				    
	    <div style="position: relative;">
			<div class="g-nav-warp-index" style="position: absolute;top: 0;left: 0;width: 100%;height: 100px;z-index: 999;border: none;">
			<div class="m-content-warp clearfix nav-top">
				<a href="${basePath}index" ><img  class="logo-img" src="${basePath}static/img/tao/logo1.png" /></a>
				<div class="nav">
					<a href="${basePath}index"  class="active">首页</a>
					<a href="${basePath}index/findHouses"   >找房源</a>
					<a href="${basePath}index/findBuildings"  >热门楼盘</a>
					<a href="${basePath}index/findRoom"  >委托找楼</a>
					<a href="${basePath}index/house_resource"  >业主放盘</a>
				</div>
			</div>
            </div>
            <div class="banner">
                <div class="swiper"   style="position: absolute;width: 100%;">
                    <#if banner ?? && (banner?size > 0)>
				    <#list banner as b>
				      <#if banner?size = 1>
				        <a <#if b.url !=""> href="${b.url}"  <#else> onclick="return false;"  href="javascript:;" </#if> class="item" target="_blank"><img src="${basePath}${b.pic}"/></a>
				        <a href="javascript:;"   class="item" target="_blank"><img src="${basePath}static/img/tao/banner.png"/ ></a>
				       <#else>
				         <a <#if b.url !=""> href="${b.url}"  <#else> onclick="return false;"  href="javascript:;" </#if>  class="item" target="_blank"><img src="${basePath}${b.pic}"/></a>
				       </#if>
					</#list>
					<#else>
						<a href="javascript:;"   class="item"><img src="${basePath}static/img/tao/banner1.png.png"/></a>
						<a href="javascript:;"   class="item"><img src="${basePath}static/img/tao/banner1.png.png"/></a>
						<a href="javascript:;"   class="item"><img src="${basePath}static/img/tao/banner1.png.png"/></a>
					</#if>
                </div>
                </div>
                <div class="m-content-warp"  id="main-search" style="z-index: 99;position: absolute;left: 50%;width: 1000px;margin-left:-500px;">
                    <div class="seach-warp">
                        <div class="input-warp">
                            <div class="search-ip">
                                <input type="text" placeholder="请输入楼盘名字或者商圈名字..." class="seach-input" id="keyword" onkeyup="application.keydown('${basePath}',event)"/>
                                <a href="javascript:;" onclick="application.submit('${basePath}')" class="seach-btn"><img src="${basePath}static/img/tao/seach-btn.png" class="seach-btn-img"/></a>
                            </div>
                           <a href="${basePath}index/findMap"  class="map-btn"><img src="${basePath}static/img/tao//ditu.png" alt=""/>地图找房</a>
                         </div> 
                        <div class="phonephone">
                            <img src="${basePath}static/img/tao/phone.png" alt=""/>&nbsp;咨询热线 023-64288028
                        </div>
                      
                    </div>
                </div>
            </div>
		</div>
	    <div class="m-main-warp">
			<div class="hot-area">
				<div class="m-tittle">
                    <img src="${basePath}static/img/tao/left-line.png" alt=""/>
					<span class="m-title-a">&nbsp;热门商圈</span>&nbsp;&nbsp;<span class="m-title-b">HOT BUSSINESS AREAS&nbsp;</span>
                    <img src="${basePath}static/img/tao/right-line.png" alt=""/>
				</div>
				<div class="hot-area-warp clearfix">
				<#list tList as t>
				  <#if t_index==0>
					<div class="img-warp ">
						<img src="${basePath}${t.trade_area_img}" />
						<a class="text-warp" href="${basePath}index/findHouses?domainId=${t.trade_area_id}&districtId=${t.district_id.district_id}" >
							<span>${t.trade_area_name}</span>
						</a>
					</div>
					<#elseif t_index gt 0 && t_index lt 5>
					 <div class="img-warp ">
						<img src="${basePath}${t.trade_area_img_small}" />
						<a class="text-warp" href="${basePath}index/findHouses?domainId=${t.trade_area_id}&districtId=${t.district_id.district_id}" >
							<span>${t.trade_area_name}</span>
						</a>
					</div>
					<#elseif t_index=5>
					<div class="img-warp ">
						<img src="${basePath}${t.trade_area_img}" />
						<a class="text-warp" href="${basePath}index/findHouses?domainId=${t.trade_area_id}&districtId=${t.district_id.district_id}" >
							<span>${t.trade_area_name}</span>
						</a>
					</div>
					</#if>
					</#list>
					
				</div>
			</div>
			<div class="hot-recommend">
				<div class="m-tittle">
                    <img src="${basePath}static/img/tao/left-line.png" alt=""/>
                    <span class="m-title-a">&nbsp;热门楼盘</span>&nbsp;&nbsp;<span class="m-title-b">HOT PROJECTS&nbsp;</span>
                    <img src="${basePath}static/img/tao/right-line.png" alt=""/>
					<a href="${basePath}index/findBuildings" >查看更多&gt;&gt;</a>
				</div>
				<div class="owl-carousel">
					<#list rList as r>
					<div class="item">
						<a class="img-warp" href="${basePath}front/building/detail?id=${r.building_id}" >
							<img src="${basePath}${r.building_picture_addr}"/>
							<#if r.houseNum!=0> <span>${r.houseNum}套房源</span><#else> <span>房源上传中</span></#if>
						</a>
						<div class="text-warp">
							<div class="left">
								<p class="top">${r.building_name}</p>
								<p class="bom">${r.trade_area_name}-${r.district_name}</p>
							</div>
							<div class="right"><em>${r.building_rent}</em>元/m²·月</div>
						</div>
					</div>
				</#list>
				</div>
			</div>
			<div class="hot-room">
				<div class="m-tittle">
                    <img src="${basePath}static/img/tao/left-line.png" alt=""/>
                    <span class="m-title-a">&nbsp;热门房源</span>&nbsp;&nbsp;<span class="m-title-b">HOT OFFICES&nbsp;</span>
                    <img src="${basePath}static/img/tao/right-line.png" alt=""/>
                    <a href="${basePath}index/findHouses" >查看更多&gt;&gt;</a>
				</div>
				<div class="owl-carousel">
					<#list hList as h>
						<div class="item">
						<a class="img-warp" href="${basePath}/front/house/detail?id=${h.house_id}" >
							<img src="${basePath}${h.house_picture_addr}"/>
							<span style="background: #ff503f;">${h.house_style}</span>
						</a>
						<div class="text-warp">
							<div class="left">
								<p class="top">${h.house_name}</p>
								<p class="bom">${h.trade_area_name}-${h.district_name}</p>
							</div>
							<div class="right"><em>${h.house_money}</em><#if h.house_unit!="">${h.house_unit}<#else>元/㎡.月</#if></div>
						</div>
					</div>
				</#list>
					
				</div>
			</div>
		
			
			<div class="news-warp">
				<div class="news-tittle clearfix" id="news">
					<a href="javascript:;" class="information news-titile-active" onclick="aaa(this)">行业资讯</a>
					<a href="javascript:;" class="q-a" onclick="aaa(this)">选址百科</a>
				</div>
				<div class="news-content-warp clearfix" id="nid">
				<#if page.data?exists>  
				    <!-- 十个一行,使用FreeMarker的chunk()函数进行 -->  
				     <#list page.data?chunk(3) as row> <!-- 清除div浮动 -->  
				       <div class="news-item-warp">
				              <#list row as n>  
				               <div class="news-item">
									<h2><a <#if n.url?contains("http://")>href="${n.url}"<#else>href="http://${n.url}"</#if>" >${n.title}</a></h2>
									<p>
									<#if p.desctiption.length gt 30>
									   ${n.description.substring(0,30)}...
									<#else>
									   ${n.description}
									</#if>
									</p>
									<div class="new-item-bottom">
										<a <#if n.url?contains("http://")>href="${n.url}"<#else>href="http://${n.url}"</#if>" >查看详情&gt;&gt;</a>
										<span>[${n.updateDate?string('yyyy-MM-dd')}]</span>
									</div>
								</div>     
				              </#list>  
				        </div>  
				    </#list>   
				</#if> 
			</div>
			<div class="m-page-warp" id="Pagination">
			</div>
		</div>
		<div class="friends-group">
		  <div class="friends-group-left">
		      <img src="${basePath}static/img/fir-1.png" alt=""/>
		  </div>
		  <div class="friends-group-right">
		      <div class="right-one"><img src="${basePath}static/img/repa.png" alt=""/></div>
		      <div class="right-one"><img src="${basePath}static/img/ffc.png" alt=""/></div>
		      <div class="right-one"><img src="${basePath}static/img/huarun.png" alt=""/></div>
		      <div class="right-one"><img src="${basePath}static/img/huangguan.png" alt=""/></div>
		      <div class="right-one"><img src="${basePath}static/img/jingxin.png" alt=""/></div>
		      <div class="right-one"><img src="${basePath}static/img/youlineng.png" alt=""/></div>
		      <div class="right-last-one"><img src="${basePath}static/img/fir-2.png" alt=""/></div>
		  </div>
		</div>
		<#include "/include/footer.ftl"/>
		</div>
<script src="${basePath}static/js/common/jquery-3.1.0.min.js" type="text/javascript" charset="utf-8"></script>
<script src="${basePath}static/js/common/owl.carousel.min.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="${basePath}static/jquery.page.js"></script>
<script type="text/javascript" src="${basePath}static/DateFormat.js"></script>
<script type="text/javascript" src="${basePath}static/js/common/common.js"></script>

<script type="text/javascript">
    var url="";
    var index=0;
	function aaa(obj){
		 index=$(obj).index();
	    $(obj).siblings().removeClass("news-titile-active");
	    $(obj).addClass("news-titile-active");
	    var num="";
	    if(index==0){
	          $("#nid").empty();
	          var url="${basePath}" + "index/ajaxNews";
          postData(url,index);
	}else{
      $("#nid").empty();
      var url="${basePath}" + "index/ajaxProblem";
      postData(url);
        
	}	
	function postData(url,index){
	    $.ajax({ 
		        type: "post", 
		        url: url, 
		        data: {
		        	beginNum : num,
		        	pageSize : ${page.pageSize}
		        }, 
		        dataType: "json", 
		        success: function(result) {
		        change(result)  ; 
		        }
			});
	}
	
	
	 function ajaxPage(num,index){
	  if(index==0){
    	url= "${basePath}" + "index/ajaxNews";
    	}else{
    	url= "${basePath}" + "index/ajaxProblem";
     }
	   $.ajax({ 
	        type: "post", 
	        url: url, 
	        data: {
	        	beginNum : num,
	        	pageSize : ${page.pageSize}
	        }, 
	        dataType: "json", 
	        success: function(result) { 
		     change(result);
		    }
		      
		});
    } 
    function change(result){
		  $('.news-content-warp').empty();
		  var l=result.data.length;
		  if(l>0){
		  var m=l%3==0 ? l/3:  Math.ceil(l/3);
		  var r=l%3==0 ?3 : l%3;
		  var d = new Date();
		
			  for(k=0;k<m;k++){
			      $('.news-content-warp').append("<div class=\"news-item-warp\"></div>")
				      if(k==0){
					      for(i=0;i<r;i++){
					       var d = new Date(result.data[k+i].updateDate);
					         $('.news-item-warp').eq(k).append("<div  class=\"news-item\">"+
					             " <h2><a href=\""+result.data[k+i].url+"\">" +result.data[k+i].title + "</a></h2>"+
					             "<p>"+result.data[k+i].description+"</p>"+
										"<div class=\"new-item-bottom\">"+
											"<a href=\""+result.data[k+i].url+"\" >查看详情&gt;&gt;</a>"+
											"<span>["+d.Format("yyyy-MM-dd")+"]</span>"+
										"</div>"+
					  
					         "</div>");
					      }
				      }else{
				         for(i=0;i<r;i++){
				         var d = new Date(result.data[3+i].updateDate);
				         $('.news-item-warp').eq(k).append("<div  class=\"news-item\">"+
				             " <h2><a href=\""+result.data[k+i].url+"\">" +result.data[3+i].title + "</a></h2>"+
				             "<p>"+result.data[3+i].description+"</p>"+
									"<div class=\"new-item-bottom\">"+
										"<a href=\""+result.data[k+i].url+"\" >查看详情&gt;&gt;</a>"+
										"<span>["+d.Format("yyyy-MM-dd")+"]</span>"+
									"</div>"+
				  
				         "</div>");
				      }
			      }//else end
			  }//for k end
	   }
		 $("#Pagination").remove();
		 $(".news-content-warp").after("<div class='m-page-warp' id='Pagination'></div>");
		 if(result.pages>1){
		 $(".m-page-warp").createPage({
			    pageCount:result.pages,//总页数
			    current:result.pageNum,//当前页
			    backFn:function(num){
			    	ajaxPage(num,index);
			    }
			});
		}
	}	
}
//友盟统计
$(function(){
     if(${page.pages}>1){
        $("#Pagination").createPage({
        pageCount:${page.pages},//总页数
        current:${page.pageNum},//当前页
        backFn:function(num){
         ajaxPage(num,0);
        }
    });
  }
  
 
	$("#left-code").animate({"left":"0"},888);
		setTimeout(function(){
		    $("#left-code").animate({"left":"-116px"},888);
		},2666);
		    $("#left-code").mouseenter(function(){
		    $("#left-code").animate({"left":"0"},666);
		});
		$("#left-code").mouseleave(function(){
		    $("#left-code").animate({"left":"-116px"},666);
		});
    $("#bgimg").hide();
	
    resetbanner();
    $(window).resize(function(){
        resetbanner();
    });
	 $('.swiper').owlCarousel({
        loop: true,
        items:1,
        dots:true,
        autoplay:true,
        autoplayTimeout:6000
	});
	 $('.owl-carousel').owlCarousel({
        loop: true,
        pagination: true,
        responsiveClass: true,
		items: 4,
        margin: 20,
        autoplay:true,
        slideSpeed:1000,
        scrollPerPage:true
	})
	
	window.onscroll = function () {
     var top = $(document).scrollTop();
     var totop = $(window).width()/6.4;
     if(top >= totop){
          $("#bgimg").fadeIn();
     }else{
          $("#bgimg").fadeOut();
     }
}
	
    
	function resetbanner(){
        //修改banner自适应等比拉伸图片
        var windowwidth = $(window).width();
        var bannerheight = windowwidth/3.2;
        $(".swiper .item").css("height",bannerheight+"px");
        $(".banner").css("height",bannerheight+"px");
        var topsearch = bannerheight*.76;
        $("#main-search").css("top",topsearch+"px");
    }
    
    
     
  function ajaxPage(num,index){
	  if(index==0){
    	url= "${basePath}" + "index/ajaxNews";
    	}else{
    	url= "${basePath}" + "index/ajaxProblem";
     }
	   $.ajax({ 
	        type: "post", 
	        url: url, 
	        data: {
	        	beginNum : num,
	        	pageSize : ${page.pageSize}
	        }, 
	        dataType: "json", 
	        success: function(result) { 
		     change(result);
		    }
		      
		});
    }
	
	function change(result){
	  $('.news-content-warp').empty();
	  var l=result.data.length;
	  if(l>0){
	  var m=l%3==0 ? l/3:  Math.ceil(l/3);
	  var r=l%3==0 ?3 : l%3;
	  var d = new Date();
	  for(k=0;k<m;k++){
	     $('.news-content-warp').append("<div class=\"news-item-warp\"></div>")
				      if(k==0){
					      for(i=0;i<r;i++){
					       var d = new Date(result.data[k+i].updateDate);
					         $('.news-item-warp').eq(k).append("<div  class=\"news-item\">"+
					             " <h2><a href=\""+result.data[k+i].url+"\">" +result.data[k+i].title + "</a></h2>"+
					             "<p>"+result.data[k+i].description+"</p>"+
										"<div class=\"new-item-bottom\">"+
											"<a href=\""+result.data[k+i].url+"\" >查看详情&gt;&gt;</a>"+
											"<span>["+d.Format("yyyy-MM-dd")+"]</span>"+
										"</div>"+
					  
					         "</div>");
					      }
				      }else{
				         for(i=0;i<r;i++){
				         var d = new Date(result.data[3+i].updateDate);
				         $('.news-item-warp').eq(k).append("<div  class=\"news-item\">"+
				             " <h2><a href=\""+result.data[k+i].url+"\">" +result.data[3+i].title + "</a></h2>"+
				             "<p>"+result.data[3+i].description+"</p>"+
									"<div class=\"new-item-bottom\">"+
										"<a href=\""+result.data[k+i].url+"\" >查看详情&gt;&gt;</a>"+
										"<span>["+d.Format("yyyy-MM-dd")+"]</span>"+
									"</div>"+
				  
				         "</div>");
				      }
			      }//else end
	     
	     }//for end
	  }//if end
}
})
</script>
<#include "/include/stastics.ftl"/>
</body>

</html>