package com.mapper;

import java.util.List;

import com.model.Trade_Area;
import com.model.pojo.DeletePojo;
import com.model.pojo.PageTrade_AreaPojo;
/**
 * 
 * @author MyZhang
 *
 */
public interface Trade_AreaMapper {
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
	 * 根据id删除
	 */
	public int deleteTrade_Area(DeletePojo dp);
	/**
	 * 录入单个数据
	 */
	public int insertTrade_Area(Trade_Area ta);
	/**
	 * 修改单个数据
	 */
	public int updateTrade_Area(Trade_Area ta);
	/**
	 * 商圈上线下线
	 */
	public int updateTrade_AreaState(Trade_Area ta);
	/**
	 * 根据编号查询
	 */
	public Trade_Area chaOneTrade_Area(int id);
	public List<Trade_Area> queryByHot();
	/**
	 * 地图找房
	 */
	public List<Trade_Area> FindMapTrade_Area();
	
}
