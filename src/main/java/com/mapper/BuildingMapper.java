package com.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.model.Building;
import com.model.Building_Picture;
import com.model.pojo.BuildingPojo;
import com.model.pojo.Building_PicturePojo;
import com.model.pojo.DeletePojo;
import com.model.pojo.PagePojo;

/**
 * 楼盘
 * @author MyZhang
 *
 */
public interface BuildingMapper {
	/**
	 * 分页查询
	 * @return
	 */
	public List<Building> pageBuilding();
	/**
	 * 条件查询
	 */
	public List<Building> pageBuilding2(PagePojo p);
	/**
	 * 根据id删除
	 * @param id
	 * @return
	 */
	public int deleteBuilding(DeletePojo ids);
	/**
	 * 上线下线
	 */
	public int updateBuildingState(Building b);
	/**
	 * 添加
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
	public List<Map<String, Object>> getPicById(@Param(value="id")Integer id);
	public Map<String, Object> get(@Param(value="id")Integer id);
	public List<Map<String, Object>> sortByCon(@Param(value="con")String con);
	public List<Map<String, Object>> queryBuilding(@Param(value="keyword")String keyword,@Param(value="districtId")Integer districtId,@Param(value="domainId")Integer domainId);
	public int updateBuildingHot(@Param(value="ids")String ids, @Param(value="hot")String hot);
}
