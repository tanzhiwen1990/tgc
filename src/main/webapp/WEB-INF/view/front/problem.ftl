<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>知识问答</title>
		<link rel="stylesheet" type="text/css" href="${basePath}static/tao/common.css" />
		<link rel="stylesheet" type="text/css" href="${basePath}static/tao/reset.css" />
		<link rel="stylesheet" type="text/css" href="${basePath}static/tao/problem.css"/>
	</head>

	<body>
		<#include "/include/header.ftl">
		<div class="m-location m-content-warp">
			<span>当前位置：</span>
			<a href="${basePath}index">首页</a>&gt;<a href="" class="active">资讯</a>
		</div>
		<div class=" m-content-warp clearfix">
			<div class="problem-tittle">
				知识问答
			</div>
			<div class="problem-content clearfix">
			<#list page.data as p>
				<div class="problem-item ">
					<h2 class="clearfix"><i>Q</i><a href="javascript:;">${p.title!}？ </a> </h2>
					<p class="clearfix"><i>A</i><span>${p.answer}。</span></p>
				</div>
			</#list>	
			</div>
		</div>
		<#include "/include/footer.ftl"/>
		<script type="text/javascript">
			window.onload = function() {
				var oP = document.getElementsByClassName('problem-item');
				for(var i = 0; i < oP.length; i++) {
					del_ff(oP[i])
					oP[i].firstChild.onclick = function() {
						this.nextSibling.style.display=='block'?this.nextSibling.style.display='none':this.nextSibling.style.display='block';
						this.className == 'active'?this.className = '':this.className = 'active';
					}
				}

			}

			function del_ff(elem) {
				var elem_child = elem.childNodes;
				for(var i = 0; i < elem_child.length; i++) {
					if(elem_child[i].nodeName == "#text" && !/\s/.test(elem_child.nodeValue)) {
						elem.removeChild(elem_child[i])
					}
				}
			}
       </script>
	</body>

</html>