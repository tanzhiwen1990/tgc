package com.controller.admin;


import java.io.IOException;
import java.text.ParseException;

import java.util.Date;
import java.util.HashMap;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.controller.response.ExceptionResponse;
import com.controller.response.NormalResponse;
import com.controller.response.PageResponse;
import com.controller.response.Response;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.model.Surpporting_Facilities;
import com.model.pojo.PagePojo;
import com.service.Surpporting_FacilitiesService;
import com.util.AppConfig;
import com.util.BasePathUtil;
import com.util.FileUtil;

@Controller
@RequestMapping("/surpporting_facilities")
public class Surpporting_FacilitiesController {
	
	@Autowired
	private Surpporting_FacilitiesService sfs;
	
	@RequestMapping(value="/getSFList",method=RequestMethod.GET)
	public String index(HttpServletRequest request,ModelMap model){
		PageHelper.startPage(1, AppConfig.pageSize);
		Page<Surpporting_Facilities> list = (Page<Surpporting_Facilities>) sfs.pageSurpporting_Facilities();
		PageResponse page = new PageResponse(list.getPageNum(), list.getPageSize(), list.getTotal(), list.getPages(),
				list, true);
		model.addAttribute("basePath", BasePathUtil.getBasePath(request));
		model.addAttribute("page", page);
		return "admin/Surpporting_Facilities_list";
	}
	
	@RequestMapping(value = "/ajaxPage", method = { RequestMethod.POST })
	@ResponseBody//分页查询
	public PageResponse ajaxPage(HttpServletRequest request, ModelMap model, int beginNum, int pageSize, String type,
			String name, String beginTime, String endTime) {
		try {
			PageHelper.startPage(beginNum, pageSize);
			PagePojo p = new PagePojo(beginTime, endTime, name, type);//构建查询条件
			Page<Surpporting_Facilities> list = (Page<Surpporting_Facilities>) sfs.pageByConSurpporting_Facilities(p);
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
	
	@RequestMapping(value="/addPage",method=RequestMethod.GET)
	public String addPage(HttpServletRequest request,ModelMap model){
		model.addAttribute("basePath", BasePathUtil.getBasePath(request));
		return "admin/Surpporting_Facilities_add";
	}
	
	/*新增*/
	@RequestMapping(value="/property_add",method=RequestMethod.POST)
    public String add(Surpporting_Facilities entity,HttpServletRequest request,ModelMap model) throws ParseException{
    	entity.setUsername(AppConfig.getLoginUserName(request));
    	entity.setState("未上线");
    	entity.setTime(new Date());
    	sfs.save(entity);
    	return index(request, model);
    }
    
	/*图片上传*/
	@RequestMapping(value="/upload",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> upload(MultipartFile file,HttpServletRequest request) throws IllegalStateException, IOException{
		String key="";
		Map<String , Object> map=new HashMap<>();
        if (file!=null) {
 	            if(!file.isEmpty()){  
 	                key=FileUtil.saveFile(file, "/static/images/surpporting_facilities", AppConfig.img_addr);
 	            }  
 	        } 
        map.put("imgUrl", key);
		return map;
	}

	
   /*修改状态*/
	@RequestMapping(value="changeStatus",method=RequestMethod.POST)
	@ResponseBody
	public Response changeStatus(HttpServletRequest request,String state,Integer id){
		int i=0;
		try{
			Surpporting_Facilities entity=sfs.findOne(id);
			entity.setUsername(AppConfig.getLoginUserName(request));
			entity.setTime(new Date());
			entity.setState(state);
			i=sfs.update(entity);
		}catch(Exception e){
			e.printStackTrace();
			return new ExceptionResponse(e);
		}
		
		return new NormalResponse(i);
	}
	
	/*编辑页面*/
	@RequestMapping(value="/editPage",method=RequestMethod.GET)
	public String editPage(HttpServletRequest request,ModelMap model,Integer id){
		model.addAttribute("basePath", BasePathUtil.getBasePath(request));
		model.addAttribute("ob", sfs.findOne(id));
		return "admin/Surpporting_Facilities_edit";
	}
	
	/*更新*/
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public String editPage(HttpServletRequest request,ModelMap model,Integer id,String username,String name,String state,String addr,String picUrl ){
		model.addAttribute("ctx", BasePathUtil.getBasePath(request));
		Surpporting_Facilities entity= sfs.findOne(id);
		entity.setName(name);
		entity.setAddr(addr);
		entity.setPicUrl(picUrl);
		entity.setState(state);
		entity.setTime(new Date());
		entity.setUsername(username);
		sfs.update(entity);
		return index(request, model);
	}
	
	/*删除*/
    @RequestMapping(value="/delete",method=RequestMethod.POST)
    @ResponseBody
    public Response delete(String ids,ModelMap model,HttpServletRequest request){
    	int i=0;
    	try {
    		i=sfs.delete(ids);
		} catch (Exception e) {
			e.printStackTrace();
		}
    	return new NormalResponse(i);
    }
	
}
