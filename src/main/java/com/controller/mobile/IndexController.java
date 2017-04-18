package com.controller.mobile;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.controller.response.PageResponse;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.google.common.collect.Maps;
import com.model.Information;
import com.service.BuildingService;
import com.service.HouseService;
import com.service.IndexBannerService;
import com.service.InfomationService;
import com.service.ProblemService;
import com.service.PropertyService;
import com.service.SeoService;
import com.service.Trade_AreaService;
import com.util.BasePathUtil;

@Controller(value="frontIndex")
@RequestMapping(value="/mobile")
public class IndexController {
	
	@Autowired
	private BuildingService bs;
	
	@Autowired
	private HouseService hs;
	
	@Autowired
	private Trade_AreaService ts;
	
	//@Autowired
	//private InfomationService is;
	
	@Autowired
	private SeoService ss;
	
	@Autowired
	private ProblemService ps;
	
	@Autowired
	private PropertyService pService;
	
	@Autowired
	 private InfomationService is;
	
	@Autowired
	private IndexBannerService indexBannerService;
	
	/**
	 * 首页
	 * @param request
	 * @param model
	 * @return
	 */
	@GetMapping(value="")
	public String index(HttpServletRequest request,ModelMap model){
		//热门商圈
				model.addAttribute("tList", ts.queryByHot());
				//热门房源
				List<Map<String , Object>> hList= hs.queryByHot();
				//SEO
				model.addAttribute("seo", ss.search("1"));
				model.addAttribute("hList", hList);
				//热门楼盘
				model.addAttribute("rList", bs.queryByHot());
				//首页banner
				model.addAttribute("banner", indexBannerService.search("1","","PC"));
				//咨询新闻
				PageHelper.startPage(1, 6);
				Page<Information> list=(Page<Information>) is.findLatest();
			    PageResponse page=new PageResponse(list.getPageNum(), list.getPageSize(), list.getTotal(),
					   list.getPages(), list, true);
			    model.addAttribute("pList", ps.pageProblem());
				model.addAttribute("page", page);
		model.addAttribute("basePath", BasePathUtil.getBasePath(request));
		return "mobile/index";
		
	}
	
	/**
	 * 找房源
	 * @param request
	 * @param model
	 * @param keyword
	 * @return
	 */
	 @GetMapping("/findHouses")
	   public String findHouses(HttpServletRequest request,ModelMap model,String keyword){
		   model.addAttribute("basePath", BasePathUtil.getBasePath(request));
		   //房源
		   List<Map<String , Object>> hList= hs.queryHouse(keyword);
		   //区域
		   List<Map<String, Object>> rList=hs.getDistrict();
		   List<List<Map<String , Object>>> dList=new ArrayList<>();
		   List<List<Map<String , Object>>> hPicList=new ArrayList<>();
		   for(int k=0;k<hList.size();k++){
			   Integer id=(Integer) hList.get(k).get("house_id");
			   hPicList.add(hs.getPicById(id));
		   }
		   
		   for(int i=0;i<rList.size();i++){
			   dList.add(hs.getDomainById(rList.get(i).get("district_id")));
		   }
		   //物业类型
		   model.addAttribute("property", pService.pageProperty());
		   //最新楼盘
		   model.addAttribute("bList",bs.queryBuilding());
		   model.addAttribute("pList",hPicList);
		   model.addAttribute("district",rList);
		   model.addAttribute("domain",dList);
		   model.addAttribute("hList", hList);
		   Map<String, Object> params=new HashMap<>();
		   params.put("keyword", keyword);
		   model.addAttribute("params",params);
		   PageHelper.startPage(1,3);
		   Page<Map<String, Object>> cList=(Page<Map<String, Object>>) hs.queryHouse(keyword);
		   PageResponse page=new PageResponse(cList.getPageNum(), cList.getPageSize(),cList.getTotal(), 
				   cList.getPages(), cList, true);
		   model.addAttribute("page",page);
		   return "mobile/find_house";
	   }
	 
   /**
    * 热门楼盘 
    * @param request
    * @param model
    * @return
    */
   @GetMapping("/findBuildings")
   public String findBuilding(HttpServletRequest request,ModelMap model,String keyword,Integer districtId,Integer domainId,Integer pageNum){
	   List<Map<String, Object>> cList= bs.queryBuilding(keyword, districtId, domainId);
	   model.addAttribute("page",cList);
	   model.addAttribute("basePath", BasePathUtil.getBasePath(request));
	   model.addAttribute("rList", bs.queryBuilding());
	   Map<String, Object> params=new HashMap<>();
	   params.put("keyword", keyword);
	   model.addAttribute("params",params);
	   return "mobile/find_buildings";
   }
   
   
   /**
    * 业主放盘
    * @param request
    * @param model
    * @return
    */
   @GetMapping("/findRoom")
   public String findRoom(HttpServletRequest request,ModelMap model){
	   model.addAttribute("basePath", BasePathUtil.getBasePath(request));
	   List<Map<String, Object>> rList=hs.getDistrict();
	   List<List<Map<String , Object>>> dList=new ArrayList<>();
	   for(int i=0;i<rList.size();i++){
		   dList.add(hs.getDomainById(rList.get(i).get("district_id")));
	   }
	   model.addAttribute("district",rList);
	   model.addAttribute("domain",dList);
	   return "mobile/find_room";
   }
   
   /**
    * 委托找房
    * @param request
    * @param model
    * @return
    */
   @GetMapping("/house_resource")
   public String houseResource(HttpServletRequest request,ModelMap model){
	   model.addAttribute("basePath", BasePathUtil.getBasePath(request));
	   return "mobile/house_resource";
   }
   
   /**
    * 
    * @param request
    * @param model
    * @param keyword 关键词，楼盘名或者房源名
    * @return
    */
   @GetMapping("/houseList")
   public String searchByKeyword(HttpServletRequest request ,ModelMap model,String keyword){
	   model.addAttribute("basePath", BasePathUtil.getBasePath(request));
	   model.addAttribute("hList", hs.search(keyword));
	   //房源推荐
	   model.addAttribute("hot", hs.queryByHot());
	   //物业类型
	   model.addAttribute("property", pService.pageProperty());
	   List<List<Map<String, Object>>> dList = new ArrayList<>();

	    // 区域
		List<Map<String, Object>> rList = hs.getDistrict();
		for (int i = 0; i < rList.size(); i++) {
			dList.add(hs.getDomainById(rList.get(i).get("district_id")));
		}
		Map<String, Object> params=new HashMap<>();
		 params.put("keyword", keyword);
		 model.addAttribute("params",params);
		model.addAttribute("district", rList);
		//商圈
		model.addAttribute("domain", dList);
		 
	     return "mobile/find_house";
	   
   }
   
   @GetMapping("/searchByParams")
	public String findHouses(HttpServletRequest request,ModelMap model,String keyword,String type,Integer districtId,
			Integer domainId,String houseType,String price,String mi,Integer pageNum,
			@RequestParam(required=false)String style,@RequestParam(required=false)String param,
			@RequestParam(required=false)String sort){
		model.addAttribute("basePath", BasePathUtil.getBasePath(request));
		//房源
		List<Map<String , Object>> hList= hs.queryHouse(keyword);
		//区域
		List<Map<String, Object>> rList=hs.getDistrict();
		List<List<Map<String , Object>>> hPicList=new ArrayList<>();
		for(int k=0;k<hList.size();k++){
			Integer id=(Integer) hList.get(k).get("house_id");
			hPicList.add(hs.getPicById(id));
		}

		//物业类型
		model.addAttribute("property", pService.pageProperty());
		//最新楼盘
		List<Map<String , Object>> bList=bs.queryBuilding();
		//查询楼盘的租售情况
		for(int i=0;i<bList.size();i++){
			//楼盘ID
			Integer id=(Integer)bList.get(i).get("building_id");
			//出租房源数
			bList.get(i).put("rent",hs.getByHouseType(id, "出租").size());
			//出售房源数
			bList.get(i).put("sale",hs.getByHouseType(id, "出售").size());
		}
		model.addAttribute("bList",bList);
		model.addAttribute("pList",hPicList);
		model.addAttribute("district",rList);
		List<List<Map<String, Object>>> dList = new ArrayList<>();

	    // 区域
		for (int i = 0; i < rList.size(); i++) {
			dList.add(hs.getDomainById(rList.get(i).get("district_id")));
		}
		
		model.addAttribute("hList", hList);
		Integer minMi=null;
		Integer maxMi=null;
		Integer minPirce=null,maxPrice=null;
		Map<String,Object> params = Maps.newHashMap();
		if (!StringUtils.isEmpty(mi)) {
			if (mi.contains("-")) {
				int index=mi.indexOf("-");
				if (index==mi.length()-1) {
					minMi=Integer.parseInt(mi.split("-")[0]);
				}else if(index==0){
				    maxMi=Integer.parseInt(mi.split("-")[0]);
				}else {
					minMi=Integer.parseInt(mi.split("-")[0]);
					maxMi=Integer.parseInt(mi.split("-")[1]);
				}
			}else {
				maxMi=Integer.parseInt(mi);
			}
			params.put("minMi",minMi);
			params.put("maxMi",maxMi);
			params.put("mi",mi);
		}
		if (!StringUtils.isEmpty(price)) {
			if (price.contains("~")) {
				int index=price.indexOf("~");
				if (index==price.length()-1) {
					minPirce=Integer.parseInt(price.split("~")[0]);
				}else if(index==0){
					maxPrice=Integer.parseInt(price.split("~")[0]);
				}else {
					minPirce=Integer.parseInt(price.split("~")[0]);
					maxPrice=Integer.parseInt(price.split("~")[1]);
				}
			}else {
				minPirce=Integer.parseInt(price);
			}
			params.put("minPrice",minPirce);
			params.put("maxPrice",maxPrice);
			params.put("price",price);
		}
		
		List<Map<String ,Object>> cList= hs.searchByCondition(keyword, type, districtId, domainId,
				minPirce, maxPrice, houseType, minMi,maxMi,style,param,sort);
		//没有找到合适的，则推荐
		if (cList.size()<1) {
			cList=hs.queryByHot();
			model.addAttribute("hot", cList);
		}
		
		params.put("keyword",keyword);
		params.put("type",type);
		params.put("districtId",districtId);
		params.put("domainId",domainId);
		params.put("houseType",houseType);
		model.addAttribute("hList", cList);
		model.addAttribute("params",params);
		model.addAttribute("domain", dList);
		return "mobile/find_house";
	}
   
}
