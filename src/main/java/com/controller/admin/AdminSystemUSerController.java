package com.controller.admin;

import java.util.Date;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
import com.model.Systemuser;
import com.service.RoleService;
import com.service.SystemuserService;
import com.util.AppConfig;
import com.util.BasePathUtil;

/**
 * 系统账号相关操作
 * 
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/systemuser")
public class AdminSystemUSerController {
	@Autowired
	private SystemuserService ss;

	@Autowired
	private RoleService rs;

	@GetMapping("/getSystemUserList")
	public String list(HttpServletRequest request, ModelMap model) {
		PageHelper.startPage(1, AppConfig.pageSize);
		Page<Systemuser> uList = (Page<Systemuser>) ss.pageSystemUser();
		PageResponse page = new PageResponse(uList.getPageNum(), uList.getPageSize(), uList.getTotal(),
				uList.getPages(), uList, true);
		model.addAttribute("page", page);
		model.addAttribute("ctx", BasePathUtil.getBasePath(request));
		return "admin/user_list";
	}

	/**
	 * 分页查询
	 * 
	 * @param pageNum
	 * @param pageSize
	 * @return
	 */
	@PostMapping("/ajaxPage")
	@ResponseBody
	public PageResponse ajaxPage(Integer beginNum, Integer pageSize,String beginTime,String endTime) {
		if (beginNum==null) {
			beginNum=1;
		}
		PageHelper.startPage(beginNum, pageSize);
		Page<Systemuser> uList = (Page<Systemuser>) ss.pageSystemUser(beginTime,endTime);
		PageResponse page = new PageResponse(uList.getPageNum(), uList.getPageSize(), uList.getTotal(),
				uList.getPages(), uList, true);
		return page;
	}

	@GetMapping("/addOrEditPage")
	public String addOrEditPage(HttpServletRequest request, ModelMap model, Integer id) {
		model.addAttribute("ctx", BasePathUtil.getBasePath(request));
		model.addAttribute("role", rs.pageRole());
		if (id == null) {
			return "admin/user_add";
		} else {
			Systemuser ob = ss.getOneById(id);
			model.addAttribute("ob", ob);
			return "admin/user_edit";
		}
	}

	@RequestMapping(value = "/addOrEdit", method = RequestMethod.POST)
	public String addOrEdit(HttpServletRequest request, ModelMap model, Systemuser entity, Integer id) {
		if (id == null) {
			if (entity.getT_password().isEmpty()) {
				entity.setT_password("123456");
			}
			entity.setT_status("未激活");
			entity.setT_createtime(new Date());
			entity.setT_name(AppConfig.getLoginUserName(request));
			ss.save(entity);
		} else {
			Systemuser bean = ss.getOneById(id);
			/* if (bean.getT_name()!=AppConfig.getLoginUserName(request)) {
				 bean.setT_name(AppConfig.getLoginUserName(request));
			}else if (bean.getRoleid()!= entity.getRoleid()) {
				
			}else if (bean.getT_realname()!=entity.getT_realname()) {
				
			}else if (bean.getT_user()!=entity.getT_user()) {
				
			}*/
			
			bean.setRoleid(entity.getRoleid());
			bean.setT_realname(entity.getT_realname());
			bean.setT_user(entity.getT_user());
			bean.setT_name(AppConfig.getLoginUserName(request));
			bean.setT_createtime(new Date());
			ss.update(bean);
		}

		model.addAttribute("ctx", BasePathUtil.getBasePath(request));
		return list(request, model);
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	@ResponseBody
	public NormalResponse delete(HttpServletRequest request, ModelMap model, String ids) {
		int i = 0;
		try {
			i = ss.delete(ids);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new NormalResponse(i);
	}
	
	  @RequestMapping(value="/changeStatus",method=RequestMethod.POST)
	    @ResponseBody
	    public Response changeStatus(String state,Integer id,HttpServletRequest request,ModelMap model){
	    	int i = 0;
	    	try {
	    		Systemuser user=ss.getOneById(id);
	    		user.setT_name(AppConfig.getLoginUser(request).getT_user());
	        	user.setT_status(state);
	        	i=ss.update(user);;
			} catch (Exception e) {
				e.printStackTrace();
				return new ExceptionResponse(e);
			}
	    	return new NormalResponse(i);
	}

}
