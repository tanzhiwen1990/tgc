package com.model;

import java.util.Date;

/**
 * 业主放盘
 * @author MyZhang
 *
 */
public class Owner_Building {
	/**
	 * 编号
	 */
	private int owner_building_id;
	/**
	 * 类型 出售/出租
	 */
	private String owner_building_type;
	/**
	 * 大厦名称
	 */
	private String owner_building_name;
	/**
	 * 楼房号 12层-8号
	 */
	private String owner_building_number;
	/**
	 * 建筑面积
	 */
	private String owner_building_mi;
	/**
	 * 出租/出售价格
	 */
	private String owner_building_price;
	/**
	 * 联系人
	 */
	private String owner_building_linkman;
	/**
	 * 联系电话
	 */
	private String owner_building_phone;
	/**
	 * 录入时间
	 */
    private String  owner_building_state;
    public String getOwner_building_state() {
		return owner_building_state;
	}
    public void setOwner_building_state(String owner_building_state) {
		this.owner_building_state = owner_building_state;
	}
    
	private Date owner_building_time;
	public Owner_Building(String owner_building_type, String owner_building_name, String owner_building_number,
			String owner_building_mi, String owner_building_price, String owner_building_linkman,
			String owner_building_phone, Date owner_building_time) {
		super();
		this.owner_building_type = owner_building_type;
		this.owner_building_name = owner_building_name;
		this.owner_building_number = owner_building_number;
		this.owner_building_mi = owner_building_mi;
		this.owner_building_price = owner_building_price;
		this.owner_building_linkman = owner_building_linkman;
		this.owner_building_phone = owner_building_phone;
		this.owner_building_time = owner_building_time;
	}
	public Owner_Building() {
		super();
	}
	public int getOwner_building_id() {
		return owner_building_id;
	}
	public void setOwner_building_id(int owner_building_id) {
		this.owner_building_id = owner_building_id;
	}
	public String getOwner_building_type() {
		return owner_building_type;
	}
	public void setOwner_building_type(String owner_building_type) {
		this.owner_building_type = owner_building_type;
	}
	public String getOwner_building_name() {
		return owner_building_name;
	}
	public void setOwner_building_name(String owner_building_name) {
		this.owner_building_name = owner_building_name;
	}
	public String getOwner_building_number() {
		return owner_building_number;
	}
	public void setOwner_building_number(String owner_building_number) {
		this.owner_building_number = owner_building_number;
	}
	public String getOwner_building_mi() {
		return owner_building_mi;
	}
	public void setOwner_building_mi(String owner_building_mi) {
		this.owner_building_mi = owner_building_mi;
	}
	public String getOwner_building_price() {
		return owner_building_price;
	}
	public void setOwner_building_price(String owner_building_price) {
		this.owner_building_price = owner_building_price;
	}
	public String getOwner_building_linkman() {
		return owner_building_linkman;
	}
	public void setOwner_building_linkman(String owner_building_linkman) {
		this.owner_building_linkman = owner_building_linkman;
	}
	public String getOwner_building_phone() {
		return owner_building_phone;
	}
	public void setOwner_building_phone(String owner_building_phone) {
		this.owner_building_phone = owner_building_phone;
	}
	public Date getOwner_building_time() {
		return owner_building_time;
	}
	public void setOwner_building_time(Date owner_building_time) {
		this.owner_building_time = owner_building_time;
	}
}

