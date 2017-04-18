package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mapper.Trade_AreaMapper;
import com.model.Trade_Area;
import com.model.pojo.DeletePojo;
import com.model.pojo.PagePojo;
import com.model.pojo.PageTrade_AreaPojo;
import com.service.Trade_AreaService;
/**
 * 商圈ServiceImpl
 * @author MyZhang
 *
 */
@Service
public class Trade_AreaServiceImpl implements Trade_AreaService {
	@Autowired
	private Trade_AreaMapper tam;

	@Override
	public Trade_Area findOne(Object id) {
		return tam.chaOneTrade_Area(Integer.parseInt(id.toString()));
	}

	@Override
	public int save(Trade_Area entity) {
		return tam.insertTrade_Area(entity);
	}

	@Override
	public int updateAll(Trade_Area entity) {
		return 0;
	}

	@Override
	public int updateNotNull(Trade_Area entity) {
		return 0;
	}

	@Override
	public int delete(Object id) {
		return tam.deleteTrade_Area(new DeletePojo((String)id));
	}

	@Override
	public List<Trade_Area> selectByExample(Object example) {
		return null;
	}

	@Override
	public List<Trade_Area> queryPage(PagePojo p) {
		return null;
	}

	@Override
	public List<Trade_Area> pageTrade_Area() {
		return tam.pageTrade_Area();
	}

	@Override
	public List<Trade_Area> pageTrade_Area2(PageTrade_AreaPojo p) {
		return tam.pageTrade_Area2(p);
	}

	@Override
	public int update(Trade_Area entity) {
		return tam.updateTrade_Area(entity);
	}

	@Override
	public int updateTrade_AreaState(Trade_Area ta) {
		return tam.updateTrade_AreaState(ta);
	}

	@Override
	public List<Trade_Area> queryByHot() {
		return tam.queryByHot();
	}

	@Override
	public List<Trade_Area> FindMapTrade_Area() {
		return tam.FindMapTrade_Area();
	}

}
