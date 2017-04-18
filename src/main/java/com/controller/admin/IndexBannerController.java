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
import com.model.Indexbanner;
import com.model.Property;
import com.model.pojo.PagePojo;
import com.service.IndexBannerService;
import com.util.AppConfig;
import com.util.BasePathUtil;
import com.util.FileUtil;

/**
 * 首页banner controller
 * 
 * @author huxiuqin
 *
 */
@Controller
@RequestMapping("/indexbanner")
public class IndexBannerController extends BaseController {

	@Autowired
	private IndexBannerService bannerservice;

	@RequestMapping(value = "/upload", produces = "application/json", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> Upload(@RequestParam(required = false) MultipartFile file, HttpServletRequest request)
			throws IllegalStateException, IOException {
		Map<String, Object> map = new HashMap<>();
		String path = "";
		if (file != null) {
			if (!file.isEmpty()) {
				path =FileUtil.saveFile(file,"/static/images/indexbanner", AppConfig.img_addr);
			}
		}
		map.put("imgUrl", path);
		return map;
	}

	/* 新增功能实现 */
	@RequestMapping(value = "/banner_save", method = RequestMethod.POST)
	public String save(Indexbanner banner, ModelMap model, HttpServletRequest request) {
		banner.setGroundtime(new Date());
		if (banner.getUrl()!=null&&banner.getUrl()!="") {
			if(!banner.getUrl().contains("http://")&&!banner.getUrl().contains("https://")){
				banner.setUrl("http://"+banner.getUrl());
			}
		}
		
		bannerservice.save(banner);
		return list(model, request);
	}

	@RequestMapping(value = "/banner_update", method = RequestMethod.POST)
	public String edit(Integer id, Indexbanner entity, ModelMap model, HttpServletRequest request) {
		Indexbanner banner = bannerservice.findOne(id);
		banner.setPic(entity.getPic());
		banner.setPlatform(entity.getPlatform());
		banner.setPosition(entity.getPosition());
		banner.setSort(banner.getSort());
		banner.setStatus(entity.getStatus());
		banner.setTitle(entity.getTitle());
		String url=entity.getUrl();
		if (url!=null&&banner.getUrl()!="") {
			if (!url.contains("http://")&&!url.contains("https://")) {
				url="http://"+url;
			}else {
				banner.setUrl(url);
			}
		}
		banner.setGroundtime(new Date());
		bannerservice.update(banner);
		return list(model, request);
	}

	@RequestMapping(value = "/getBannerList", produces = "application/json", method = RequestMethod.GET)
	public String list(ModelMap model, HttpServletRequest request) {
		PageHelper.startPage(1, 3);
		Page<Property> list = bannerservice.pageBanner();
		PageResponse page = new PageResponse(list.getPageNum(), list.getPageSize(), list.getTotal(), list.getPages(),
				list, true);
		model.addAttribute("ctx", BasePathUtil.getBasePath(request));
		model.addAttribute("page", page);
		return "admin/banner_list";
	}

	/* 
	 * 按条件分页
	 */
	@RequestMapping(value = "/ajaxPage", method = RequestMethod.POST)
	@ResponseBody // 分页查询
	public PageResponse pageByCon(HttpServletRequest request, ModelMap model, int beginNum, int pageSize, String type,
			String name, String beginTime, String endTime) {
		PageHelper.startPage(beginNum, pageSize);
		PagePojo p = new PagePojo(beginTime, endTime, name, type);
		Page<Indexbanner> list = (Page<Indexbanner>) bannerservice.pageByConIndexBanner(p);
		if (!(list.size() > 0)) {
			return new PageResponse();
		}
		PageResponse page = new PageResponse(list.getPageNum(), list.getPageSize(), list.getTotal(), list.getPages(),
				list, true);
		model.put("page", page);
		return page;

	}

	/* 编辑 */
	@GetMapping("/editPage")
	public String index(ModelMap model, HttpServletRequest request, Integer id) {
		model.addAttribute("ctx", BasePathUtil.getBasePath(request));
		model.addAttribute("ob", bannerservice.findOne(id));
		return "admin/banner_edit";
	}

	/* 新增页面 */
	@GetMapping(value = "/banner_add")
	public String addPage(ModelMap model, HttpServletRequest request) {
		model.addAttribute("ctx", BasePathUtil.getBasePath(request));
		return "admin/banner_add";
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	@ResponseBody
	public Response delete(HttpServletRequest request, ModelMap model, String ids) {
		model.addAttribute("ctx", BasePathUtil.getBasePath(request));
		int i = 0;
		try {
			i = bannerservice.delete(ids);
		} catch (Exception e) {
			e.printStackTrace();
			return new ExceptionResponse(e);
		}
		return new NormalResponse(i);
	}

	@RequestMapping(value = "/changeStatus", method = RequestMethod.POST)
	@ResponseBody
	public Response changeStatus(String state, Integer id, HttpServletRequest request, ModelMap model) {
		int i = 0;
		try {
			Indexbanner entity = bannerservice.findOne(id);
			entity.setStatus(state);
			i = bannerservice.update(entity);
		} catch (Exception e) {
			e.printStackTrace();
			return new ExceptionResponse(e);
		}
		return new NormalResponse(i);
	}
	
	
}
