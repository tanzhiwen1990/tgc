package com.mapper;

import java.util.List;

import com.model.House;
import com.model.Trade_Area;

public interface FindMapHouseMapper {
	/**
	 * 商圈 
	 */
	public List<Trade_Area> mapTrade_Area();
	/**
	 * 房源
	 */
	public List<House> mapHouse();
}
