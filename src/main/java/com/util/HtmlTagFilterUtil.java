package com.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 过滤img标签
 * @author Administrator
 *
 */
public class HtmlTagFilterUtil {
	public static String replace(String content){
		String regxpForImgTag = "<img\\s[^>]+/>";
		Pattern pattern = Pattern.compile(regxpForImgTag);
		Matcher matcher = pattern.matcher(content);
		while (matcher.find()) {
		    String temp = matcher.group();
		    String tempUrl = temp.substring(temp.indexOf("src=") + 5);
		    tempUrl =tempUrl.substring(0, tempUrl.indexOf("\""));
		    String urlResult = "another url";   
		    content = content.replace(temp, urlResult);
		}
		return content;
	}

}
