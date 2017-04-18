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
<title>添加</title>
<link href="${ctx}/lib/webuploader/0.1.5/webuploader.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="page-container">
	<form class="form form-horizontal" id="form-article-add" action="${ctx}adminSeo/edit?id=${obj.id}" method="Post">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>标题：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${obj.title}" placeholder="标题" id="name" dataType="*" name="title" style="width:200px;">
			</div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">展示位置：</label>
			<div class="formControls col-xs-8 col-sm-9">
			    <select class="select" name="position" dataType="*" style="width:200px;height:30px;">
			    <#if obj.position=="1">
                    <option value="1" selected>首页</option>
                    <option value="2">业主放盘</option>
                    <option value="3">委托找房</option>
                    <option value="4">地图找房</option>
                    <option value="5">热门楼盘</option>
                    <option value="6">找房源</option>
                <#elseif obj.position=="2">
                    <option value="1" >首页</option>
                    <option value="2" selected>业主放盘</option>
                    <option value="3">委托找房</option>
                    <option value="4">地图找房</option>
                    <option value="5">热门楼盘</option>
                    <option value="6">找房源</option>
                <#elseif obj.position=="3">
                    <option value="1" >首页</option>
                    <option value="2">业主放盘</option>
                    <option value="3" selected>委托找房</option>
                    <option value="4">地图找房</option>
                    <option value="5">热门楼盘</option>
                    <option value="6">找房源</option>
                <#elseif obj.position=="4">
                    <option value="1" >首页</option>
                    <option value="2">业主放盘</option>
                    <option value="3">委托找房</option>
                    <option value="4" selected>地图找房</option>
                    <option value="5">热门楼盘</option>
                    <option value="6" >找房源</option>
                <#elseif obj.position=="5">
                    <option value="1" >首页</option>
                    <option value="2">业主放盘</option>
                    <option value="3">委托找房</option>
                    <option value="4">地图找房</option>
                    <option value="5" selected>热门楼盘</option>
                    <option value="6">找房源</option>
                <#else>
                    <option value="1" >首页</option>
                    <option value="2">业主放盘</option>
                    <option value="3">委托找房</option>
                    <option value="4">地图找房</option>
                    <option value="5">热门楼盘</option>
                    <option value="6" selected>找房源</option>
                </#if>
                 </select>
			</div>
		</div> 
		
	  <div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">关键字：</label>
			<div class="formControls col-xs-8 col-sm-9">
			   <textarea name="keyword" id="keyword" rows="5"  dataType="*" cols="80">${obj.keyword}</textarea> 
			</div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">描述：</label>
			<div class="formControls col-xs-8 col-sm-9">
			   <textarea name="description" id="description" rows="5"  dataType="*" cols="80">${obj.description}</textarea> 
			</div>
		</div>
		
		
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
				<input type=submit  class="btn btn-primary radius" value="提交">
			</div>
		</div>
	</form>
</div>

<script type="text/javascript" src="${ctx}/lib/jquery/1.9.1/jquery.min.js"></script> 
<script src="${ctx}static/js/common/jquery-3.1.0.min.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="${ctx}static/js/Validform_v5.3.2_min.js"></script>
<script type="text/javascript" src="${ctx}/lib/layer/2.1/layer.js"></script> 
<script type="text/javascript" src="${ctx}/lib/My97DatePicker/WdatePicker.js"></script> 
<script type="text/javascript" src="${ctx}/lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="${ctx}/static/h-ui/js/H-ui.js"></script> 
<script type="text/javascript" src="${ctx}/static/h-ui.admin/js/H-ui.admin.js"></script> 
<script type="text/javascript">
 var demo=$("#form-article-add").Validform({
				tiptype:3,
				btnSubmit:"#btn-sub", 
				label:".label",
				showAllError:false,
				ajaxPost:false,
				callback:function(){
				  $("#form-article-add").submit();
				}
			});
</script>
</body>
</html>