package com.util;

import java.io.InputStream;
import java.util.Properties;

/**
 * @Title: ReadProperties.java
 * 
 * @Description: TODO 配置文件读取
 * 
 * @author huxiuqin
 * 
 */
public class ReadProperties {
	private static String fileName = "/config.properties";

	public static String getValue(String key) {
		Properties p = new Properties();
		InputStream in = ReadProperties.class.getResourceAsStream(fileName);// 这里有人用new
		try { // FileInputStream(fileName),不过这种方式找不到配置文件。有人说是在classes下，我调过了，不行。
			p.load(in);
			in.close();
			if (p.containsKey(key)) {
				return p.getProperty(key);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return e.toString();
		}
		return null;
	}

}
