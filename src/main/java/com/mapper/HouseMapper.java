package com.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import com.github.pagehelper.Page;
import com.model.Building_Picture;
import com.model.House;
import com.model.House_Picture;
import com.model.pojo.DeletePojo;
import com.model.pojo.FindMapHousePojo;
import com.model.pojo.HouseMapPojo;
import com.model.pojo.HousePojo;
import com.model.pojo.House_PicturePojo;
import com.model.pojo.PageHousePojo;
import com.util.BaseMapper;

public interface HouseMapper extends BaseMapper<House> {
	/**
	 * 分页查询
	 * @return
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
	public Page<Map<String, Object>> pageHouse3(@Param(value="text")String text);
	/**
	 * 上线下线
	 */
	public int updateHouseState(House h);
	/**
	 * 	删除
	 */
	public int deleteHouse(DeletePojo d);
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
	public List<Map<String, Object>> getDistrict();
	public List<Map<String, Object>> getDomainById(@Param(value="id")Object id);
	public Map<String, Object> getById(@Param(value="id")Integer id);
	public List<Map<String, Object>> getPicById(@Param(value="id")Integer id);
	public List<Map<String, Object>> getFacilityById(@Param(value="id")Integer id);
	public List<Map<String, Object>> sortByCon(@Param(value="con")String con,@Param(value="paixu") String paixu, @Param(value="districtid")String districtid, @Param(value="propertyid")Integer propertyid, @Param(value="keyword")String keyword);
	public List<Map<String, Object>> getByBuilding(@Param(value="id")Integer id);
	public Page<Map<String, Object>> getByTradeArea(@Param(value="id")Integer id);
	public Page<House> search(@Param(value="con")String con);
	public List<Map<String, Object>> queryHouse(@Param(value="keyword")String keyword);
	public List<Map<String, Object>> searchByCondition(@Param(value="keyword")String keyword,@Param(value="type")String type, 
			                                           @Param(value="districtId")Integer districtId, @Param(value="domainId")Integer domainId,
													   @Param(value="minPirce")Integer minPirce, @Param(value="maxPrice")Integer maxPrice,
													   @Param(value="houseType")String houseType,@Param(value="minMi")Integer minMi, @Param(value="maxMi")Integer maxMi,
													   @Param(value="style") String style, @Param(value="param")String param, @Param(value="sort")String sort);
	public List<Building_Picture> getBuildingPicsById(@Param(value="id")Integer id);
	public List<Map<String, Object>> getByHouseType(@Param(value="id")Integer id, @Param(value="type")String type);
	/**
	 * 根据id删除图片
	 */
	public int deletePicture(DeletePojo ids);
	public List<Map<String, Object>> getTradeByDid(@Param(value="ids")String ids);
	public List<Map<String, Object>> getHouseByParam(@Param(value="id")Integer id, @Param(value="type")String type, @Param(value="minMi")Integer minMi, @Param(value="maxMi")Integer maxMi);
	public List<Map<String, Object>> queryFindHouseByCon(FindMapHousePojo f);
	public int updateHouseHot(@Param(value="ids")String ids, @Param(value="hot")String hot);
}
	