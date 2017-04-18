
<#--
<div class="g-footer">
			<div class="footer-top">
				<div class="m-content-warp clearfix">
					<p >合作伙伴</p>
					<div class="link-warp clearfix" id="fl">
					
					</div>
				</div>
				<script src="${basePath}static/js/common/jquery-3.1.0.min.js" type="text/javascript" charset="utf-8"></script>
				<script type="text/javascript">
				   $(function(){
				     $.ajax({ 
					        type: "get", 
					        url: "${basePath}" + "index/friendlink",  
					        dataType: "json", 
					        success: function(result) { 
					        if(result.length>0){
					          for(var i=0;i<result.length;i++){
						          var url=result[i].linkurl;
						          if(url.indexOf("http://")==-1&&url.indexOf("https://")==-1){
						              url="http://"+url;
						          }
						          $('#fl').append("<a style=\"margin:5px auto;\" href=\""+url+"\" target=\"_blank\">"+result[i].companyname+"</a>");
					          }
					         }
					        }
						});
					})
				</script>
			</div>
			<div class="footer-bottom">
				<div class="m-content-warp">
					<p class="link-warp">
						<a href="http://www.zhongxiangspace.com/front/article/78.html">关于我们</a><i>|</i>
						<a href="http://www.zhongxiangspace.com/front/article/79.html">联系我们</a><i>|</i>
						<a href="">人才招聘</a><i>|</i>
						<a href="">用户协议</a><i>|</i>
						<script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_1261159065'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s4.cnzz.com/z_stat.php%3Fid%3D1261159065' type='text/javascript'%3E%3C/script%3E"));</script>
					</p>
					<p>Copyright  2016 www.zhongxiangspace.com. All Rights Reserved 渝ICP备16013565号-1</p>
				</div>
			</div>
		</div>
		</div>
-->
<#--
<div class="g-footer" style="float:left;width: 100%;">
    <div class="footer-top">
        <div class="clearfix">
            <p class="link-warp">
                <a href="${basePath}special/about?type=1" target="_blank">关于我们</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;</i>
                <a href="${basePath}special/about" target="_blank">联系我们</a>
              
               
                 &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;</i>
                <a href="javascript:;">人才招聘</a>
                 <a href="javascript:;">用户协议</a><i>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;</i>
                <script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_1261159065'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s4.cnzz.com/z_stat.php%3Fid%3D1261159065' type='text/javascript'%3E%3C/script%3E"));</script>
               
               
            </p>
            <p>联系邮箱：taogc@homesunto.com </p>
            <p>电话: 023-64288028</p>
        </div>
    </div>
    <div class="footer-right">
        <img src="${basePath}static/img/tao/weixin.jpg" alt=""/>
    </div>
    <div class="footer-bottom">
        <span>合作伙伴:</span>
        <a href=""><img src="${basePath}static/img/tao/repa.png" alt=""/></a>
        <a href=""><img src="${basePath}static/img/tao/gaoke.png" alt=""/></a>
        <a href=""><img src="${basePath}static/img/tao/huarun.png" alt=""/></a>
        <a href=""><img src="${basePath}static/img/tao/wanke.png" alt=""/></a>
        <a href=""><img src="${basePath}static/img/tao/youlineng.png" alt=""/></a>
        <a href=""><img src="${basePath}static/img/tao/huangguan.png" alt=""/></a>
    </div>
    <div class="footer-bot">
        <p>Copyright 2016 www.zhongxiangspace.com. All Rights Reserved 渝ICP备16013565号-1</p>
    </div>
</div>

-->
 


<div class="g-footer" style="float:left;width: 100%;">
    <div class="footer-top">
        <div class="clearfix">
            <p class="link-warp">
                <a href="${basePath}special/about?type=1" target="_blank">关于我们</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;</i>
                <a href="${basePath}special/about" target="_blank">联系我们</a>
            </p>
            <span><img src="${basePath}static/img/email.png" alt=""/>&nbsp;邮箱: taogc@homesunto.com&nbsp;&nbsp;&nbsp;&nbsp;<img src="${basePath}static/img/ie.png" alt=""/>&nbsp;www.zhongxiangspace.com</span>
        </div>
    </div>
    <div class="footer-right">
       
        <span><img src="${basePath}static/img/phone.png" alt=""/>&nbsp;&nbsp;023-64288028</span>
    </div>
   
    <div class="footer-bot">
        <p>Copyright 2016 www.zhongxiangspace.com. All Rights Reserved 渝ICP备16013565号-1</p>
    </div>
</div>



