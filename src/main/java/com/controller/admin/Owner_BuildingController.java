package com.controller.admin;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.controller.response.ExceptionResponse;
import com.controller.response.NormalResponse;
import com.controller.response.PageResponse;
import com.controller.response.Response;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.model.Owner_Building;
import com.model.pojo.PagePojo;
import com.service.Owner_BuildingService;
import com.util.AppConfig;
import com.util.BasePathUtil;

/**
 * 业主放盘
 * 
 * @author MyZhang
 *
 */
@Controller
@RequestMapping("/OBuilding")
public class Owner_BuildingController {
	@Autowired
	private Owner_BuildingService obs;

	@RequestMapping(value = "/goToIndex", method = { RequestMethod.GET })
	public String goToOwner_BuildingControllerIndex(HttpServletRequest request, ModelMap model) {
		PageHelper.startPage(1, AppConfig.pageSize);
		Page<Owner_Building> list = (Page<Owner_Building>) obs.pageOwner_Building();
		PageResponse page = new PageResponse(list.getPageNum(), list.getPageSize(), list.getTotal(), list.getPages(),
				list, true);
		model.addAttribute("basePath", BasePathUtil.getBasePath(request));
		model.addAttribute("page", page);
		return "admin/Owner_Building_list";
	}

	@RequestMapping(value = "/ajaxPage", method = { RequestMethod.POST })
	@ResponseBody//分页查询
	public PageResponse ajaxPage(HttpServletRequest request, ModelMap model, int beginNum, int pageSize, String type,
			String name, String beginTime, String endTime) {
		try {
			PageHelper.startPage(beginNum, pageSize);
			PagePojo p = new PagePojo(beginTime, endTime, name, type);//构建查询条件
			Page<Owner_Building> list = (Page<Owner_Building>) obs.pageConditionOwner_Building(p);
			if (list == null) {
				return new PageResponse();
			}
			PageResponse page = new PageResponse(list.getPageNum(), list.getPageSize(), list.getTotal(),
					list.getPages(), list, true);
			model.addAttribute("page", page);
			return page;
		} catch (Exception e) {
			e.printStackTrace();
			return new PageResponse(e);
		}

	}
	
	@RequestMapping(value="/detail",method=RequestMethod.GET)
	public String  detail(ModelMap model,Integer id,HttpServletRequest request){
		model.addAttribute("data", obs.findOne(id));
		model.addAttribute("basePath", BasePathUtil.getBasePath(request));
		return "admin/Owner_Building_detail";
		
	}
	
	
	@GetMapping(value="/addPage")
	public String addPage(HttpServletRequest request,ModelMap model){
		model.addAttribute("basePath",BasePathUtil.getBasePath(request));
		return "admin/Owner_Building_add";
		
	}
	
	
	@RequestMapping(value="/add",method=RequestMethod.POST)
	@ResponseBody
	public Response add(HttpServletRequest request,ModelMap model,Owner_Building entity){
		entity.setOwner_building_time(new Date());
		int i=0;
		try {
			//Owner_Building oBuilding=new Owner_Building("出租", "西南经协大厦", "18层", 70-90, 80, "张三", "18090890908", new Date());
			//i=obs.save(oBuilding);
		} catch (Exception e) {
			e.printStackTrace();
			return new ExceptionResponse(e);
		}
		
		return new NormalResponse(i);
		
	}
}
