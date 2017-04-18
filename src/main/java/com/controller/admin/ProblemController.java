package com.controller.admin;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

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
import com.model.Problem;
import com.service.ArticleService;
import com.service.ProblemService;
import com.util.AppConfig;
import com.util.BasePathUtil;
import com.util.FileUtil;

@Controller
@RequestMapping("/problem")
public class ProblemController {
  
	@Autowired
	private ProblemService ps;
	
	@Autowired
	private ArticleService as;
	
	/**
	 * 购房知识后台列表页
	 * @param request
	 * @param model
	 * @return
	 */
	@GetMapping(value="/getProblemList")
	public  String index(HttpServletRequest request, ModelMap model) {
		PageHelper.startPage(1, AppConfig.pageSize);
		Page<Problem> pList=(Page<Problem>) ps.pageProblem();
		PageResponse  page=new PageResponse(pList.getPageNum(), pList.getPageSize(), pList.getTotal(),
				pList.getPages(), pList, true);
		model.addAttribute("page", page);
		model.addAttribute("ctx", BasePathUtil.getBasePath(request));
		return "admin/problem_list";
	}
	
	@RequestMapping(value="/ajaxPage",method = RequestMethod.POST)
	@ResponseBody
	public PageResponse ajaxPage(HttpServletRequest request,ModelMap model,Integer pageSize,
			Integer beginNum,String beginTime,String endTime){
		PageHelper.startPage(beginNum, pageSize);
		Page<Problem> pList=ps.pageProblemByCon(beginTime,endTime);
		PageResponse page=new PageResponse(pList.getPageNum(), pList.getPageSize(), pList.getTotal(),
				pList.getPages(), pList, true);
		return page;
		
	}
	
	/**
	 * 添加页
	 * @param request
	 * @param model
	 * @return
	 */
	@GetMapping(value="/addPage")
	public String addPage(HttpServletRequest request,ModelMap model){
		model.addAttribute("ctx", BasePathUtil.getBasePath(request));
		return "admin/problem_add";
	}
	
	/**
	 * 添加方法
	 * @param entity
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/problem_add",method = RequestMethod.POST)
	public String add(Problem entity,HttpServletRequest request ,ModelMap model){
		entity.setUpdateDate(new Date());
		
		if(!entity.getUrl().contains("http://")&&!entity.getUrl().contains("https://")){
			entity.setUrl("http://"+entity.getUrl());
		}
		entity.setUsername(AppConfig.getLoginUserName(request));
		entity.setStatus("未上线");
		ps.save(entity);
		model.addAttribute("ctx", BasePathUtil.getBasePath(request));
		return index(request,model);
	}
	
	/**
	 * 编辑页面
	 * @param request
	 * @param model
	 * @param id
	 * @return
	 */
	@GetMapping("/editPage")
	public String editPage(HttpServletRequest request,ModelMap model,Integer id){
		model.addAttribute("ctx",BasePathUtil.getBasePath(request));
		model.addAttribute("obj", ps.findOne(id));
		return "admin/problem_edit";
		
	}
	
	/**
	 * 编辑实现
	 * @param request
	 * @param model
	 * @param entity
	 * @return
	 */
	@RequestMapping(value="/problem_edit",method = RequestMethod.POST)
	public String edit(HttpServletRequest request,ModelMap model,Problem entity){
		Problem bean=ps.findOne(entity.getId());
		if (bean.getTitle()!=entity.getTitle()) {
			bean.setTitle(entity.getTitle());
		}
		if (entity.getStatus()!=bean.getStatus()) {
			bean.setStatus(entity.getStatus());
		}
		if (entity.getDescription()!=bean.getDescription()) {
			bean.setDescription(entity.getDescription());
		}
		if (bean.getUrl()!=entity.getUrl()) {
			String url=entity.getUrl();
			String id=url.substring(url.indexOf("e/")+2, url.length()-5).toString();
			Pattern pattern = Pattern.compile("[0-9]*");  
			if(pattern.matcher(id).matches()){
				bean.setName(as.findOne(Integer.parseInt(id)).getTitle());
		    	bean.setContent(as.findOne(Integer.parseInt(id)).getContent());
			}
			if(!entity.getUrl().contains("http://")&&!entity.getUrl().contains("https://")){
				bean.setUrl("http://"+entity.getUrl());
			}
		}
		bean.setUpdateDate(new Date());
		bean.setUsername(AppConfig.getLoginUserName(request));
		ps.update(bean);
		model.addAttribute("ctx", BasePathUtil.getBasePath(request));
		return index(request, model);
	}
	
	@RequestMapping(value="/delete",method=RequestMethod.POST)
	@ResponseBody
	public Response delete(HttpServletRequest request,ModelMap model,String ids){
		int i=0;
		try {
			i=ps.delete(ids);
		} catch (Exception e) {
			e.printStackTrace();
			return new ExceptionResponse(e);
		}
		return new NormalResponse(i);
	}
	
	@RequestMapping(value="/changeStatus",method=RequestMethod.POST)
	@ResponseBody
	public Response changeStatus(HttpServletRequest request,Integer id,String state){
		int i=0;
		Problem entity=ps.findOne(id);
		entity.setUsername(AppConfig.getLoginUserName(request));
		entity.setUpdateDate(new Date());
		entity.setStatus(state);
	    try {
			i=ps.update(entity);
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
				 path=FileUtil.saveFile(file, "/static/images/problem", AppConfig.img_addr);
				listImagePath.add(path);
			}
		}
		map.put("imgUrl", path);
		return map;
	} 

}

