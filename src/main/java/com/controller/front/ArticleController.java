package com.controller.front;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.model.Article;
import com.service.ArticleService;
import com.service.HouseService;
import com.service.InfomationService;
import com.util.BasePathUtil;
import com.util.UserAgentUtil;

/**
 * 首页新闻资讯相关
 * @author Administrator
 *
 */
@Controller
@RequestMapping("front/article")
public class ArticleController {
   @Autowired
   private ArticleService as;
   
   @Autowired
   private InfomationService is;
   
   @Autowired
   private HouseService hs;
   @GetMapping(value="/{id}.html")
   public String detail(HttpServletRequest request,ModelMap model,@PathVariable(value="id") Integer id,
		   @RequestParam(required=false)String type){
	   model.addAttribute("ob", as.findOne(id));
	   model.addAttribute("basePath", BasePathUtil.getBasePath(request));
	   //最新资讯
	   model.addAttribute("latest", is.findLatest());
	   model.addAttribute("type", type);
       String ua=request.getHeader("User-Agent");
       if (UserAgentUtil.checkAgentIsMobile(ua)) {
    	 //热门房源推荐
    	   model.addAttribute("hList", hs.queryByHot());
		return "mobile/article_detail";
	   }else{
		   //行业动态
		   model.addAttribute("infoList",is.findLatest());
		   int length=as.getPre(id).size();
		 
		   //当前文章的前一篇
		   if (length<1) {
			   model.addAttribute("pre", "已经是第一篇");
		   }else if (length==1) {
			   model.addAttribute("pre", as.getPre(id).get(0));
		   }else {
			   model.addAttribute("pre", as.getPre(id).get(length-1));
		   }
		   //当前文章的下一篇
		
		   if (as.getNext(id)!=null) {
			  model.addAttribute("next", as.getNext(id));
		 }
		   return "front/article_detail";
	   }
   }
   
}
