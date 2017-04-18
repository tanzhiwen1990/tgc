package com.model.pojo;

public class PageHousePojo {
	private String city;//城市
	private String district;//区县
	private String trade_Area;//楼盘
	private String building;//商圈
	private String type;//类型
	private String name;//输入的条件
	public PageHousePojo(String city, String district, String trade_Area, String building, String type, String name) {
		super();
		this.city = city;
		this.district = district;
		this.trade_Area = trade_Area;
		this.building = building;
		this.type = type;
		this.name = name;
	}
	public PageHousePojo() {
		super();
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getDistrict() {
		return district;
	}
	public void setDistrict(String district) {
		this.district = district;
	}
	public String getTrade_Area() {
		return trade_Area;
	}
	public void setTrade_Area(String trade_Area) {
		this.trade_Area = trade_Area;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getBuilding() {
		return building;
	}
	public void setBuilding(String building) {
		this.building = building;
	}
}
