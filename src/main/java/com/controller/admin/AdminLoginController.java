package com.controller.admin;

import java.util.List;
import java.util.Map;

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
import com.controller.response.Response;
import com.model.Systemuser;
import com.service.PermissionService;
import com.service.impl.SystemuserServiceImpl;
import com.util.AppConfig;
import com.util.BasePathUtil;

/**
 * 后台登陆
 * 
 * @author MyZhang
 *
 */
@Controller
@RequestMapping("/adminLogin")
public class AdminLoginController {
	@Autowired
	private SystemuserServiceImpl ss;
	
	@Autowired
	private PermissionService ps;
    
	// 后台登陆
	@RequestMapping(value = "/login", method = {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public Response login(HttpServletRequest request, String name , String pwd) throws Exception {
			try {
				Systemuser s_user = ss.LoginSystemuser(name, pwd);
				if (s_user != null) {
					if(!s_user.getT_status().trim().equals("已激活")){
						return new NormalResponse("status is false");
					}
					//登陆用户存入session作用域中
					request.getSession().setAttribute(AppConfig.loginName, s_user);
					request.getSession().setAttribute("user", s_user);
					return new NormalResponse("true");
				} else {
					return new NormalResponse("false");
				}
			} catch (Exception e) {
				// TODO: handle exception
				return new ExceptionResponse(e);
			}
	}

	// 验证码验证
	@GetMapping("/captcha")
	@ResponseBody
	public Response captcha(Map<String, Object> map, String captcha, HttpServletRequest request) {
		String captcha1 = (String) request.getSession(true).getAttribute("captcha");
		try {
			if (captcha1.equalsIgnoreCase(captcha)) {
				map.put("success", "true");
				return new NormalResponse(map);
			} else {
				map.put("success", "false");
				return new NormalResponse(map);
			}
		} catch (Exception e) {
			return new ExceptionResponse(e);
		}
	}

	@GetMapping("/goAdminLogin")
	public String goAdminLogin(HttpServletRequest request,ModelMap model) {
		String ctx = request.getScheme() +"://" + request.getServerName()  + ":" +request.getServerPort() +request.getContextPath();
		model.addAttribute("ctx",ctx );
		return "admin/login";
	}

	@GetMapping("/outLogin") // 退出登录、切换用户
	public String outLogin(HttpServletRequest request,ModelMap model) {
		request.getSession().removeAttribute(AppConfig.loginName);
		String ctx = request.getScheme() +"://" + request.getServerName()  + ":" +request.getServerPort() +request.getContextPath();
		model.addAttribute("ctx",ctx );
		return "admin/login";
	}

	@GetMapping("/goIndex")
	public String goIndex(HttpServletRequest request,ModelMap model) {
		String basePath = BasePathUtil.getBasePath(request);
		AppConfig.setCacheMap(ss);//缓存数据
		model.addAttribute("basePath",basePath);
		Systemuser user=(Systemuser)request.getSession().getAttribute("user");
		if (null!=user) {
			if ("admin".equals(user.getT_user())) {
			  return "admin/index";
		  }else{
			    model.addAttribute("user",user);
				List<Map<String, Object>> pList=ps.getPermissionByRoleId(user.getRoleid().toString());
				//查询用户角色
				Map<String , Object> role=ss.getRoleByRoleId(user.getRoleid());
				for(Map<String , Object> permission:pList) {
						permission.put("menu", ps.getChildMenuByParentId(permission.get("id"),user.getRoleid()));
				}
				model.addAttribute("pList", pList);
				model.addAttribute("role", role);
				return "admin/indexBackUp";
		  }
		
		}else{
		model.addAttribute("ctx",BasePathUtil.getBasePath(request));
		return "admin/login";
		}
		
	}
	@GetMapping("/goWelcome")
	public String goWelcome(HttpServletRequest request,ModelMap model) {
		return "admin/welcome";
	}
}
