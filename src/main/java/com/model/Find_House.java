package com.model;

import java.util.Date;

/**
 * 委托找房表
 * @author MyZhang
 *
 */
public class Find_House {
	/**
	 * 委托找房编号
	 */
	private int find_house_id;
	/**
	 * 公司名称
	 */
	private String find_house_company_name;
	/**
	 * 房源类型
	 */
	private String find_house_type;
	/**
	 * 城市
	 */
	private String find_house_city;
	/**
	 * 区域
	 */
	private String find_house_district;
	/**
	 * 商圈
	 */
	private String find_house_trade_area;
	/**
	 * 期望面积
	 */
	private String find_house_acreage;
	/**
	 * 期望价格
	 */
	private String find_house_price;
	
	/**
	 * 联系人
	 */
	private String find_house_name;
	/**
	 * 联系电话
	 */
	private String find_house_phone;
	/**
	 * 提交时间
	 */
	private Date find_house_time;
	/**
	 * 状态
	 */
	private String find_house_state;
	public Find_House(String find_house_company_name, String find_house_type, String find_house_city,
			String find_house_district, String find_house_trade_area, String find_house_acreage, String find_house_price,
			String find_house_name, String find_house_phone, Date find_house_time, String find_house_state) {
		super();
		this.find_house_company_name = find_house_company_name;
		this.find_house_type = find_house_type;
		this.find_house_city = find_house_city;
		this.find_house_district = find_house_district;
		this.find_house_trade_area = find_house_trade_area;
		this.find_house_acreage = find_house_acreage;
		this.find_house_price = find_house_price;
		this.find_house_name = find_house_name;
		this.find_house_phone = find_house_phone;
		this.find_house_time = find_house_time;
		this.find_house_state = find_house_state;
	}
	public Find_House() {
		super();
	}
	public int getFind_house_id() {
		return find_house_id;
	}
	public void setFind_house_id(int find_house_id) {
		this.find_house_id = find_house_id;
	}
	public String getFind_house_company_name() {
		return find_house_company_name;
	}
	public void setFind_house_company_name(String find_house_company_name) {
		this.find_house_company_name = find_house_company_name;
	}
	public String getFind_house_type() {
		return find_house_type;
	}
	public void setFind_house_type(String find_house_type) {
		this.find_house_type = find_house_type;
	}
	public String getFind_house_city() {
		return find_house_city;
	}
	public void setFind_house_city(String find_house_city) {
		this.find_house_city = find_house_city;
	}
	public String getFind_house_district() {
		return find_house_district;
	}
	public void setFind_house_district(String find_house_district) {
		this.find_house_district = find_house_district;
	}
	public String getFind_house_trade_area() {
		return find_house_trade_area;
	}
	public void setFind_house_trade_area(String find_house_trade_area) {
		this.find_house_trade_area = find_house_trade_area;
	}
	public String getFind_house_acreage() {
		return find_house_acreage;
	}
	public void setFind_house_acreage(String find_house_acreage) {
		this.find_house_acreage = find_house_acreage;
	}
	public String getFind_house_price() {
		return find_house_price;
	}
	public void setFind_house_price(String find_house_price) {
		this.find_house_price = find_house_price;
	}
	public String getFind_house_name() {
		return find_house_name;
	}
	public void setFind_house_name(String find_house_name) {
		this.find_house_name = find_house_name;
	}
	public String getFind_house_phone() {
		return find_house_phone;
	}
	public void setFind_house_phone(String find_house_phone) {
		this.find_house_phone = find_house_phone;
	}
	public Date getFind_house_time() {
		return find_house_time;
	}
	public void setFind_house_time(Date find_house_time) {
		this.find_house_time = find_house_time;
	}
	public String getFind_house_state() {
		return find_house_state;
	}
	public void setFind_house_state(String find_house_state) {
		this.find_house_state = find_house_state;
	}
}
