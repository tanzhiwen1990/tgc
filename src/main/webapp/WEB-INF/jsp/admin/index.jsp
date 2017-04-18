
<%@page import="com.util.AppConfig"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" import="com.model.*"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	Systemuser t_sys = (Systemuser)request.getSession().getAttribute(AppConfig.loginName);
	if(t_sys == null){
		t_sys = new Systemuser();
	}
%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<script type="text/javascript" src="lib/PIE_IE678.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="<%=basePath%>static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>lib/Hui-iconfont/1.0.7/iconfont.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>lib/icheck/icheck.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>众享空间后台</title>
</head>
<body>
<header class="navbar-wrapper">
	<div class="navbar navbar-fixed-top">
		<div class="container-fluid cl"> <a class="logo navbar-logo f-l mr-10 hidden-xs" href="javascript:;">众享空间后台</a> <a class="logo navbar-logo-m f-l mr-10 visible-xs" href="/aboutHui.shtml"></a> <span class="logo navbar-slogan f-l mr-10 hidden-xs">v1.0</span> <a aria-hidden="false" class="nav-toggle Hui-iconfont visible-xs" href="javascript:;">&#xe667;</a>
			<nav class="nav navbar-nav">
			</nav>
			<nav id="Hui-userbar" class="nav navbar-nav navbar-userbar hidden-xs">
				<ul class="cl">
					<li>管理员</li>
					<li class="dropDown dropDown_hover"> <a href="#" class="dropDown_A"><%=t_sys.getT_realname()%><i class="Hui-iconfont">&#xe6d5;</i></a>
						<ul class="dropDown-menu menu radius box-shadow">
							<li><a href="<%=basePath%>adminLogin/outLogin">切换账户</a></li>
							<li><a href="<%=basePath%>adminLogin/outLogin">退出</a></li>
						</ul>
					</li>
					<li id="Hui-skin" class="dropDown right dropDown_hover"> <a href="javascript:;" class="dropDown_A" title="换肤"><i class="Hui-iconfont" style="font-size:18px">&#xe62a;</i></a>
						<ul class="dropDown-menu menu radius box-shadow">
							<li><a href="javascript:;" data-val="default" title="默认（黑色）">默认（黑色）</a></li>
							<li><a href="javascript:;" data-val="blue" title="蓝色">蓝色</a></li>
							<li><a href="javascript:;" data-val="green" title="绿色">绿色</a></li>
							<li><a href="javascript:;" data-val="red" title="红色">红色</a></li>
							<li><a href="javascript:;" data-val="yellow" title="黄色">黄色</a></li>
							<li><a href="javascript:;" data-val="orange" title="绿色">橙色</a></li>
						</ul>
					</li>
				</ul>
			</nav>
		</div>
	</div>
</header>
<aside class="Hui-aside">
	<div class="menu_dropdown bk_2">
		<dl id="menu-article">
			<dt><i class="Hui-iconfont">&#xe625;</i> 房产管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="<%=basePath%>Trade_Area/pageTrade_Area" data-title="商圈管理" href="javascript:void(0)">商圈管理</a></li>
					<li><a data-href="<%=basePath%>Property/getPropertyList" data-title="物业类型" href="javascript:void(0)">物业类型</a></li>
					<li><a data-href="<%=basePath%>surpporting_facilities/getSFList" data-title="配套管理" href="javascript:void(0)">配套管理</a></li>
					<li><a data-href="<%=basePath%>building/pageBuilding" data-title="楼盘管理" href="javascript:void(0)">楼盘管理</a></li>
					<li><a data-href="<%=basePath%>house/pagehouse" data-title="房源管理" href="javascript:void(0)">房源管理</a></li>
					<li><a data-href="<%=basePath%>recommend/pageRecommend" data-title="热门推荐" href="javascript:void(0)">热门推荐</a></li>
				</ul>
			</dd>
		</dl>
		<dl id="menu-article">
			<dt><i class="Hui-iconfont">&#xe627;</i> 内容管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="<%=basePath%>article/getArticleList" data-title="文章管理" href="javascript:void(0)">素材管理</a></li>
					<li><a data-href="<%=basePath%>indexbanner/getBannerList" data-title="banner管理" href="javascript:void(0)">banner管理</a></li>
					<li><a data-href="<%=basePath%>information/getInformationList" data-title="行业动态" href="javascript:void(0)">行业资讯</a></li>
					<li><a data-href="<%=basePath%>problem/getProblemList" data-title="购房知识" href="javascript:void(0)">选址百科</a></li>
				</ul>
			</dd>
		</dl>
		<dl id="menu-article">
			<dt><i class="Hui-iconfont">&#xe636;</i> 合作管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="<%=basePath%>findhouse/pageFindHouse" data-title="委托找楼" href="javascript:void(0)">委托找楼</a></li>
					<li><a data-href="<%=basePath%>OBuilding/goToIndex" data-title="业主放盘" href="javascript:void(0)">业主放盘</a></li>
					<li><a data-href="<%=basePath%>friendLink/getFriendLinkList" data-title="友情链接"  href="javascript:void(0)">友情链接</a></li>
				</ul>
			</dd>
		</dl>
		<dl id="menu-article">
			<dt><i class="Hui-iconfont">&#xe62e;</i> 系统设置<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="<%=basePath%>role/getRoleList" data-title="角色管理" href="javascript:void(0)">角色管理</a></li>
					<li><a data-href="<%=basePath%>systemuser/getSystemUserList" data-title="账号管理" href="javascript:void(0)">账号管理</a></li>
					<li><a data-href="<%=basePath%>adminSeo/getSeoList" data-title="SEO设置" href="javascript:void(0)">SEO设置</a></li>
				</ul>
			</dd>
		</dl>
		
		<dl id="menu-article">
			<dt><i class="Hui-iconfont">&#xe60d;</i> 微信用户统计<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="<%=basePath%>wx/getUserInfoList" data-title="微信用户管理" href="javascript:void(0)">微信用户管理</a></li>
				</ul>
			</dd>
		</dl>
	</div>
</aside>

<div class="dislpayArrow hidden-xs"><a class="pngfix" href="javascript:void(0);" onClick="displaynavbar(this)"></a></div>
<section class="Hui-article-box">
	<div id="Hui-tabNav" class="Hui-tabNav hidden-xs">
		<div class="Hui-tabNav-wp">
			<ul id="min_title_list" class="acrossTab cl">
				<li class="active"><span title="我的桌面" data-href="welcome.html">我的桌面</span><em></em></li>
			</ul>
		</div>
		<div class="Hui-tabNav-more btn-group"><a id="js-tabNav-prev" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d4;</i></a><a id="js-tabNav-next" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d7;</i></a></div>
	</div>
	<div id="iframe_box" class="Hui-article">
		<div class="show_iframe">
			<div style="display:none" class="loading"></div>
			<iframe scrolling="yes" frameborder="0" src="<%=basePath%>adminLogin/goWelcome"></iframe>
		</div>
	</div>
</section>
<script type="text/javascript" src="<%=basePath%>lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="<%=basePath%>lib/layer/2.1/layer.js"></script> 
<script type="text/javascript" src="<%=basePath%>lib/jquery.contextmenu/jquery.contextmenu.r2.js"></script> 
<script type="text/javascript" src="<%=basePath%>static/h-ui/js/H-ui.js"></script> 
<script type="text/javascript" src="<%=basePath%>static/h-ui.admin/js/H-ui.admin.js"></script> 
<script type="text/javascript">
	$(function() {
<%if (t_sys.getT_name() == null) {%>
		layer.alert('登陆失效，点击确认前往登陆页面!', {
			skin : 'layui-layer-molv',
			closeBtn : 0
		}, function() {
			window.location.href="<%=basePath%>adminLogin/goAdminLogin";
		});
<%}%>
	});
</script> 
</body>
</html>