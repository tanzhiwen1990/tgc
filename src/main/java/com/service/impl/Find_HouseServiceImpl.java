package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mapper.Find_HouseMapper;
import com.model.Find_House;
import com.model.pojo.PagePojo;
import com.service.Find_HouseService;
@Service
public class Find_HouseServiceImpl implements Find_HouseService {
	
	@Autowired
	private Find_HouseMapper fh;
	
	@Override
	public List<Find_House> pageFind_House() {
		return fh.pageFind_House();
	}

	@Override
	public List<Find_House> pageFind_House2(PagePojo p) {
		return fh.pageFind_House2(p);
	}

	@Override
	public int save(Find_House entity) {
		return fh.save(entity);
	}

}
