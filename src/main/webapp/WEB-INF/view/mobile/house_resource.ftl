<!DOCTYPE html>
<html>

	<head>
		<title>业主放盘</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
		<link rel="stylesheet" type="text/css" href="${basePath}static/mobile/css/reset.css">
		<link rel="stylesheet" type="text/css" href="${basePath}static/mobile/css/entrust-find.css" />
		<link rel="stylesheet" type="text/css" href="${basePath}static/mobile/css/common.css"/>
		<script type="text/javascript" src="${basePath}static/mobile/js/jquery-3.1.0.min.js"></script>
		<script type="text/javascript" src="${basePath}static/js/Validform_v5.3.2_min.js"></script>
		<script type="text/javascript" src="${basePath}static/mobile/js/resposive.js"></script>
		<script type="text/javascript" src="${basePath}static/mobile/js/layer/layer.js"></script>
		<link rel="icon"href="${basePath}static/img/tao/title-icon2.png" type="image/x-icon"/>
		<#include "/include/head.ftl">
	</head>

	<body>
		<div class="g-heard">
			<div class="heard-title">
			<a href="${basePath}mobile">
				<img src="${basePath}static/mobile/img/logo.png"/>
				</a>
				<span>业主放盘</span>
				<a href="javascript:;" class="nav-btn"></a>
			</div>
			<#include '/mobile/header.ftl'/>
		</div>
		<div id="myform" class="form">
			<ul class="form-ul">
				<li>
					<span class="li-left">房源类型</span>
					<div class="li-right btn-warp">
						<a href="javascript:;" class="active" >出租</a>
						<a href="javascript:;">出售</a>
					</div>
				</li>
				
				<li>
					<span class="li-left">大厦名称</span>
					<input class="li-right" placeholder="请输入大厦名称" id="ds" dataType="*" sucmsg=" " errormsg=" "/>
				</li>
				<li>
					<span class="li-left ">楼层</span>
					<div class="li-right loucheng">
						<div class="loucheng-left">
							第
							<input  type="number" id="floor"  />
							层
						</div>
						-
						<div>
							第
							<input type="number" id="total" />
							号
						</div>
					</div>
				</li>
				<li>
					<span class="li-left">建筑面积</span>
					<input class="li-right " placeholder="请输入建筑面积" id="s"  sucmsg=" "/><span style="color:#b3b6be;padding-right:10px;">m²</span>
				</li>
				<li>
					<span class="li-left">出租价格</span>
					<input class="li-right " placeholder="请输入租金"  type="number" id="rent"  sucmsg=" " /><span id="unit" style="color:#b3b6be;margin-right:10px;">m²·月</span>
				</li>
				<li>
					<span class="li-left">联系人</span>
					<input class="li-right" placeholder="请输入姓名" id="oname" dataType="*" sucmsg=" " errormsg=" "/>
				</li>
				<li>
					<span class="li-left">联系电话</span>
					<input class="li-right" placeholder="请输入联系电话"  type="number" id="otel"  errormsg="请填写手机号" dataType="phone" sucmsg=" " />
				</li>
			</ul>
			<sapn id="submit">确定</span>
			<input type="hidden" value="${basePath}" id="aa"/>
		</div>
		  <div class="page-bottom page-bottom-fixed">
		    <a  style="color:#fff;" href="${basePath}special/about?type=1">关于我们</a>
		    <span>&nbsp;|&nbsp;</span>
		    <a style="color:#fff;" href="${basePath}special/about" >联系我们</a>
		    <span class="bottom-bottom">Copyright 2016 www.zhongxiangspace.com. All Rights Reserved 渝ICP备16013565号-1</span>
		</div>
		<a class="m-top-btn"></a>
		<#include '/mobile/stastics.ftl'/>
	</body>
	<script type="text/javascript">
          var type=$('.btn-warp').find('a.active').text();
          var base=$("#aa").val();
	       $('.btn-warp a').click(function(){
				if(!$(this).hasClass('active')){
					$(this).siblings().removeClass('active');
					$(this).addClass('active');
				}
			   type=$(this).text();
			   if(type=="出售"){
					  $("#unit").text('元/m²');
				}else{
					   $("#unit").text('m²·月');
					}
			  });
			 
	     var demo=$("#myform").Validform({
				 datatype:{
			"phone":function(gets,obj,curform,regxp){
				/*参数gets是获取到的表单元素值，
				  obj为当前表单元素，
				  curform为当前验证的表单，
				  regxp为内置的一些正则表达式的引用。*/
					var reg2=/^1(3|4|5|7|8)[0-9]\d{8}$/,
					mobile=$("#otel");
				if(reg2.test(mobile.val())){return true;}
				 return false;
			}	
		},
				tiptype:3,
				btnSubmit:"#submit", 
				label:".label",
				showAllError:false,
				ajaxPost:false,
				callback:function(){
				  submit(base);
				}
			});
			

		function submit(base){
		       var floor=$("#floor").val();
			   floor+="-"+$("#total").val();
			   $.post('${basePath}/front/owner/add',{
			   "owner_building_type":type,
			   "owner_building_name":$("#ds").val(),
			   "owner_building_number":floor,
			   "owner_building_mi":$("#s").val(),
			   "owner_building_price":$("#rent").val(),
			   "owner_building_linkman":$("#oname").val(),
			   "owner_building_phone":$("#otel").val()
			   },function(){
			      layer.msg('提交成功,请等待我们的工作人员联系您!',{icon:1,time:3000});
			      $("input").val("");
			      $(".Validform_right").hide();
			   },"json");
			}
	</script>

</html>