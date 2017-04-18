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
import com.model.Owner_Building;
import com.service.Owner_BuildingService;

@Controller(value="Owner_Building")
@RequestMapping("/front/owner")
public class Owner_BuildingController {
  
	@Autowired
	private Owner_BuildingService obs;
	
	@RequestMapping(value="/add",method=RequestMethod.POST)
	@ResponseBody
	public Response add(Owner_Building entity){
		int i=0;
		entity.setOwner_building_time(new Date());
		entity.setOwner_building_state("未上线");
		try {
			i=obs.save(entity);
		} catch (Exception e) {
			e.printStackTrace();
			return new ExceptionResponse(e);
		}
		
		return new NormalResponse(i);
	}
}
