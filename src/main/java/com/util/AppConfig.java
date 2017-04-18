package com.util;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.controller.cache.CacheMap;
import com.controller.cache.CacheMapCode;
import com.model.Building;
import com.model.Systemuser;
import com.model.Trade_Area;
import com.model.pojo.CityPojo;
import com.model.pojo.PropertyPojo;
import com.service.impl.SystemuserServiceImpl;

/**   
* @Title: AppConfig.java 
* 
* @Description: TODO 系统全局变量
* 
* @author tianjianping@meloinfo.com 
* 
*/
public class AppConfig {
	public static String cdn_bucket = ReadProperties.getValue("cdn.bucket");
	public static String cdn_key = ReadProperties.getValue("cdn.key");
	public static String cdn_secret = ReadProperties.getValue("cdn.secret");
	public static String cdn_endpoint = ReadProperties.getValue("cdn.endpoint");
	public static String cdn_url = ReadProperties.getValue("cdn.url");
	public static String jpush_appKey = ReadProperties.getValue("jpush.appKey");
	public static String jpush_masterSecret = ReadProperties.getValue("jpush.masterSecret");
	public static long jpush_timeToLive = Long.parseLong(ReadProperties.getValue("jpush.timeToLive"));
	public static String certification_url = ReadProperties.getValue("certification.url");
	public static String certification_apikey = ReadProperties.getValue("certification.apikey");
	public static String user_invitCodeList = ReadProperties.getValue("user.invitcodelist");
	public static String amap_key = ReadProperties.getValue("amap.key");
	public static String amap_positionUrl = ReadProperties.getValue("amap.positionUrl");
	public static String amap_geoUrl = ReadProperties.getValue("amap.geoUrl");
	public static String ak = ReadProperties.getValue("bmap.ak");
	
	public static String bak=ReadProperties.getValue("baidu.ak");
	
	public static String wechat_appId = ReadProperties.getValue("wechat.appId");
	public static String wechat_secret = ReadProperties.getValue("wechat.secret");
	public static String wechat_oauth2redirectUri = ReadProperties.getValue("wechat.oauth2redirectUri");
	
	public static String sms_url = ReadProperties.getValue("sms.url");
	public static String sms_userCode = ReadProperties.getValue("sms.userCode");
	public static String sms_userPass = ReadProperties.getValue("sms.userPass");
	public static int pageSize = 5;
	public final static String loginName= "loginSysUser";
	
	public static String image_addr=ReadProperties.getValue("image.addr");
	public static String img_addr=ReadProperties.getValue("img.addr");
	public static void setCacheMap(SystemuserServiceImpl ss){
		List<CityPojo> list= ss.cacheCity();
		List<Trade_Area> listTrade_Area = ss.cacheTrade_Area();
		List<Building> listsBuilding = ss.cacheBuilding();
		List<PropertyPojo> listProperty = ss.cacheProperty();
		CacheMap.initializationCdcMap(CacheMapCode.City.toString(),list);//缓存城市和区县
		CacheMap.initializationCdcMap(CacheMapCode.Trade_Area.toString(),listTrade_Area);//缓存商圈
		CacheMap.initializationCdcMap(CacheMapCode.Building.toString(),listsBuilding);//缓存楼盘
		CacheMap.initializationCdcMap(CacheMapCode.Property.toString(),listProperty);//缓存物业类型
	}
	//登陆验证
	public static boolean verificationLogin(HttpServletRequest request){
		Systemuser s_user = (Systemuser) request.getSession().getAttribute(AppConfig.loginName);
		if(s_user == null){
			return false;
		} else {
			return true;
		}
	}
	public static String getLoginUserName(HttpServletRequest request){
		Systemuser s_user = (Systemuser) request.getSession().getAttribute(AppConfig.loginName);
		return s_user.getT_user();
	}
	
	public static Systemuser getLoginUser(HttpServletRequest request){
		Systemuser s_user = (Systemuser) request.getSession().getAttribute(AppConfig.loginName);
		return s_user;
	}
}
