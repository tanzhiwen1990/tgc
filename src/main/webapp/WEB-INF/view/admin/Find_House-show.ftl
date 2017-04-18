<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<script type="text/javascript" src="lib/PIE_IE678.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="${basePath}static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="${basePath}static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="${basePath}lib/Hui-iconfont/1.0.7/iconfont.css" />
<link rel="stylesheet" type="text/css" href="${basePath}lib/icheck/icheck.css" />
<link rel="stylesheet" type="text/css" href="${basePath}static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="${basePath}static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>查看</title>
</head>
<body>
<div class="cl pd-20" style=" background-color:#5bacb6">
  <dl style="margin-left:40px; color:#fff">
  </dl>
</div>
<div class="pd-20">
  <table class="table">
    <tbody>
      <tr>
        <th class="text-r">编号：</th>
        <td>${data.find_house_id}</td>
      </tr>
      <tr>
        <th class="text-r">公司名称：</th>
        <td>${data.find_house_company_name}</td>
      </tr>
      <tr>
        <th class="text-r">房源类型：</th>
        <td>${data.find_house_type}</td>
      </tr>
      <tr>
        <th class="text-r">城市：</th>
        <td>${data.find_house_city}</td>
      </tr>
      <tr>
        <th class="text-r">区域：</th>
        <td>${data.find_house_district}</td>
      </tr>
      <tr>
        <th class="text-r">商圈：</th>
        <td>${data.find_house_trade_area}</td>
      </tr>
      <tr>
        <th class="text-r">期望面积：</th>
        <td>${data.find_house_acreage}㎡</td>
      </tr>
      <tr>
        <th class="text-r">期望价格：</th>
        <#if data.find_house_type == '求售'>
        	<td>${data.find_house_price}元/㎡</td>
        <#else>
        	<td>${data.find_house_price}元/月</td>
        </#if>
      </tr>
      <tr>
        <th class="text-r">联系人：</th>
        <td>${data.find_house_name}</td>
      </tr>
      <tr>
        <th class="text-r">联系电话：</th>
        <td>${data.find_house_phone}</td>
      </tr>
      <tr>
        <th class="text-r">提交时间：</th>
        <td>${data.find_house_time?string('yyyy-MM-dd HH:mm:ss')}</td>
      </tr>
    </tbody>
  </table>
</div>
<script type="text/javascript" src="${basePath}js/jquery.min.js"></script> 
<script type="text/javascript" src="${basePath}static/h-ui/js/H-ui.js"></script>
<script type="text/javascript" src="${basePath}static/h-ui.admin/js/H-ui.admin.js"></script>
</body>
</html>