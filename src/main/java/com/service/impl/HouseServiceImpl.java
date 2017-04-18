package com.service.impl;

import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.mapper.HouseMapper;
import com.model.Building_Picture;
import com.model.House;
import com.model.House_Picture;
import com.model.pojo.DeletePojo;
import com.model.pojo.FindMapHousePojo;
import com.model.pojo.HouseMapPojo;
import com.model.pojo.HousePojo;
import com.model.pojo.House_PicturePojo;
import com.model.pojo.PageHousePojo;
import com.model.pojo.PagePojo;
import com.service.HouseService;
@Service
public class HouseServiceImpl implements HouseService{
	@Autowired
	private HouseMapper hm;
	@Override
	public House findOne(Object id) {
		return null;
	}

	@Override
	public int save(House entity) {
		return 0;
	}

	@Override
	public int update(House entity) {
		return 0;
	}

	@Override
	public int updateAll(House entity) {
		return 0;
	}

	@Override
	public int updateNotNull(House entity) {
		return 0;
	}

	@Override
	public int delete(Object id) {
		return hm.deleteHouse(new DeletePojo((String)id));
	}

	@Override
	public List<House> selectByExample(Object example) {
		return null;
	}

	@Override
	public List<House> queryPage(PagePojo p) {
		return null;
	}

	@Override
	public List<House> pageHouse() {
		return hm.pageHouse();
	}

	@Override
	public List<House> pageHouse2(PageHousePojo p) {
		return hm.pageHouse2(p);
	}

	@Override
	public int updateHouseState(House h) {
		return hm.updateHouseState(h);
	}

	@Override
	public int insertHouse(HousePojo bp) {
		return hm.insertHouse(bp);
	}

	@Override
	public int updateHouse(HousePojo bp) {
		return hm.updateHouse(bp);
	}

	@Override
	public House findOne(HousePojo bp) {
		return hm.findOne(bp);
	}

	@Override
	public int addHouse_Picture(House_PicturePojo p) {
		return hm.addHouse_Picture(p);
	}

	@Override
	public List<Map<String, Object>> queryByHot() {
		return hm.queryByHot();
	}

	@Override
	public List<Map<String, Object>> getDistrict() {
		return hm.getDistrict();
	}

	@Override
	public List<Map<String, Object>> getDomainById(Object id) {
		return hm.getDomainById(id);
	}

	@Override
	public Map<String, Object> getById(Integer id) {
		return hm.getById(id);
	}

	@Override
	public List<Map<String, Object>> getPicById(Integer id) {
		return hm.getPicById(id);
	}

	@Override
	public List<Map<String, Object>> getFacilityById(Integer id) {
		return hm.getFacilityById(id);
	}

	@Override
	public List<Map<String, Object>> sortByCon(String con,String paixu,String districtid,Integer propertyid,String keyword) {
		return hm.sortByCon(con,paixu,districtid,propertyid,keyword);
	}

	@Override
	public List<Map<String, Object>> getByBuilding(Integer id) {
		return hm.getByBuilding(id);
	}

	@Override
	public Page<Map<String , Object>> getByTradeArea(Integer id) {
		return hm.getByTradeArea(id);
	}

	@Override
	public Page<House> search(String con) {
		return hm.search(con);
	}

	@Override
	public List<Map<String, Object>> queryHouse(String keyword) {
		return hm.queryHouse(keyword);
	}

	@Override
	public List<Map<String, Object>> searchByCondition(String keyword,String type, Integer districtId, Integer domainId,
													   Integer minPirce, Integer maxPrice, String houseType,
													   Integer minMi, Integer maxMi,String style,String param,String sort) {
		return hm.searchByCondition(keyword,type,districtId,domainId,
				minPirce,maxPrice,houseType, minMi,maxMi,style,param,sort);
	}

	@Override
	public List<HouseMapPojo> queryFindMapHouse(FindMapHousePojo p) {
		return hm.queryFindMapHouse(p);
	}

	@Override
	public Page<Map<String, Object>> pageHouse3(String text) {
		return hm.pageHouse3(text);
	}

	@Override

	public List<Building_Picture> getBuildingPicsById(Integer id) {
		return hm.getBuildingPicsById(id);
	}


	public List<House_Picture> queryHousePicture(int id) {
		return hm.queryHousePicture(id);
	}

	@Override
	public List<Map<String, Object>> getByHouseType(Integer id, String type) {

		return hm.getByHouseType(id,type);
	}

	@Override
	public int deletePicture(DeletePojo ids) {
		return hm.deletePicture(ids);
	}

	@Override
	public List<Map<String, Object>> getTradeByDid(String ids) {
		return hm.getTradeByDid(ids);
	}

	@Override
	public List<Map<String, Object>> getHouseByParam(Integer id, String type, Integer minMi, Integer maxMi) {
		
		return hm.getHouseByParam(id,type,minMi,maxMi);
	}

	@Override
	public List<Map<String, Object>> queryFindHouseByCon(FindMapHousePojo f) {
		return hm.queryFindHouseByCon(f);
	}

	@Override
	public int updateHouseHot(String ids, String hot) {
		return hm.updateHouseHot(ids, hot);
	}


}
