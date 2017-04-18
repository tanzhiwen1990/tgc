<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<LINK rel="Bookmark" href="/favicon.ico" >
<LINK rel="Shortcut Icon" href="/favicon.ico" />
<!--[if lt IE 9]>
<script type="text/javascript" src="${basePath}lib/html5.js"></script>
<script type="text/javascript" src="${basePath}lib/respond.min.js"></script>
<script type="text/javascript" src="${basePath}}lib/PIE_IE678.js"></script>
<![endif]-->

<link rel="stylesheet" type="text/css" href="${basePath}/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="${basePath}/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="${basePath}/lib/Hui-iconfont/1.0.7/iconfont.css" />
<link rel="stylesheet" type="text/css" href="${basePath}/lib/icheck/icheck.css" />
<link rel="stylesheet" type="text/css" href="${basePath}/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="${basePath}/static/h-ui.admin/css/style.css" />
<link rel="stylesheet" type="text/css" href="${basePath}lib/webuploader/0.1.5/webuploader.css"/>


<!--[if IE 6]>
<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->

<title>新增图片</title>
<link href="${basePath}lib/webuploader/0.1.5/webuploader.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="page-container">
	<form class="form form-horizontal" id="form-article-add" action="${basePath}surpporting_facilities/property_add" method="post">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>图片标题：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="" placeholder="" dataType="s3-20" id="" name="name" style="width:240px;">
			</div>
		</div>
		
	
		<input type="hidden"  name="picUrl" id="imgUrl"/>
		<input type="hidden" value="未上线" name="state"/>
		
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">图片(建议尺寸：高x宽：120 x 120)：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<div class="uploader-thum-container">
					<div id="fileList" class="uploader-list" ></div>
					<div  id="filePicker" name="picUrl" >选择图片</div>
				</div>
			</div>
		</div>
		

		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
				<input type="submit" class="btn btn-primary radius"/>
			</div>
		</div>
	</form>
</div>
</div>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="${basePath}lib/jquery/1.9.1/jquery.min.js"></script> 
<script src="${basePath}static/js/common/jquery-3.1.0.min.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="${basePath}static/js/Validform_v5.3.2_min.js"></script>
<script type="text/javascript" src="${basePath}lib/layer/2.1/layer.js"></script> 
<script type="text/javascript" src="${basePath}lib/icheck/jquery.icheck.min.js"></script>
<script type="text/javascript" src="${basePath}lib/My97DatePicker/WdatePicker.js"></script>  
<script type="text/javascript" src="${basePath}lib/jquery.validation/1.14.0/jquery.validate.min.js"></script> 
<script type="text/javascript" src="${basePath}lib/jquery.validation/1.14.0/validate-methods.js"></script> 
<script type="text/javascript" src="${basePath}lib/jquery.validation/1.14.0/messages_zh.min.js"></script> 
<script type="text/javascript" src="${basePath}static/h-ui/js/H-ui.js"></script> 
<script type="text/javascript" src="${basePath}static/h-ui.admin/js/H-ui.admin.js"></script> 
<script type="text/javascript" src="${basePath}static/DateFormat.js"></script>
<script type="text/javascript" src="${basePath}static/js/ajaxfileupload.js"></script>
<script type="text/javascript" src="${basePath}static/js/common/common.js"></script>

<script type="text/javascript" src="${basePath}lib/webuploader/0.1.5/webuploader.min.js"></script> 

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
    },120,120);
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