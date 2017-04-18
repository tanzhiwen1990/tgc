<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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
<link href="<%=basePath%>static/h-ui/css/H-ui.min.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>static/h-ui.admin/css/H-ui.login.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>static/h-ui.admin/css/style.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>lib/Hui-iconfont/1.0.7/iconfont.css" rel="stylesheet" type="text/css" />
<!--[if IE 6]>
<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>后台登录</title>
</head>
<body>
<input type="hidden" id="TenantId" name="TenantId" value="" />
<div class="header"></div>
<div class="loginWraper">
  <div id="loginform" class="loginBox">
    <form class="form form-horizontal" method="post" onsubmit="return false">
      <div class="row cl">
        <label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60d;</i></label>
        <div class="formControls col-xs-8">
          <input id="name" name="name" type="text" placeholder="账户" class="input-text size-L">
        </div>
      </div>
      <div class="row cl">
        <label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60e;</i></label>
        <div class="formControls col-xs-8">
          <input id="pwd" name="pwd" type="password" placeholder="密码" class="input-text size-L">
        </div>
      </div>
      <div class="row cl">
        <div class="formControls col-xs-8 col-xs-offset-3">
          <input class="input-text size-L" id="captcha" type="text" placeholder="验证码"  style="width:150px;">
          <img src="<%=basePath%>util/captcha">
        </div>
      </div>
     
      <div class="row cl">
        <div class="formControls col-xs-8 col-xs-offset-3">
          <input name="" type="submit" class="btn btn-success radius size-L" value="&nbsp;登&nbsp;&nbsp;&nbsp;&nbsp;录&nbsp;" onclick="loginCaptcha()">
          <input name="" type="reset" class="btn btn-default radius size-L" value="&nbsp;取&nbsp;&nbsp;&nbsp;&nbsp;消&nbsp;">
        </div>
      </div>
    </form>
  </div>
</div>
<div class="footer">Copyright 甜瓜科技 by H-ui.admin.v2.5</div>
<script type="text/javascript" src="<%=basePath%>lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="<%=basePath%>static/h-ui/js/H-ui.js"></script>
<script type="text/javascript" src="<%=basePath%>lib/layer/2.1/layer.js"></script>
<script type="text/javascript">
	function loginCaptcha(){
		if($("#name").val().trim() == ""){
			layer.alert('用户名不能为空!');
			return;
		}
		if($("#pwd").val().trim() == ""){
			layer.alert('密码不能为空!');
			return;
		}
		if($("#captcha").val().trim() == ""){
			layer.alert('验证码不能为空!');
			return;
		}
		
		$.get('<%=basePath%>adminLogin/captcha', {
			captcha : $('#captcha').val()
		},function(result) {
			if(result.data.success == "false"){
				layer.msg('验证码错误!');
			}else{
				login();
			}
		}, 'json');
		var index = layer.load(0, {shade: false}); //0代表加载的风格，支持0-2
		//loading层
		var index = layer.load(1, {
		  shade: [0.1,'#fff'] //0.1透明度的白色背景
		});
		login();
	}
	function login(){
		$.ajax({ 
	        type: "post", 
	        url: "<%=basePath%>adminLogin/login", 
	        data: {
	        	name : $("#name").val(),
	    		pwd : $("#pwd").val()
	        }, 
	        dataType: "json", 
	        success: function(result) { 
	            if(result.data == "false"){
	            	layer.alert('用户名或密码错误!');
	            } else if (result.data == "status is false"){
	            	layer.alert('账户已经锁定!');
	            } else {
	            	window.location.href = "<%=basePath%>adminLogin/goIndex";
	            }
	        }
		});
	}
</script> 
</body>
</html>