package com.controller.front;

import javax.servlet.http.HttpServletRequest;


import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import com.util.BasePathUtil;
import com.util.UserAgentUtil;

@Controller
@RequestMapping(value = "/special")
public class SendRequestController {
	@GetMapping("/{name}")
	public String send(HttpServletRequest request, ModelMap model,@PathVariable(value="name")String name) {
		model.addAttribute("basePath", BasePathUtil.getBasePath(request));
		String ua = request.getHeader("User-Agent");
		if (UserAgentUtil.checkAgentIsMobile(ua)) {
			return "mobile/"+name;
		} else {
			return "front/"+name;
		}
	}
	
	/**
	 * 联系我们
	 * @param request
	 * @param model
	 * @return
	 */
	@GetMapping("/about?type=1")
	public String contact(HttpServletRequest request, ModelMap model) {
		model.addAttribute("basePath", BasePathUtil.getBasePath(request));
		String ua = request.getHeader("User-Agent");
		if (UserAgentUtil.checkAgentIsMobile(ua)) {
			return "mobile/about";
		} else {
			return "front/about";
		}
	}
	
	

}
