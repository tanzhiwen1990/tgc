package com.util;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @Title: CaptchaUtil.java
 * 
 * @Description: 图片验证码生成
 * 
 * @author tianjianping@meloinfo.com
 * 
 * @date 2016年9月6日 下午1:52:22
 */
public class CaptchaUtil {
	private CaptchaUtil() {
	}

	/*
	 * 随机字符字典
	 */
	private static final char[] CHARS = { '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F', 'G',
			'H', 'J', 'K', 'L', 'M', 'N', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };

	/*
	 * 随机数
	 */
	private static Random random = new Random();

	/*
	 * 获取6位随机数
	 */
	private static String getRandomString() {
		StringBuffer buffer = new StringBuffer();
		for (int i = 0; i < 6; i++) {
			buffer.append(CHARS[random.nextInt(CHARS.length)]);
		}
		return buffer.toString();
	}

	/*
	 * 获取随机数颜色
	 */
	@SuppressWarnings("unused")
	private static Color getRandomColor() {
		return new Color(random.nextInt(255), random.nextInt(255), random.nextInt(255));
	}

	/*
	 * 返回某颜色的反色
	 */
	@SuppressWarnings("unused")
	private static Color getReverseColor(Color c) {
		return new Color(255 - c.getRed(), 255 - c.getGreen(), 255 - c.getBlue());
	}

	public static void outputCaptcha(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("image/jpeg");

		String randomString = getRandomString();
		request.getSession(true).setAttribute("captcha", randomString);

		int width = 100;
		int height = 30;

		//Color color = Color.;
		Color reverse = Color.black;

		BufferedImage bi = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		Graphics2D g = bi.createGraphics();
		g.setFont(new Font(Font.SANS_SERIF, Font.BOLD, 16));
		//g.setColor(color);
		g.fillRect(0, 0, width, height);
		g.setColor(reverse);
		g.drawString(randomString, 18, 20);

		// 转成JPEG格式
		ServletOutputStream out = response.getOutputStream();
		ImageIO.write(bi, "JPEG", out);
		out.flush();
	}
}