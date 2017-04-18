package com.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mapper.SystemuserMapper;
import com.model.Building;
import com.model.Permission;
import com.model.Systemuser;
import com.model.Trade_Area;
import com.model.pojo.CityPojo;
import com.model.pojo.PropertyPojo;
import com.service.SystemuserService;
@Service
public class SystemuserServiceImpl implements SystemuserService {
	@Autowired
	private SystemuserMapper sm;
	@Override
	public Systemuser LoginSystemuser(String name, String pwd) {
			Systemuser s = new Systemuser(name, "", "", "", null, pwd,"");
			return sm.LoginSystemuser(s);
	}
	@Override
	public List<CityPojo> cacheCity() {
		return sm.cacheCity();
	}
	@Override
	public List<Trade_Area> cacheTrade_Area() {
		return sm.cacheTrade_Area();
	}
	@Override
	public List<Building> cacheBuilding() {
		return sm.cacheBuilding();
	}
	@Override
	public List<PropertyPojo> cacheProperty() {
		return sm.cacheProperty();
	}
	@Override
	public List<Systemuser> pageSystemUser() {
		
		return sm.pageSystemUser();
	}
	@Override
	public void save(Systemuser entity) {
		sm.save(entity);
		
	}
	@Override
	public Systemuser getOneById(Integer id) {
		return sm.getOneById(id);
	}
	@Override
	public int update(Systemuser bean) {
		return sm.update(bean);
		
	}
	@Override
	public int delete(String ids) {
		
		return sm.delete(ids);
	}
	public String getPermissionByRoleId(Integer roleid) {
		
		List<Permission> pList=sm.getPermissionByRoleId(roleid);
		StringBuffer sb=new StringBuffer();
		for (int i = 0; i < pList.size(); i++) {
		}
		return sb.toString();
	}
	public Map<String , Object> getRoleByRoleId(Integer roleid) {
		
		return sm.getRoleByRoleId(roleid);
	}
	@Override
	public List<Systemuser> pageSystemUser(String begeinTime, String endTime) {
		
		return sm.pageSystemUserByCon(begeinTime,endTime);
	}
	

}
