package com.model;

import java.util.Date;

/**
 * 商圈表
 * @author MyZhang
 */
public class Trade_Area {
	/**
	 * 编号
	 */
	private int trade_area_id;
	/**
	 * 区县编号
	 */
	private District district_id;
	/**
	 * 子域编号
	 */
	private Child_Domain child_domain_id;
	/**
	 * 商圈名称
	 */
	private String trade_area_name;
	/**
	 * 商圈地址
	 */
	private String trade_area_addr;
	/**
	 * 商圈介绍
	 */
	private String trade_area_text;
	/**
	 * 热门推荐
	 */
	private String trade_area_ishot;
	/**
	 * 排序
	 */
	private int trade_area_sort;
	/**
	 * 经度
	 */
	private String longitude;
	/**
	 * 纬度
	 */
	private String latitude;
	/**
	 * 状态
	 */
	private String trade_area_state;
	/**
	 * 更新人
	 */
	private String trade_area_username;
	/**
	 * 更新时间
	 */
	private Date trade_area_time;
	/**
	 * 商圈预览图url
	 */
	private String trade_area_img;
	/**
	 * 商圈预览图小
     */
	private String trade_area_img_small;
	public Trade_Area(District district_id, String trade_area_name, String trade_area_text, String trade_area_ishot,
			int trade_area_sort, String trade_area_state, String trade_area_username, Date trade_area_time,
			String trade_area_img, String longitude ,String latitude,String trade_area_addr,String trade_area_img_small) {
		super();
		this.district_id = district_id;
		this.trade_area_name = trade_area_name;
		this.trade_area_text = trade_area_text;
		this.trade_area_ishot = trade_area_ishot;
		this.trade_area_sort = trade_area_sort;
		this.trade_area_state = trade_area_state;
		this.trade_area_username = trade_area_username;
		this.trade_area_time = trade_area_time;
		this.trade_area_img = trade_area_img;
		this.longitude = longitude;
		this.latitude = latitude;
		this.trade_area_addr=trade_area_addr;
		this.trade_area_img_small=trade_area_img_small;
	}
	public Trade_Area(int trade_area_id, District district_id, Child_Domain child_domain_id, String trade_area_name,
			String trade_area_text, String trade_area_ishot, int trade_area_sort, String longitude, String latitude,
			String trade_area_state, String trade_area_username, Date trade_area_time, String trade_area_img) {
		super();
		this.trade_area_id = trade_area_id;
		this.district_id = district_id;
		this.child_domain_id = child_domain_id;
		this.trade_area_name = trade_area_name;
		this.trade_area_text = trade_area_text;
		this.trade_area_ishot = trade_area_ishot;
		this.trade_area_sort = trade_area_sort;
		this.longitude = longitude;
		this.latitude = latitude;
		this.trade_area_state = trade_area_state;
		this.trade_area_username = trade_area_username;
		this.trade_area_time = trade_area_time;
		this.trade_area_img = trade_area_img;
	}
	public Trade_Area(District district_id, String trade_area_name, String trade_area_text, String trade_area_ishot,
			int trade_area_sort, String trade_area_username, String trade_area_img,
			String longitude ,String latitude,String trade_area_addr,String trade_area_img_small) {
		super();
		this.district_id = district_id;
		this.trade_area_name = trade_area_name;
		this.trade_area_text = trade_area_text;
		this.trade_area_ishot = trade_area_ishot;
		this.trade_area_sort = trade_area_sort;
		this.trade_area_username = trade_area_username;
		this.trade_area_img = trade_area_img;
		this.longitude = longitude;
		this.latitude = latitude;
		this.trade_area_addr=trade_area_addr;
		this.trade_area_img_small=trade_area_img_small;
	}
	
	public Trade_Area(int trade_area_id, String trade_area_state, String trade_area_username, Date trade_area_time) {
		super();
		this.trade_area_id = trade_area_id;
		this.trade_area_state = trade_area_state;
		this.trade_area_username = trade_area_username;
		this.trade_area_time = trade_area_time;
	}
	public Trade_Area(int trade_area_id) {
		super();
		this.trade_area_id = trade_area_id;
	}

	public Trade_Area() {
		super();
	}
	public int getTrade_area_id() {
		return trade_area_id;
	}
	public void setTrade_area_id(int trade_area_id) {
		this.trade_area_id = trade_area_id;
	}
	public District getDistrict_id() {
		return district_id;
	}
	public void setDistrict_id(District district_id) {
		this.district_id = district_id;
	}
	public String getTrade_area_name() {
		return trade_area_name;
	}
	public void setTrade_area_name(String trade_area_name) {
		this.trade_area_name = trade_area_name;
	}
	public String getTrade_area_text() {
		return trade_area_text;
	}
	public void setTrade_area_text(String trade_area_text) {
		this.trade_area_text = trade_area_text;
	}
	public String getTrade_area_ishot() {
		return trade_area_ishot;
	}
	public void setTrade_area_ishot(String trade_area_ishot) {
		this.trade_area_ishot = trade_area_ishot;
	}
	public int getTrade_area_sort() {
		return trade_area_sort;
	}
	public void setTrade_area_sort(int trade_area_sort) {
		this.trade_area_sort = trade_area_sort;
	}
	public String getTrade_area_state() {
		return trade_area_state;
	}
	public void setTrade_area_state(String trade_area_state) {
		this.trade_area_state = trade_area_state;
	}
	public String getTrade_area_username() {
		return trade_area_username;
	}
	public void setTrade_area_username(String trade_area_username) {
		this.trade_area_username = trade_area_username;
	}
	public Date getTrade_area_time() {
		return trade_area_time;
	}
	public void setTrade_area_time(Date trade_area_time) {
		this.trade_area_time = trade_area_time;
	}
	public String getTrade_area_img() {
		return trade_area_img;
	}
	public void setTrade_area_img(String trade_area_img) {
		this.trade_area_img = trade_area_img;
	}
	public Child_Domain getChild_domain_id() {
		return child_domain_id;
	}
	public void setChild_domain_id(Child_Domain child_domain_id) {
		this.child_domain_id = child_domain_id;
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
	
	public String getTrade_area_addr() {
		return trade_area_addr;
	}
	
	public void setTrade_area_addr(String trade_area_addr) {
		this.trade_area_addr = trade_area_addr;
	}

	public String getTrade_area_img_small() {
		return trade_area_img_small;
	}

	public void setTrade_area_img_small(String trade_area_img_small) {
		this.trade_area_img_small = trade_area_img_small;
	}
}
