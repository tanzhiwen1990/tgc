package com.controller.front;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.service.ArticleService;
import com.service.InfomationService;
import com.service.ProblemService;
import com.util.BasePathUtil;

@Controller("front")
@RequestMapping("/front/problem")
public class ProblemController {

	@Autowired
	private ProblemService ps;

	@Autowired
	private ArticleService as;
	
	@Autowired
	private InfomationService is;

	@GetMapping(value = "/{id}.html")
	public String detail(HttpServletRequest request, ModelMap model, @PathVariable(value = "id") Integer id) {
		model.addAttribute("basePath", BasePathUtil.getBasePath(request));
		model.addAttribute("obj", ps.findOne(id));
		// 最新资讯
		model.addAttribute("latest", as.findLatest());
		
		model.addAttribute("infoList",is.findLatest());
		// banner图
		// model.addAttribute("banners", is.selectByCon(1,"pc"));
		return "front/problem_detail";
	}

}
