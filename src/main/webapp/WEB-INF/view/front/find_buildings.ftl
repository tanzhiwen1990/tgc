<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <meta name="keywords" content="${seo.keyword}">
	<meta name="title" content="${seo.title}">
	<meta name="description" content="${seo.description}">
	<title>${seo.title?default('热门楼盘')}</title>
    <link rel="stylesheet" type="text/css" href="${basePath}static/tao/common.css" />
    <link rel="stylesheet" type="text/css" href="${basePath}static/tao/reset.css" />
    <link rel="stylesheet" type="text/css" href="${basePath}static/tao/hot-room-index.css" />
    <link rel="stylesheet" type="text/css" href="${basePath}static/style/front/pagination.css" />
    <script src="${basePath}static/js/common/jquery-3.1.0.min.js" type="text/javascript" charset="utf-8"></script>
    <script type="text/javascript" src="${basePath}static/jquery.page.js"></script>
    <script type="text/javascript" src="${ctx}static/js/Validform_v5.3.2_min.js"></script>
    <script type="text/javascript" src="${basePath}/lib/layer/2.1/layer.js"></script>
    <script type="text/javascript" src="${basePath}static/js/common/common.js"></script>
    <link rel="icon"href="${basePath}static/img/tao/title-icon2.png" type="image/x-icon"/>
	<#include "/include/head.ftl">
    <link rel="stylesheet" type="text/css"  src="${basePath}/static/h-ui.admin/css/style.css" />
    <style>

        .seach-lable-warp{
            border: 1px solid #cccccc;
            margin-top: 8px;
            margin-bottom: 30px;
            padding-left: 10px;
            padding-bottom: 20px;
            font-size: 14px;
        }
        .seach-lable-item{
            height: 28px;
            line-height: 28px;
            margin-top: 20px;
        }
        .seach-lable-item>span{
            float: left;
            margin-right: 10px;
        }
        .seach-lable-item .lable-box{
            float: left;
        }
        .lable-box>a{
            float: left;
            margin-right: 22px;
            color: #000;
        }
        .lable-box a.active{
            color: #d20000;
            font-weight: bold;
        }
        .lable-box a:hover{
            color: #d20000;
            text-decoration: underline;
        }
        .area-content{
            border: 1px solid #ff0000;
            border-radius: 5px;
            margin-top: -1px;
            width:1000px;
        }

        .area-content a.active{
            color: #ff0000;
        }
        .area-content.hide{
            display: none;
        }
        .area-content a {
            float: left;
            margin-left: 26px;
        }
        .search-box a.re{
            color: #ff0000;
            background: url(${basePath}static/img/tao/redsanjiao.gif) no-repeat bottom center;
        }

        .seach-lable-item .search-box{
            float: left;
        }
        .search-box>a{
            float: left;
            margin-right: 22px;
            color: #000;
        }
        .search-box a.active{
            color: #d20000;
            font-weight: bold;
        }
        .search-box a:hover{
            color: #d20000;
            text-decoration: underline;
        }
       .noneoffice{
		    float: left;
		    width: 100%;
		    height: 466px;
		    padding-top: 125px;
		    text-align: center;
		}
		.noneoffice img{
		    height: 216px;
		}
    </style>
</head>

<body>
<div class="g-nav-warp">
    <div class="m-content-warp clearfix nav-top">
        <a href="${basePath}index"  ><img class="logo-img" src="${basePath}static/img/tao/logo1.png" /></a>
        <div class="nav">
            <a href="${basePath}index"  >首页</a>
            <a href="${basePath}index/findHouses"  >找房源</a>
            <a href="${basePath}index/findBuildings"    class="active">热门楼盘</a>
            <a href="${basePath}index/findRoom"  >委托找楼</a>
            <a href="${basePath}index/house_resource"  >业主放盘</a>
        </div>
    </div>
</div>
<div class="clearfix l-main-warp">
    <div class="m-location" style="margin-top: 60px;">
    </div>
    <div class="search-condition">
        <div class="seach-input clearfix">
            <input type="text" id="keyword"  placeholder="请输入楼盘名字..." value="${params.keyword}" onkeydown="keyDownSearch(event)"/>
            <a href="javascript:;" id="search-btn">搜索</a>
        </div>
         
         <div class="seach-lable-warp">
	         <div class="seach-lable-item">
	                <span>区域：</span>
	                <div class="search-box">
	                    <a href="${basePath}index/findBuildings?keyword=${params.keyword}" <#if !params.districtId>class="active"</#if>>不限</a>
					<#list district as d>
	                    <a  href="${basePath}index/findBuildings?keyword=${params.keyword}&districtId=${d.district_id}" <#if params.districtId==d.district_id>class="re"</#if>  name="${d.district_id}">${d.district_name}</a>
					</#list>
	                </div>
	            </div>
	    
	            <div class="area-content-warp">
				   <#if domain>
	                <div class="area-content clearfix" style="padding: 6px 0px;">
	                    <a href="${basePath}index/findBuildings?keyword=${params.keyword}&districtId=${params.districtId}" <#if !params.domainId>class="active"</#if>>不限</a>
							<#list domain as r>
		                        <a href="${basePath}index/findBuildings?keyword=${params.keyword}&districtId=${params.districtId}&domainId=${r.trade_area_id}"  name="${r.trade_area_id}" <#if r.trade_area_id == params.domainId>class="active"</#if>> ${r.trade_area_name}</a>
							</#list>
	                </div>
				</#if>
	            </div>
	          </div>
             
        </div>
        <#if page.data?size<1>
			 <div class="noneoffice">
                <img src="${basePath}static/img/error1.png" />
			</div>
		</#if>
        <#if page.data?size gt 0>
        <div class="hot-warp">
				<div class="hot-content clearfix">
						<#list page.data as b>
			                <div class="item">
			                    <a class="img-warp" href="${basePath}front/building/detail?id=${b.building_id}">
			                        <img src="${basePath}${b.building_picture_addr}"/>
			                       <#if b.houseNum!=0> <span>${b.houseNum}套房源</span><#else> <span>房源上传中</span></#if>
			                    </a>
			                    <div class="text-warp">
			                        <div class="left">
			                            <p class="top">${b.building_name}</p>
			                            <p class="bom">${b.trade_area_name}-${b.district_name}</p>
			                        </div>
			                        <div class="right"><em>${b.building_rent}</em><#if b.building_rent_unit!="">${b.building_rent_unit}<#else>元/㎡.月</#if></div>
			                    </div>
			                </div>
						</#list>
				</div>
				
				<div class="m-page-warp"  id="Pagination">
                    <#if page.pages gt 1><span>共${page.pages}页</span></#if>
                </div>
                
			</div>
      </#if>
<#include "/include/footer.ftl">
</div>
<#include "/include/stastics.ftl"/>
</body>
</html>
<script src="${basePath}static/js/common/jquery-3.1.0.min.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="${basePath}static/jquery.page.js"></script>
<script type="text/javascript" src="${ctx}static/js/Validform_v5.3.2_min.js"></script>
<script type="text/javascript" src="${basePath}/lib/layer/2.1/layer.js"></script>
<script type="text/javascript" src="${basePath}static/js/common/common.js"></script>
<script>
    $(function(){
      if(${page.pages}>1){
        $("#Pagination").createPage({
            pageCount:${page.pages},//总页数
            current:${page.pageNum},//当前页
            backFn:function(num){
                window.location.href='${basePath}index/findBuildings?keyword=${params.keyword}&districtId=${params.districtId}&domainId=${params.domainId}&pageNum='+num;
            }
        });
       }
    })
    
      
    document.onkeydown=keyDownSearch; 
    function keyDownSearch(e) {  
        // 兼容FF和IE和Opera  
        var theEvent = e || window.event;  
        var code = theEvent.keyCode || theEvent.which || theEvent.charCode;  
        if (code == 13) {   
            search();//具体处理函数  
            return false;  
        }  
        return true;  
    };
    
    function search(){
            window.location.href='${basePath}index/findBuildings?keyword='+$("#keyword").val();
     }
     
     $("#search-btn").click(function(){
        search();
     })
 
</script>