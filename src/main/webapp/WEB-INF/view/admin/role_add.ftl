<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="${ctx}/lib/html5.js"></script>
<script type="text/javascript" src="${ctx}/lib/respond.min.js"></script>
<script type="text/javascript" src="${ctx}/lib/PIE_IE678.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="${ctx}/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/lib/Hui-iconfont/1.0.7/iconfont.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/lib/icheck/icheck.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="${ctx}/static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>角色添加</title>
<link href="${ctx}/lib/webuploader/0.1.5/webuploader.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="page-container">
	<form class="form form-horizontal" id="form-article-add" method="post" action="${ctx}role/addOrEdit">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>角色名：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text"  placeholder="角色名称"  name="name">
			</div>
		</div>
	
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">描述：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text"  placeholder="角色描述" id="" name="description">
			</div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">网站角色：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<dl class="permission-list">
					<dt>
						<label>
							<input type="checkbox" value="house" name="permission" id="selectall">
							房产管理</label>
					</dt>
					<dd>
						<dl class="cl permission-list2">
							<dd>
						        <label class="">
									<input type="checkbox" value="house_trade" name="permission" id="user-Character-0-0">
									商圈管理</label>
								<label class="">
									<input type="checkbox" value="house_property" name="permission" id="user-Character-0-0-0">
									物业管理</label>
								<label class="">
									<input type="checkbox" value="house_faciilty" name="permission" id="user-Character-0-0-1">
									配套管理</label>
								<label class="">
									<input type="checkbox" value="house_building" name="permission" id="user-Character-0-0-2">
									楼盘管理</label>
								<label class="">
									<input type="checkbox" value="house_recommend" name="permission" id="user-Character-0-0-3">
									热门推荐</label>
								<label class="">
									<input type="checkbox" value="house_source" name="permission" id="user-Character-0-0-4">
									房源管理</label>
							</dd>
						</dl>
					
					</dd>
				</dl>
				<dl class="permission-list">
					<dt>
						<label>
							<input type="checkbox" value="content" name="permission" id="user-Character-1">
							内容管理</label>
					</dt>
					<dd>
						<dl class="cl permission-list2">
							<dd>
							    <label class="">
									<input type="checkbox" value="content_article" name="permission" id="permission">
									文章管理</label>
								<label class="">
									<input type="checkbox" value="content_banner" name="permission" id="permission-0">
									banner管理</label>
								<label class="">
									<input type="checkbox" value="content_industry" name="permission" id="permission-1">
									行业动态</label>
								<label class="">
									<input type="checkbox" value="content_info" name="permission" id="permission-2">
									购房知识</label>
							</dd>
						</dl>
					</dd>
				</dl>
				
				<dl class="permission-list">
					<dt>
						<label>
							<input type="checkbox" value="corporate" name="permission" id="user-Character-1">
							合作管理</label>
					</dt>
					<dd>
						<dl class="cl permission-list2">
							<dd>
							    <label class="">
									<input type="checkbox" value="corporate_house" name="permission" id="permission">
									委托找房</label>
								<label class="">
									<input type="checkbox" value="corporate_owner" name="permission" id="permission-0">
									业主放盘</label>
								<label class="">
									<input type="checkbox" value="corporate_friendlink" name="permission" id="permission-1">
									友情链接</label>
							</dd>
						</dl>
					</dd>
				</dl>
				
				<dl class="permission-list">
					<dt>
						<label>
							<input type="checkbox" value="system" name="permission" id="user-Character-1">
							系统设置</label>
					</dt>
					<dd>
						<dl class="cl permission-list2">
							<dd>
								<label class="">
									<input type="checkbox" value="system_role" name="permission" id="permission">
									角色管理</label>
								<label class="">
									<input type="checkbox" value="system_account" name="permission" id="permission">
									账号管理</label>
								<label class="">
									<input type="checkbox" value="system_SEO" name="permission" id="permission-1">
									SEO设置</label>
								
							</dd>
						</dl>
					</dd>
				</dl>
				
				<dl class="permission-list">
					<dt>
						<label>
							<input type="checkbox" value="weixin" name="permission" id="user-Character-1">
							微信用户统计</label>
					</dt>
					<dd>
						<dl class="cl permission-list2">
							<dd>
								<label class="">
									<input type="checkbox" value="weixin_user" name="permission" id="permission">
									微信用户管理</label>
							</dd>
						</dl>
					</dd>
				</dl>
			</div>
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
				<input type="submit" class="btn btn-primary radius" />
			</div>
		</div>
	</form>
</div>
</div>
<script type="text/javascript" src="${ctx}/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="${ctx}/lib/layer/2.1/layer.js"></script> 
<script type="text/javascript" src="${ctx}/lib/icheck/jquery.icheck.min.js"></script> 
<script type="text/javascript" src="${ctx}/lib/jquery.validation/1.14.0/jquery.validate.min.js"></script> 
<script type="text/javascript" src="${ctx}/lib/jquery.validation/1.14.0/validate-methods.js"></script> 
<script type="text/javascript" src="${ctx}/lib/jquery.validation/1.14.0/messages_zh.min.js"></script> 

<script type="text/javascript" src="${ctx}/lib/My97DatePicker/WdatePicker.js"></script> 
<script type="text/javascript" src="${ctx}/lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="${ctx}/static/h-ui/js/H-ui.js"></script> 
<script type="text/javascript" src="${ctx}/static/h-ui.admin/js/H-ui.admin.js"></script> 
<script type="text/javascript" src="${ctx}static/js/common/common.js"></script>


<#--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="${ctx}/lib/webuploader/0.1.5/webuploader.min.js"></script> 
<script type="text/javascript" src="${ctx}/lib/ueditor/1.4.3/ueditor.config.js"></script> 
<script type="text/javascript" src="${ctx}/lib/ueditor/1.4.3/ueditor.all.min.js"> </script> 
<script type="text/javascript" src="${ctx}/lib/ueditor/1.4.3/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript">
$(function(){
	$(".permission-list dt input:checkbox").click(function(){
		$(this).closest("dl").find("dd input:checkbox").prop("checked",$(this).prop("checked"));
	});
	$(".permission-list2 dd input:checkbox").click(function(){
		var l =$(this).parent().parent().find("input:checked").length;
		var l2=$(this).parents(".permission-list").find(".permission-list2 dd").find("input:checked").length;
		if($(this).prop("checked")){
			$(this).closest("dl").find("dt input:checkbox").prop("checked",true);
			$(this).parents(".permission-list").find("dt").first().find("input:checkbox").prop("checked",true);
		}
		else{
			if(l==0){
				$(this).closest("dl").find("dt input:checkbox").prop("checked",false);
			}
			if(l2==0){
				$(this).parents(".permission-list").find("dt").first().find("input:checkbox").prop("checked",false);
			}
		}
	});
	
	$("#form-admin-role-add").validate({
		rules:{
			roleName:{
				required:true,
			},
		},
		onkeyup:false,
		focusCleanup:true,
		success:"valid",
		submitHandler:function(form){
			$(form).ajaxSubmit();
			var index = parent.layer.getFrameIndex(window.name);
			parent.layer.close(index);
		}
	});
});
</script>
</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>