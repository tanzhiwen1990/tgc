package com.controller.front;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.google.common.collect.Maps;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.controller.response.PageResponse;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.google.gson.Gson;
import com.model.House;
import com.model.Information;
import com.model.Problem;
import com.model.Property;
import com.service.BuildingService;
import com.service.FrindLinkService;
import com.service.HouseService;
import com.service.IndexBannerService;
import com.service.InfomationService;
import com.service.ProblemService;
import com.service.PropertyService;
import com.service.SeoService;
import com.service.Trade_AreaService;
import com.util.BasePathUtil;
import com.util.UserAgentUtil;



/**
 * 前端数据集成
 * @author huxiuqin
 *
 */
@Controller
@RequestMapping("/index")
public class IndexController {
	@Autowired
	private Trade_AreaService tas;

	//@Autowired
	//private Owner_BuildingService obs;

	@Autowired
	private BuildingService bs;

	@Autowired 
	private HouseService hs;

	@Autowired
	private PropertyService ps;

	@Autowired
	private ProblemService pService;


	@Autowired
	private  FrindLinkService fs;
	
	@Autowired
	private SeoService ss;
	
	@Autowired
	private IndexBannerService is;
    
	@Autowired
	 private InfomationService info;
	@GetMapping(value="")
	public String index(HttpServletRequest request,ModelMap model){
		
		model.addAttribute("basePath", BasePathUtil.getBasePath(request));
		//热门商圈
		model.addAttribute("tList", tas.queryByHot());
		//热门房源
		List<Map<String , Object>> hList= hs.queryByHot();
		model.addAttribute("hList", hList);
		//热门楼盘
		List<Map<String,Object>> map=bs.queryByHot();
		
		//SEO
		model.addAttribute("seo",ss.search("1"));
		//行业资讯
		PageHelper.startPage(1, 6);
		Page<Information> list=(Page<Information>) info.findLatest();
		PageResponse page=new PageResponse(list.getPageNum(), list.getPageSize(), list.getTotal(),
				list.getPages(), list, true);
		model.addAttribute("page", page);
		//如果访问设备为移动端
		if(UserAgentUtil.checkAgentIsMobile(request.getHeader("User-Agent"))){
			  //热门楼盘
			  model.addAttribute("rList", map);
			  //知识问答
			  model.addAttribute("pList", pService.pageProblem());
			 //首页banner
			  model.addAttribute("banner", is.search("1","","PC"));
			return "mobile/index";
		}else{  //如果是浏览器访问
			for(int i=0;i<map.size();i++){
				map.get(i).put("houseNum", hs.getByBuilding((Integer)map.get(i).get("building_id")).size());
			}
			model.addAttribute("rList", map);
			
		    //知识问答
			PageHelper.startPage(1, 6);
			Page<Problem> pList=(Page<Problem>) pService.frontPageProblem();
			PageResponse data=new PageResponse(pList.getPageNum(), pList.getPageSize(), pList.getTotal(),
					pList.getPages(), pList, true);
			model.addAttribute("result", data);
			
			//banner图
			model.addAttribute("banner",is.search("1","","微信") );
			return "front/index";
		}
	}
	
	/**
	 * 合作伙伴
	 * @return json
	 */
	@GetMapping(value="/friendlink",produces="application/json;charset=utf-8;")
	@ResponseBody
	public String getFriendLink(){
		return new Gson().toJson(fs.findShow());
	}

	@GetMapping("/map")
	public String map(HttpServletRequest request,ModelMap model){
		model.addAttribute("basePath", BasePathUtil.getBasePath(request));
		return "front/map";
	}
    
	/**
	 * 找房源
	 * @param request
	 * @param model
	 * @param keyword 关键字(楼盘或者房源名称)
	 * @param type 
	 * @param districtId 所属地区id(如渝北区 id=1)
	 * @param domainId  所属商圈id(如光电园 id=2)
	 * @param houseType 物业类型id(如写字楼 id=2)
	 * @param price   价格(string 如70~80)
	 * @param mi      面积(string 如70-80)
	 * @param style   租/售(string 出租/出售)
	 * @param param   排序字段(如价格 ->house_money )
	 * @param sort    升序/降序(ASC/DESC)
	 * @param pageNum 当前页(integer)
	 * @return
	 */
	@GetMapping("/findHouses")
	public String findHouses(HttpServletRequest request,ModelMap model,String keyword,String type,Integer districtId,Integer domainId,
							 String houseType,String price,String mi,
							 @RequestParam(required=false)String style,@RequestParam(required=false)String param,
							 @RequestParam(required=false)String sort,Integer pageNum){
		model.addAttribute("basePath", BasePathUtil.getBasePath(request));
		//SEO
		model.addAttribute("seo",ss.search("6"));
		//房源
		List<Map<String , Object>> hList= hs.queryHouse(keyword);
		//区域
		List<Map<String, Object>> rList=hs.getDistrict();
		List<List<Map<String , Object>>> hPicList=new ArrayList<>();
		for(int k=0;k<hList.size();k++){
			Integer id=(Integer) hList.get(k).get("house_id");
			hPicList.add(hs.getPicById(id));
		}
         //购房知识
		model.addAttribute("infoList", pService.frontPageProblem());
		//物业类型
		model.addAttribute("property", ps.pageProperty());
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
		if(pageNum == null) pageNum = 1;
		PageHelper.startPage(pageNum, 4);
		Page<Map<String ,Object>> cList=(Page<Map<String, Object>>) hs.searchByCondition(keyword, type, districtId, domainId,
				minPirce, maxPrice, houseType, minMi, maxMi,style,param,sort);
		PageResponse page=new PageResponse(cList.getPageNum(), cList.getPageSize(),cList.getTotal(),cList.getPages(), cList, true);
		params.put("keyword",keyword);
		params.put("type",type);
		params.put("districtId",districtId);
		params.put("domainId",domainId);
		params.put("houseType",houseType);
		params.put("style", style);
		params.put("param", param);
		params.put("sort", sort);
		model.addAttribute("page", page);
		model.addAttribute("params",params);
		if (UserAgentUtil.checkAgentIsMobile(request.getHeader("User-Agent"))) {
			   List<List<Map<String , Object>>> dList=new ArrayList<>();
			   for(int i=0;i<rList.size();i++){
				   dList.add(hs.getDomainById(rList.get(i).get("district_id")));
			   }
			   model.addAttribute("domain",dList);
			return "mobile/find_house";
		}else{
			if(districtId != null){
				model.addAttribute("domain", hs.getDomainById(districtId));
			}
			return "front/find_houses";
		}
		
	}

	/**
	 * 找房分页
	 * @param pageSize
	 * @param beginNum
	 * @return
	 */
	@RequestMapping(value="/ajaxHouses",method=RequestMethod.POST,produces="application/json;charset=UTF-8")
	@ResponseBody
	public String ajaxHouses(Integer pageSize,Integer beginNum,String keyword){
		PageHelper.startPage(beginNum,pageSize);
		Page<Map<String, Object>> cList=(Page<Map<String, Object>>) hs.queryHouse(keyword);
		PageResponse page=new PageResponse(cList.getPageNum(),cList.getPageSize(), cList.getTotal(), cList.getPages(),
				cList, true);
		return new Gson().toJson(page);

	}

    /**
     * 热门楼盘
     * @param request
     * @param model
     * @param keyword
     * @param districtId
     * @param domainId
     * @param pageNum
     * @return
     */
	@GetMapping("/findBuildings")
	public String findBuilding(HttpServletRequest request,ModelMap model,String keyword,Integer districtId,Integer domainId,Integer pageNum){
		//SEO
		model.addAttribute("seo",ss.search("5"));
		Map<String,Object> params = Maps.newHashMap();
		params.put("keyword",keyword);
		params.put("districtId",districtId);
		params.put("domainId",domainId);
		model.addAttribute("params",params);
		model.addAttribute("basePath", BasePathUtil.getBasePath(request));
		if (UserAgentUtil.checkAgentIsMobile(request.getHeader("User-Agent"))) {
			 List<Map<String, Object>> cList= bs.queryBuilding(keyword, districtId, domainId);
			 model.addAttribute("page",cList);
			return "mobile/find_buildings";
		}else{
			//区域
			List<Map<String, Object>> rList=hs.getDistrict();
			model.addAttribute("district",rList);
			if(districtId != null){
				model.addAttribute("domain", hs.getDomainById(districtId));
			}
			if(pageNum == null) pageNum = 1;
			PageHelper.startPage(pageNum,16);
			Page<Map<String, Object>> cList=(Page<Map<String, Object>>) bs.queryBuilding(keyword,districtId,domainId);
			//下属房源数量
			for (int i = 0; i < cList.getResult().size(); i++) {
				cList.getResult().get(i).put("houseNum", hs.getByBuilding((Integer)cList.getResult().get(i).get("building_id")).size());
			}
			PageResponse page=new PageResponse(cList.getPageNum(),cList.getPageSize(), cList.getTotal(), cList.getPages(),
					cList, true);
			model.addAttribute("page",page);
			
		  return "front/find_buildings";
		}
	}

	@RequestMapping(value="/ajaxBuilding",method=RequestMethod.POST,produces="application/json;charset=UTF-8")
	@ResponseBody
	public String ajaxBuilding(Integer pageSize,Integer beginNum){
		PageHelper.startPage(beginNum,pageSize);
		Page<Map<String, Object>> cList=(Page<Map<String, Object>>) bs.queryBuilding();
		PageResponse page=new PageResponse(cList.getPageNum(),cList.getPageSize(), cList.getTotal(), cList.getPages(),
				cList, true);
		return new Gson().toJson(page);

	}
    
	/**
	 * 委托找房
	 * @param request
	 * @param model
	 * @return
	 */
	@GetMapping("/findRoom")
	public String findRoom(HttpServletRequest request,ModelMap model){
		//SEO
		model.addAttribute("seo",ss.search("3"));
		model.addAttribute("basePath", BasePathUtil.getBasePath(request));
		List<Map<String, Object>> rList=hs.getDistrict();
		List<List<Map<String , Object>>> dList=new ArrayList<>();
		for(int i=0;i<rList.size();i++){
			dList.add(hs.getDomainById(rList.get(i).get("district_id")));
		}
		model.addAttribute("district",rList);
		model.addAttribute("domain",dList);
		if(UserAgentUtil.checkAgentIsMobile(request.getHeader("User-Agent"))){
			return "mobile/find_room";
		}else{
			return "front/find_room";
		}
		
	}
   
	/**
	 * 业主放盘
	 * @param request
	 * @param model
	 * @return
	 */
	@GetMapping("/house_resource")
	public String houseResource(HttpServletRequest request,ModelMap model){
		model.addAttribute("basePath", BasePathUtil.getBasePath(request));
		//SEO
	    model.addAttribute("seo",ss.search("2"));
	    //检查访问设备
	    if(UserAgentUtil.checkAgentIsMobile(request.getHeader("User-Agent"))){
	    	 return "mobile/house_resource";
	    }else{
	    	return "front/house_resource";
	    }
		
	}
	
	/**
	 * 地图找房
	 * @param request
	 * @param model
	 * @param text
	 * @return
	 */
	@GetMapping("/findMap")
	public String findMap(HttpServletRequest request, ModelMap model,@RequestParam(required=false)String text) {
		//SEO
	    model.addAttribute("seo",ss.search("4"));
		model.addAttribute("basePath", BasePathUtil.getBasePath(request));
		model.addAttribute("hList", hs.queryByHot());
		List<Property> pList = ps.queryPropertyByStatus();
		model.addAttribute("property", pList);
		model.addAttribute("district", hs.getDistrict());
		Page<Map<String, Object>> list =  hs.pageHouse3(text);
		model.addAttribute("list", list.getResult());
		Map<String , Object> map=new HashMap<>();
		map.put("houses", list.getResult());
		return "front/find_map";
	}

	@RequestMapping(value="/search",method=RequestMethod.POST,produces="application/json;charset=UTF-8")
	public String search(HttpServletRequest request,ModelMap model,String con){
		//SEO
		model.addAttribute("seo",ss.search("6"));
		Page<House> hList=hs.search(con);
		PageResponse page=new PageResponse(hList.getPageNum(), hList.getPageSize(), hList.getTotal(),
				hList.getPages(), hList, true);
		model.addAttribute("page", page);
		model.addAttribute("hList", hList.getResult());
		model.addAttribute("basePath", BasePathUtil.getBasePath(request));
		return "front/findHouses";
	}

	/**
	 * 条件查询
	 * @param type
	 * @param districtId
	 * @param domainId
	 * @param houseType
	 * @param price
	 * @param mi
	 * @return
	 */
	@RequestMapping(value="/searchByCondition",method=RequestMethod.POST,produces="application/json;charset=UTF-8")
	@ResponseBody
	public String ajaxByCondition(String type,Integer districtId,Integer domainId,
								  String houseType,String price,String mi,Integer beginNum,Integer pageSize,
								  @RequestParam(required=false)String style,@RequestParam(required=false)String param,
								  @RequestParam(required=false)String sort){
		Integer minMi=0;
		Integer maxMi=0;
		Integer minPirce=0,maxPrice=0;
		if (!StringUtils.isEmpty(mi)) {
			minMi=Integer.parseInt(mi.split("-")[0]);
			maxMi=Integer.parseInt(mi.split("-")[1]);
		}
		if (!StringUtils.isEmpty(price)) {
			minPirce=Integer.parseInt(price.split("~")[0]);
			maxPrice=Integer.parseInt(price.split("~")[1]);
		}
		PageHelper.startPage(beginNum, pageSize);
		Page<Map<String ,Object>> hList=(Page<Map<String, Object>>) hs.searchByCondition("",type,districtId,domainId,
				minPirce,maxPrice,houseType, minMi,maxMi,style,param,sort);
		PageResponse page=new PageResponse(hList.getPageNum(), hList.getPageSize(), hList.getTotal(),
				hList.getPages(), hList, true);
		Gson gson=new Gson();
		return gson.toJson(page);
	}


	/**
	 * 知识问答
	 * @param request
	 * @param model
	 * @return
	 */
	@GetMapping(value="/problem")
	public String problem(HttpServletRequest request,ModelMap model){
		model.addAttribute("basePath", BasePathUtil.getBasePath(request));
		PageHelper.startPage(1, 6);
		Page<Problem> list=(Page<Problem>) pService.pageProblem();
		PageResponse page=new PageResponse(list.getPageNum(), list.getPageSize(), list.getTotal(),
				list.getPages(), list, true);
		model.addAttribute("page",page);
		return "front/problem";
	}

	/**
	 * 新闻分页
	 * @param beginNum
	 * @param pageSize
	 * @return
	 */
	@RequestMapping(value="/ajaxNews",method=RequestMethod.POST,produces="application/json;charset=UTF-8")
	@ResponseBody
	public String ajaxArticle(Integer beginNum,Integer pageSize){
		if (beginNum==null) {
			beginNum=1;
		}
		PageHelper.startPage(beginNum, pageSize);
		Page<Information> list=(Page<Information>) info.findLatest();
		PageResponse page=new PageResponse(list.getPageNum(), list.getPageSize(), list.getTotal(),
				list.getPages(), list, true);
		return new Gson().toJson(page);

	}
   
	
	@RequestMapping(value="/ajaxProblem",method=RequestMethod.POST,produces="application/json;charset=UTF-8")
	@ResponseBody
	public String ajaxProblem(Integer beginNum,Integer pageSize){
		if (beginNum==null||beginNum==0) {
			beginNum=1;
		}
		PageHelper.startPage(beginNum, pageSize);
		Page<Problem> lists=(Page<Problem>)pService.pageProblem();
		PageResponse page=new PageResponse(lists.getPageNum(), lists.getPageSize(), lists.getTotal(),
				lists.getPages(), lists, true);
		return new Gson().toJson(page);

	}


}
