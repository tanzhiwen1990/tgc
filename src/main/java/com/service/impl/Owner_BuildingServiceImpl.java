package com.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mapper.Owner_BuildingMapper;
import com.model.Owner_Building;
import com.model.pojo.PagePojo;
import com.service.Owner_BuildingService;
@Service
public class Owner_BuildingServiceImpl extends BaseServiceImpl<Owner_Building>implements Owner_BuildingService {
	
	@Autowired
	private Owner_BuildingMapper ob;
	@Override
	public List<Owner_Building> pageOwner_Building() {
		return ob.pageOwner_Building();
	}
	@Override
	public List<Owner_Building> pageConditionOwner_Building(PagePojo pp) {
		return ob.pageConditionOwner_Building(pp);
	}
	@Override
	public Owner_Building findOne(Object id) {
		return ob.findOne(id);
	}
	@Override
	public int save(Owner_Building entity) {
		return ob.save(entity);
	}
	@Override
	public int update(Owner_Building entity) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int updateAll(Owner_Building entity) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int updateNotNull(Owner_Building entity) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int delete(Object id) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public List<Owner_Building> selectByExample(Object example) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<Owner_Building> queryPage(PagePojo p) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<Map<String, Object>> queryByHot() {
		return ob.queryByHot();
	}
}
