package com.model.pojo;

import java.util.List;

import com.model.District;

public class CityPojo {
	/**
	 * 编号
	 */
	private int city_id;
	/**
	 * 城市名称
	 */
	private String city_name;
	/**
	 * 城市的区县集合
	 */
	private List<District> list;
	public int getCity_id() {
		return city_id;
	}
	public void setCity_id(int city_id) {
		this.city_id = city_id;
	}
	public String getCity_name() {
		return city_name;
	}
	public void setCity_name(String city_name) {
		this.city_name = city_name;
	}
	public CityPojo(int city_id, String city_name, List<District> list) {
		super();
		this.city_id = city_id;
		this.city_name = city_name;
		this.list = list;
	}
	public CityPojo() {
		super();
	}
	public List<District> getList() {
		return list;
	}
	public void setList(List<District> list) {
		this.list = list;
	}
}
