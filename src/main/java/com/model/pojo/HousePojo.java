package com.model.pojo;

import java.util.Date;

public class HousePojo {
	private int house_id;
	private String building_id;
	private String house_name;
	private String house_money;
	private String house_type;
	private String house_mi;
	private String house_unit;
	private String house_num;
	private String house_orientation;
	private String house_decoration_type;
	private String house_address;
	private String house_intime;
	private String house_linkman;
	private String house_phone;
	private String house_style;
	private String house_userName;
	private Date house_time;
	/**
	 * 经度
	 */
	private String longitude;
	/**
	 * 纬度
	 */
	private String latitude;
	public HousePojo(int house_id, String building_id, String house_name, String house_money, String house_type,
					 String house_mi,String house_unit, String house_num, String house_orientation, String house_decoration_type,
					 String house_address, String house_intime, String house_linkman, String house_phone, String house_style,
					 String house_userName, Date house_time, String longitude, String latitude) {
		super();
		this.house_id = house_id;
		this.building_id = building_id;
		this.house_name = house_name;
		this.house_money = house_money;
		this.house_type = house_type;
		this.house_mi = house_mi;
		this.house_unit = house_unit;
		this.house_num = house_num;
		this.house_orientation = house_orientation;
		this.house_decoration_type = house_decoration_type;
		this.house_address = house_address;
		this.house_intime = house_intime;
		this.house_linkman = house_linkman;
		this.house_phone = house_phone;
		this.house_style = house_style;
		this.house_userName = house_userName;
		this.house_time = house_time;
		this.longitude = longitude;
		this.latitude = latitude;
	}
	public HousePojo(int house_id, String building_id, String house_name, String house_money, String house_type,
					 String house_mi,String house_unit, String house_num, String house_orientation, String house_decoration_type,
					 String house_address, String house_intime, String house_linkman, String house_phone, String house_style,
					 String house_userName, Date house_time) {
		super();
		this.house_id = house_id;
		this.building_id = building_id;
		this.house_name = house_name;
		this.house_money = house_money;
		this.house_type = house_type;
		this.house_mi = house_mi;
		this.house_unit = house_unit;
		this.house_num = house_num;
		this.house_orientation = house_orientation;
		this.house_decoration_type = house_decoration_type;
		this.house_address = house_address;
		this.house_intime = house_intime;
		this.house_linkman = house_linkman;
		this.house_phone = house_phone;
		this.house_style = house_style;
		this.house_userName = house_userName;
		this.house_time = house_time;
	}
	public HousePojo(String building_id, String house_name, String house_money, String house_type, String house_mi,String house_unit,
					 String house_num, String house_orientation, String house_decoration_type, String house_address,
					 String house_intime, String house_linkman, String house_phone, String house_style, String house_userName,
					 Date house_time, String longitude, String latitude) {
		super();
		this.building_id = building_id;
		this.house_name = house_name;
		this.house_money = house_money;
		this.house_type = house_type;
		this.house_mi = house_mi;
		this.house_unit = house_unit;
		this.house_num = house_num;
		this.house_orientation = house_orientation;
		this.house_decoration_type = house_decoration_type;
		this.house_address = house_address;
		this.house_intime = house_intime;
		this.house_linkman = house_linkman;
		this.house_phone = house_phone;
		this.house_style = house_style;
		this.house_userName = house_userName;
		this.house_time = house_time;
		this.longitude = longitude;
		this.latitude = latitude;
	}
	@Override
	public String toString() {
		return "HousePojo [building_id=" + building_id + ", house_name=" + house_name + ", house_money=" + house_money
				+ ", house_type=" + house_type + ", house_mi=" + house_mi + ", house_num=" + house_num
				+ ", house_orientation=" + house_orientation + ", house_decoration_type=" + house_decoration_type
				+ ", house_address=" + house_address + ", house_intime=" + house_intime + ", house_linkman="
				+ house_linkman + ", house_phone=" + house_phone + ", house_style=" + house_style + ", house_userName="
				+ house_userName + ", house_time=" + house_time + "]";
	}
	public HousePojo() {
		super();
	}
	public HousePojo(int house_id) {
		super();
		this.house_id = house_id;
	}
	public String getBuilding_id() {
		return building_id;
	}
	public void setBuilding_id(String building_id) {
		this.building_id = building_id;
	}
	public String getHouse_name() {
		return house_name;
	}
	public void setHouse_name(String house_name) {
		this.house_name = house_name;
	}
	public String getHouse_money() {
		return house_money;
	}
	public void setHouse_money(String house_money) {
		this.house_money = house_money;
	}
	public String getHouse_type() {
		return house_type;
	}
	public void setHouse_type(String house_type) {
		this.house_type = house_type;
	}
	public String getHouse_mi() {
		return house_mi;
	}
	public void setHouse_mi(String house_mi) {
		this.house_mi = house_mi;
	}
	public String getHouse_num() {
		return house_num;
	}
	public void setHouse_num(String house_num) {
		this.house_num = house_num;
	}
	public String getHouse_orientation() {
		return house_orientation;
	}
	public void setHouse_orientation(String house_orientation) {
		this.house_orientation = house_orientation;
	}
	public String getHouse_decoration_type() {
		return house_decoration_type;
	}
	public void setHouse_decoration_type(String house_decoration_type) {
		this.house_decoration_type = house_decoration_type;
	}
	public String getHouse_address() {
		return house_address;
	}
	public void setHouse_address(String house_address) {
		this.house_address = house_address;
	}
	public String getHouse_intime() {
		return house_intime;
	}
	public void setHouse_intime(String house_intime) {
		this.house_intime = house_intime;
	}
	public String getHouse_phone() {
		return house_phone;
	}
	public void setHouse_phone(String house_phone) {
		this.house_phone = house_phone;
	}
	public String getHouse_style() {
		return house_style;
	}
	public void setHouse_style(String house_style) {
		this.house_style = house_style;
	}
	public String getHouse_userName() {
		return house_userName;
	}
	public void setHouse_userName(String house_userName) {
		this.house_userName = house_userName;
	}
	public Date getHouse_time() {
		return house_time;
	}
	public void setHouse_time(Date house_time) {
		this.house_time = house_time;
	}
	public int getHouse_id() {
		return house_id;
	}
	public void setHouse_id(int house_id) {
		this.house_id = house_id;
	}
	public String getHouse_linkman() {
		return house_linkman;
	}
	public void setHouse_linkman(String house_linkman) {
		this.house_linkman = house_linkman;
	}

	public String getHouse_unit() {
		return house_unit;
	}

	public void setHouse_unit(String house_unit) {
		this.house_unit = house_unit;
	}
}
