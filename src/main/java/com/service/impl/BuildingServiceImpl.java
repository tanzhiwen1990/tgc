package com.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mapper.BuildingMapper;
import com.model.Building;
import com.model.Building_Picture;
import com.model.pojo.BuildingPojo;
import com.model.pojo.Building_PicturePojo;
import com.model.pojo.DeletePojo;
import com.model.pojo.PagePojo;
import com.service.BuildingService;
@Service
public class BuildingServiceImpl extends BaseServiceImpl<Building> implements BuildingService{
	@Autowired
	private BuildingMapper bm;
	@Override
	public List<Building> pageBuilding() {
		return bm.pageBuilding();
	}

	@Override
	public List<Building> pageBuilding2(PagePojo p) {
		return bm.pageBuilding2(p);
	}

	@Override
	public Building findOne(Object id) {
		return null;
	}

	@Override
	public int save(Building entity) {
		return 0;
	}

	@Override
	public int updateAll(Building entity) {
		return 0;
	}

	@Override
	public int updateNotNull(Building entity) {
		return 0;
	}

	@Override//删除
	public int delete(Object id) {
		return bm.deleteBuilding(new DeletePojo(id.toString()));
	}

	@Override
	public List<Building> selectByExample(Object example) {
		return null;
	}

	@Override
	public List<Building> queryPage(PagePojo p) {
		return null;
	}

	@Override
	public int update(Building entity) {
		return 0;
	}

	@Override
	public int updateState(Building b) {
		return bm.updateBuildingState(b);
	}

	@Override
	public int insertBuilding(BuildingPojo b) {
		return bm.insertBuilding(b);
	}

	@Override
	public int updateBuilding(BuildingPojo b) {
		return bm.updateBuilding(b);
	}

	@Override
	public Building findOne(Building b) {
		return bm.findOne(b);
	}

	@Override
	public int addBuilding_Picture(Building_PicturePojo p) {
		return bm.addBuilding_Picture(p);
	}

	@Override
	public List<Map<String , Object>> queryByHot() {

		return bm.queryByHot();
	}

	@Override
	public Map<String, Object> get(Integer id) {
		return bm.get(id);
	}

	@Override
	public List<Map<String, Object>> getPicById(Integer id) {
		return bm.getPicById(id);
	}

	@Override
	public List<Map<String, Object>> sortByCon(String con) {
		// TODO Auto-generated method stub
		return bm.sortByCon(con);
	}

	@Override
	public List<Map<String, Object>> queryBuilding(String keyword,Integer districtId,Integer domainId) {
		return bm.queryBuilding(keyword, districtId, domainId);
	}
	public List<Map<String, Object>> queryBuilding() {
		return bm.queryBuilding(null,null,null);
	}

	@Override
	public List<Building_Picture> queryBuildingPicture(int id) {
		return bm.queryBuildingPicture(id);
	}

	@Override
	public int deletePicture(DeletePojo ids) {
		return bm.deletePicture(ids);
	}

	
	public int updateBuildingHot(String ids, String hot) {
		
		return bm.updateBuildingHot(ids, hot);
	}

}
