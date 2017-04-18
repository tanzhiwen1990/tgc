/**
 * 常用方法的js
 */

var application={};
/*清空表单 */
application.reset=function(){
	$('#myform')[0].reset();
}

/*页面跳转*/
application.locationToUrl=function(title,url){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
		
}

/*单条数据删除*/
application.deleteOne=function(obj,id,url){
	layer.confirm('确认要删除吗？',function(index){
		$.ajax({ 
        	type: "post", 
        	url: url, 
        	data: {
        		ids : id
        	}, 
        	dataType: "json", 
        	success: function(result) { 
        		if (result.data == 0){
					layer.msg('删除失败!',{icon:5,time:2000});
        		} else {
        			$(obj).parents("tr").remove();
					layer.msg('已删除!',{icon:1,time:2000});
        		}
        	}
		});
	});
}
/*批量删除数据*/
application.batchDelete=function(url){
	if($(".taid:checked").size() == 0){
		layer.msg('请选择要删除的内容!');
		return;
	}
	var ids = "";
	var i = 1;
	$(".taid:checked").each(function (){
		if(i == $(".taid:checked").size()){
			ids = ids + $(this).val();
		} else {
			ids = ids + $(this).val() + ",";
		}
		i++;
	});
	layer.confirm('确认要删除一条或多条内容吗？',function(index){
		$.ajax({ 
        	type: "post", 
        	url: url, 
        	data: {
        		ids : ids
        	}, 
        	dataType: "json", 
        	success: function(result) { 
        		if (result.data == 0){
					layer.msg('删除失败!',{icon:5,time:2000});
        		} else {
					layer.msg('删除成功!',{icon:1,time:2000});
					location.replace(location.href);
        		}
        	}
		});
	});
}


/*批量删除数据*/
application.batchHot=function(obj,url,status,id){
	if($(".taid:checked").size() == 0&&id==""){
		layer.msg('请选择要操作的内容!');
		return;
	}
	var state;
	var ids = "";
	var i = 1;
	var tip;
	if(status=="是"){
		tip="确定设置为热门?";
		state='否';
	}else{
		tip="确定取消热门?";
		state='是';
	}
	if(id!=""){
	  ids=id;
	}else{
	$(".taid:checked").each(function (){
		if(i == $(".taid:checked").size()){
			ids = ids + $(this).val();
			
		} else {
			ids = ids + $(this).val() + ",";
		}
		i++;
	});
	}
	layer.confirm(tip,function(index){
		$.ajax({ 
        	type: "post", 
        	url: url, 
        	data: {
        		ids : ids,
        		hot : status
        	}, 
        	dataType: "json", 
        	success: function(result) { 
        		if (result.data == 0){
				     layer.msg('操作失败!',{icon:5,time:2000});
        		} else if(result.data == 1){
        			if(status=='是'){
        				$(obj).parents("tr").find(".td-status").next().html('<span class="label label-danger radius">热门</span>');
        				$(obj).after('<a style=\"text-decoration:none\" onClick=\"application.batchHot(this,\''+ url +'\',\''+state+'\','+ id +')\" href=\"javascript:;\" title=\"非热门\"><i class=\"Hui-iconfont\">&#xe615;</i></a>');
        				$(obj).remove();
        				layer.msg('操作成功!',{icon:1,time:2000});
        			}else{
        				$(obj).parents("tr").find(".td-status").next().html('<span class="label label-defaunt radius">非热门</span>');
        				$(obj).after('<a style=\"text-decoration:none\" onClick=\"application.batchHot(this,\''+ url +'\',\''+state+'\','+ id +')\" href=\"javascript:;\" title=\"热门\"><i class=\"Hui-iconfont\">&#xe631;</i></a>');
        				$(obj).remove();
        				layer.msg('操作成功!',{icon:1,time:2000});
        			}
        		}else {
					layer.msg('操作成功!',{icon:1,time:2000});
					location.replace(location.href);
        		}
        	}
		});
	});
}


/*修改状态*/
application.changeStatus=function(obj,status,id,url){
	var tip="";
	if(status=="已上线"){
		tip="确定上线?";
		state='未上线';
	}else if(status=="已激活"){
		tip="确定激活?";
		state='未激活';
	}else if(status=="未激活"){
		tip="确定冻结?";
		state='已激活';
	}else{
		tip="确定下线?";
		state='已上线';
	}
	layer.confirm(tip,function(){
		$.ajax({ 
        	type: "post", 
        	url: url, 
        	data: {
        		id:id,
        		state:status
        	}, 
        	dataType: "json", 
        	success: function(result) { 
        		if (result.data==0){
					layer.msg('操作失败!',{icon:5,time:2000});
        		} else {
        			if(status=='已上线'){
        				$(obj).parents("tr").find(".td-manage").prepend('<a style=\"text-decoration:none\" onClick=\"application.changeStatus(this,\''+state+'\','+ id +',\''+ url +'\')\" href=\"javascript:;\" title=\"上线\"><i class=\"Hui-iconfont\">&#xe6de;</i></a>');
						$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已上线</span>');
						$(obj).remove();
        				layer.msg('操作成功!',{icon:1,time:2000});
        			}else if(status=='未上线'){
        				$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="application.changeStatus(this,\''+state+'\','+ id +',\''+ url +'\')" href="javascript:;" title="下线"><i class="Hui-iconfont">&#xe603;</i></a>');
						$(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">未上线</span>');
						$(obj).remove();
					layer.msg('操作成功!',{icon:1,time:2000});
        			}else if(status=='已激活'){
        				$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="application.changeStatus(this,\''+state+'\','+ id +',\''+ url +'\')" href="javascript:;" title="锁定"><i class="Hui-iconfont">&#xe60e;</i></a>');
						$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已激活</span>');
						$(obj).remove();
					    layer.msg('操作成功!',{icon:1,time:2000});
        			}else{
					    $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="application.changeStatus(this,\''+state+'\','+ id +',\''+ url +'\')" href="javascript:;" title="启用"><i class="Hui-iconfont">&#xe605;</i></a>');
						$(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">未激活</span>');
						$(obj).remove();
					    layer.msg('操作成功!',{icon:1,time:2000});
					}
					//location.replace(location.href);
        		}
        	}
		});
	})
}

/*单图上传*/

application.upload=function(url) {	
	var uploader = WebUploader.create({
	    auto: true,
	    swf: 'lib/webuploader/0.1.5/Uploader.swf',
	    disableGlobalDnd: true,  
	    chunked: true,  
	    server: url, 
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
	    }, 300, 100 );
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

	
}

application.objLayer=function(title,url,w,h){
	layer_show(title,url,w,h);
}

application.submit=function(base){
	var keyword=$('#keyword').val().trim();
    if(keyword!=null&&keyword!=''){
    		window.location.href=base+'index/findHouses?keyword='+keyword;
        }else{
        	window.location.href=base+'index/findHouses';
    }
}

application.keydown=function(base,event){
	var keyword=$('#keyword').val().trim();
	if(event.keyCode==13){
    if(keyword!=null&&keyword!=''){
    		window.location.href=base+'index/findHouses?keyword='+keyword;
        }else{
        	window.location.href=base+'index/findHouses';
   		}
    }
}
 /*图片编辑*/
application.picture_edit=function(title,url,id){
	var index = layer.open({
		type: 2,
		title: title,
		content: url + "?id=" +id
	});
	layer.full(index);
}
/*移动端查询*/
application.search=function (base){
	 var keyword=$("#search").val();	
	 window.location.href=base+"mobile/houseList?keyword="+keyword;
}
/*换一批功能实现*/
application.change=function(obj){
	 var showObject = $('#obj').children('a');
	  $.refresh({
	      object: showObject
	  });
     $('obj').show();
}

