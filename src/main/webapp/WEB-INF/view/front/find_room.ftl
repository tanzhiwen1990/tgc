
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>委托找楼</title>
		<link rel="stylesheet" type="text/css" href="${basePath}static/tao/common.css"/>
		<link rel="stylesheet" type="text/css" href="${basePath}static/tao/reset.css"/>
		<link rel="stylesheet" type="text/css" href="${basePath}static/tao/find-room.css"/>
		<script src="${basePath}static/js/common/jquery-3.1.0.min.js" type="text/javascript" charset="utf-8"></script>
        <script type="text/javascript" src="${basePath}static/js/Validform_v5.3.2_min.js"></script>
        <script type="text/javascript" src="${basePath}/lib/layer/2.1/layer.js"></script> 
        <link rel="icon"href="${basePath}static/img/tao/title-icon2.png" type="image/x-icon"/>
		<#include "/include/head.ftl">
       
	</head>
	<body>
		        <div class="g-nav-warp">
            <div class="m-content-warp clearfix nav-top">
               	<a href="${basePath}index"  ><img  class="logo-img" src="${basePath}static/img/tao/logo1.png" /></a>

                <div class="nav">
                    <a href="${basePath}index"  >首页</a>
					<a href="${basePath}index/findHouses"  >找房源</a>
					<a href="${basePath}index/findBuildings"  >热门楼盘</a>
					<a href="${basePath}index/findRoom"   class="active">委托找楼</a>
					<a href="${basePath}index/house_resource"  >业主放盘</a>
                </div>
            </div>
        </div>
		
		<div class="clearfix m-main-warp input-warp">
			<h1>委托找楼</h1>
			<div  class="form-find">
				<div class="form-list fangyuan clearfix" id="type">
					<span>房源类型：</span>
					<div class="f-warp active">出租</div>
					<div class="f-warp">出售</div>
				</div>	
				<div class="form-list area-warp clearfix">
					<span>期望区域：</span>
					<div class="area-title active clearfix" id="district">
						<a href="javascript:;" class="unlimited" id="aa" >不限</a>
						<#list district as d>
						 <#if d_index=0>
						 <a href="javascript:;" > ${d.district_name}</a>
						 <#else>
						   <a href="javascript:;">${d.district_name}</a>
						 </#if>
						</#list>
					</div>
					<div class="area-content-warp">
					<#list domain as a>
					   <div class="area-content clearfix" style="display:none;" id="area">
						<a  class="active" id="de">不限</a>
						<#list a as r>
						  <a href="javascript:;"> ${r.trade_area_name}</a>
						</#list>
					</div>
					
				   </#list>
				</div>	
				</div>
				<div class="form-list loucheng clearfix">
					<span>期望面积：</span>
					<div class="lou-warp">
						<input type="text" datatype="n2-4" sucmsg=" " errormsg="" nullmsg=" " id="min"/>	
					</div>
					<i></i>
					<div class="lou-warp">
						<input type="text" datatype="n2-4" sucmsg=" " errormsg="" nullmsg=" " id="max"/>	
					</div>
					<b>m²</b>
				</div>
				
				<div class="form-list  clearfix" style="margin-top:20px;">
					<span>价格：</span>
					<input type="text" id="price" datatype="n" sucmsg=" " errormsg="" nullmsg=" " />
					<b id="unit">元/m²·月</b>
				</div>
				
				<div class="form-list clearfix">
					<span>公司名称：</span>
					<input type="text" datatype="s"  id="com" name="find_house_name" sucmsg=" " errormsg="" nullmsg=" " />
				</div>
				<div class="form-list clearfix">
					<span>联系人：</span>
					<input type="text" datatype="*" id="con" name="find_house_phone" sucmsg=" " errormsg="" nullmsg=" "/>
				</div>
				<div class="form-list clearfix">
					<span>联系电话：</span>
					<input type="text" datatype="m" id="phone" sucmsg=" " errormsg="" nullmsg=" "/>
				</div>
				<span id="btn-sub" style=" margin-left: auto;margin-right: auto;width: 30%;">确认</span>
			</div>
				<input type="hidden" value="${basePath}" id="base"/>
		<#include "/include/footer.ftl"/>
		<script src="${basePath}static/js/common/jquery-3.1.0.min.js" type="text/javascript" charset="utf-8"></script>
        <script type="text/javascript" src="${basePath}static/js/Validform_v5.3.2_min.js"></script>
        <script type="text/javascript" src="${basePath}/lib/layer/2.1/layer.js"></script> 
		<script>
			$(function(){
			 var area="不限";
			     type="出租";
			     district="不限";
			  $('.area-title a').click(function(){
					var $index = $(this).index()-1;
					$(this).siblings().removeClass('active');
					$(this).addClass('active');
					$("#aa").removeClass('unlimited');
					district=$(this).text();
					if ($(this).attr("id")=="aa") {
					    $(this).addClass('unlimited');
						$('.area-content-warp .area-content').hide();
					}else{
						$('.area-content-warp .area-content').hide();
					    $('.area-content-warp .area-content').eq($index).show();
					}
					
				})
			
				$('.area-content a').click(function(){
				    $(this).parent().find('#de').removeClass('active');
					//$("#de").removeClass('active');
					if($(this).attr("class")=='active'){
					   $(this).removeClass('active');
					   return 0;
					}
					if($(this).parent().find('.active').length<3){
					    $(this).addClass('active');
					    if($(this).parent().find('.active').length<=1){
						area=$(this).text();
						}
						if($(this).parent().find('.active').length>1&&$(this).parent().find('.active').length<=3){
						 area+="-"+$(this).text();
						}
						}else{
						   alert("最多只能选择三个");
						}
					
				})
				$('.f-warp').click(function(){
					$(this).siblings().removeClass('active');
					$(this).addClass('active');
					type=$(this).text();
					if(type=="出售"){
					  $("#unit").text('元/m²');
					}else{
					   $("#unit").text('m²·月');
					}
				})
				
			  var demo=$(".form-find").Validform({
				tiptype:3,
				btnSubmit:"#btn-sub", 
				label:".label",
				showAllError:false,
				ajaxPost:false,
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
				callback:function(){
				  submit();
				}
			});
			function submit(){
			var base=$("#base").val();
			     mi=$("#min").val();
			     mi+=-$("#max").val();
                 rn=$("#f").val();
                 rn+=-$("#r").val();
                 com=$("#com").val();
                 con=$("#con").val();
                 price=$("#price").val();
                 phone=$("#phone").val();
                 var data={"find_house_company_name":com,"find_house_type":type,"find_house_city":"重庆","find_house_district":district,"find_house_price":price,
                 "find_house_trade_area":area,"find_house_acreage":mi,"find_house_name":con,"find_house_phone":phone};
                 $.post(base+'front/findHouse/add',data,function(result){
                     layer.msg('提交成功,请等候客服人员联系你!',{icon:1,time:3000});
                     $("#myform input").val("");
                     $(".Validform_right").hide();
                     $("#aa").addClass('unlimited');
                     $("#aa").siblings().removeClass('active');
                     $("#area").hide();
                 },"json");
			}
			})
			
		</script>
		<#include "/include/stastics.ftl"/>
	</body>
</html>
