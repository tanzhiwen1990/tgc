package com.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * SEO 实体类
 * 
 * @Table t_seo
 * @author Administrator
 *
 */
public class Seo {
	
	private Integer id;

	private String username; // 更新人
	
    @DateTimeFormat(pattern="yyyy-MM-dd")
	private Date date; // 更新时间

	private String title; // 标题

	private String description; // 描述

	private String keyword; // 关键词

	private String position; // 页面

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}

}
