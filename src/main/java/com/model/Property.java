package com.model;

import java.util.Date;

public class Property {
   /*编号*/
   private Integer id;
   /*类型*/
   private String type;
   /*描述*/
   private String description;
   /*更新人*/
   private String username;
   /*状态*/
   private String state;
   /*更新时间*/
   private Date time;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public Property(Integer id, String type, String description, String username, String state, Date time) {
		super();
		this.id = id;
		this.type = type;
		this.description = description;
		this.username = username;
		this.state = state;
		this.time = time;
	}
	public Property() {
		super();
	}
	public Property(String type2, String description2, String username2, String state2, Date time2) {
		super();
		this.type = type2;
		this.description = description2;
		this.username = username2;
		this.state = state2;
		this.time = time2;
	}
	   
	   
}
