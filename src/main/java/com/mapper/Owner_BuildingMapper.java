package com.mapper;

import java.util.List;
import java.util.Map;

import com.model.Owner_Building;
import com.model.pojo.PagePojo;

/**
 * 业主放盘Mapper
 * @author MyZhang
 *
 */
public interface Owner_BuildingMapper {

	public List<Owner_Building> pageOwner_Building();
	/**
	 * 条件查询
	 * @return
	 */
	public List<Owner_Building> pageConditionOwner_Building(PagePojo pp);
	public Owner_Building findOne(Object id);
	public List<Map<String, Object>> queryByHot();
	public int save(Owner_Building entity);
}
