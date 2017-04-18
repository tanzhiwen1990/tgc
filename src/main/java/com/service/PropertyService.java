package com.service;

import java.util.List;

import com.model.Property;
import com.model.pojo.PagePojo;


/**
 * 物业相关接口
 * @author huxiuqin
 *
 */
public interface PropertyService extends BaseService<Property>{

	List<Property> pageProperty();

	List<Property> pageByConProperty(PagePojo p);

	List<Property> queryPropertyByStatus();


}
