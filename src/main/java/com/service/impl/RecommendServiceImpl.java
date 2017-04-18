package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mapper.RecommendMapper;
import com.model.Building;
import com.model.House;
import com.model.Recommend;
import com.model.pojo.DeletePojo;
import com.model.pojo.PageRecommendPojo;
@Service
public class RecommendServiceImpl implements com.service.RecommendService {
	@Autowired
	private RecommendMapper rm;
	
	@Override
	public List<Recommend> pageRecommend() {
		return rm.pageRecommend();
	}

	@Override
	public List<Recommend> pageRecommend(PageRecommendPojo p) {
		return rm.pageRecommend2(p);
	}

	@Override
	public int updateRecommendState(Recommend r) {
		return rm.updateRecommendState(r);
	}

	@Override
	public int deleteRecommend(DeletePojo ids) {
		return rm.deleteRecommend(ids);
	}

	@Override
	public int insertRecommend(Recommend r) {
		return rm.insertRecommend(r);
	}

	@Override
	public List<Recommend> queryByType(String type) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateHouseishot(House h) {
		return rm.updateHouseishot(h);
	}

	@Override
	public int updateBuildingishot(Building b) {
		return rm.updateBuildingishot(b);
	}
}
