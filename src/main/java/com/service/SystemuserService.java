package com.service;

import java.util.List;

import com.model.Building;
import com.model.Systemuser;
import com.model.Trade_Area;
import com.model.pojo.CityPojo;
import com.model.pojo.PropertyPojo;

public interface SystemuserService {
	/**
	 * 管理员登录
	 * @param name
	 * @param pwd
	 * @return
	 */
	public Systemuser LoginSystemuser(String name,String pwd);
	/**
	 * 城市区县缓存
	 */
	public List<CityPojo> cacheCity();
	/**
	 * 缓存商圈
	 */
	public List<Trade_Area> cacheTrade_Area();
	/**
	 * 缓存楼盘
	 */
	public List<Building> cacheBuilding();
	/**
	 * 物业缓存
	 */
	public List<PropertyPojo> cacheProperty();
	public List<Systemuser> pageSystemUser(String begeinTime,String endTime);
	public void save(Systemuser entity);
	public Systemuser getOneById(Integer id);
	public int update(Systemuser bean);
	public int delete(String ids);
	public List<Systemuser> pageSystemUser();
}
