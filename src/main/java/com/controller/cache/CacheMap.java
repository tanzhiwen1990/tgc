package com.controller.cache;

import java.util.HashMap;
import java.util.Map;

/**
 * 缓存对象
 * 
 * @author MyZhang
 *
 */
public class CacheMap {
	private static HashMap<String, Object> cdcMap = new HashMap<String, Object>();

	private CacheMap() {
	}

	public static Map<String, Object> getCdcMap() {
		if (cdcMap == null) {
			cdcMap = new HashMap<String, Object>();
		}
		return cdcMap;
	}
	/**
	 * 初始化数据
	 * @param type
	 * @param list
	 */
	public static void initializationCdcMap(String type,Object list) {
		if (cdcMap == null) {
			cdcMap = new HashMap<String, Object>();
		}
		cdcMap.put(type, list);
	}
}
