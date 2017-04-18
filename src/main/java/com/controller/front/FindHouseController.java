package com.controller.front;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.controller.response.ExceptionResponse;
import com.controller.response.NormalResponse;
import com.controller.response.Response;
import com.model.Find_House;
import com.service.Find_HouseService;

/**
 * 前台委托找房controller
 * @author huxiuqin
 *
 */
@Controller
@RequestMapping("/front/findHouse")
public class FindHouseController {
	
	@Autowired
	private Find_HouseService fhs;
	
	@RequestMapping(value="/add",method = RequestMethod.POST)
	@ResponseBody
	public Response add(Find_House entity){
		
		entity.setFind_house_state("未上线");
		entity.setFind_house_time(new Date());
		int i=0;
		try {
			i=fhs.save(entity);
		} catch (Exception e) {
			e.printStackTrace();
			return new ExceptionResponse(e);
		}
		return new NormalResponse(i);
	}
	
	

}
