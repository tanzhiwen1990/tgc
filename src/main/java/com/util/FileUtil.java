package com.util;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.web.multipart.MultipartFile;

public class FileUtil {

	public static String saveFile(MultipartFile file,String filePath , String fileName) throws IOException {
		SimpleDateFormat dateFormater = new SimpleDateFormat("yyyy.MM.dd");
		Date date = new Date();
		String newFileName = "";
		String path="";
		if (file.isEmpty()){
            return null;
        } else {
			// 获取文件名+存放的全路径
			path = fileName + "/"+filePath+"/" + dateFormater.format(date);// 存放位置
			File f = new File(path);
			if (f.exists()) {// 判断文件夹是否存在
				
			}else{
				f.mkdirs();
			}

			newFileName = FileUtil.updateFileName(file.getOriginalFilename());
			path = path + "/" + newFileName;
			 file.transferTo(new File(path));
			return  filePath+"/" + dateFormater.format(date) + "/" + newFileName;
		}
		
	}
	
	public static String getFileURL(HttpServletRequest request, String fileName){
		String path = AppConfig.image_addr+fileName;// 存放位置
		return path;
	}

	// 修改文件名称
	public static String updateFileName(String name) {
		String[] names = name.split("\\.");
		long l = System.currentTimeMillis();
		return l + "." + names[names.length - 1];
	}
	//获得文件路径
	public static String returnFileName(HttpServletRequest request, String file) {
		String path =AppConfig.image_addr;
		path = path + file;
		return path;
	}
	//删除文件
	public static boolean deleteFile(String file) {
		File f = new File(file);
		if(f.exists()){
			f.delete();
			return true;
		}
		return false;
	}
}
