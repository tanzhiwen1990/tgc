package com.controller;

import java.util.Map;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.util.AmapHelper;

/**   
* @Title: FollowController.java 
* 
* @Description: TODO 关注
* 
* @author tianjianping@meloinfo.com 
* 
* @date 2016年9月1日 下午4:48:39 
*/
@RestController
@RequestMapping("/area")
public class AreaController {
	/**
	 * 根据地址获取经纬度
	 */
	@RequestMapping(value = "/reposition", method = RequestMethod.POST)
	public Map<String, Object> getRePosition(String city, String address){
		return AmapHelper.getGeo(address.replaceAll("\\s*", ""), city.replaceAll("\\s*", ""));
	}
	
	/**
	 * 根据经纬度获取地址详细信息
	 */
	@RequestMapping(value = "/positiondetail", method = RequestMethod.GET)
	public Map<String, Object> getPositionDetail(double longitude, double latitude){
		
		return AmapHelper.getPositionDetail(longitude, latitude);
	}
}
