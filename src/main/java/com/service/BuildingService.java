package com.service;

import java.util.List;
import java.util.Map;

import com.model.Building;
import com.model.Building_Picture;
import com.model.pojo.BuildingPojo;
import com.model.pojo.Building_PicturePojo;
import com.model.pojo.DeletePojo;
import com.model.pojo.PagePojo;
/**
 * 楼盘Service
 * @author MyZhang
 *
 */
public interface BuildingService extends BaseService<Building>{
	/**
	 * 分页查询
	 * @return
	 */
	public List<Building> pageBuilding();
	/**
	 * 条件查询
	 * @param p
	 * @return
	 */
	public List<Building> pageBuilding2(PagePojo p);
	/**
	 * 上线下线
	 * @return
	 */
	public int updateState(Building b);
	/**
	 * 添加楼盘
	 */
	public int insertBuilding(BuildingPojo b);
	/**
	 * 修改
	 */
	public int updateBuilding(BuildingPojo b);
	/**
	 * 查询单个
	 */
	public Building findOne(Building b);
	/**
	 * 添加图片
	 */
	public int addBuilding_Picture(Building_PicturePojo p);
	/**
	 * 图片查询
	 */
	public List<Building_Picture> queryBuildingPicture(int id);
	/**
	 * 根据id删除图片
	 */
	public int deletePicture(DeletePojo ids);
	public List<Map<String, Object>> queryByHot();
	public Map<String, Object> get(Integer id);
	public List<Map<String , Object>> getPicById(Integer id);
	public List<Map<String, Object>> sortByCon(String con);
	public List<Map<String, Object>> queryBuilding(String keyword,Integer districtId,Integer domainId);
	public List<Map<String, Object>> queryBuilding();
	public int updateBuildingHot(String ids, String hot);
}
