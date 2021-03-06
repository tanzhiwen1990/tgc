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
<link rel="stylesheet" type="text/css" href="${basePath}/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="${basePath}/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="${basePath}/lib/Hui-iconfont/1.0.7/iconfont.css" />
<link rel="stylesheet" type="text/css" href="${basePath}/lib/icheck/icheck.css" />
<link rel="stylesheet" type="text/css" href="${basePath}/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="${basePath}/static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>众享空间后台</title>
</head>
<body>
<header class="navbar-wrapper">
	<div class="navbar navbar-fixed-top">
		<div class="container-fluid cl"> <a class="logo navbar-logo f-l mr-10 hidden-xs" href="/aboutHui.shtml">众享空间后台</a> <a class="logo navbar-logo-m f-l mr-10 visible-xs" href="/aboutHui.shtml"></a> <span class="logo navbar-slogan f-l mr-10 hidden-xs">v1.0</span> <a aria-hidden="false" class="nav-toggle Hui-iconfont visible-xs" href="javascript:;">&#xe667;</a>
			<nav class="nav navbar-nav">
			</nav>
			<nav id="Hui-userbar" class="nav navbar-nav navbar-userbar hidden-xs">
				<ul class="cl">
					<li>${role.description}</li>
					<li class="dropDown dropDown_hover"> <a href="#" class="dropDown_A">${user.t_user}<i class="Hui-iconfont">&#xe6d5;</i></a>
						<ul class="dropDown-menu menu radius box-shadow">
							<li><a href="${basePath}/adminLogin/outLogin">切换账户</a></li>
							<li><a href="${basePath}/adminLogin/outLogin">退出</a></li>
						</ul>
					</li>
					<li id="Hui-msg"> <a href="#" title="消息"><span class="badge badge-danger">1</span><i class="Hui-iconfont" style="font-size:18px">&#xe68a;</i></a> </li>
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
		<#list pList as p>
		 <#if p.isroot==1>
		<dl id="menu-article">
			<dt><i class="Hui-iconfont">${p.logo};</i>${p.name}<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
				<#list p.menu as m>
					<li><a data-href="${basePath}${m.link}" data-title="${m.name}" href="javascript:void(0)">${m.name}</a></li>
				</#list>
				</ul>
			</dd>
		</dl>
		</#if>
	  </#list>
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
		<!--<div class="show_iframe">
			<div style="display:none" class="loading"></div>
			<iframe scrolling="yes" frameborder="0" src="welcome.html"></iframe>
		</div>-->
	</div>
</section>

<script type="text/javascript" src="${basePath}/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="${basePath}/lib/layer/2.1/layer.js"></script> 
<script type="text/javascript" src="${basePath}/lib/jquery.contextmenu/jquery.contextmenu.r2.js"></script> 
<script type="text/javascript" src="${basePath}/static/h-ui/js/H-ui.js"></script> 
<script type="text/javascript" src="${basePath}/static/h-ui.admin/js/H-ui.admin.js"></script> 
<script type="text/javascript">
$(function(){
	$(".Hui-tabNav-wp").contextMenu('myMenu1', {
		bindings: {
			'open': function(t) {
				alert('Trigger was '+t.id+'\nAction was Open');
			},
			'email': function(t) {
				alert('Trigger was '+t.id+'\nAction was Email');
			},
			'save': function(t) {
				alert('Trigger was '+t.id+'\nAction was Save');
			},
			'delete': function(t) {
				alert('Trigger was '+t.id+'\nAction was Delete')
			}
		}
	});
});


</script> 
</body>
</html>