package com.controller.admin;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;

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
import com.model.Building;
import com.model.Building_Picture;
import com.model.Recommend;
import com.model.Trade_Area;
import com.model.pojo.BuildingPojo;
import com.model.pojo.Building_PicturePojo;
import com.model.pojo.CityPojo;
import com.model.pojo.DeletePojo;
import com.model.pojo.PagePojo;
import com.model.pojo.PropertyPojo;
import com.service.BuildingService;
import com.service.RecommendService;
import com.service.Trade_AreaService;
import com.service.impl.SystemuserServiceImpl;
import com.util.AppConfig;
import com.util.BasePathUtil;
import com.util.FileUtil;

/**
 * 楼盘Controller
 *
 * @author MyZhang
 *
 */
@Controller
@RequestMapping("/building")
public class BuildingController {
	@Autowired
	private SystemuserServiceImpl ss;
	@Autowired
	private Trade_AreaService tas;
	@Autowired
	private BuildingService bs;
	@Autowired
	private RecommendService rs;
	@RequestMapping(value = "/pageBuilding", method = { RequestMethod.GET })
	public String goToBuilding(HttpServletRequest request, ModelMap model) {
		try {
			PageHelper.startPage(1, AppConfig.pageSize);
			Page<Building> list = (Page<Building>) bs.pageBuilding();
			PageResponse page = new PageResponse(list.getPageNum(), list.getPageSize(), list.getTotal(),
					list.getPages(), list, true);
			CacheMap.initializationCdcMap("BuildingimgURL",new ArrayList<String>());
			model.addAttribute("basePath", BasePathUtil.getBasePath(request));
			model.addAttribute("page", page);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin/building-list";
	}

	@RequestMapping(value = "/ajaxPageBuilding", method = RequestMethod.POST)
	@ResponseBody//分页查询
	public PageResponse pageFindHouse(HttpServletRequest request, ModelMap model, int beginNum, int pageSize, String type,
									  String name, String beginTime, String endTime) {
		try {
			PageHelper.startPage(beginNum, pageSize);
			PagePojo p = new PagePojo(beginTime, endTime, name, type);//构建查询条件
			Page<Building> list = (Page<Building>) bs.pageBuilding2(p);
			PageResponse page = new PageResponse(list.getPageNum(), list.getPageSize(), list.getTotal(),
					list.getPages(), list, true);
			model.addAttribute("basePath", BasePathUtil.getBasePath(request));
			model.addAttribute("page", page);
			return page;
		} catch (Exception e) {
			e.printStackTrace();
			return new PageResponse(e);
		}
	}
	@RequestMapping(value = "/deleteHouse" ,method={RequestMethod.POST})//删除
	@ResponseBody
	public Response deleteHouse(HttpServletRequest request, ModelMap model, String ids){
		if(ids.equals("")){
			return new NormalResponse("参数错误！");
		}
		System.out.println("test:" + bs.delete(ids));
		return new NormalResponse();
	}
	
	// 热门非热门
		@RequestMapping(value = "/changeHot", method = RequestMethod.POST)
		@ResponseBody
		public Response setHot(HttpServletRequest request, ModelMap model, String hot, String ids) {
			int i = 0;
			try {
				i = bs.updateBuildingHot(ids,hot);
			} catch (Exception e) {
				e.printStackTrace();
				return new ExceptionResponse(e);
			}
			return new NormalResponse(i);
		}


	// 上线下线
	@RequestMapping(value = "/updateState", method = RequestMethod.POST)
	@ResponseBody
	public Response updateBuildingState(HttpServletRequest request, ModelMap model, String state, int id) {
		System.out.println(state + "-" + id);
		int i = 0;
		try {
			i = bs.updateState(new Building(id,state,AppConfig.getLoginUserName(request),new Date()));
		} catch (Exception e) {
			e.printStackTrace();
			return new ExceptionResponse(e);
		}
		return new NormalResponse(i);
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/goToAddBuilding", method = { RequestMethod.GET })
	public String goToAddBuilding(HttpServletRequest request, ModelMap model) {
		try {
			List<Trade_Area> list = tas.pageTrade_Area();
			model.addAttribute("basePath", BasePathUtil.getBasePath(request));
			model.addAttribute("cityList", (List<CityPojo>) CacheMap.getCdcMap().get(CacheMapCode.City.toString()));
			model.addAttribute("propertyList", (List<PropertyPojo>) CacheMap.getCdcMap().get(CacheMapCode.Property.toString()));
			model.addAttribute("list", list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin/building-add";
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

	// 添加楼盘
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/inesrt", method = RequestMethod.POST)
	@ResponseBody
	public Response inesrtBuilding(HttpServletRequest request, ModelMap model, String building_name,
								   String building_addr, String city, String district, String Trade_Area, String building_year,String building_rent_unit,
								   String building_car, String building_car_money, String building_property, String building_property_money,
								   String building_developers, String building_repairtime, String building_acreage, String building_level,
								   String building_rent,String building_rent2, String building_sort, String building_traffic, String cityName, String districtName,
								   String trade_AreaName, String[] position, int property_id,String SEO_describe,String building_price,String building_price_unit,
								   String building_property_unit,String bimage) {
		if (building_car.equals("")) {
			building_car=null;
		}
		if(building_car_money.equals("")){
			building_car_money=null;
		}
		if(building_property_money.equals("")){
			building_property_money=null;
		}
		if(building_repairtime.equals("")){
			building_repairtime=null;
		}
		if(building_acreage.equals("")){
			building_acreage=null;
		}
		if (building_rent_unit==null) {
			building_rent_unit="元/㎡.月 ";
		}
		
		int i = 0;
		try {
			BuildingPojo bp = new BuildingPojo(Trade_Area, building_name, building_addr, building_rent,building_rent_unit,building_year,
					building_car, building_car_money, building_property, building_property_money, building_developers,
					building_repairtime, building_acreage, building_level, building_traffic,
					AppConfig.getLoginUserName(request), new Date(), building_sort, position[0], position[1],
					property_id,SEO_describe,building_price,building_price_unit,building_property_unit);
			i = bs.insertBuilding(bp);
			//添加图片
		
			String[] fileName=bimage.split(",");
			for (String string : fileName) {
				i += bs.addBuilding_Picture(new Building_PicturePojo(bp.getBuilding_id(), string));
			}
			//热门添加数据
			Recommend r = new Recommend(bp.getBuilding_id(), cityName, districtName, trade_AreaName, building_name, "楼盘", AppConfig.getLoginUserName(request));
			i += rs.insertRecommend(r);
			AppConfig.setCacheMap(ss);//缓存数据
			return new NormalResponse(true);
		} catch (Exception e) {
			e.printStackTrace();
			return new ExceptionResponse(e);
		}
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/goToUpdatebuilding")
	public String goToUpdateHouse(HttpServletRequest request, ModelMap model, int id) {
		try {
			Building b = bs.findOne(new Building(id));
			model.addAttribute("basePath", BasePathUtil.getBasePath(request));
			List<CityPojo> cityList = (List<CityPojo>) CacheMap.getCdcMap().get(CacheMapCode.City.toString());
			List<CityPojo> cityLists = new ArrayList<CityPojo>();
			for (CityPojo cityPojo : cityList) {
				if(b.getTrade_area_id().getDistrict_id().getCity_id().getCity_id() == cityPojo.getCity_id()){
					cityLists.add(cityPojo);
				}
			}
			model.addAttribute("cityList", cityLists);
			model.addAttribute("city", (List<CityPojo>) CacheMap.getCdcMap().get(CacheMapCode.City.toString()));
			List<Trade_Area> list = (List<Trade_Area>) CacheMap.getCdcMap().get(CacheMapCode.Trade_Area.toString());
			List<Trade_Area> lists = new ArrayList<Trade_Area>();
			for (Trade_Area trade_Area : list) {
				if(b.getTrade_area_id().getDistrict_id().getDistrict_id() == trade_Area.getDistrict_id().getDistrict_id()){
					lists.add(trade_Area);
				}
			}
			model.addAttribute("trade_AreaList", lists);
			model.addAttribute("propertyList", (List<PropertyPojo>) CacheMap.getCdcMap().get(CacheMapCode.Property.toString()));
			model.addAttribute("b", b);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin/building-update";
	}

	// 修改楼盘
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	@ResponseBody
	public Response updateBuilding(HttpServletRequest request, ModelMap model, String building_name,String building_rent_unit,
								   String building_addr, String city, String district, String Trade_Area, String building_year,
								   String building_car, String building_car_money, String building_property, String building_property_money,
								   String building_developers, String building_repairtime, String building_acreage, String building_level,
								   String building_rent, String building_sort, String building_traffic,int building_id, String[] position,
								   int property_id,String SEO_describe,String building_price,String building_price_unit,String building_property_unit) {
		if (building_car.equals("")) {
			building_car = null;
		}
		if (building_car_money.equals("")) {
			building_car_money = null;
		}
		if (building_property_money.equals("")) {
			building_property_money = null;
		}
		if (building_repairtime.equals("")) {
			building_repairtime = null;
		}
		if (building_acreage.equals("")) {
			building_acreage = null;
		}
		if (building_rent_unit==null) {
			building_rent_unit="元/㎡.月 ";
		}
		try {
			BuildingPojo bp = new BuildingPojo(building_id, Trade_Area, building_name, building_addr, building_rent,building_rent_unit,
					building_year, building_car, building_car_money, building_property, building_property_money,
					building_developers, building_repairtime, building_acreage, building_level, building_traffic,
					AppConfig.getLoginUserName(request), new Date(), building_sort, position[0], position[1], 
					property_id,SEO_describe,building_price,building_price_unit,building_property_unit);
			int i = bs.updateBuilding(bp);
			AppConfig.setCacheMap(ss);// 缓存数据
			return new NormalResponse(i);
		} catch (Exception e) {
			e.printStackTrace();
			return new ExceptionResponse(e);
		}
	}
	//多个文件上传
	@RequestMapping("/up_Files")
	@ResponseBody
	public Object up_Files(MultipartFile file,HttpServletRequest request, String type, String name, String size){
		String fileURL="";
		try {
			// 保存图片并获取放入数据库的文件路径
			 fileURL = FileUtil.saveFile(file, "/static/images/building", AppConfig.image_addr);
			return fileURL;
		} catch (Exception e) {
		   return new ExceptionResponse(e);
		}
		
	}
	

	@RequestMapping(value = "/goToPictureEdit", method = RequestMethod.GET)
	public String goToPictureEdit(HttpServletRequest request, ModelMap model, int id) {
		try {
			List<Building_Picture> list = bs.queryBuildingPicture(id);
			CacheMap.initializationCdcMap("BuildingId", id);
			model.addAttribute("basePath", BasePathUtil.getBasePath(request));
			model.addAttribute("list", list);
			if(list == null){
				model.addAttribute("listSize", 0);
			} else {
				model.addAttribute("listSize", list.size());
			}
			request.getSession().setAttribute("PictureURL", list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin/building-picture-show";
	}
	@SuppressWarnings("unchecked")//图片删除
	@RequestMapping(value = "/deletePicture", method = RequestMethod.POST)
	@ResponseBody
	public Response deletePicture(HttpServletRequest request, ModelMap model, String ids){
		List<Building_Picture> list = (List<Building_Picture>) request.getSession().getAttribute("PictureURL");
		String[] id = ids.split(",");
		if(id.length > 0){
			for (int i = 0; i < id.length; i++) {
				for (Building_Picture bp : list) {
					if(id[i].equals(bp.getBuilding_picture_id()+"")){
						System.out.println("id:"+id[i]+"，路径"+bp.getBuilding_picture_addr());
						String url = FileUtil.getFileURL(request, bp.getBuilding_picture_addr());
						System.out.println(url);
						File f = new File(url);
						if(f.exists()){
							f.delete();
						}
					}
				}
			}
			bs.deletePicture(new DeletePojo(ids));
		}
		return new NormalResponse(1);
	}

	@RequestMapping("/BuildingUp_Files")
	@ResponseBody
	public Response BuildingUp_Files(MultipartFile[] file, HttpServletRequest request) {
		Map<String, Object> map = CacheMap.getCdcMap();
		int id = (int) map.get("BuildingId");
		System.out.println(id);
		try {
			if (file != null) {
				for (int i = 0; i < file.length; i++) {
					// 保存图片并获取放入数据库的文件路径
					String fileURL = FileUtil.saveFile(file[i],"/static/images/building", AppConfig.image_addr);
					bs.addBuilding_Picture(new Building_PicturePojo(id, fileURL));
				}
			}
			return new NormalResponse();
		} catch (Exception e) {
			return new ExceptionResponse(e);
		}
	}
}
