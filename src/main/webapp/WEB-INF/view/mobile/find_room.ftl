<!DOCTYPE html>
<html>

	<head>
		<title>委托找楼</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
		<link rel="stylesheet" type="text/css" href="${basePath}static/mobile/css/reset.css">
		<link rel="stylesheet" type="text/css" href="${basePath}static/mobile/css/common.css"/>
		<link rel="stylesheet" type="text/css" href="${basePath}static/mobile/css/entrust-find.css" />
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
				<span>委托找楼</span>
				<a href="javascript:;" class="nav-btn"></a>
			</div>
			<#include '/mobile/header.ftl'/>
		</div>
		<div id="myform" class="form"  >
			<ul class="form-ul">
				<li>
					<span class="li-left">房源类型</span>
					<div class="li-right btn-warp">
						<a href="javascript:;" class="active">出租</a>
						<a href="javascript:;">出售</a>
					</div>
				</li>
				<li>
					<span class="li-left">期望区域</span>
					<div class="li-right layer-li-1 layer-li" id="district">
					</div>
				</li>
				<li>
					<span class="li-left">期望商圈</span>
					<div class="li-right layer-li-2 layer-li" id="area">
					</div>
				</li>
				
				<li>
					<span class="li-left ">期望面积</span>
					<div class="li-right loucheng">
						<div class="loucheng-left">
							<input  type="number" id="min" placeholder="最小面积"  />
						</div>
						<span style="margin-right:10px;">-</span> 
						<div style="margin-right:5px;">
							<input type="number" id="max" placeholder="最大面积" / style="margin-right:5px;">m²
						</div>
					</div>
				</li>
				<li>
					<span class="li-left">求租价格</span>
					<input class="li-right" placeholder="请输入价格"  type="number"  sucmsg=" " id="s" dataType="n"/><span id="unit" style="color:#b3b6be;">元/m².月<span>
				</li>
				
				<li>
					<span class="li-left">公司名称</span>
					<input class="li-right " placeholder="请输入公司名称" id="com" sucmsg=" " dataType="*"/>
				</li>
				<li>
					<span class="li-left">联系人</span>
					<input class="li-right " placeholder="请输入联系人" id="con" sucmsg=" " dataType="*"/>
				</li>
				<li>
					<span class="li-left">联系电话</span>
					<input class="li-right " placeholder="请输入联系电话" errormsg="请填写手机号" sucmsg=" " type="number" id="phone" dataType="phone"/>
				</li>
			</ul>
			<span id="submit">确认</span>
		</div>
		<div class="layer-warp layer-warp1" style="display: none;">
			<ul>
			    <#list district as d>
				<li><input type="radio" name="keshi" value="${d.district_id}"/><label>${d.district_name}</label></li>
				</#list>
			</ul>
		</div>
			<div class="layer-warp layer-warp2 " style="display: none;">
				<ul>
			     
				</ul>
			</div>
        <input type="hidden" value="${basePath}" id="aa"/>
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
	   var ids="";
	   var names="";
	   var base=$("#aa").val();
		$(function(){
			$('.layer-li-1').click(function(){
				var $this = $(this);
				$("#district").empty();
				 layer.open({
				 	type: 1, 
					shadeClose: true,
					content : $('.layer-warp1'),
					btn:['确定','取消'],
				  	yes: function(){
				  		var oInput = $('.layer-warp1 ul').find('input:checked');
				  		if(oInput.length>1){
				  		   layer.msg('只能选一个');
				  		}else{
				  		var arr = [];
				  		var id ;
				  		var name;
				  		for (var i = 0;i<oInput.length;i++) {
				  			arr.push($(oInput[i]).next().text());
				  			name=$(oInput[i]).next().text();
				  			id=$(oInput[i]).val();
				  			ids=id;
				  		}
				  		var text = oInput.next().text();
				  		$this.text(text);
				  		layer.closeAll();
				  		}
				  		//todo 发送ajax请求，获取选择区域下的商圈
				  		$.ajax({
				  		url:base+"house/searchTradeArea",
				  		type:"post",
				  		data:{
				  		   "ids":ids
				  		},
				  		dataType:"json",
				  		success: function (result) {
				  		    $('.layer-warp2 ul').empty();
							for(var i=0;i<result.length;i++){
							  $('.layer-warp2 ul').append('<li><input type=\"checkbox\"/><label>'+result[i].trade_area_name+'</label></li>');
							}
						},
						error:function(response){
							//出错处理
}
				  	});
				  		
				  	}
				 })
			});
			$('.layer-li-2').click(function(){
				var $this = $(this);
				var areas="";
				oInput = $('.layer-warp1 ul').find('input:checked');
				if(oInput.length==0){
				   layer.msg('请选择期望区域');
				}else{
				 layer.open({
				 	type: 1, 
					shadeClose: true,
					content : $('.layer-warp2'),
					btn:['确定','取消'],
				  	yes: function(){
				  	    $("input[type='checkbox']").attr("checked",false);
				  		var oInput = $('.layer-warp2 ul').find('input:checked');
				  		if(oInput.length>3){
				  		  layer.msg('最多只能选择三个');
				  		}else{
				  		var arr = [];
				  		for (var i = 0;i<oInput.length;i++) {
				  			arr.push(oInput.next().text()+",");
				  			area=$(oInput[i]).next().text();
				  			areas+=area+",";
				  			
				  		}
				  		var text = oInput.next().text();
				  		 areas=areas.substring(0,areas.length-1); 
				  		$this.text(areas);
				  		layer.closeAll();
				  		}
				  	}
				 })
				}
			});
			$('.btn-warp a').click(function(){
				if(!$(this).hasClass('active')){
					$(this).siblings().removeClass('active');
					$(this).addClass('active');
					var type=$(this).text();
					if(type=="出售"){
					  $("#unit").text('元/m²');
					}else{
					   $("#unit").text('m²·月');
					}
				}
			})
		})
		   var demo=$("#myform").Validform({
		      datatype:{
			"phone":function(gets,obj,curform,regxp){
				/*参数gets是获取到的表单元素值，
				  obj为当前表单元素，
				  curform为当前验证的表单，
				  regxp为内置的一些正则表达式的引用。*/
					var reg2=/^1(3|4|5|7|8)[0-9]\d{8}$/,
					mobile=$("#phone");
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
				  submit();
				}
			});
			function submit(){
			var base=$("#aa").val();
                 com=$("#com").val();
                 con=$("#con").val();
                 phone=$("#phone").val();
                 rent=$("#min").val();
                 rent+=-$("#max").val();
                 var data={
                 "find_house_company_name":com,
                 "find_house_type":type,
                 "find_house_city":"重庆",
                 "find_house_district":$('#district').text(),
                 "find_house_price":$("#s").val(),
                 "find_house_trade_area":$('#area').text(),
                 "find_house_acreage":rent,
                 "find_house_name":con,
                 "find_house_phone":phone
                 };
                 $.post(base+'front/findHouse/add',data,function(result){
                     layer.msg('提交成功,请等待我们的工作人员联系您!',{icon:1,time:3000});
                     $("input").val("");
                     $("#area").text("");
                     $("#district").text("");
                      $(".Validform_right").hide();
                 },"json");
			}
			
				
	</script>

</html>