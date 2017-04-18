package com.controller.admin;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.controller.cache.CacheMap;
import com.controller.cache.CacheMapCode;
import com.controller.response.ExceptionResponse;
import com.controller.response.NormalResponse;
import com.controller.response.PageResponse;
import com.controller.response.Response;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.model.Building;
import com.model.District;
import com.model.House;
import com.model.Recommend;
import com.model.Trade_Area;
import com.model.pojo.CityPojo;
import com.model.pojo.DeletePojo;
import com.model.pojo.PageRecommendPojo;
import com.service.RecommendService;
import com.util.AppConfig;
import com.util.BasePathUtil;
/**
 * 热门推荐
 * @author MyZhang
 *
 */
@Controller
@RequestMapping("/recommend")
public class RecommendController {
	@Autowired
	private RecommendService rs;
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/pageRecommend", method = RequestMethod.GET)
	public String pageFindHouse(HttpServletRequest request, ModelMap model) {
		try {
			PageHelper.startPage(1, AppConfig.pageSize);
			Page<Recommend> list = (Page<Recommend>) rs.pageRecommend();
			PageResponse page = new PageResponse(list.getPageNum(), list.getPageSize(), list.getTotal(),
					list.getPages(), list, true);
			model.addAttribute("basePath", BasePathUtil.getBasePath(request));
			model.addAttribute("cityList", (List<CityPojo>) CacheMap.getCdcMap().get(CacheMapCode.City.toString()));
			request.getSession().setAttribute("list", list);
			model.addAttribute("page", page);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin/Recommend-list";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/ajaxpageRecommend", method = RequestMethod.POST)
	@ResponseBody // 分页查询
	public PageResponse pageRecommend(HttpServletRequest request, ModelMap model, int beginNum, int pageSize,
			String city, String district, String trade_Area, String type, String state, String beginTime,
			String endTime) {
		try {
			PageHelper.startPage(beginNum, pageSize);
			PageRecommendPojo p = new PageRecommendPojo(beginTime, endTime, city, district, trade_Area, type, state);
			System.out.println(p.toString());
			Page<Recommend> list = (Page<Recommend>) rs.pageRecommend(p);
			PageResponse page = new PageResponse(list.getPageNum(), list.getPageSize(), list.getTotal(),
					list.getPages(), list, true);
			model.addAttribute("basePath", BasePathUtil.getBasePath(request));
			request.getSession().setAttribute("list", list);
			model.addAttribute("cityList", (List<CityPojo>) CacheMap.getCdcMap().get(CacheMapCode.City.toString()));
			model.addAttribute("page", page);
			return page;
		} catch (Exception e) {
			e.printStackTrace();
			return new PageResponse(e);
		}
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/getCityList", method = RequestMethod.POST)
	@ResponseBody
	public Response getCityList(HttpServletRequest request, ModelMap model, int id) {
		try {
			List<CityPojo> list = (List<CityPojo>) CacheMap.getCdcMap().get(CacheMapCode.City.toString());
			List<District> DistrictList = new ArrayList<District>();
			for (CityPojo cityPojo : list) {
				if (cityPojo.getCity_id() == id) {
					DistrictList = cityPojo.getList();
				}
			}
			return new NormalResponse(DistrictList);
		} catch (Exception e) {
			e.printStackTrace();
			return new ExceptionResponse(e);
		}
	}
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/getTrade_AreaList", method = RequestMethod.POST)
	@ResponseBody
	public Response getTrade_AreaList(HttpServletRequest request, ModelMap model, int id) {
		try {
			List<Trade_Area> list = (List<Trade_Area>) CacheMap.getCdcMap().get(CacheMapCode.Trade_Area.toString());
			List<Trade_Area> lists = new ArrayList<Trade_Area>();
			for (Trade_Area trade_Area : list) {
				if(trade_Area.getDistrict_id().getDistrict_id() == id){
					lists.add(trade_Area);
				}
			}
			return new NormalResponse(lists);
		} catch (Exception e) {
			e.printStackTrace();
			return new ExceptionResponse(e);
		}
	}
	
	// 上线下线
	@RequestMapping(value = "/updateState", method = RequestMethod.POST)
	@ResponseBody
	public Response updateRecommendState(HttpServletRequest request, ModelMap model, String state, int id, int ided, String type) {
		System.out.println(state + "-" + id +"-" +type + "-"+ided);
		int i = 0;
		try {
			i = rs.updateRecommendState(new Recommend(id, state, AppConfig.getLoginUserName(request), new Date()));
			if(type.equals("房源")){
				if(state.equals("已上线")){
					rs.updateHouseishot(new House(ided, "是"));
				} else {
					rs.updateHouseishot(new House(ided, "否"));
				}
			}
			if(type.equals("楼盘")){
				if(state.equals("已上线")){
					rs.updateBuildingishot(new Building(ided, "是"));
				} else {
					rs.updateBuildingishot(new Building(ided, "否"));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new ExceptionResponse(e);
		}
		return new NormalResponse(i);
	}
	//删除
	@RequestMapping(value = "/deleteRecommend" ,method={RequestMethod.POST})
	@ResponseBody
	public Response deleteRecommend(HttpServletRequest request, ModelMap model, String ids){
		if(ids.equals("")){
			return new NormalResponse("参数错误！");
		}
		System.out.println("test:" + rs.deleteRecommend(new DeletePojo(ids)));
		return new NormalResponse();
	}
}
