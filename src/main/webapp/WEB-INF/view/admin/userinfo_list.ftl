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
<title>图片列表</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>微信用户统计<span class="c-gray en">&gt;</span> 微信用户管理 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	
	<div class="cl pd-5 bg-1 bk-gray mt-20"> 
	   <span class="r">共有数据：<strong>${page.total}</strong> 条</span> </div>
	<div class="mt-20">
		<table class="table table-border table-bordered table-bg table-hover">
			<thead>
				<tr class="text-c">
					<th width="80">ID</th>
					<#--<th width="100">openid</th>-->
					
					<th width="40">昵称</th>
					<th width="150">头像</th>
					<th width="80">性别</th>
					<th width="100">访问时间</th>
					<th width="60">所在地</th>
				</tr>
			</thead>
			<tbody id="pagetbody">
            <#list page.data as ob >
				<tr class="text-c">
					
					<td>${ob.id}</td>
					<#--
					<td>${ob.openid}</td>
					-->
					<td>${ob.nickname}</td>
					<td><img src="${ob.headimgurl}" style="width:100px;height:80px;"/></td>
					<td><#if ob.sex==1>男<#else>女</#if></td>
					<td>${ob.date?string("yyyy-MM-dd")}</td>
					<td> 
					 <#if ob.province??>
					    ${ob.province}
                         <#if ob.city??>
					        -${ob.city}
					     </#if>
                      <#else>
                                                                              未填写信息
					  </#if>
                     
					
					</td>
				</tr>
			</#list>
			</tbody>
		</table>
		<div class="page" style="float: left; margin: 10px 10px;">
			<a href="#">显示${page.pageNum}页，共${page.pages}页</a>
    	</div>
		<div class="tcdPageCode"></div>
	</div>
</div>
<script type="text/javascript" src="${ctx}/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="${ctx}/lib/layer/2.1/layer.js"></script> 
<script type="text/javascript" src="${ctx}/lib/My97DatePicker/WdatePicker.js"></script> 
<script type="text/javascript" src="${ctx}/lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="${ctx}/static/h-ui/js/H-ui.js"></script> 
<script type="text/javascript" src="${ctx}/static/h-ui.admin/js/H-ui.admin.js"></script> 
<script type="text/javascript" src="${ctx}static/js/jquery.page.js"></script>
<script type="text/javascript" src="${ctx}static/DateFormat.js"></script>
<script type="text/javascript" src="${ctx}static/js/common/common.js"></script>
<script type="text/javascript">
$('.table-sort').dataTable({
		"aaSorting": [[ 0, "asc" ]],//默认第几个排序
		"bPaginate" : true
	});
	$(".tcdPageCode").createPage({
	    pageCount:${page.pages},//总页数
	    current:${page.pageNum},//当前页
	    backFn:function(num){
	    	ajaxPage(num);
	    }
	});
	function ajaxPage(num){
		$.ajax({ 
	        type: "post", 
	        url: "${ctx}" + "wx/ajaxPage", 
	        data: {
	        	beginNum : num,
	        	pageSize : ${page.pageSize},
	        }, 
	        dataType: "json", 
	        success: function(result) { 
	        	change(result);
	        }
		});
	}
	function change(result){
		$("#pagetbody").children().remove();
		for(var i = 0 ; i<result.data.length ; i++){
		   var img="<img src=\"+ result.data[i].headimgurl +\" style=\"width:100px;height:80px;\"/>";
		   var sex="";
		   if(result.data[i].sex==1){
		     sex="男";
		   }else{
		     sex="女";
		   }
		   var addr="未填写信息";
		   if(result.data[i].province!=null&&result.data[i].province!=""){
		      addr=result.data[i].province;
		   }
		    if(result.data[i].city!=null&&result.data[i].city!=""){
		      addr+=result.data[i].city;
		   }
			var d = new Date();
			d.setTime(result.data[i].date);
			$("#pagetbody").append("<tr class='text-c'>" +
					  "<td>"+result.data[i].id +"</td>" +
					  "<td>"+result.data[i].openid +"</td>" +
					  "<td>"+ result.data[i].nickname +"</td>" +
					  "<td>"+ img +"</td>" +
					  "<td>"+ sex +"</td>" +
					  "<td>"+d.Format("yyyy-MM-dd hh:mm:ss") +"</td>"+
					  "<td>"+ addr +"</td>"+
					  "</tr>");
			}
			$("#sumNum").text(result.total);
			$('.page').children().remove();
			$(".page").append("<a href='#'>显示"+result.pageNum+"页，共"+result.pages+"页</a>");
			$('.page').next().remove();
			$('.page').after("<div class='tcdPageCode'></div></div>");
			$(".tcdPageCode").createPage({
			    pageCount:result.pages,//总页数
			    current:result.pageNum,//当前页
			    backFn:function(num){
			    	ajaxPage(num);
			    }
			});
	}
	$('#search').click(function (){
		ajaxPage(1);
	});
	
	
</script> 
</script>
</body>
</html>