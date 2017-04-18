package com.controller.mobile;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import com.service.BuildingService;
import com.service.HouseService;
import com.util.BasePathUtil;

/**
 * 移动端楼盘相关操作
 * @author Administrator
 *
 */
@Controller(value="mobileBuilding")
@RequestMapping("/mBuilding")
public class BuildingController {
	
	@Autowired
	private BuildingService bs;
	
	@Autowired
	private HouseService hs;
	
	@GetMapping("/detail_b{id}.html")
	public String detail(HttpServletRequest request,ModelMap model,@PathVariable(value="id")Integer id){
		 model.addAttribute("basePath", BasePathUtil.getBasePath(request));
		 model.addAttribute("b", bs.get(id));
		 //楼盘图片
		 model.addAttribute("bPics", bs.getPicById(id));
		
		 //热门楼盘
		 model.addAttribute("rList", bs.queryByHot());
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
		model.addAttribute("map", map);
		 //该楼盘下的房源
		 model.addAttribute("hList", hs.getByBuilding(id));
		 //出租房源
		 model.addAttribute("rents", hs.getByHouseType(id,"出租"));
		 //出售房源
		 model.addAttribute("sales", hs.getByHouseType(id,"出售"));
		return "mobile/building_detail";
		}

}
