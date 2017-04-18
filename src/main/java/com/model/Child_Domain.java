package com.model;
/**
 * 子域表
 * @author MyZhang
 *
 */
public class Child_Domain {
	/**
	 * 子域编号
	 */
	private int child_domain_id;
	/**
	 * 区县编号
	 */
	private District district_id;
	/**
	 * 子域名称
	 */
	private String child_domain_name;
	public Child_Domain(int child_domain_id, District district_id, String child_domain_name) {
		super();
		this.child_domain_id = child_domain_id;
		this.district_id = district_id;
		this.child_domain_name = child_domain_name;
	}
	public Child_Domain(int child_domain_id, String child_domain_name) {
		super();
		this.child_domain_id = child_domain_id;
		this.child_domain_name = child_domain_name;
	}
	public int getChild_domain_id() {
		return child_domain_id;
	}
	public void setChild_domain_id(int child_domain_id) {
		this.child_domain_id = child_domain_id;
	}
	public District getDistrict_id() {
		return district_id;
	}
	public void setDistrict_id(District district_id) {
		this.district_id = district_id;
	}
	public String getChild_domain_name() {
		return child_domain_name;
	}
	public void setChild_domain_name(String child_domain_name) {
		this.child_domain_name = child_domain_name;
	}
}
