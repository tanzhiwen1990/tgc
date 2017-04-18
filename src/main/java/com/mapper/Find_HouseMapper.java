package com.mapper;

import java.util.List;

import com.model.Find_House;
import com.model.pojo.PagePojo;

/**
 * 委托找房
 * @author MyZhang
 *
 */
public interface Find_HouseMapper {
	/**
	 * 分页查询
	 * @return
	 */
	public List<Find_House> pageFind_House();
	/**
	 * 条件查询
	 */
	public List<Find_House> pageFind_House2(PagePojo p);
	public int save(Find_House entity);
}
