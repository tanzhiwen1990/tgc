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
<link rel="stylesheet" type="text/css" href="${ctx}/lib/webuploader/0.1.5/webuploader.css"/>
<!--[if IE 6]>
<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>新增图片</title>
<link href="${ctx}/lib/webuploader/0.1.5/webuploader.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="page-container">
	<form class="form form-horizontal" id="form-article-add" action="${ctx}/information/edit" method="post">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>标题：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${obj.title}" dataType="*" placeholder="标题" id="" name="title">
			</div>
		</div>
	
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">描述：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${obj.description}" dataType="*" placeholder="描述" id="" name="description">
			</div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">Url：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text"  placeholder="点击访问地址" dataType="url"  value="${obj.url}" id="" name="url">
			</div>
		</div>
		
		 <div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">状态：</label>
			<div class="formControls col-xs-8 col-sm-9 skin-minimal">
				<div class="check-box">
				<#if obj.status=='未上线'>
				   <input type="radio" value="未上线"checked="checked" name="status">未上线
					<input type="radio"  value="已上线" name="status">已上线
				<#else>
				    <input type="radio" value="未上线" name="status">未上线
				    <input type="radio"  value="已上线" checked="checked" name="status">已上线
				</#if>
				</div>
			</div>
		</div>
		
		 <div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">展示平台：</label>
			<div class="formControls col-xs-8 col-sm-9 skin-minimal">
				<div class="check-box">
				  <#if obj.platform='全部'>
					<input type="radio"  value="全部" checked="checked" name="platform">全部
					<input type="radio" value="PC" name="platform">PC
					<input type="radio" value="微信" name="platform">微信
				 <#elseif obj.platform='PC'>
				    <input type="radio"  value="全部"  name="platform">全部
					<input type="radio" value="PC" checked="checked" name="platform">PC
					<input type="radio" value="微信" name="platform">微信
				<#else>
				    <input type="radio"  value="全部"  name="platform">全部
					<input type="radio" value="PC"  name="platform">PC
					<input type="radio" value="微信" checked="checked" name="platform">微信
				 </#if>
				</div>
			</div>
		   </div>
		
		<input type="hidden" name="img" id="imgUrl" value="${obj.img}"/>
		<input type="hidden" name="id" id="id" value="${obj.id}"/>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">图片(建议尺寸：高x宽：300*205)：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<div class="uploader-thum-container">
					<div id="fileList" class="uploader-list" >
					  <img src="${ctx}${obj.img}" style="width:50%;height:50%;" />
					</div>
					<div  id="filePicker" name="img" >选择图片</div>
				</div>
			</div>
		</div>
		
		
		
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
				<input type="submit" value="提交" class="btn btn-primary radius"/>
				
			</div>
		</div>
	</form>
</div>
</div>
<script src="${ctx}static/js/common/jquery-3.1.0.min.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="${ctx}static/js/Validform_v5.3.2_min.js"></script>
<script type="text/javascript" src="${ctx}/lib/layer/2.1/layer.js"></script> 
<script type="text/javascript" src="${ctx}/lib/My97DatePicker/WdatePicker.js"></script> 
<script type="text/javascript" src="${ctx}/lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="${ctx}/static/h-ui/js/H-ui.js"></script> 

<script type="text/javascript" src="${ctx}/static/h-ui.admin/js/H-ui.admin.js"></script> 

<#--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="${ctx}/lib/webuploader/0.1.5/webuploader.min.js"></script> 
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
var uploader = WebUploader.create({
    auto: true,
    swf: 'lib/webuploader/0.1.5/Uploader.swf',
    disableGlobalDnd: true,  
    chunked: true,  
    server: 'upload', 
    pick: '#filePicker',
    accept: {
        title: 'Images',
        extensions: 'gif,jpg,jpeg,bmp,png',
        mimeTypes: 'image/*'
    }
});

uploader.on( 'fileQueued', function( file ) {
     $('#fileList').empty();
    var $li = $(
            '<div id="' + file.id + '" class="file-item thumbnail">' +
                '<img>' +
                '<div class="info">' + file.name + '</div>' +
            '</div>'
            ),
        $img = $li.find('img');

    $('#fileList').append( $li );

    uploader.makeThumb( file, function( error, src ) {
        if ( error ) {
            $img.replaceWith('<span>不能预览</span>');
            return;
        }

        $img.attr( 'src', src );
    });
});

uploader.on( 'uploadSuccess', function( file,data ) {
    $('#imgUrl').val(data.imgUrl);
    $( '#'+file.id ).addClass('upload-state-done');
});


uploader.on( 'uploadError', function( file ) {
    var $li = $( '#'+file.id ),
        $error = $li.find('div.error');

   
    if ( !$error.length ) {
        $error = $('<div class="error"></div>').appendTo( $li );
    }

    $error.text('上传失败');
});

uploader.on( 'uploadComplete', function( file,response) {
    $( '#'+file.id ).find('.progress').remove();
    layer.msg('上传成功!',{icon:1,time:2000});
});

</script>

</body>
</html>