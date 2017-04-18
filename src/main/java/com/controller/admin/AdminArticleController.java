package com.controller.admin;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
import com.model.Article;
import com.model.pojo.PagePojo;
import com.service.ArticleService;
import com.util.AppConfig;
import com.util.BasePathUtil;

@Controller
@RequestMapping("/article")
public class AdminArticleController {

	@Autowired
	private ArticleService as;
    
	
	@GetMapping(value = "/getArticleList")
	public String index(ModelMap model, HttpServletRequest request) {
		PageHelper.startPage(1, AppConfig.pageSize);
		Page<Article> list = as.pageArticle();
		PageResponse page = new PageResponse(list.getPageNum(), list.getPageSize(), list.getTotal(), list.getPages(),
				list, true);
		model.addAttribute("page", page);
		model.addAttribute("ctx", BasePathUtil.getBasePath(request));
		return "admin/article";
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
		Page<Article> list = (Page<Article>) as.pageByConArticle(p);
		if (!(list.size() > 0)) {
			return new PageResponse();
		}
		PageResponse page = new PageResponse(list.getPageNum(), list.getPageSize(), list.getTotal(), list.getPages(),
				list, true);
		model.put("page", page);
		return page;

	}

	/**
	 * 添加页面
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@GetMapping(value = "/addPage")
	public String addPage(HttpServletRequest request, Model model) {
		model.addAttribute("ctx", BasePathUtil.getBasePath(request));
		return "admin/article_add";
	}

	/**
	 * 添加
	 * 
	 * @param model
	 * @param request
	 * @param entity
	 * @return
	 */
	@RequestMapping(value = "/article_add", method = RequestMethod.POST)
	public String add(ModelMap model, HttpServletRequest request, Article entity) {
		entity.setRealeaseDate(new Date());
		entity.setUsername(AppConfig.getLoginUser(request).getT_realname());
		entity.setStatus("未上线");
		as.save(entity);
		Article bean=as.findOne(entity.getId());
		bean.setUrl("front/article/"+entity.getId()+".html");
		as.update(bean);
		model.addAttribute("ctx", BasePathUtil.getBasePath(request));
		return index(model, request);
	}

	/**
	 * 更新页面
	 * 
	 * @param request
	 * @param model
	 * @param id
	 * @return
	 */
	@GetMapping(value = "/editPage")
	public String editPage(HttpServletRequest request, ModelMap model, Integer id) {
		model.addAttribute("ob", as.findOne(id));
		model.addAttribute("ctx", BasePathUtil.getBasePath(request));
		return "admin/article_edit";
	}

	/**
	 * 跟新
	 * 
	 * @param model
	 * @param request
	 * @param article
	 * @return
	 */
	@RequestMapping(value = "/article_edit", method = RequestMethod.POST)
	public String edit(ModelMap model, HttpServletRequest request,Integer id,String content,String keyword,
			String description,String source,String status,String imgurl){
		Article entity = as.findOne(id);
		entity.setContent(content);
		entity.setDescription(description);
		entity.setKeyword(keyword);
		entity.setSource(source);
		entity.setStatus(status);
		entity.setUrl("front/article/"+id+".html");
		entity.setUsername(AppConfig.getLoginUser(request).getT_realname());
		entity.setRealeaseDate(new Date());
		entity.setImgurl(imgurl);
		as.update(entity);
		return index(model, request);
	}

	/**
	 * 上线/下线操作
	 * 
	 * @param model
	 * @param request
	 * @param state更新状态('已上线','未上线')
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/changeStatus", method = RequestMethod.POST)
	@ResponseBody
	public Response changeStatus(ModelMap model, HttpServletRequest request, String state, Integer id) {
		Article bean = as.findOne(id);
		int i = 0;
		try {
			bean.setStatus(state);
			bean.setUsername(AppConfig.getLoginUserName(request));
			i = as.update(bean);
		} catch (Exception e) {
			e.printStackTrace();
			return new ExceptionResponse(e);
		}

		return new NormalResponse(i);
	}
    
	/**
	 * 删除
	 * @param model
	 * @param request
	 * @param ids
	 * @return
	 */
	@RequestMapping(value = "delete", method = RequestMethod.POST)
	@ResponseBody
	public Response delete(ModelMap model, HttpServletRequest request, String ids) {
		int i = 0;
		try {
			i = as.delete(ids);
		} catch (Exception e) {
			e.printStackTrace();
			return new ExceptionResponse(e);
		}
		return new NormalResponse(i);
	}

}
