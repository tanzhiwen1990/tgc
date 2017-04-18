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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.controller.cache.CacheMap;
import com.controller.cache.CacheMapCode;
import com.controller.response.ExceptionResponse;
import com.controller.response.NormalResponse;
import com.controller.response.PageResponse;
import com.controller.response.Response;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.model.City;
import com.model.District;
import com.model.Trade_Area;
import com.model.pojo.CityPojo;
import com.model.pojo.PageTrade_AreaPojo;
import com.service.Trade_AreaService;
import com.service.impl.SystemuserServiceImpl;
import com.util.AmapHelper;
import com.util.AppConfig;
import com.util.BasePathUtil;
import com.util.FileUtil;

/**
 * 商圈Controller
 * 
 * @author MyZhang
 *
 */
@Controller
@RequestMapping("/Trade_Area")
public class Trade_AreaController {
	@Autowired
	private SystemuserServiceImpl ss;

	@Autowired
	private Trade_AreaService tas;

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/pageTrade_Area", method = RequestMethod.GET)
	public String pageTrade_Area(HttpServletRequest request, ModelMap model) {
		try {
			PageHelper.startPage(1, AppConfig.pageSize);
			Page<Trade_Area> list = (Page<Trade_Area>) tas.pageTrade_Area();
			PageResponse page = new PageResponse(list.getPageNum(), list.getPageSize(), list.getTotal(),
					list.getPages(), list, true);
			model.addAttribute("cityList", (List<CityPojo>) CacheMap.getCdcMap().get(CacheMapCode.City.toString()));
			request.getSession().setAttribute("list", list);
			model.addAttribute("page", page);
			model.addAttribute("basePath", BasePathUtil.getBasePath(request));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin/Trade_Area-list";
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/ajaxpageTrade_Area", method = RequestMethod.POST)
	@ResponseBody // 分页查询
	public PageResponse pageFindHouse(HttpServletRequest request, ModelMap model, int beginNum, int pageSize,
			String city, String district, String name) {
		try {
			PageHelper.startPage(beginNum, pageSize);
			PageTrade_AreaPojo p = new PageTrade_AreaPojo(city, district, name);// 构建查询条件
			Page<Trade_Area> list = (Page<Trade_Area>) tas.pageTrade_Area2(p);
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
	@RequestMapping(value = "/goToAddTarade_area")
	public String goToAddTarade_area(HttpServletRequest request, ModelMap model) {
		try {
			model.addAttribute("basePath", BasePathUtil.getBasePath(request));
			model.addAttribute("cityList", (List<CityPojo>) CacheMap.getCdcMap().get(CacheMapCode.City.toString()));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin/Trade_Area-add";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/goToUpdateTarade_area")
	public String goToUpdateTarade_area(HttpServletRequest request, ModelMap model, int id) {
		try {
			model.addAttribute("basePath", BasePathUtil.getBasePath(request));
			model.addAttribute("cityList", (List<CityPojo>) CacheMap.getCdcMap().get(CacheMapCode.City.toString()));
			Trade_Area ta =  tas.findOne(id);
			model.addAttribute("ta", ta);
			model.addAttribute("cityid", ta.getDistrict_id().getCity_id().getCity_id());
			model.addAttribute("districtid", ta.getDistrict_id().getDistrict_id());
			if (ta.getTrade_area_addr()==null) {
			    model.addAttribute("trade_area_addr", AmapHelper.getPositionDetail(Double.parseDouble(ta.getLongitude()), Double.parseDouble(ta.getLatitude())).get("address"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin/Trade_Area-update";
	}

	// 删除多个或者单个 ids参数格式：4,5,6
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	@ResponseBody
	public Response deleteTrade_Area(HttpServletRequest request, ModelMap model, String ids) {
		int i = 0;
		try {
			i = tas.delete(ids);
		} catch (Exception e) {
			e.printStackTrace();
			return new ExceptionResponse(e);
		}
		return new NormalResponse(i);
	}

	// 添加商圈
	@RequestMapping(value = "/inesrt", method = RequestMethod.POST)
	@ResponseBody
	public Response inesrtTrade_Area(HttpServletRequest request, ModelMap model,
			@RequestParam(value = "file", required = true) MultipartFile file,@RequestParam(value = "tradeAreaImgSmall", required = true) MultipartFile tradeAreaImgSmall,String name, String tradAreaText,
			String district, String sort, String ishot, String longitude, String latitude,String trade_area_addr) {
		try {
			if(AppConfig.verificationLogin(request)){
				String fileURL = FileUtil.saveFile(file, "/static/images/Trade_Area", AppConfig.image_addr);
				String tradeAreaImg = FileUtil.saveFile(tradeAreaImgSmall, "/static/images/Trade_Area", AppConfig.image_addr);
				Trade_Area entity = new Trade_Area(new District(Integer.parseInt(district), null, ""), name, tradAreaText,
						ishot, Integer.parseInt(sort), AppConfig.getLoginUserName(request), fileURL,longitude,latitude,trade_area_addr,tradeAreaImg);
				tas.save(entity);
				AppConfig.setCacheMap(ss);//缓存数据
			} else {
				return new NormalResponse("LoginTimeOut");
			}
			return new NormalResponse(true);
		} catch (Exception e) {
			e.printStackTrace();
			return new ExceptionResponse(e);
		}
	}

	// 修改商圈
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	@ResponseBody
	public Response updateTrade_Area(@RequestParam(value ="file", required = false) MultipartFile file, HttpServletRequest request, ModelMap model, String name, String tradAreaText,
			int city, int district, int sort, String ishot, String uploadfile, int id, String longitude, String latitude,String trade_area_addr,@RequestParam(value = "trade_area_img_small",required = false) MultipartFile trade_area_img_small) {
		try {
			Trade_Area ta = tas.findOne(id);
			String fileURL=ta.getTrade_area_img();
			String trade_area_img_smallUrl=ta.getTrade_area_img_small();
			if(file!=null){
				fileURL=FileUtil.returnFileName(request, ta.getTrade_area_img());
				//String oldfile = FileUtil.returnFileName(request, ta.getTrade_area_img());
				FileUtil.deleteFile(fileURL);
				fileURL = FileUtil.saveFile(file, "/static/images/Trade_Area", AppConfig.image_addr);
			}
			if(trade_area_img_small!=null){
				trade_area_img_smallUrl=FileUtil.returnFileName(request, ta.getTrade_area_img_small());
				//String oldfile = FileUtil.returnFileName(request, ta.getTrade_area_img());
				FileUtil.deleteFile(trade_area_img_smallUrl);
				trade_area_img_smallUrl = FileUtil.saveFile(trade_area_img_small, "/static/images/Trade_Area", AppConfig.image_addr);
			}
			ta = new Trade_Area(new District(district, new City(city, ""), ""), name, tradAreaText, ishot, sort, "",
					AppConfig.getLoginUserName(request), new Date(), fileURL, longitude, latitude,trade_area_addr,trade_area_img_smallUrl);
			ta.setTrade_area_id(id);
			tas.update(ta);
			
			AppConfig.setCacheMap(ss);//缓存数据
		} catch (Exception e) {
			e.printStackTrace();
			return new ExceptionResponse(e);
		}
		return new NormalResponse(1);
	}

	// 上线下线
	@RequestMapping(value = "/updateState", method = RequestMethod.POST)
	@ResponseBody
	public Response updateTrade_AreaState(HttpServletRequest request, ModelMap model, String state, int id) {
		int i = 0;
		try {
			Trade_Area ta = new Trade_Area(id, state, AppConfig.getLoginUserName(request), new Date());
			i = tas.updateTrade_AreaState(ta);
		} catch (Exception e) {
			e.printStackTrace();
			return new ExceptionResponse(e);
		}
		return new NormalResponse(i);
	}
}
