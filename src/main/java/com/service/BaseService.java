package com.service;

import java.util.List;

import com.model.pojo.PagePojo;


public interface BaseService<T> {
	/**
	 * 根据id查询
	 * @param id
	 * @return
	 */
	public T findOne(Object id);
	
	/**
	 * 保存实体对象
	 * @param entity
	 * @return
	 */
	public int save(T entity);
	
	/**
	 * 修改单个实体对象
	 */
	public int update(T entity);
	
	/**
	 * 更新全部（包含null）
	 * @param entity
	 * @return
	 */
	public int updateAll(T entity);
	
	/**
	 * 更新实体，null值不更新
	 * @param entity
	 * @return
	 */
	public int updateNotNull(T entity);
	
	/**
	 * 根据id删除实体
	 * @param id
	 * @return
	 */
	public int delete(Object id);
	
	public List<T> selectByExample(Object example);
	
	public List<T> queryPage(PagePojo p);
}
