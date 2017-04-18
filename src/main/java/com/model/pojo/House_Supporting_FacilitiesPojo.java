package com.model.pojo;

public class House_Supporting_FacilitiesPojo {
	/**
	 * 配套设施编号
	 */
	private Integer supporting_facilities_id;
	/**
	 * 房屋编号
	 */
	private Integer house_id;
	/**
	 * 配套设施名称
	 */
	private String supporting_facilities_name;
	public House_Supporting_FacilitiesPojo(int supporting_facilities_id, int house_id) {
		super();
		this.supporting_facilities_id = supporting_facilities_id;
		this.house_id = house_id;
	}
	public House_Supporting_FacilitiesPojo(Integer supporting_facilities_id, Integer house_id,
			String supporting_facilities_name) {
		super();
		this.supporting_facilities_id = supporting_facilities_id;
		this.house_id = house_id;
		this.supporting_facilities_name = supporting_facilities_name;
	}
	public int getSupporting_facilities_id() {
		return supporting_facilities_id;
	}
	public void setSupporting_facilities_id(int supporting_facilities_id) {
		this.supporting_facilities_id = supporting_facilities_id;
	}
	public int getHouse_id() {
		return house_id;
	}
	public void setHouse_id(int house_id) {
		this.house_id = house_id;
	}
	public String getSupporting_facilities_name() {
		return supporting_facilities_name;
	}
	public void setSupporting_facilities_name(String supporting_facilities_name) {
		this.supporting_facilities_name = supporting_facilities_name;
	}
}
