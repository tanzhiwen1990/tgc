package com.model.pojo;

public class Building_PicturePojo {
	/**
	 * 楼盘编号
	 */
	private int building_id;
	/**
	 * 图片地址
	 */
	private String building_picture_addr;
	/**
	 * 图片类型
	 */
	private String building_picture_type;
	public Building_PicturePojo(int building_id, String building_picture_addr, String building_picture_type) {
		super();
		this.building_id = building_id;
		this.building_picture_addr = building_picture_addr;
		this.building_picture_type = building_picture_type;
	}
	public Building_PicturePojo(int building_id, String building_picture_addr) {
		super();
		this.building_id = building_id;
		this.building_picture_addr = building_picture_addr;
	}
	public Building_PicturePojo() {
		super();
	}
	public int getBuilding_id() {
		return building_id;
	}
	public void setBuilding_id(int building_id) {
		this.building_id = building_id;
	}
	public String getBuilding_picture_addr() {
		return building_picture_addr;
	}
	public void setBuilding_picture_addr(String building_picture_addr) {
		this.building_picture_addr = building_picture_addr;
	}
	public String getBuilding_picture_type() {
		return building_picture_type;
	}
	public void setBuilding_picture_type(String building_picture_type) {
		this.building_picture_type = building_picture_type;
	}
}
