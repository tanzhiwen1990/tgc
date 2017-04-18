package com.service.impl;

import java.util.List;

import com.model.pojo.PagePojo;
import com.service.BaseService;

public abstract class BaseServiceImpl<T> implements BaseService<T>{
	
	public abstract T findOne(Object id);

	public abstract int save(T entity);

	public abstract int updateAll(T entity);

	public abstract int updateNotNull(T entity);

	public abstract int delete(Object id);

	public abstract List<T> selectByExample(Object example);
	
	public abstract List<T> queryPage(PagePojo p) ;
}
