package com.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.model.Building;
import com.model.Permission;
import com.model.Systemuser;
import com.model.Trade_Area;
import com.model.pojo.CityPojo;
import com.model.pojo.PropertyPojo;

public interface SystemuserMapper {
	/**
	 * 用户登录
	 */
	public Systemuser LoginSystemuser(Systemuser s);
	/**
	 * 城市区县缓存
	 */
	public List<CityPojo> cacheCity();
	/**
	 * 缓存商圈
	 */
	public List<Trade_Area> cacheTrade_Area();
	/**
	 * 缓存商圈
	 */
	public List<Building> cacheBuilding();
	/**
	 * 物业缓存
	 */
	public List<PropertyPojo> cacheProperty();
	public List<Systemuser> pageSystemUser();
	public void save(Systemuser entity);
	public Systemuser getOneById(@Param(value="id")Integer id);
	public int update(Systemuser bean);
	public int delete(@Param(value="ids")String ids);
	public List<Permission> getPermissionByRoleId(Integer roleid);
	public Systemuser LoginSystemuser(String name, String pwd);
	public Map<String , Object> getRoleByRoleId(@Param(value="roleid")Integer roleid);
	public List<Systemuser> pageSystemUserByCon(@Param(value="beginTime")String begeinTime, @Param(value="endTime")String endTime);
}
