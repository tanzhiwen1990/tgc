package com.controller.front;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.pagehelper.PageHelper;
import com.service.Trade_AreaService;
import com.util.BasePathUtil;

@Controller
@RequestMapping("/front/trade_area")
public class TradeAreaController {
      
	@Autowired
	private Trade_AreaService tas;
	
	@GetMapping("/detail")
	public String detail(HttpServletRequest request,ModelMap model,Integer id){
		 model.addAttribute("basePath", BasePathUtil.getBasePath(request));
		 model.addAttribute("obj", tas.findOne(id));
		/* 
		 model.addAttribute("picture", tas.getPicById(id));
		 model.addAttribute("rList", tas.queryByHot());
		 model.addAttribute("hs", tas.queryByHot());
		 model.addAttribute("facility", tas.getFacilityById(id));*/
		return "front/trade_area_detail";
	}
	
   @GetMapping("/list")
   public String list(HttpServletRequest request,ModelMap model){
	   model.addAttribute("basePath", BasePathUtil.getBasePath(request));
	   PageHelper.startPage(1, 5);
	   model.addAttribute("tList", tas.queryByHot());
	   
	   return "front/trade_area_list";
   }
}
