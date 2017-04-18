package com.model;

import java.util.Date;
public class Article {
	
	private Integer id;
	//内容
	private String content;
	
	private Date realeaseDate;
	private String title;
	//访问路径
	private String url;
	//关键词
	private String keyword;
	//描述
	private String description;
	//更新人
	private String username;
	//来源
	private String source;
	
	private String status;
	
	private String imgurl;
	
	public String getImgurl() {
		return imgurl;
	}
	
	public void setImgurl(String imgurl) {
		this.imgurl = imgurl;
	}
	
	public String getStatus() {
		return status;
	}
	
	public void setStatus(String status) {
		this.status = status;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getSource() {
		return source;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getUsername() {
		return username;
	}
	
	public String getKeyword() {
		return keyword;
	}
	public void setSource(String source) {
		this.source = source;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRealeaseDate() {
		return realeaseDate;
	}
	public void setRealeaseDate(Date realeaseDate) {
		this.realeaseDate = realeaseDate;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	
	public String getTitle() {
		return title;
	}
    
	
	public Article() {
		super();
	}

	public Article(String content, Date realeaseDate, String title, String keyword, String description) {
		super();
		this.content = content;
		this.realeaseDate = realeaseDate;
		this.title = title;
		this.keyword = keyword;
		this.description = description;
	} 
	
	
	
	
	

}
