package com.service.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mapper.Surpporting_FacilitiesMapper;
import com.model.Surpporting_Facilities;
import com.model.pojo.DeletePojo;
import com.model.pojo.House_Supporting_FacilitiesPojo;
import com.model.pojo.PagePojo;
import com.service.Surpporting_FacilitiesService;

@Service
public class Surpporting_FacilitiesSerivceImpl extends BaseServiceImpl<Surpporting_Facilities> implements Surpporting_FacilitiesService {
    
	@Autowired
	private Surpporting_FacilitiesMapper sfm;
	
	@Override
	public List<Surpporting_Facilities> pageSurpporting_Facilities() {
		return sfm.pageSurpporting_Facilities();
	}

	@Override
	public List<Surpporting_Facilities> pageByConSurpporting_Facilities(PagePojo p) {
		return sfm.pageByConSurpporting_Facilities( p);
	}

	@Override
	public int save(Surpporting_Facilities entity) {
		return sfm.save(entity);
	}

	@Override
	public int update(Surpporting_Facilities entity) {
		return sfm.update_Surpporting_Facilities(entity);
	}

	@Override
	public Surpporting_Facilities findOne(Object id) {
		return sfm.findOne(id);
	}

	@Override
	public int updateAll(Surpporting_Facilities entity) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateNotNull(Surpporting_Facilities entity) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(Object ids) {
		return sfm.deleteBatch(new DeletePojo((String) ids));
	}

	@Override
	public List<Surpporting_Facilities> selectByExample(Object example) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Surpporting_Facilities> queryPage(PagePojo p) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int saveHouse_Supporting_Facilities(House_Supporting_FacilitiesPojo p) {
		return sfm.saveHouse_Supporting_Facilities(p);
	}

	@Override
	public List<House_Supporting_FacilitiesPojo> selectHouse_Supporting_Facilities(int id) {
		return sfm.selectHouse_Supporting_Facilities(id);
	}

	@Override
	public int deleteHouse_Supporting_Facilities(DeletePojo d) {
		return sfm.deleteHouse_Supporting_Facilities(d);
	}


}
