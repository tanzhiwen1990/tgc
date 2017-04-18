package com.service;

import java.util.List;
import java.util.Map;

import com.github.pagehelper.Page;
import com.model.Building_Picture;
import com.model.House;
import com.model.House_Picture;
import com.model.pojo.*;

public interface HouseService extends BaseService<House> {
	/**
	 * 分页查询
	 */
	public List<House> pageHouse();
	/**
	 * 条件查询
	 */
	public List<House> pageHouse2(PageHousePojo p);
	/**
	 * 已上线查询
	 * @param text 
	 */
	public Page<Map<String, Object>> pageHouse3(String text);
	/**
	 * 上线下线
	 */
	public int updateHouseState(House h);
	/**
	 * 添加
	 */
	public int insertHouse(HousePojo bp);
	/**
	 * 修改
	 */
	public int updateHouse(HousePojo bp);
	/**
	 * 查询单个
	 */
	public House findOne(HousePojo bp);
	/**
	 * 添加图片
	 */
	public int addHouse_Picture(House_PicturePojo p);
	/**
	 * 地图找房
	 */
	public List<HouseMapPojo> queryFindMapHouse(FindMapHousePojo p);
	/**
	 * 查询图片
	 */
	public List<House_Picture> queryHousePicture(int id);
	public List<Map<String, Object>> queryByHot();
	public List<Map<String,Object>> getDistrict();
	public List<Map<String, Object>> getDomainById(Object id);
	public Map<String ,Object> getById(Integer id);
	public List<Map<String, Object>> getPicById(Integer id);
	public List<Map<String , Object>> getFacilityById(Integer id);
	public List<Map<String, Object>> sortByCon(String con, String paixu, String districtid, Integer propertyid, String keyword);
	public List<Map<String, Object>> getByBuilding(Integer id);
	public Page<Map<String, Object>> getByTradeArea(Integer id);
	public Page<House> search(String con);
	public List<Map<String, Object>> queryHouse(String keyword);
	public List<Map<String, Object>> searchByCondition(String keyword,String type, Integer districtId, Integer domainId,
													   Integer minPirce, Integer maxPrice, String houseType, 
													   Integer minMi, Integer maxMi,String style, String param, String sort);
	public List<Building_Picture> getBuildingPicsById(Integer id);
	public List<Map<String, Object>> getByHouseType(Integer id, String string);
	/**
	 * 根据id删除图片
	 */
	public int deletePicture(DeletePojo ids);
	public List<Map<String, Object>> getTradeByDid(String ids);
	public List<Map<String, Object>> getHouseByParam(Integer id, String type, Integer minMi, Integer maxMi);
	public List<Map<String, Object>> queryFindHouseByCon(FindMapHousePojo f);
	public int updateHouseHot(String ids, String hot);
}
