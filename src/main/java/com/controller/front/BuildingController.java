package com.controller.front;

import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
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
import com.github.pagehelper.StringUtil;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.service.BuildingService;
import com.service.HouseService;
import com.service.IndexBannerService;
import com.util.AmapHelper;
import com.util.AppConfig;
import com.util.BasePathUtil;
import com.util.UserAgentUtil;

@Controller("building")
@RequestMapping("front/building")
public class BuildingController {
    
	@Autowired
	private BuildingService bs;
	
	@Autowired
	private HouseService hs;
	
	@Autowired
	private IndexBannerService is;
	
	 @GetMapping("/detail")
	 public String detail(HttpServletRequest request,ModelMap model,Integer id){
		 model.addAttribute("basePath", BasePathUtil.getBasePath(request));
		 model.addAttribute("b", bs.get(id));
		 //楼盘图片
		 model.addAttribute("bPics", bs.getPicById(id));
		 //热门楼盘
		 List<Map<String , Object>> bList=bs.queryByHot();
		 //查询每个楼盘下出租/出售的房源
		 for (int i = 0; i < bList.size(); i++) {
	      bList.get(i).put("rentNum", hs.getByHouseType((Integer)bList.get(i).get("building_id"), "出租").size());
	      bList.get(i).put("saleNum", hs.getByHouseType((Integer)bList.get(i).get("building_id"), "出售").size());
		}
		
		 model.addAttribute("rList", bList);
		 //热门房源
		 model.addAttribute("hs", hs.queryByHot());
		 //获取地图位置
		 Map<String, BigDecimal> map = new HashMap<String, BigDecimal>();
		 String longitude=(String) bs.get(id).get("longitude");
		 String latitude=(String) bs.get(id).get("latitude");
		 if (longitude!=null && latitude!=null) {
			  map.put("lat", new BigDecimal(longitude));
		      map.put("lng", new BigDecimal(latitude));
		 }else {
			map=BasePathUtil.getLatAndLngByAddress((String)bs.get(id).get("building_addr"));
		}
	      model.addAttribute("map",map );
		 //出租房源
		 model.addAttribute("rents", hs.getByHouseType(id,"出租"));
		 //出售房源
		 model.addAttribute("sales", hs.getByHouseType(id,"出售"));
		 if (UserAgentUtil.checkAgentIsMobile(request.getHeader("User-Agent"))) {
			 return "mobile/building_detail";
		}else{
			 //楼盘图片
			 PageHelper.startPage(1, 4);
			 Page<Map<String, Object>> list=(Page<Map<String, Object>>) bs.getPicById(id);
			 PageResponse page=new PageResponse(list.getPageNum(), list.getPageSize(), list.getTotal(), 
					 list.getPages(), list, true);
			 model.addAttribute("page", page);
			 //banner
			 model.addAttribute("banner", is.search("2",bs.get(id).get("building_name").toString(),"微信"));
			 int i=is.search("2",bs.get(id).get("building_name").toString(),"微信").size();
			 
			 //获取最近的一个地铁站
			 String location=(String)bs.get(id).get("longitude");
			 location+=","+(String)bs.get(id).get("latitude");
			 //优先查地铁,如果没有，则坐公交
			// Gson gson=new Gson();
		    JsonArray jsonArray= AmapHelper.name("地铁", location, 1000, AppConfig.ak).get("results").getAsJsonArray();
		     if (jsonArray.size()>0) {
				model.addAttribute("station", jsonArray.get(0).getAsJsonObject());
				model.addAttribute("keyword", "地铁");
			}else{
				jsonArray=AmapHelper.name("公交", location, 1000, AppConfig.ak).get("results").getAsJsonArray();
				model.addAttribute("station", jsonArray.get(0).getAsJsonObject());
				model.addAttribute("keyword", "公交");
			}
		 return "front/building_detail";
		}
	 }
	 
	 @RequestMapping(value="/ajaxPage",produces="application/json;charset=UTF-8",method=RequestMethod.POST)
	 @ResponseBody
	 public String ajaxPage(Integer id,Integer pageSize,Integer beginNum){
		 if(pageSize==null){
			 pageSize=4;
		 }if (beginNum==null) {
			beginNum=1;
		}
		 PageHelper.startPage(beginNum, pageSize);
		 Page<Map<String, Object>> list=(Page<Map<String, Object>>) bs.getPicById(id);
		 PageResponse page=new PageResponse(list.getPageNum(), pageSize, list.getTotal(), 
				 list.getPages(), list, true);
		 Gson gson=new Gson();
		 return gson.toJson(page);
	 }
	 
	 
	 @RequestMapping(value="/sort",method=RequestMethod.POST,produces="application/json;charset=UTF-8")
	 @ResponseBody
	 public String sort(String con,String paixu,String  districtid,Integer propertyid,String keyword,HttpServletRequest request,ModelMap model) throws UnsupportedEncodingException{
		 if(districtid.equals("区域")){
			 districtid=null;
		 }
		 List<Map<String, Object>> bList=hs.sortByCon(con,paixu,districtid,propertyid,keyword);
		 Gson gson=new Gson();
		 return gson.toJson(bList);
	 }
	 
	 /**
	  * 按条件查询房源
	  */
	 @RequestMapping(value="/search",method=RequestMethod.POST,produces="application/json;charset=utf-8")
	 @ResponseBody
	 public String search(Integer id,String type,String mi,Integer beginNum,Integer pageSize){
		 Integer minMi=null;
		 Integer maxMi=null;
		 if (StringUtil.isNotEmpty(mi)) {
			if(mi.contains("-")){
				minMi=Integer.parseInt(mi.split("-")[0]);
				maxMi=Integer.parseInt(mi.split("-")[1]);
			}else {
				minMi=Integer.parseInt(mi);
			}
		}
		 PageHelper.startPage(beginNum, pageSize);
		 Page<Map<String , Object>> hList=(Page<Map<String, Object>>) hs.getHouseByParam(id, type,minMi,maxMi);
		 PageResponse page=new PageResponse(beginNum, pageSize, hList.getTotal(), hList.getPages(), hList, true);
		 return new Gson().toJson(page);
		 
	 }
	
	 /**
	  * 
	  * @param id
	  * @param style 出租/出售
	  * @param beginNum
	  * @param pageSize
	  * @return
	  */
	 @RequestMapping(value="getByBidAndBStyele",produces="application/json;charset=UTF-8")
	 @ResponseBody
	 public String getByBidAndStyle(Integer id,String style,Integer beginNum,Integer pageSize){
		 PageHelper.startPage(beginNum, pageSize);
		 Page<Map<String , Object>> list=(Page<Map<String, Object>>) hs.getByHouseType(id, style);
		 PageResponse page=new PageResponse(beginNum, pageSize, list.getTotal(), list.getPages(), list, true);
		 return new Gson().toJson(page);
	 }
	 
}
