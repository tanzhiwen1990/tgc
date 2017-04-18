package com.controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.controller.response.PageResponse;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.model.UserInfo;
import com.service.UserInfoService;
import com.util.AppConfig;
import com.util.BasePathUtil;
import com.util.WXAuthUtil;

/**
 * 微信拉取用户授权相关
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/wx")
public class WXController {
	@Autowired
	private UserInfoService us;
	@RequestMapping("/index")
	public String index(HttpServletRequest request,ModelMap model,HttpServletResponse response) throws IOException{
		String basePath=BasePathUtil.getBasePath(request);
		//String callback=basePath+"wx/callback";
		String callback="http://1u5l669025.51mypc.cn/ShareSpace/wx/callback";
		String url="https://open.weixin.qq.com/connect/oauth2/authorize?"
				+ "appid="+WXAuthUtil.APPID+""
				+ "&redirect_uri="+callback+""
				+ "&response_type=code"
				+ "&scope=snsapi_userinfo"
				+ "&state=STATE#wechat_redirect";
		 response.sendRedirect(url);
		 model.addAttribute("basePath", basePath);
		return "wx/index";
	}
	
	
	@RequestMapping("/callback")
	public String callback(HttpServletRequest request,ModelMap model,HttpServletResponse response){
		String code=request.getParameter("code");
		String url="https://api.weixin.qq.com/sns/oauth2/access_token?"
				+ "appid="+WXAuthUtil.APPID
				+ "&secret="+WXAuthUtil.appsecret
				+ "&code="+code
				+ "&grant_type=authorization_code";
		JsonObject jsonObject=WXAuthUtil.post(url);
		
	    String openid=jsonObject.get("openid").toString();
	    openid=openid.substring(1, openid.length()-1);
		
	    String token=jsonObject.get("access_token").toString();
	    token=token.substring(1, token.length()-1);
		String infoUrl="https://api.weixin.qq.com/sns/userinfo?"
				+ "access_token="+token
				+ "&openid="+openid
				+ "&lang=zh_CN";
		//读取用户信息并转成json字符串
		JsonObject object=WXAuthUtil.post(infoUrl);

		//json转object
		UserInfo info=new Gson().fromJson(object, UserInfo.class);
		info.setDate(new Date());
		UserInfo entity=us.get(info.getOpenid());
		//todo 存入数据
		if (entity==null) {
			us.save(info);
		}
		model.addAttribute("info",object);
		model.addAttribute("basePath", BasePathUtil.getBasePath(request));
		return "wx/callback";
	}
	
	
	@GetMapping(value="/getUserInfoList")
	public String list(HttpServletRequest request,ModelMap model,Integer pageNum,Integer pageSize){
		if (pageNum==null) {
			pageNum=1;
		}
		if (pageSize==null) {
			pageSize=AppConfig.pageSize;
		}
		PageHelper.startPage(pageNum, pageSize);
		Page<UserInfo> infoList=(Page<UserInfo>) us.pageUserInfo();
		PageResponse page=new PageResponse(infoList.getPageNum(), infoList.getPageSize(), infoList.getTotal(),
				infoList.getPages(), infoList, true);
		model.addAttribute("page", page);
		model.addAttribute("ctx", BasePathUtil.getBasePath(request));
		return "admin/userinfo_list";
		
	}
	
	
    @RequestMapping(value="/ajaxPage",method=RequestMethod.POST,produces="application/json;charset=utf-8")
	@ResponseBody
	public String ajaxPage(HttpServletRequest request,ModelMap model,Integer pageNum,Integer pageSize){
		if (pageNum==null) {
			pageNum=1;
		}
		if (pageSize==null) {
			pageSize=AppConfig.pageSize;
		}
		PageHelper.startPage(pageNum, pageSize);
		Page<UserInfo> infoList=(Page<UserInfo>) us.pageUserInfo();
		PageResponse page=new PageResponse(infoList.getPageNum(), infoList.getPageSize(), infoList.getTotal(),
				infoList.getPages(), infoList, true);
		return new Gson().toJson(page);
	}
	
	

}
