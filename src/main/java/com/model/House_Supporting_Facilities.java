package com.model;

import com.model.pojo.House_Supporting_FacilitiesPojo;

/**
 * 房源表-配套设施表关系表
 * @author MyZhang
 *
 */
public class House_Supporting_Facilities {
	/**
	 * 关系编号
	 */
	private int hsf_id;
	/**
	 * 配套设施编号
	 */
	private Surpporting_Facilities surpporting_facilities_id;
	/**
	 * 房屋编号
	 */
	private House house_id;
	public House_Supporting_Facilities(int hsf_id, Surpporting_Facilities surpporting_facilities_id, House house_id) {
		super();
		this.hsf_id = hsf_id;
		this.surpporting_facilities_id = surpporting_facilities_id;
		this.house_id = house_id;
	}
	public House_Supporting_Facilities() {
		super();
	}
	public int getHsf_id() {
		return hsf_id;
	}
	public void setHsf_id(int hsf_id) {
		this.hsf_id = hsf_id;
	}
	public Surpporting_Facilities getSurpporting_facilities_id() {
		return surpporting_facilities_id;
	}
	public void setSurpporting_facilities_id(Surpporting_Facilities surpporting_facilities_id) {
		this.surpporting_facilities_id = surpporting_facilities_id;
	}
	public House getHouse_id() {
		return house_id;
	}
	public void setHouse_id(House house_id) {
		this.house_id = house_id;
	}
	public House_Supporting_Facilities(Surpporting_Facilities surpporting_facilities_id, House house_id) {
		super();
		this.surpporting_facilities_id = surpporting_facilities_id;
		this.house_id = house_id;
	}
}
