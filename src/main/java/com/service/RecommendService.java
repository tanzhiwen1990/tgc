package com.service;

import java.util.List;

import com.model.Building;
import com.model.House;
import com.model.Recommend;
import com.model.pojo.DeletePojo;
import com.model.pojo.PageRecommendPojo;
/**
 * 委托找房Service
 * @author MyZhang
 *
 */
public interface RecommendService {
	/**
	 * 分页查询
	 * @return
	 */
	public List<Recommend> pageRecommend();
	/**
	 * 条件查询
	 */
	public List<Recommend> pageRecommend(PageRecommendPojo p);
	/**
	 * 上线下线
	 */
	public int updateRecommendState(Recommend r);
	/**
	 * 删除一个或者多个
	 */
	public int deleteRecommend(DeletePojo ids);
	/**
	 * 添加一个
	 */
	public int insertRecommend(Recommend r);
	
	public List<Recommend> queryByType(String type);
	/**
	 * 修改房源热门状态
	 */
	public int updateHouseishot(House h);
	/**
	 * 修改楼盘热门状态
	 */
	public int updateBuildingishot(Building b);
}
