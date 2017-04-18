package com.service;

import java.util.List;

import com.model.Trade_Area;
import com.model.pojo.PageTrade_AreaPojo;

public interface Trade_AreaService extends BaseService<Trade_Area> {
	/**
	 * 分页查询
	 * @return
	 */
	public List<Trade_Area> pageTrade_Area();
	/**
	 * 条件查询
	 */
	public List<Trade_Area> pageTrade_Area2(PageTrade_AreaPojo p);
	/**
	 * 商圈上线下线
	 */
	public int updateTrade_AreaState(Trade_Area ta);
	public List<Trade_Area> queryByHot();
	/**
	 * 地图找房
	 */
	public List<Trade_Area> FindMapTrade_Area();
	
}
