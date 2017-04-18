package com.controller.admin;

import java.text.ParseException;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.controller.response.NormalResponse;
import com.controller.response.PageResponse;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.model.Seo;
import com.service.SeoService;
import com.util.AppConfig;
import com.util.BasePathUtil;

/**
 * 后台seo设置
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/adminSeo")
public class SeoController {
   @Autowired
   private SeoService ss;
   
   @GetMapping(value="/getSeoList")
   public String list(HttpServletRequest request,ModelMap model){
	    PageHelper.startPage(1, AppConfig.pageSize);
	   	Page<Seo> list=(Page<Seo>) ss.pageSeo();
	   	PageResponse page=new PageResponse(list.getPageNum(), list.getPageSize(), list.getTotal(), list.getPages(),
	   			list, true);
	   	model.addAttribute("ctx",BasePathUtil.getBasePath(request));
	   	model.addAttribute("page", page);
	   	return "admin/seo_list";
   }
   /*
    * 按条件分页
    */
   @RequestMapping(value="/ajaxPage",method=RequestMethod.POST)
   @ResponseBody//分页查询
   public PageResponse pageByCon(HttpServletRequest request,ModelMap model,int beginNum,int pageSize,
			 String beginTime, String endTime){
   	PageHelper.startPage(beginNum, pageSize);
   	Page<Seo> list= (Page<Seo>) ss.pageByConSeo(beginTime,endTime);
   	if (!(list.size()>0)) {
			return new PageResponse();
		}
   	PageResponse page=new PageResponse(list.getPageNum(), list.getPageSize(), list.getTotal(),
   			list.getPages(), list, true);
   	model.put("page", page);
   	return page;
   	
   }
   @RequestMapping(value="/addPage",method=RequestMethod.GET)
   public String addPage(HttpServletRequest request,ModelMap model){
   	model.addAttribute("ctx", BasePathUtil.getBasePath(request));
   	return "admin/seo_add";
   }
   
   @RequestMapping(value="/seo_add",method=RequestMethod.POST)
   public String add(Seo bean ,HttpServletRequest request,ModelMap model) throws ParseException{
   	bean.setUsername(AppConfig.getLoginUserName(request));
   	bean.setDate(new Date());
   	ss.save(bean);
   	return list(request, model);
   }
   
   
   @RequestMapping(value="/editPage",method=RequestMethod.GET)
   public String editPage(HttpServletRequest request,ModelMap model,Integer id){
   	model.addAttribute("ctx", BasePathUtil.getBasePath(request));
   	Seo entity=ss.findOne(id);
   	model.addAttribute("obj", entity);
   	return "admin/seo_edit";
   }
   
   @RequestMapping(value="/edit",method=RequestMethod.POST)
   public String edit(String description,String keyword,String title,ModelMap model,HttpServletRequest request,Integer id) throws ParseException{
   	Seo entity=ss.findOne(id);
    entity.setDescription(description);
    entity.setTitle(title);
    entity.setKeyword(keyword);
   	entity.setDate(new Date());
   	entity.setUsername(AppConfig.getLoginUserName(request));
   	ss.update(entity);
		return list(request, model);
   }
   
   
   
   @RequestMapping(value="/delete",method=RequestMethod.POST)
   @ResponseBody
   public NormalResponse delete(HttpServletRequest request,ModelMap model,String ids){
   	int i = 0;
		try {
			i = ss.delete(ids);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new NormalResponse(i);
   }
  
}
