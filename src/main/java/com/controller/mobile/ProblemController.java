package com.controller.mobile;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.service.ArticleService;
import com.service.HouseService;
import com.service.IndexBannerService;
import com.service.ProblemService;
import com.util.BasePathUtil;

@Controller(value="problem")
@RequestMapping(value="mobile/problem")
public class ProblemController {
	@Autowired
    private ProblemService ps;
	
	@Autowired
	private HouseService hs;
	
	@Autowired
	private ArticleService as;
	
	@Autowired
	private IndexBannerService is;
  
  @GetMapping(value="/{id}.html")
  public String detail(HttpServletRequest request,ModelMap model,@PathVariable(value="id")Integer id){
	  model.addAttribute("basePath", BasePathUtil.getBasePath(request));
	  model.addAttribute("obj", ps.findOne(id));
	  //最新资讯
	  model.addAttribute("latest", as.findLatest());
	  //房源推荐
	  model.addAttribute("hList", hs.queryByHot());
	  //banner图
	  //model.addAttribute("banners", is.selectByCon(1,"pc"));
	  return "mobile/problem_detail";
  }
}
