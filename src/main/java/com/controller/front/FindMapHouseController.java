package com.controller.front;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.controller.response.ExceptionResponse;
import com.controller.response.NormalResponse;
import com.controller.response.Response;
import com.google.gson.Gson;
import com.model.Trade_Area;
import com.model.pojo.FindMapHousePojo;
import com.model.pojo.HouseMapPojo;
import com.service.HouseService;
import com.service.Trade_AreaService;
import com.util.BasePathUtil;

/**
 * 地图找房Controller
 * 
 * @author MyZhang
 *
 */
@Controller
@RequestMapping("/findMapHouse")
public class FindMapHouseController {
	@Autowired
	private HouseService hs;
	@Autowired
	private Trade_AreaService tas;
	@RequestMapping(value = "/find", method = RequestMethod.POST)
	@ResponseBody
	public Response pageFindHouse(HttpServletRequest request, ModelMap model, String typeText, String district_id,
			String property_id, String paixu) {
		FindMapHousePojo f = new FindMapHousePojo();
		f.setTypeText(typeText);
		if(district_id.equals("不限")){
			district_id=null;
		}else{
			f.setDistrict_id(district_id);
		}
		if(!property_id.equals("")){
			f.setProperty_id(Integer.parseInt(property_id.trim()));
		}
		if(!paixu.equals("")){
			f.setPaixu(Integer.parseInt(paixu.trim()));
		}
		try {
			List<Map<String, Object>> list=hs.queryFindHouseByCon(f);
			model.addAttribute("basePath", BasePathUtil.getBasePath(request));
			return new NormalResponse(list);
		} catch (Exception e) {
			e.printStackTrace();
			return new ExceptionResponse(e);
		}
	}
	
	@RequestMapping(value = "/FindMapTrade_Area", method = RequestMethod.POST)
	@ResponseBody
	public Response FindMapTrade_Area(HttpServletRequest request, ModelMap model) {
		try {
			List<Trade_Area> list =tas.FindMapTrade_Area();
			model.addAttribute("basePath", BasePathUtil.getBasePath(request));
			return new NormalResponse(list);
		} catch (Exception e) {
			e.printStackTrace();
			return new ExceptionResponse(e);
		}
	}
	
	@RequestMapping(value = "/findMapHouse", method = RequestMethod.POST,produces="application/json;charset=UTF-8")
	@ResponseBody
	public Response  findMap(HttpServletRequest request, ModelMap model,String text) {
		model.addAttribute("basePath", BasePathUtil.getBasePath(request));
		if (text.equals("不限")) {
			text=null;
		}
		List<Map<String, Object>> list = hs.pageHouse3(text);
		return new NormalResponse(list);
	}
	
	@RequestMapping(value="/findMapDistrict",method=RequestMethod.POST)
	@ResponseBody
	public Response findMapDistrict(ModelMap model,HttpServletRequest request){
		model.addAttribute("basePath", BasePathUtil.getBasePath(request));
		try {
			List<Map<String, Object>> dList=hs.getDistrict();
			for(int i=0;i<dList.size();i++){
				dList.get(i).put("latitude", BasePathUtil.getLatAndLngByAddress((String)dList.get(i).get("district_name")).get("lat"));
				dList.get(i).put("longitude", BasePathUtil.getLatAndLngByAddress((String)dList.get(i).get("district_name")).get("lng"));
			}
			return new NormalResponse(dList);
		} catch (Exception e) {
			e.printStackTrace();
			return new ExceptionResponse(e);
		}
		
	}
}
