package com.model.pojo;

import java.util.Date;

public class PropertyPojo {
	private int property_id;
	private String property_type;
	private String property_describe;
	private String property_state;
	private String property_userName;
	private Date property_time;
	public PropertyPojo(int property_id, String property_type, String property_describe, String property_state,
			String property_userName, Date property_time) {
		super();
		this.property_id = property_id;
		this.property_type = property_type;
		this.property_describe = property_describe;
		this.property_state = property_state;
		this.property_userName = property_userName;
		this.property_time = property_time;
	}
	public int getProperty_id() {
		return property_id;
	}
	public void setProperty_id(int property_id) {
		this.property_id = property_id;
	}
	public String getProperty_type() {
		return property_type;
	}
	public void setProperty_type(String property_type) {
		this.property_type = property_type;
	}
	public String getProperty_describe() {
		return property_describe;
	}
	public void setProperty_describe(String property_describe) {
		this.property_describe = property_describe;
	}
	public String getProperty_state() {
		return property_state;
	}
	public void setProperty_state(String property_state) {
		this.property_state = property_state;
	}
	public String getProperty_userName() {
		return property_userName;
	}
	public void setProperty_userName(String property_userName) {
		this.property_userName = property_userName;
	}
	public Date getProperty_time() {
		return property_time;
	}
	public void setProperty_time(Date property_time) {
		this.property_time = property_time;
	}
	public PropertyPojo() {
		super();
	}
}
