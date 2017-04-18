package com.controller.admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.util.AppConfig;
import com.util.BasePathUtil;
import com.util.FileUtil;

@Controller
@RequestMapping("/image")
public class ImageUploadController {
   
	@RequestMapping(value = "/upload", produces = "application/json", method = RequestMethod.POST)
	@ResponseBody
	public String Upload( MultipartFile imgFile, HttpServletRequest request)
			throws IllegalStateException, IOException {
		
		Map<String, Object> map = new HashMap<>();
		String path = "";
		List<String> listImagePath = new ArrayList<String>();
		if (imgFile != null) {
			if (!imgFile.isEmpty()) {
				path = FileUtil.saveFile(imgFile,"/static/images/image", AppConfig.img_addr);
				listImagePath.add(path);
			}
		}
		map.put("url", BasePathUtil.getBasePath(request)+path);
		map.put("error", 0);
		return new Gson().toJson(map);
		
	}
	
	
	@RequestMapping(value = "/imgupload", produces = "application/json", method = RequestMethod.POST)
	@ResponseBody
	public String titleimg( MultipartFile file, HttpServletRequest request)
			throws IllegalStateException, IOException {
		Map<String, Object> map = new HashMap<>();
		String path = "";
		if (file != null) {
			if (!file.isEmpty()) {
				path = FileUtil.saveFile(file, "/static/images/image", AppConfig.img_addr);
			}
		}
		map.put("imgUrl",path);
		map.put("error", 0);
		return new Gson().toJson(map);
		
	}

	
}
