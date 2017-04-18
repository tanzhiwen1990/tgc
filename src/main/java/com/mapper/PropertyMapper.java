package com.mapper;

import java.util.List;

import com.model.Property;
import com.model.pojo.DeletePojo;
import com.model.pojo.PagePojo;

public interface PropertyMapper {

	List<Property> pageProperty();

	List<Property> pageByConProperty(PagePojo p);

	int insert_property(Property entity);

	int update_property(Property entity);

	int delete_property(DeletePojo deletePojo);

	void save(String username, String description, String state, String type, String time);

	void updateByState(String state);

	Property findOne(Object id);

	List<Property> queryPropertyByStatus();
   
}
