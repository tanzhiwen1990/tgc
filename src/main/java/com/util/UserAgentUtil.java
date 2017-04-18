package com.util;

/**
 * 判断请求来自移动端还是pc
 * 
 * @author Administrator
 *
 */
public class UserAgentUtil {
	private final static String[] agent = { "Android", "iPhone", "iPod", "iPad", "Windows Phone", "MQQBrowser" }; // 定义移动端请求的所有可能类型

	/**
	 * 判断User-Agent 是不是来自于手机
	 * 
	 * @param ua
	 * @return
	 */
	public static boolean checkAgentIsMobile(String ua) {
		boolean flag = false;
		if (!"Windows NT".contains(ua) || ("Windows NT".contains(ua) && "compatible; MSIE 9.0;".contains(ua))) {
			// 排除 苹果桌面系统
			if (!"Windows NT".contains(ua) && !"Macintosh".contains(ua)) {
				for (String item : agent) {
					if (ua.contains(item)) {
						flag = true;
						break;
					}
				}
			}
		}
		return flag;
	}
}
