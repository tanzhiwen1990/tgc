package com.controller.admin;


import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.controller.response.ExceptionResponse;
import com.controller.response.NormalResponse;
import com.controller.response.PageResponse;
import com.controller.response.Response;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.google.gson.Gson;
import com.model.Information;
import com.service.InfomationService;
import com.util.AppConfig;
import com.util.BasePathUtil;
import com.util.FileUtil;

/**
 * 行业动态相关
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/information")
public class InfomationController {
	
	@Autowired
	private InfomationService is;
	
	/**
	 * 行业动态列表
	 * @param request
	 * @param model
	 * @return
	 */
	@GetMapping(value="/getInformationList")
	public String index(HttpServletRequest request,ModelMap model){
		PageHelper.startPage(1, AppConfig.pageSize);
		Page<Information> list= (Page<Information>) is.pageInfomation();
		PageResponse page=new PageResponse(list.getPageNum(), list.getPages(), list.getTotal(), list.getPages(), list, true);
		model.addAttribute("page", page);
		model.addAttribute("ctx", BasePathUtil.getBasePath(request));
		return "admin/information_list";
	}
	
	/**
	 * 分页请求
	 * @param beginNum
	 * @param pageSize
	 * @param beginTime
	 * @param endTime
	 * @return
	 */
	@RequestMapping(value="/ajaxPage",method=RequestMethod.POST,produces="application/json;charset=UTF-8")
	@ResponseBody
	public String ajaxPage(Integer beginNum,Integer pageSize,String beginTime,String endTime){
		PageHelper.startPage(beginNum, pageSize);
		Page<Information> list=(Page<Information>) is.pageByConInformation(beginTime,endTime);
		PageResponse page=new PageResponse(list.getPageNum(), list.getPageSize(), list.getTotal(), list.getPages(),
				list, true);
		return new Gson().toJson(page);
		
	}
	
	@GetMapping(value="/addPage")
	public String addPage(HttpServletRequest request,ModelMap model){
		model.addAttribute("ctx", BasePathUtil.getBasePath(request));
		return "admin/information_add";
	}
	
	/**
	 * 添加实现
	 * @param request
	 * @param model
	 * @param entity
	 * @return
	 */
	@PostMapping(value="/add")
	public String add(HttpServletRequest request,ModelMap model,Information entity){
		entity.setUsername(AppConfig.getLoginUserName(request));
		entity.setUpdateDate(new Date());
		entity.setStatus("未上线");
		is.save(entity);
		return index(request, model);
		
	}
	
	/**
	 * 编辑页面
	 * @param request
	 * @param model
	 * @param id
	 * @return
	 */
	@GetMapping(value="/editPage")
	public String editPage(HttpServletRequest request,ModelMap model,Integer id){
		Information infomation=is.findOne(id);
		model.addAttribute("obj", infomation);
		model.addAttribute("ctx", BasePathUtil.getBasePath(request));
		return "admin/information_edit";
		
	}
	
	/**
	 * 编辑实现
	 * @param request
	 * @param model
	 * @param id
	 * @param entity
	 * @return
	 */
	@PostMapping(value="/edit")
	public String edit(HttpServletRequest request,ModelMap model,Integer id,Information entity){
		Information bean=is.findOne(entity.getId());
		bean.setDescription(entity.getDescription());
		bean.setTitle(entity.getTitle());
		bean.setImg(entity.getImg());
		bean.setUrl(entity.getUrl());
		bean.setPlatform(entity.getPlatform());
		bean.setStatus(entity.getStatus());
		bean.setUsername(AppConfig.getLoginUserName(request));
		bean.setUpdateDate(new Date());
		is.update(bean);
		return index(request, model);
	}
	
	/**
	 * 删除
	 * @param request
	 * @param model
	 * @param ids //要删除的数据id,如(4,5,6)
	 * @return
	 */
	@PostMapping(value="/delete")
	@ResponseBody
	public Response delete(HttpServletRequest request,ModelMap model,String ids){
		int i=0;
		try {
			i=is.delete(ids);
		} catch (Exception e) {
			e.printStackTrace();
			return new ExceptionResponse(e);
		}
		return new NormalResponse(i);
		
	}
	
	/**
	 * 状态修改
	 * @param request
	 * @param model
	 * @param id //需要修改的内容id
	 * @param state //更新状态
	 * @return
	 */
	@PostMapping(value="/changeStatus")
	@ResponseBody
	public Response changeStatus(HttpServletRequest request,ModelMap model,Integer id,String state){
		int i=0;
		Information infomation=is.findOne(id);
		infomation.setUpdateDate(new Date());
		infomation.setUsername(AppConfig.getLoginUserName(request));
		infomation.setStatus(state);
	    try {
			i=is.update(infomation);
		} catch (Exception e) {
			e.printStackTrace();
			return new ExceptionResponse(e);
		}
		return new NormalResponse(i);
		
	}
	/**
	 * 图片上传
	 * @param file
	 * @param request
	 * @return
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	@RequestMapping(value = "/upload", produces = "application/json", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> Upload(@RequestParam(required = false) MultipartFile file, HttpServletRequest request)
			throws IllegalStateException, IOException {
		Map<String, Object> map = new HashMap<>();
		String path = "";
		List<String> listImagePath = new ArrayList<String>();
		if (file != null) {
			if (!file.isEmpty()) {
				// 获得文件后缀名称
				 path=FileUtil.saveFile(file, "/static/images/information", AppConfig.img_addr);
				listImagePath.add(path);
			}
		}
		map.put("imgUrl", path);
		return map;
	} 

}
