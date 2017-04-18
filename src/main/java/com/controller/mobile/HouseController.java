package com.controller.mobile;

import java.math.BigDecimal;
import java.sql.PseudoColumnUsage;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.controller.response.PageResponse;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.google.gson.Gson;
import com.model.House;
import com.service.BuildingService;
import com.service.HouseService;
import com.service.PropertyService;
import com.service.Trade_AreaService;
import com.util.AppConfig;
import com.util.BasePathUtil;

@Controller(value="frontHouse")
@RequestMapping("/house")
public class HouseController {
	
	@Autowired
	private HouseService hs;

	@Autowired
	private BuildingService bs;
	
	@Autowired
	private Trade_AreaService ta;
	
	
	@Autowired 
	private PropertyService ps;
	
	
	@GetMapping(value="/detail_h{id}.html")
	public String detail(HttpServletRequest request ,ModelMap model,@PathVariable(value="id")Integer id){
		//根据id获取房源信息
		Map<String, Object> entity=hs.getById(id);
		model.addAttribute("basePath", BasePathUtil.getBasePath(request));
		model.addAttribute("h", entity);
		
		model.addAttribute("picture", hs.getPicById(id));
		//根据房源id获取楼盘图片
		//model.addAttribute("bPics",hs.getBuildingPicsById((Integer)entity.get("building_id")));
		model.addAttribute("rList", bs.queryByHot());
		model.addAttribute("hs", hs.queryByHot());
		//根据房屋地址获取经纬度
		Map<String, BigDecimal> map = new HashMap<String, BigDecimal>();
		 String longitude=(String) hs.getById(id).get("longitude");
		 String latitude=(String) hs.getById(id).get("latitude");
		 if (longitude!=null && latitude!=null) {
			  map.put("lat", new BigDecimal(longitude));
		      map.put("lng", new BigDecimal(latitude));
		 }else {
			map=BasePathUtil.getLatAndLngByAddress((String)hs.getById(id).get("building_addr"));
		}
		model.addAttribute("map", map);
		//model.addAttribute("page", page);
		model.addAttribute("facility", hs.getFacilityById(id));
		return "mobile/house_detail";
		
	}
	
	
	/**
	 * 房源图片分页请求
	 * @param id 房源id
	 * @param pageSize
	 * @param beginNum
	 * @return
	 */
	 @RequestMapping(value="/ajaxPage")
	 @ResponseBody
	 public String ajaxPage(Integer id,int pageSize,int beginNum){
		 PageHelper.startPage(beginNum, pageSize);
		 Page<Map<String, Object>> list=(Page<Map<String, Object>>) hs.getPicById(id);
		 PageResponse page=new PageResponse(list.getPageNum(), pageSize, list.getTotal(), 
				 list.getPages(), list, true);
		 Gson gson=new Gson();
		 return gson.toJson(page);
	 }
	
	

	/**
	 * 查询当前楼盘下的房源
	 * 
	 * @param request
	 * @param model
	 * @param id
	 *            楼盘Id
	 * @return
	 * 
	 */
	@GetMapping("/searchByBuilding")
	public String search(HttpServletRequest request, ModelMap model, Integer id) {
		model.addAttribute("basePath", BasePathUtil.getBasePath(request));
		// 区域
		List<Map<String, Object>> rList = hs.getDistrict();
		List<List<Map<String, Object>>> dList = new ArrayList<>();

		for (int i = 0; i < rList.size(); i++) {
			dList.add(hs.getDomainById(rList.get(i).get("region_id")));
		}
		model.addAttribute("district", rList);

		model.addAttribute("domain", dList);
		// 根据条件查询
		Page<Map<String, Object>> hList = (Page<Map<String, Object>>) hs.getByBuilding(id);
		PageResponse page=new PageResponse(hList.getPageNum(), hList.getPageSize(), hList.getTotal(), hList.getPages(),
				hList, true);
		model.addAttribute("hList", hList.getResult());
		model.addAttribute("page", page);
		return "mobile/find_house";

	}

	/**
	 * 在当前商圈下查询合适的房源
	 * 
	 * @param request
	 * @param model
	 * @param id
	 *            当前商圈Id
	 * @return
	 */
	@GetMapping("/searchByTradeArea")
	public String searchByTradeArea(HttpServletRequest request, ModelMap model, Integer id) {
		model.addAttribute("basePath", BasePathUtil.getBasePath(request));
		List<Map<String, Object>> rList = hs.getDistrict();
		List<List<Map<String, Object>>> dList = new ArrayList<>();
         //根据区域Id获取商圈
		for (int i = 0; i < rList.size(); i++) {
			dList.add(hs.getDomainById(rList.get(i).get("district_id")));
		}
		//获取期望区域
		model.addAttribute("district", rList);
		//获取区域下的商圈
		model.addAttribute("domain", dList);
		//获得商圈数据
		model.addAttribute("t",ta.findOne(id));
		//当前商圈下的房源
		PageHelper.startPage(1, AppConfig.pageSize);
		Page<Map<String , Object>> hList = hs.getByTradeArea(id);
		PageResponse page=new PageResponse(hList.getPageNum(), hList.getPageSize(), hList.getTotal(), hList.getPages(),
				hList, true);
		
		model.addAttribute("hList", hList.getResult());
		//查询热门房源，如果按条件搜索没有数据则推荐房源
		model.addAttribute("hot", hs.queryByHot());
		model.addAttribute("page", page);
		model.addAttribute("property", ps.pageProperty());
		return "mobile/find_house";

	}
	
	
	@RequestMapping(value="/searchTradeArea",produces="application/json;charset=utf-8",method=RequestMethod.POST)
	@ResponseBody
	public String getTradeAreaByIds(String ids){
		List<Map<String , Object>> tList=hs.getTradeByDid(ids);
		return new Gson().toJson(tList);
		
	}

}
