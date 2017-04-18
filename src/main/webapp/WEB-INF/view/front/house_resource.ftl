<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>业主放盘</title>
		<link rel="stylesheet" type="text/css" href="${basePath}static/tao/common.css"/>
		<link rel="stylesheet" type="text/css" href="${basePath}static/tao/reset.css"/>
		<link rel="stylesheet" type="text/css" href="${basePath}static/tao/online-listing.css"/>
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
					<a href="${basePath}index/findHouses" >找房源</a>
					<a href="${basePath}index/findBuildings" >热门楼盘</a>
					<a href="${basePath}index/findRoom"  >委托找楼</a>
					<a href="${basePath}index/house_resource"   class="active">业主放盘</a>
                </div>
            </div>
        </div>
		<div class="clearfix m-main-warp input-warp">
			<h1>业主放盘</h1>
			<div  class="form-listing" id="myform">
				<div class="form-list fangyuan">
					<span>房源类型：</span>
					<div class="f-warp active">出租</div>
					<div class="f-warp">出售</div>
				</div>
				<div class="form-list">
					<span>大厦名称：</span>
					<input type="text" id="com" datatype="*" sucmsg=" " nullmsg=" "  />
				</div>
				<div class="form-list loucheng">
					<span>楼层房号：</span>
					<div class="lou-warp">
						<em>第</em>
						<input type="text" id="f"  />		
						<em>层</em>
					</div>
					<i></i>
					<div class="lou-warp">
						<em>第</em>
						<input type="text" id="r"   />		
						<em>号</em>
					</div>
				</div>
				<div class="form-list">
					<span>建筑面积：</span>
					<input type="text" id="mi" datatype="n2-4" sucmsg=" " errormsg="" nullmsg=" " /><b>m²</b>
				</div>
				<div class="form-list">
					<span>出租价格：</span>
					<input type="text" id="price" name="price" datatype="n" sucmsg=" " errormsg="" nullmsg=" " />
					<b id="unit">元/m²·月</b>
				</div>
				<div class="form-list">
					<span>联系人&nbsp;&nbsp;&nbsp;：</span>
					<input type="text" id="con" datatype="s2-4" sucmsg=" " errormsg=" " nullmsg=" "  />
				</div>
				<div class="form-list">
					<span>联系电话：</span>
					<input type="text" id="phone" name="phone" datatype="phone" sucmsg=" " nullmsg=" " errormsg="请填写电话号码" />
				</div>
				<span id="btn-sub" style=" margin-left: auto;margin-right: auto;width: 65%;">确认</span>
			</div>
          <#include "/include/footer.ftl"/>
		<input type="hidden" value="${basePath}" id="base"/>
		
		<script src="${basePath}static/js/common/jquery-3.1.0.min.js" type="text/javascript" charset="utf-8"></script>
        <script type="text/javascript" src="${basePath}static/js/Validform_v5.3.2_min.js"></script>
        <script type="text/javascript" src="${basePath}/lib/layer/2.1/layer.js"></script> 
        <script>
		$(function(){
		  var type=$('.f-warp').find('a.active').text();
		   $('.f-warp').click(function(){
					$(this).siblings().removeClass('active');
					$(this).addClass('active');
					type=$(this).text();
					if(type=="出售"){
					  $("#unit").text('元/m²');
					}else{
					   $("#unit").text('m²·月');
					}
				});
				
				
			  var demo=$("#myform").Validform({
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
				     mi=$("#mi").val();
				     price=$("#price").val();
	                 rn=$("#f").val();
	                 rn+=-$("#r").val();
	                 com=$("#com").val();
	                 con=$("#con").val();
	                 phone=$("#phone").val();
	                 var data={"owner_building_name":com,"owner_building_type":type,"owner_building_price":price,
	                 "owner_building_mi":mi,"owner_building_number":rn,"owner_building_linkman":con,"owner_building_phone":phone};
	                 $.post(base+'front/owner/add',data,function(result){
	                 $("#myform input").val("");
	                 $(".Validform_right").hide();
                     layer.msg('提交成功,请等候客服人员联系你!',{icon:1,time:3000});
                 },"json");
		   
				}
		 })

		</script>
		<#include "/include/stastics.ftl"/>
	</body>
</html>
