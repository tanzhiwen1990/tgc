package com.controller.admin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.controller.response.PageResponse;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.model.Find_House;
import com.model.pojo.PagePojo;
import com.service.Find_HouseService;
import com.util.AppConfig;
import com.util.BasePathUtil;

/**
 * 委托找房Controller
 * 
 * @author MyZhang
 *
 */
@Controller
@RequestMapping("/findhouse")
public class Find_HouseController {
	@Autowired
	private Find_HouseService fhs;

	@RequestMapping(value = "/pageFindHouse", method = RequestMethod.GET)
	public String pageFindHouse(HttpServletRequest request, ModelMap model) {
		try {
			PageHelper.startPage(1, AppConfig.pageSize);
			Page<Find_House> list = (Page<Find_House>) fhs.pageFind_House();
			PageResponse page = new PageResponse(list.getPageNum(), list.getPageSize(), list.getTotal(),
					list.getPages(), list, true);
			model.addAttribute("basePath", BasePathUtil.getBasePath(request));
			request.getSession().setAttribute("list", list);
			model.addAttribute("page", page);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin/Find_House-list";
	}

	@RequestMapping(value = "/ajaxPageFindHouse", method = RequestMethod.POST)
	@ResponseBody//分页查询
	public PageResponse pageFindHouse(HttpServletRequest request, ModelMap model, int beginNum, int pageSize, String type,
			String name, String beginTime, String endTime) {
		try {
			PageHelper.startPage(beginNum, pageSize);
			PagePojo p = new PagePojo(beginTime, endTime, name, type);//构建查询条件
			Page<Find_House> list = (Page<Find_House>) fhs.pageFind_House2(p);
			PageResponse page = new PageResponse(list.getPageNum(), list.getPageSize(), list.getTotal(),
					list.getPages(), list, true);
			model.addAttribute("basePath", BasePathUtil.getBasePath(request));
			request.getSession().setAttribute("list", list);
			model.addAttribute("page", page);
			return page;
		} catch (Exception e) {
			e.printStackTrace();
			return new PageResponse(e);
		}
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/findOneHouse", method = RequestMethod.GET)
	public String findOneHouse(HttpServletRequest request, ModelMap model, int id){
		Page<Find_House> list = (Page<Find_House>)request.getSession().getAttribute("list");
		for (Find_House find_House : list) {
			if(find_House.getFind_house_id() == id){
				model.addAttribute("data", find_House);
			}
		}
		model.addAttribute("basePath", BasePathUtil.getBasePath(request));
		return "admin/Find_House-show";
	}
	
}
