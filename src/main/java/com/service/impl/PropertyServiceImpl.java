package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mapper.PropertyMapper;
import com.model.Property;
import com.model.pojo.DeletePojo;
import com.model.pojo.PagePojo;
import com.service.PropertyService;

@Service("propertyService")
public class PropertyServiceImpl extends BaseServiceImpl<Property> implements PropertyService{
    @Autowired
	private PropertyMapper propertyMapper;
	@Override
	public List<Property> pageProperty() {
		return propertyMapper.pageProperty();
	}

	@Override
	public List<Property> pageByConProperty(PagePojo p) {
		return propertyMapper.pageByConProperty( p);
	}

	@Override
	public Property findOne(Object id) {
		return propertyMapper.findOne(id);
	}

	@Override
	public int save(Property entity) {

		return propertyMapper.insert_property(entity);
	}

	@Override
	public int update(Property entity) {
		return propertyMapper.update_property(entity);
	}

	@Override
	public int updateAll(Property entity) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateNotNull(Property entity) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(Object ids) {
		return propertyMapper.delete_property(new DeletePojo((String)ids));
	}

	@Override
	public List<Property> selectByExample(Object example) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Property> queryPage(PagePojo p) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Property> queryPropertyByStatus() {
		// TODO Auto-generated method stub
		return propertyMapper.queryPropertyByStatus();
	}

	

}
