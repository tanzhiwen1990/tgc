package com.model;

import java.util.Date;

public class Surpporting_Facilities {
	/*编号*/
	private Integer id;
	/*名称*/
	private String name;
	/*地址*/
	private String addr;
	/*状态*/
	private String state;
	/*更新人*/
	private String username;
	
	/*图片路径*/
	private String picUrl;
	/*更新时间*/
	private Date time;
	public String getPicUrl() {
		return picUrl;
	}
	public void setPicUrl(String picUrl) {
		this.picUrl = picUrl;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public Surpporting_Facilities(Integer id, String name, String addr, String state, String username, Date time,String picUrl) {
		super();
		this.id = id;
		this.name = name;
		this.addr = addr;
		this.state = state;
		this.username = username;
		this.time = time;
		this.picUrl=picUrl;
	}
	public Surpporting_Facilities() {
		super();
	}
	public Surpporting_Facilities(String name2, String addr2, String state2, String username2, String picUrl2, Date time2) {
		super();
		this.name = name2;
		this.addr = addr2;
		this.state = state2;
		this.username = username2;
		this.picUrl = picUrl2;
		this.time = time2;
	}
	
	
	

}
