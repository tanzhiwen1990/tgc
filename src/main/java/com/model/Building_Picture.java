package com.model;
/**
 * 楼盘（商圈）图片实体类
 * @author MyZhang
 *
 */
public class Building_Picture {
	/**
	 * 楼盘（商圈）图片编号
	 */
	private int building_picture_id;
	/**
	 * 楼盘（商圈）编号
	 */
	private Building building_id;
	/**
	 * 图片地址
	 */
	private String building_picture_addr;
	/**
	 * 图片类型
	 */
	private String building_picture_type;
	public Building_Picture(Building building_id, String building_picture_addr, String building_picture_type) {
		super();
		this.building_id = building_id;
		this.building_picture_addr = building_picture_addr;
		this.building_picture_type = building_picture_type;
	}
	public Building_Picture() {
		super();
	}
	public int getBuilding_picture_id() {
		return building_picture_id;
	}
	public void setBuilding_picture_id(int building_picture_id) {
		this.building_picture_id = building_picture_id;
	}
	public Building getBuilding_id() {
		return building_id;
	}
	public void setBuilding_id(Building building_id) {
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
