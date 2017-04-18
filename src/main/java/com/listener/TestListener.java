package com.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

//测试监听器
public class TestListener implements ServletContextListener {

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		System.out.println("启动监听器");
	}

	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		System.out.println("结束监听器");
	}

}
