package com.model;
/**
 * 城市
 * @author MyZhang
 *
 */
public class City {
	/**
	 * 编号
	 */
	private int city_id;
	/**
	 * 城市名称
	 */
	private String city_name;
	public City() {
		super();
	}
	public City(String city_name) {
		super();
		this.city_name = city_name;
	}
	public City(int city_id, String city_name) {
		super();
		this.city_id = city_id;
		this.city_name = city_name;
	}
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
}
