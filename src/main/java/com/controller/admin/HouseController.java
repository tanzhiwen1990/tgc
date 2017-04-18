package com.controller.admin;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
import com.model.pojo.CityPojo;
import com.model.pojo.DeletePojo;
import com.model.pojo.HousePojo;
import com.model.pojo.House_PicturePojo;
import com.model.pojo.House_Supporting_FacilitiesPojo;
import com.model.pojo.PageHousePojo;
import com.service.BuildingService;
import com.service.HouseService;
import com.service.PropertyService;
import com.service.RecommendService;
import com.service.Surpporting_FacilitiesService;
import com.service.Trade_AreaService;
import com.util.AppConfig;
import com.util.BasePathUtil;
import com.util.FileUtil;


/**
 * 房源
 * 
 * @author MyZhang
 *
 */
@Controller
@RequestMapping("/house")
public class HouseController {
	@Autowired
	private Trade_AreaService tas;
	@Autowired
	private HouseService hs;
	@Autowired
	private RecommendService rs;
	@Autowired
	private Surpporting_FacilitiesService sfs;
	@Autowired
	private BuildingService bs;
	@Autowired
	private PropertyService ps;

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/pagehouse", method = RequestMethod.GET)
	public String pageFindHouse(HttpServletRequest request, ModelMap model) {
		try {
			PageHelper.startPage(1, AppConfig.pageSize);
			Page<House> list = (Page<House>) hs.pageHouse();
			PageResponse page = new PageResponse(list.getPageNum(), list.getPageSize(), list.getTotal(),
					list.getPages(), list, true);
			CacheMap.initializationCdcMap("houseImgURL", new ArrayList<String>());
			model.addAttribute("basePath", BasePathUtil.getBasePath(request));
			model.addAttribute("cityList", (List<CityPojo>) CacheMap.getCdcMap().get(CacheMapCode.City.toString()));
			request.getSession().setAttribute("list", list);
			model.addAttribute("page", page);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin/house-list";
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/goToAddHouse", method = { RequestMethod.GET })
	public String goToAddHouse(HttpServletRequest request, ModelMap model) {
		try {
			List<Trade_Area> list = tas.pageTrade_Area();
			List<Surpporting_Facilities> listsf = (List<Surpporting_Facilities>) sfs.pageSurpporting_Facilities();
			model.addAttribute("basePath", BasePathUtil.getBasePath(request));
			model.addAttribute("cityList", (List<CityPojo>) CacheMap.getCdcMap().get(CacheMapCode.City.toString()));
			model.addAttribute("list", list);
			model.addAttribute("listsf", listsf);
			model.addAttribute("propertyList", ps.pageProperty());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin/house-add";
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/ajaxpagehouse", method = RequestMethod.POST)
	@ResponseBody // 分页查询
	public PageResponse pageFindHouse(HttpServletRequest request, ModelMap model, int beginNum, int pageSize,
			String city, String district, String trade_Area, String building, String type, String name) {
		try {
			PageHelper.startPage(beginNum, pageSize);
			PageHousePojo p = new PageHousePojo(city, district, trade_Area, building, type, name);
			Page<House> list = (Page<House>) hs.pageHouse2(p);
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
				if (trade_Area.getDistrict_id().getDistrict_id() == id) {
					lists.add(trade_Area);
				}
			}
			return new NormalResponse(lists);
		} catch (Exception e) {
			e.printStackTrace();
			return new ExceptionResponse(e);
		}
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/getBuildingList", method = RequestMethod.POST)
	@ResponseBody
	public Response getBuildingList(HttpServletRequest request, ModelMap model, int id) {
		try {
			List<Building> list = (List<Building>) CacheMap.getCdcMap().get(CacheMapCode.Building.toString());
			List<Building> lists = new ArrayList<Building>();
			for (Building building : list) {
				if (building.getTrade_area_id().getTrade_area_id() == id) {
					lists.add(building);
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
	public Response updateHouseState(HttpServletRequest request, ModelMap model, String state, int id) {
		int i = 0;
		try {
			i = hs.updateHouseState(new House(id, state, AppConfig.getLoginUserName(request), new Date()));
		} catch (Exception e) {
			e.printStackTrace();
			return new ExceptionResponse(e);
		}
		return new NormalResponse(i);
	}

	// 热门非热门
	@RequestMapping(value = "/changeHot", method = RequestMethod.POST)
	@ResponseBody
	public Response setHot(HttpServletRequest request, ModelMap model, String hot, String ids) {
		int i = 0;
		try {
			i = hs.updateHouseHot(ids,hot);
		} catch (Exception e) {
			e.printStackTrace();
			return new ExceptionResponse(e);
		}
		return new NormalResponse(i);
	}

	// 删除多个或者单个 ids参数格式：4,5,6
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	@ResponseBody
	public Response deleteHouse(HttpServletRequest request, ModelMap model, String ids) {
		int i = 0;
		try {
			i = hs.delete(ids);
		} catch (Exception e) {
			e.printStackTrace();
			return new ExceptionResponse(e);
		}
		return new NormalResponse(i);
	}

	// 添加房源
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/inesrt", method = RequestMethod.POST)
	@ResponseBody
	public Response inesrtHouse(HttpServletRequest request, ModelMap model, String house_name, String building,
			String house_style, String house_money, String house_type, String house_mi, String house_unit,
			String house_num, String house_orientation, String house_decoration_type, String house_intime,
			String house_linkman, String house_address, String house_phone, String cityName, String districtName,
			String trade_AreaName, String building_name, int sf_name[], String[] position,String himgae) {
		int i = 0;
		if (house_mi.equals("")) {
			house_mi = "0";
		}
		if (null==house_unit) {
			house_unit="元/㎡.月";
		}
		try {
			HousePojo hp = new HousePojo(building, house_name, house_money, house_type, house_mi, house_unit, house_num,
					house_orientation, house_decoration_type, house_address, house_intime, house_linkman, house_phone,
					house_style, AppConfig.getLoginUserName(request), new Date(), position[1], position[0]);
			i = hs.insertHouse(hp);
			// 添加图片
			
			String[] filename=himgae.split(",");
			for (String string : filename) {
				i += hs.addHouse_Picture(new House_PicturePojo(hp.getHouse_id(), string));
			}
			// 热门添加数据
			Recommend r = new Recommend(hp.getHouse_id(), cityName, districtName, trade_AreaName, building_name,
					house_name, "房源", AppConfig.getLoginUserName(request));
			i += rs.insertRecommend(r);
			if (sf_name != null) {
				// 配套设施添加
				for (int j = 0; j < sf_name.length; j++) {
					House_Supporting_FacilitiesPojo hsf = new House_Supporting_FacilitiesPojo(sf_name[j],
							hp.getHouse_id());
					i += sfs.saveHouse_Supporting_Facilities(hsf);
				}
			}
			return new NormalResponse(true);
		} catch (Exception e) {
			e.printStackTrace();
			return new ExceptionResponse(e);
		}
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/goToUpdateHouse")
	public String goToUpdateHouse(HttpServletRequest request, ModelMap model, int id) {
		System.out.println("编号：" + id);
		try {
			House h = hs.findOne(new HousePojo(id));
			model.addAttribute("basePath", BasePathUtil.getBasePath(request));
			List<CityPojo> cityList = (List<CityPojo>) CacheMap.getCdcMap().get(CacheMapCode.City.toString());
			List<CityPojo> cityLists = new ArrayList<CityPojo>();
			for (CityPojo cityPojo : cityList) {
				if (h.getBuilding_id().getTrade_area_id().getDistrict_id().getCity_id().getCity_id() == cityPojo
						.getCity_id()) {
					cityLists.add(cityPojo);
				}
			}
			model.addAttribute("cityList", cityLists);
			model.addAttribute("city", (List<CityPojo>) CacheMap.getCdcMap().get(CacheMapCode.City.toString()));
			List<Trade_Area> list = (List<Trade_Area>) CacheMap.getCdcMap().get(CacheMapCode.Trade_Area.toString());
			List<Trade_Area> lists = new ArrayList<Trade_Area>();
			for (Trade_Area trade_Area : list) {

				if (h.getBuilding_id().getTrade_area_id().getDistrict_id().getDistrict_id() == trade_Area
						.getDistrict_id().getDistrict_id()) {
					lists.add(trade_Area);
				}
			}
			model.addAttribute("trade_AreaList", lists);
			List<Building> buildingLists = new ArrayList<Building>();
			List<Building> buildingList = (List<Building>) CacheMap.getCdcMap().get(CacheMapCode.Building.toString());
			for (Building building : buildingList) {
				if (h.getBuilding_id().getTrade_area_id().getTrade_area_id() == building.getTrade_area_id()
						.getTrade_area_id()) {
					buildingLists.add(building);
				}
			}
			List<Surpporting_Facilities> listsf = (List<Surpporting_Facilities>) sfs.pageSurpporting_Facilities();
			model.addAttribute("listsf", listsf);
			model.addAttribute("buildingList", buildingLists);
			model.addAttribute("h", h);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin/house-update";
	}

	@RequestMapping(value = "/getSurpporting_FacilitiesList", method = RequestMethod.POST)
	@ResponseBody
	public Response getSurpporting_FacilitiesList(HttpServletRequest request, ModelMap model, int id) {
		try {
			List<House_Supporting_FacilitiesPojo> listhsfp = sfs.selectHouse_Supporting_Facilities(id);
			return new NormalResponse(listhsfp);
		} catch (Exception e) {
			e.printStackTrace();
			return new ExceptionResponse(e);
		}
	}

	// 修改房源
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	@ResponseBody
	public Response updateHouse(HttpServletRequest request, ModelMap model, String house_name, String building,
			String house_style, String house_money, String house_type, String house_mi, String house_unit,
			String house_num, String house_orientation, String house_decoration_type, String house_intime,
			String house_linkman, String house_address, String house_phone, int house_id, int sf_name[],
			String[] position) {
		int i = 0;
		if (house_mi.equals("")) {
			house_mi = "0";
		}
		if (null==house_unit) {
			house_unit="元/㎡.月";
		}
		try {
			HousePojo hp = new HousePojo(house_id, building, house_name, house_money, house_type, house_mi, house_unit,
					house_num, house_orientation, house_decoration_type, house_address, house_intime, house_linkman,
					house_phone, house_style, AppConfig.getLoginUserName(request), new Date(), position[1],
					position[0]);
			i = hs.updateHouse(hp);
			sfs.deleteHouse_Supporting_Facilities(new DeletePojo(house_id + ""));
			if (sf_name != null) {
				// 配套设施添加
				if (sf_name != null) {
					for (int j = 0; j < sf_name.length; j++) {
						House_Supporting_FacilitiesPojo hsf = new House_Supporting_FacilitiesPojo(sf_name[j], house_id);
						i += sfs.saveHouse_Supporting_Facilities(hsf);
					}
				}
			}
			return new NormalResponse(i);
		} catch (Exception e) {
			e.printStackTrace();
			return new ExceptionResponse(e);
		}
	}

	// 多个文件上传
	@RequestMapping(value="/up_Files",produces = "application/json" )
	@ResponseBody
	public Object up_Files(MultipartFile file, HttpServletRequest request, String type, String name, String size) {
		String fileURL="";
		try {
			// 保存图片并获取放入数据库的文件路径
			 fileURL = FileUtil.saveFile(file, "/static/images/house", AppConfig.image_addr);
			return fileURL;
		} catch (Exception e) {
		   return new ExceptionResponse(e);
		}
		
	}

	@RequestMapping("/getLocation")
	@ResponseBody
	public Map<String, Object> getLocation(int id) {
		Map<String, Object> map = new HashMap<>();
		Building b = bs.findOne(new Building(id));
		String location = b.getLatitude() + "," + b.getLongitude();
		System.out.println(location);
		map.put("location", location);
		return map;
	}

	@RequestMapping(value = "/goToPictureEdit", method = RequestMethod.GET)
	public String goToPictureEdit(HttpServletRequest request, ModelMap model, int id) {
		try {
			List<House_Picture> list = hs.queryHousePicture(id);
			model.addAttribute("basePath", BasePathUtil.getBasePath(request));
			model.addAttribute("list", list);
			if (list == null) {
				model.addAttribute("listSize", 0);
			} else {
				model.addAttribute("listSize", list.size());
			}
			request.getSession().setAttribute("PictureURL", list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("houseId", id);
		return "admin/house-picture-show";
	}

	@RequestMapping(value = "/deletePicture", method = RequestMethod.POST)
	@ResponseBody
	public Response deletePicture(HttpServletRequest request, ModelMap model, String ids) {
		List<House_Picture> list = (List<House_Picture>) request.getSession().getAttribute("PictureURL");
		String[] id = ids.split(",");
		if (id.length > 0) {
			for (int i = 0; i < id.length; i++) {
				for (House_Picture bp : list) {
					if (id[i].equals(bp.getHouse_picture_id() + "")) {
						String url = FileUtil.getFileURL(request, bp.getHouse_picture_addr());
						File f = new File(url);
						if (f.exists()) {
							f.delete();
						}
					}
				}
			}
			hs.deletePicture(new DeletePojo(ids));
		}
		return new NormalResponse(1);
	}

	@RequestMapping("/HouseUp_Files")
	@ResponseBody
	public Response HouseUp_Files(MultipartFile[] file, HttpServletRequest request) {
		String id = request.getParameter("houseId");
		System.out.println(id);
		try {
			if (file != null) {
				for (int i = 0; i < file.length; i++) {
					// 保存图片并获取放入数据库的文件路径
					String fileURL = FileUtil.saveFile(file[i], "/static/images/house", AppConfig.image_addr);
					hs.addHouse_Picture(new House_PicturePojo(Integer.valueOf(id), fileURL));
				}
			}
			return new NormalResponse();
		} catch (Exception e) {
			return new ExceptionResponse(e);
		}
	}

}
