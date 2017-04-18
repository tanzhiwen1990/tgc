package com.model;

import java.util.Date;

public class Problem {
	/*ID*/
	private Integer id;
	/*标题*/
	private String title;
	/*答案*/
	private String answer;
	/*更新人*/
	
	private String description;
	
	private String url;
	private String username;
	/*更新时间*/
	private Date updateDate;
	/*状态(已上架，未上架)*/
	private String status;
	
	private String name;
	private String content;
	
	private String imgurl;
	
	public void setImgurl(String imgurl) {
		this.imgurl = imgurl;
	}
	public String getImgurl() {
		return imgurl;
	}
	
	public String getContent() {
		return content;
	}
	
	public void setContent(String content) {
		this.content = content;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getDescription() {
		return description;
	}
	
	public void setDescription(String description) {
		this.description = description;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	
	public String getStatus() {
		return status;
	}
	
	public void setStatus(String status) {
		this.status = status;
	}
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	
	

}
