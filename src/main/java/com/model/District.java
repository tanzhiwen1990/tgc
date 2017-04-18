package com.model;
/**
 * 区县
 * @author Myzhang
 *
 */
public class District {
	/**
	 * 编号
	 */
	private int district_id;
	/**
	 * 城市编号
	 */
	private City city_id;
	/**
	 * 区县名称
	 */
	private String district_name;
	public District(int district_id, City city_id, String district_name) {
		super();
		this.district_id = district_id;
		this.city_id = city_id;
		this.district_name = district_name;
	}
	public District(City city_id, String district_name) {
		super();
		this.city_id = city_id;
		this.district_name = district_name;
	}
	public District() {
		super();
	}
	public int getDistrict_id() {
		return district_id;
	}
	public void setDistrict_id(int district_id) {
		this.district_id = district_id;
	}
	public City getCity_id() {
		return city_id;
	}
	public void setCity_id(City city_id) {
		this.city_id = city_id;
	}
	public String getDistrict_name() {
		return district_name;
	}
	public void setDistrict_name(String district_name) {
		this.district_name = district_name;
	}
}
