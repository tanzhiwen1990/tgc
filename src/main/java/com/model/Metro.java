package com.model;
/**
 * 地铁表
 * @author MyZhang
 *
 */
public class Metro {
	/**
	 * 地铁编号
	 */
	private int metro_id;
	/**
	 * 地铁名
	 */
	private String metro_Name;
	public Metro(String metro_Name) {
		super();
		this.metro_Name = metro_Name;
	}
	public Metro() {
		super();
	}
	public int getMetro_id() {
		return metro_id;
	}
	public void setMetro_id(int metro_id) {
		this.metro_id = metro_id;
	}
	public String getMetro_Name() {
		return metro_Name;
	}
	public void setMetro_Name(String metro_Name) {
		this.metro_Name = metro_Name;
	}
}
