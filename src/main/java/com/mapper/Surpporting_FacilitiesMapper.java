package com.mapper;

import java.util.List;

import com.model.Surpporting_Facilities;
import com.model.pojo.DeletePojo;
import com.model.pojo.House_Supporting_FacilitiesPojo;
import com.model.pojo.PagePojo;

public interface Surpporting_FacilitiesMapper {

	List<Surpporting_Facilities> pageSurpporting_Facilities();

	List<Surpporting_Facilities> pageByConSurpporting_Facilities(PagePojo p);

	int save(Surpporting_Facilities entity);

	int update_Surpporting_Facilities(Surpporting_Facilities entity);

	Surpporting_Facilities findOne(Object id);

	int deleteBatch(DeletePojo pojo);
	
	int saveHouse_Supporting_Facilities(House_Supporting_FacilitiesPojo p);
	
	List<House_Supporting_FacilitiesPojo> selectHouse_Supporting_Facilities(int id);
	
	int deleteHouse_Supporting_Facilities(DeletePojo d);
}
