package com.model;
/**
 * 委托找房-区域关联表
 * @author MyZhang
 *
 */
/**
 * @author Administrator
 *
 */
public class Find_House_Region {
	/**
	 * 编号
	 */
	private int fhr_id;
	/**
	 * 区域编号
	 */
	private Region region_id;
	/**
	 * 子域编号
	 */
	private Child_Domain child_domain_id;
	public Find_House_Region(Region region_id, Child_Domain child_domain_id) {
		super();
		this.region_id = region_id;
		this.child_domain_id = child_domain_id;
	}
	public Find_House_Region() {
		super();
	}
	public int getFhr_id() {
		return fhr_id;
	}
	public void setFhr_id(int fhr_id) {
		this.fhr_id = fhr_id;
	}
	public Region getRegion_id() {
		return region_id;
	}
	public void setRegion_id(Region region_id) {
		this.region_id = region_id;
	}
	public Child_Domain getChild_domain_id() {
		return child_domain_id;
	}
	public void setChild_domain_id(Child_Domain child_domain_id) {
		this.child_domain_id = child_domain_id;
	}
}
