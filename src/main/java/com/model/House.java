package com.model;

import java.math.BigDecimal;
import java.util.Date;
/**
 * 房源
 * @author MyZhang
 *
 */
public class House {
	/**
	 * 房源编号
	 */
	private int house_id;
	/**
	 * 楼盘编号
	 */
	private Building building_id;
	/**
	 * 子域编号
	 */
	private Child_Domain child_domain_id;
	/**
	 * 名称
	 */
	private String house_name;
	/**
	 * 价格
	 */
	private String house_money;
	/**
	 * 户型
	 */
	private String house_type;
	/**
	 * 面积
	 */
	private BigDecimal house_mi;

	private String house_unit;
	/**
	 * 楼层
	 */
	private String house_num;
	/**
	 * 朝向
	 */
	private String house_orientation;
	/**
	 * 装修类型
	 */
	private String house_decoration_type;
	/**
	 * 地址
	 */
	private String house_address;
	/**
	 * 入住时间
	 */
	private String house_intime;
	/**
	 * 联系人
	 */
	private String house_linkman;
	/**
	 * 联系电话
	 */
	private String house_phone;
	/**
	 * 销售状态
	 */
	private String house_sale_state;
	/**
	 * 房屋类型
	 */
	private String house_style;
	/**
	 * 是否热门
	 */
	private String house_ishot;
	/**
	 * 状态
	 */
	private String house_state;
	/**
	 * 更新人
	 */
	private String house_userName;
	/**
	 * 经度
	 */
	private String longitude;
	/**
	 * 纬度
	 */
	private String latitude;
	/**
	 * 修改时间
	 */
	private Date house_time;
	/**
	 * SEO标题
	 */
	private String SEO_title;
	/**
	 * SEO页面描述
	 */
	private String SEO_describe;
	/**
	 * SEO关键字
	 */
	private String SEO_keyword;
	public House(int house_id, String house_ishot) {
		super();
		this.house_id = house_id;
		this.house_ishot = house_ishot;
	}
	public House(int house_id, Building building_id, Child_Domain child_domain_id, String house_name, String  house_money,
				 String house_type, BigDecimal house_mi,String house_unit, String house_num, String house_orientation, String house_decoration_type,
				 String house_address, String house_intime, String house_linkman, String house_phone,
				 String house_sale_state, String house_style, String house_ishot, String house_state, String house_userName,
				 Date house_time, String sEO_title, String sEO_describe, String sEO_keyword) {
		super();
		this.house_id = house_id;
		this.building_id = building_id;
		this.child_domain_id = child_domain_id;
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
		this.house_sale_state = house_sale_state;
		this.house_style = house_style;
		this.house_ishot = house_ishot;
		this.house_state = house_state;
		this.house_userName = house_userName;
		this.house_time = house_time;
		SEO_title = sEO_title;
		SEO_describe = sEO_describe;
		SEO_keyword = sEO_keyword;
	}
	public House(int house_id, String house_state, String house_userName, Date house_time) {
		super();
		this.house_id = house_id;
		this.house_state = house_state;
		this.house_userName = house_userName;
		this.house_time = house_time;
	}
	public House() {
		super();
	}
	public int getHouse_id() {
		return house_id;
	}
	public void setHouse_id(int house_id) {
		this.house_id = house_id;
	}
	public Building getBuilding_id() {
		return building_id;
	}
	public void setBuilding_id(Building building_id) {
		this.building_id = building_id;
	}
	public Child_Domain getChild_domain_id() {
		return child_domain_id;
	}
	public void setChild_domain_id(Child_Domain child_domain_id) {
		this.child_domain_id = child_domain_id;
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
	public BigDecimal getHouse_mi() {
		return house_mi;
	}
	public void setHouse_mi(BigDecimal house_mi) {
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
	public String getHouse_linkman() {
		return house_linkman;
	}
	public void setHouse_linkman(String house_linkman) {
		this.house_linkman = house_linkman;
	}
	public String getHouse_phone() {
		return house_phone;
	}
	public void setHouse_phone(String house_phone) {
		this.house_phone = house_phone;
	}
	public String getHouse_sale_state() {
		return house_sale_state;
	}
	public void setHouse_sale_state(String house_sale_state) {
		this.house_sale_state = house_sale_state;
	}
	public String getHouse_style() {
		return house_style;
	}
	public void setHouse_style(String house_style) {
		this.house_style = house_style;
	}
	public String getHouse_state() {
		return house_state;
	}
	public void setHouse_state(String house_state) {
		this.house_state = house_state;
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
	public String getSEO_title() {
		return SEO_title;
	}
	public void setSEO_title(String sEO_title) {
		SEO_title = sEO_title;
	}
	public String getSEO_describe() {
		return SEO_describe;
	}
	public void setSEO_describe(String sEO_describe) {
		SEO_describe = sEO_describe;
	}
	public String getSEO_keyword() {
		return SEO_keyword;
	}
	public void setSEO_keyword(String sEO_keyword) {
		SEO_keyword = sEO_keyword;
	}
	public String getHouse_ishot() {
		return house_ishot;
	}
	public void setHouse_ishot(String house_ishot) {
		this.house_ishot = house_ishot;
	}
	public String getLongitude() {
		return longitude;
	}
	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}
	public String getLatitude() {
		return latitude;
	}
	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}

	public String getHouse_unit() {
		return house_unit;
	}

	public void setHouse_unit(String house_unit) {
		this.house_unit = house_unit;
	}
}
