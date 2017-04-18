package com.service;

import java.util.List;
import java.util.Map;

import com.model.Owner_Building;
import com.model.pojo.PagePojo;

/**
 * 业主放盘Service
 * @author MyZhang
 *
 */
public interface Owner_BuildingService extends BaseService<Owner_Building>{
	/**
	 * 分页查询
	 * @return
	 */
	public List<Owner_Building> pageOwner_Building();
	/**
	 * 条件查询
	 * @return
	 */
	public List<Owner_Building> pageConditionOwner_Building(PagePojo pp);
	public List<Map<String, Object>> queryByHot();
}
