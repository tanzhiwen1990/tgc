package com.controller.front;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.controller.response.PageResponse;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.google.gson.Gson;
import com.service.BuildingService;
import com.service.HouseService;
import com.service.Trade_AreaService;
import com.util.AppConfig;
import com.util.BasePathUtil;
import com.util.UserAgentUtil;

@Controller(value = "house")
@RequestMapping("/front/house")
public class HouseController {

	@Autowired
	private HouseService hs;

	@Autowired
	private BuildingService bs;
	
	@Autowired
	private Trade_AreaService ta;

	@GetMapping("/detail")
	public String detail(HttpServletRequest request, ModelMap model, Integer id) {
		//根据id获取房源信息
		Map<String, Object> entity=hs.getById(id);
		model.addAttribute("basePath", BasePathUtil.getBasePath(request));
		model.addAttribute("h", entity);
	
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
		model.addAttribute("facility", hs.getFacilityById(id));
		if (UserAgentUtil.checkAgentIsMobile(request.getHeader("User-Agent"))) {
			model.addAttribute("picture", hs.getPicById(id));
			return "mobile/house_detail";
		}else{
			//根据房源id获取房源图片信息
			PageHelper.startPage(1, 3);
			Page<Map<String, Object>> hPics=(Page<Map<String, Object>>) hs.getPicById(id);
			PageResponse page=new PageResponse(hPics.getPageNum(), hPics.getPageSize(), hPics.getTotal(),
					hPics.getPages(), hPics, true);
			//房源图片
			model.addAttribute("picture", hs.getPicById(id));
			model.addAttribute("page", page);
		  return "front/house_detail";
		}
	}
	
	/**
	 * 房源图片分页请求
	 * @param id 房源id
	 * @param pageSize
	 * @param beginNum
	 * @return
	 */
	 @RequestMapping(value="/ajaxPage",method=RequestMethod.POST,produces="application/json;charset=UTF-8")
	 @ResponseBody
	 public String ajaxPage(Integer id,Integer pageSize,Integer beginNum){
		 if (pageSize==null) {
			pageSize=3;
		}if (beginNum==null) {
			beginNum=1;
		}
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
			dList.add(hs.getDomainById(rList.get(i).get("district_id")));
		}
		model.addAttribute("district", rList);

		model.addAttribute("domain", dList);
		// 根据条件查询
		PageHelper.startPage(1, AppConfig.pageSize);
		Page<Map<String, Object>> hList = (Page<Map<String, Object>>) hs.getByBuilding(id);
		PageResponse page=new PageResponse(hList.getPageNum(), hList.getPageSize(), hList.getTotal(), hList.getPages(),
				hList, true);
		model.addAttribute("hList", hList.getResult());
		model.addAttribute("page", page);
		return "front/find_houses";

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

		for (int i = 0; i < rList.size(); i++) {
			dList.add(hs.getDomainById(rList.get(i).get("district_id")));
		}
		model.addAttribute("district", rList);
		model.addAttribute("domain", dList);
		//
		model.addAttribute("t",ta.findOne(id));
		//当前商圈下的房源
		PageHelper.startPage(1, AppConfig.pageSize);
		Page<Map<String , Object>> hList = hs.getByTradeArea(id);
		PageResponse page=new PageResponse(hList.getPageNum(), hList.getPageSize(), hList.getTotal(), hList.getPages(),
				hList, true);
		model.addAttribute("hList", hList.getResult());
		model.addAttribute("page", page);
		return "front/find_houses";

	}

}
