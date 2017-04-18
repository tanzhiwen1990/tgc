package com.controller.admin;

import java.io.File;
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
import org.springframework.util.StringUtils;
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
import com.model.FriendLink;
import com.service.FrindLinkService;
import com.util.AppConfig;
import com.util.BasePathUtil;

/**
 * 友情链接相关操作
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/friendLink")
public class FriendLinkController {
	
	@Autowired
	private FrindLinkService fs;
	
	/**
	 * 友链列表
	 * @param request
	 * @param model
	 * @return
	 */
	@GetMapping(value="/getFriendLinkList")
	public String index(HttpServletRequest request,ModelMap model){
	    PageHelper.startPage(1, AppConfig.pageSize);
	    Page<FriendLink> list=(Page<FriendLink>) fs.pageFriendLink();
	    PageResponse page=new PageResponse(list.getPageNum(), list.getPageSize(), list.getTotal(), 
	    		list.getPages(), list, true);
		model.addAttribute("page", page);
		model.addAttribute("ctx",BasePathUtil.getBasePath(request));
		return "admin/friend_link_list";
		
	}
	
	/**
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@PostMapping(value="/ajaxPage",produces="application/json;charset=UTF-8")
	@ResponseBody
	public String ajaxPage(String beginTime,String endTime,Integer beginNum,Integer pageSize){
		PageHelper.startPage(beginNum, pageSize);
		Page<FriendLink> list=(Page<FriendLink>) fs.pageByConFriendLink(beginTime,endTime);
	    PageResponse page=new PageResponse(list.getPageNum(), list.getPageSize(), list.getTotal(), 
	    		list.getPages(), list, true);
		return new Gson().toJson(page);
	}
	
	/*添加页面*/
	@GetMapping(value="/addPage")
	public String addPage(HttpServletRequest request,ModelMap model){
		model.addAttribute("ctx", BasePathUtil.getBasePath(request));
		return "admin/friend_link_add";
	}
	
	/**
	 * 添加实现
	 * @param request
	 * @param model
	 * @param entity
	 * @return
	 */
	@PostMapping(value="/friendLink_add")
	public String add(HttpServletRequest request,ModelMap model,FriendLink entity){
		entity.setStatus("未上线");
		entity.setUsername(AppConfig.getLoginUserName(request));
		entity.setReleaseDate(new Date());
		fs.save(entity);
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
		model.addAttribute("ctx", BasePathUtil.getBasePath(request));
		model.addAttribute("obj", fs.findOne(id));
		return "admin/friend_link_edit";
	}
	
	/**
	 * 编辑实现
	 * @param request
	 * @param model
	 * @param id
	 * @param entity
	 * @return
	 */
	@PostMapping(value="/friendLink_edit")
	public  String update(HttpServletRequest request,ModelMap model,Integer id,FriendLink entity){
		FriendLink bean=fs.findOne(entity.getId());
		bean.setCompanyname(entity.getCompanyname());
		bean.setDescription(entity.getDescription());
		if (!StringUtils.isEmpty(entity.getLinkurl())) {
			bean.setLinkurl(entity.getLinkurl());
		}
		if (!StringUtils.isEmpty(entity.getLogo())) {
			bean.setLogo(entity.getLogo());
		}
		bean.setUsername(entity.getUsername());
		bean.setStatus(entity.getStatus());
		bean.setReleaseDate(new Date());
		bean.setUsername(AppConfig.getLoginUserName(request));
		fs.update(bean);
		
		return index(request, model);
		
	}
	
	/**
	 * 删除
	 * @param ids 要删除的ids,如4，5，6
	 * @return
	 */
	@PostMapping(value="/delete",produces="application/json")
	@ResponseBody
	public Response delete(String ids){
		int i=0;
		try {
			i=fs.delete(ids);
		} catch (Exception e) {
			e.printStackTrace();
			return new ExceptionResponse(e);
		}
		
		return new NormalResponse(i);
	}
	
	/**
	 * 状态修改
	 * @param state
	 * @param id
	 * @param request
	 * @return
	 */
	@PostMapping(value="/changeStatus",produces="application/json")
	@ResponseBody
	public Response changeStatus(String state,Integer id,HttpServletRequest request){
		int i=0;
		FriendLink bean=fs.findOne(id);
		try {
			bean.setReleaseDate(new Date());
			bean.setUsername(AppConfig.getLoginUserName(request));
			bean.setStatus(state);
			i=fs.update(bean);
		} catch (Exception e) {
			e.printStackTrace();
			return new ExceptionResponse(e);
		}
		return new NormalResponse(i);
	}
	
	/**
	 * logo上传
	 * @param file
	 * @param request
	 * @return
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	@RequestMapping(value ="/upload", produces = "application/json", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> Upload(@RequestParam(required = false) MultipartFile file, HttpServletRequest request)
			throws IllegalStateException, IOException {
		String pathRoot = request.getSession().getServletContext().getRealPath("");
		Map<String, Object> map = new HashMap<>();
		String path = "";
		List<String> listImagePath = new ArrayList<String>();
		if (file != null) {
			if (!file.isEmpty()) {
				String contentType = file.getContentType();
				// 获得文件后缀名称
				String imageName = contentType.substring(contentType.indexOf("/") + 1);
				path = "/images/" + new Date().getTime() + "." + imageName;
				file.transferTo(new File(pathRoot + path));
				listImagePath.add(path);
			}
		}
		map.put("imgUrl", path);
		return map;
	}

}
