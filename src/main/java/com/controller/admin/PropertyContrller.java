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

import com.controller.response.ExceptionResponse;
import com.controller.response.NormalResponse;
import com.controller.response.PageResponse;
import com.controller.response.Response;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.model.Property;
import com.model.pojo.PagePojo;
import com.service.PropertyService;
import com.util.AppConfig;
import com.util.BasePathUtil;

/**
 * 物业相关操作
 * @author huxiuqin
 * 
 *
 */
@Controller
@RequestMapping("/Property")
public class PropertyContrller {
    @Autowired
	public PropertyService ps;
    
    @GetMapping(value="/getPropertyList")
    public String index(ModelMap model,HttpServletRequest request){
    	PageHelper.startPage(1, AppConfig.pageSize);
    	Page<Property> list=(Page<Property>) ps.pageProperty();
    	PageResponse page=new PageResponse(list.getPageNum(), list.getPageSize(), list.getTotal(), list.getPages(),
    			list, true);
    	model.addAttribute("basePath",BasePathUtil.getBasePath(request));
    	model.addAttribute("page", page);
    	return "admin/property_list";
    }
    
    /*
     * 按条件分页
     */
    @RequestMapping(value="/ajaxPage",method=RequestMethod.POST)
    @ResponseBody//分页查询
    public PageResponse pageByCon(HttpServletRequest request,ModelMap model,int beginNum,int pageSize,String type,
			String name, String beginTime, String endTime){
    	PageHelper.startPage(beginNum, pageSize);
    	PagePojo p=new PagePojo(beginTime, endTime, name, type);
    	Page<Property> list= (Page<Property>) ps.pageByConProperty(p);
    	
    	PageResponse page=new PageResponse(list.getPageNum(), list.getPageSize(), list.getTotal(),
    			list.getPages(), list, true);
    	model.put("page", page);
    	return page;
    	
    }
    
    @RequestMapping(value="/addPage",method=RequestMethod.GET)
    public String addPage(HttpServletRequest request,ModelMap model){
    	model.addAttribute("ctx", BasePathUtil.getBasePath(request));
    	return "admin/property_add";
    }
    
    @RequestMapping(value="/property_add",method=RequestMethod.POST)
    public String add(Property bean ,HttpServletRequest request,ModelMap model) throws ParseException{
    	bean.setUsername(AppConfig.getLoginUserName(request));
    	bean.setState("未上线");
    	bean.setTime(new Date());
    	ps.save(bean);
    	return index(model, request);
    }
    
    
    @RequestMapping(value="/editPage",method=RequestMethod.GET)
    public String editPage(HttpServletRequest request,ModelMap model,Integer id){
    	model.addAttribute("ctx", BasePathUtil.getBasePath(request));
    	Property property=ps.findOne(id);
    	model.addAttribute("obj", property);
    	return "admin/property_edit";
    }
    
    @RequestMapping(value="/edit",method=RequestMethod.POST)
    public String edit(String description,String state,String username,String type,ModelMap model,HttpServletRequest request,Integer id) throws ParseException{
    	Property property=ps.findOne(id);
    	property.setState(state);
    	property.setDescription(description);
    	property.setTime(new Date());
    	property.setUsername(AppConfig.getLoginUserName(request));
    	property.setState(state);
    	ps.update(property);
		return index(model, request);
    }
    
    
    @RequestMapping(value="/changeStatus",method=RequestMethod.POST)
    @ResponseBody
    public Response changeStatus(String state,Integer id,HttpServletRequest request,ModelMap model){
    	int i = 0;
    	try {
    		Property property=ps.findOne(id);
    		property.setUsername(AppConfig.getLoginUserName(request));
        	property.setState(state);
        	i=ps.update(property);
		} catch (Exception e) {
			e.printStackTrace();
			return new ExceptionResponse(e);
		}
    	return new NormalResponse(i);
}

    
    @RequestMapping(value="/delete",method=RequestMethod.POST)
    @ResponseBody
    public NormalResponse delete(HttpServletRequest request,ModelMap model,String ids){
    	int i = 0;
		try {
			i = ps.delete(ids);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new NormalResponse(i);
    }
   
}
