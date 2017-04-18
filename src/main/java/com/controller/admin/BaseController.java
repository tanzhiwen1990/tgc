package com.controller.admin;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.ModelMap;

public class BaseController {
	
	public String getBasePath(HttpServletRequest request,ModelMap model){
		String basePath = request.getScheme() +"://" + request.getServerName()  + ":" +request.getServerPort() +request.getContextPath();
		Map<String , Object> map=new HashMap<>();
		map.put("basePath", basePath);
		return basePath;
		
	}

}
