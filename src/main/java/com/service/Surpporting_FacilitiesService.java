package com.service;

import java.util.List;

import com.model.Surpporting_Facilities;
import com.model.pojo.DeletePojo;
import com.model.pojo.House_Supporting_FacilitiesPojo;
import com.model.pojo.PagePojo;

public interface Surpporting_FacilitiesService extends BaseService<Surpporting_Facilities>{

	List<Surpporting_Facilities> pageByConSurpporting_Facilities(PagePojo p);
	
	List<Surpporting_Facilities> pageSurpporting_Facilities();
	
	public int saveHouse_Supporting_Facilities(House_Supporting_FacilitiesPojo p);
	
	public List<House_Supporting_FacilitiesPojo> selectHouse_Supporting_Facilities(int id);
	
	public int deleteHouse_Supporting_Facilities(DeletePojo d);
}
