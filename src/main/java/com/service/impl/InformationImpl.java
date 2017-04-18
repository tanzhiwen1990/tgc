package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mapper.InformationMapper;
import com.model.Information;
import com.service.InfomationService;


@Service
public class InformationImpl implements InfomationService {
    
	@Autowired
	private InformationMapper im;

	@Override
	public List<Information> pageInfomation() {
		return im.pageInfomation();
	}

	@Override
	public List<Information> pageByConInformation(String beginTime, String endTime) {
		return im.pageByConInformation(beginTime,endTime);
	}

	@Override
	public Information findOne(Integer id) {
		return im.findOne(id);
	}

	@Override
	public void save(Information entity) {
		im.save(entity);
		
	}

	@Override
	public int update(Information bean) {
		return im.update(bean);
	}

	@Override
	public int delete(String ids) {
		return im.batchDelete(ids);
	}

	@Override
	public List<Information> findLatest() {
		// TODO Auto-generated method stub
		return im.findLatest();
	}

	@Override
	public List<Information> getPre(Integer id) {
		return im.getPre(id);
	}

	@Override
	public Information getNext(Integer id) {
		return im.getNext(id);
	}
	
	

}
