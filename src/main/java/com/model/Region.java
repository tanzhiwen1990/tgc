package com.model;
/**
 * 区域表
 * @author MyZhang
 *
 */
public class Region {
	/**
	 * 区域编号
	 */
	private int region_id;
	/**
	 * 区域名称
	 */
	private String region_name;
	public Region(String region_name) {
		super();
		this.region_name = region_name;
	}
	public Region() {
		super();
	}
	public int getRegion_id() {
		return region_id;
	}
	public void setRegion_id(int region_id) {
		this.region_id = region_id;
	}
	public String getRegion_name() {
		return region_name;
	}
	public void setRegion_name(String region_name) {
		this.region_name = region_name;
	}
}
