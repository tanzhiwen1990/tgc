package com.model.pojo;

import java.util.Date;

public class BuildingPojo {
	private int building_id;//编号
	private String trade_area_id;//商圈编号
	private int property_id;//物业编号
	private String building_name;//楼盘名称
	private String building_addr;//楼盘地址
	private String building_rent;//租金范围
	private String building_rent_unit;//租金单位
	private String building_year;//建筑年代
	private String building_car;//停车位
	private String building_car_money;//停车费用
	private String building_property;//物业公司
	private String building_property_money;//物业费用
	private String building_developers;//开发商
	private String building_repairtime;//竣工时间
	private String building_acreage;//总建筑面积
	private String SEO_describe;//介绍
	private String building_price_unit;
	private String building_property_unit;
	/**
	 * 经度
	 */
	private String longitude;
	/**
	 * 纬度
	 */
	private String building_price;
	private String latitude;
	private String building_level;//级别
	private String building_traffic;//交通状况
	private String building_userName;//更新人
	private Date building_time;//更新时间
	private String building_sort;//排序
	public BuildingPojo(String trade_area_id, String building_name, String building_addr, String building_rent,
						String building_rent_unit,String building_year, String building_car, String building_car_money,
						String building_property,String building_property_money, String building_developers, String building_repairtime,
						String building_acreage, String building_level, String building_traffic, String building_userName,
						Date building_time, String building_sort, String latitude, String longitude, int property_id,
						String SEO_describe,String building_price,String building_price_unit,String building_property_unit) {
		super();
		this.trade_area_id = trade_area_id;
		this.building_name = building_name;
		this.building_addr = building_addr;
		this.building_rent = building_rent;
		this.building_rent_unit = building_rent_unit;
		this.building_year = building_year;
		this.building_car = building_car;
		this.building_car_money = building_car_money;
		this.building_property = building_property;
		this.building_property_money = building_property_money;
		this.building_developers = building_developers;
		this.building_repairtime = building_repairtime;
		this.building_acreage = building_acreage;
		this.building_level = building_level;
		this.building_traffic = building_traffic;
		this.building_userName = building_userName;
		this.building_time = building_time;
		this.building_sort = building_sort;
		this.longitude = longitude;
		this.latitude = latitude;
		this.property_id = property_id;
		this.SEO_describe=SEO_describe;
		this.building_price_unit=building_price_unit;
		this.building_price=building_price;
		this.building_property_unit=building_property_unit;
	}
	public BuildingPojo(int building_id, String trade_area_id, String building_name, String building_addr,
						String building_rent,String building_rent_unit, String building_year, String building_car, String building_car_money,
						String building_property, String building_property_money, String building_developers,
						String building_repairtime, String building_acreage, String building_level, String building_traffic,
						String building_userName, Date building_time, String building_sort, String latitude, 
						String longitude,int property_id,String SEO_describe,String building_price,String building_price_unit,String building_property_unit) {
		super();
		this.building_id = building_id;
		this.trade_area_id = trade_area_id;
		this.building_name = building_name;
		this.building_addr = building_addr;
		this.building_rent = building_rent;
		this.building_rent_unit = building_rent_unit;
		this.building_year = building_year;
		this.building_car = building_car;
		this.building_car_money = building_car_money;
		this.building_property = building_property;
		this.building_property_money = building_property_money;
		this.building_developers = building_developers;
		this.building_repairtime = building_repairtime;
		this.building_acreage = building_acreage;
		this.building_level = building_level;
		this.building_traffic = building_traffic;
		this.building_userName = building_userName;
		this.building_time = building_time;
		this.building_sort = building_sort;
		this.longitude = longitude;
		this.latitude = latitude;
		this.property_id = property_id;
		this.SEO_describe=SEO_describe;
		this.building_price_unit=building_price_unit;
		this.building_price=building_price;
		this.building_property_unit=building_property_unit;
	}

	public int getBuilding_id() {
		return building_id;
	}

	public void setBuilding_id(int building_id) {
		this.building_id = building_id;
	}

	public String getTrade_area_id() {
		return trade_area_id;
	}
	public void setTrade_area_id(String trade_area_id) {
		this.trade_area_id = trade_area_id;
	}
	public String getBuilding_name() {
		return building_name;
	}
	public void setBuilding_name(String building_name) {
		this.building_name = building_name;
	}
	public String getBuilding_addr() {
		return building_addr;
	}
	public void setBuilding_addr(String building_addr) {
		this.building_addr = building_addr;
	}
	public String getBuilding_rent() {
		return building_rent;
	}
	public void setBuilding_rent(String building_rent) {
		this.building_rent = building_rent;
	}
	public String getBuilding_year() {
		return building_year;
	}
	public void setBuilding_year(String building_year) {
		this.building_year = building_year;
	}
	public String getBuilding_car() {
		return building_car;
	}
	public void setBuilding_car(String building_car) {
		this.building_car = building_car;
	}
	public String getBuilding_car_money() {
		return building_car_money;
	}
	public void setBuilding_car_money(String building_car_money) {
		this.building_car_money = building_car_money;
	}
	public String getBuilding_property() {
		return building_property;
	}
	public void setBuilding_property(String building_property) {
		this.building_property = building_property;
	}
	public String getBuilding_property_money() {
		return building_property_money;
	}
	public void setBuilding_property_money(String building_property_money) {
		this.building_property_money = building_property_money;
	}
	public String getBuilding_developers() {
		return building_developers;
	}
	public void setBuilding_developers(String building_developers) {
		this.building_developers = building_developers;
	}
	public String getBuilding_repairtime() {
		return building_repairtime;
	}
	public void setBuilding_repairtime(String building_repairtime) {
		this.building_repairtime = building_repairtime;
	}
	public String getBuilding_property_unit() {
		return building_property_unit;
	}
	public void setBuilding_property_unit(String building_property_unit) {
		this.building_property_unit = building_property_unit;
	}
	public String getBuilding_acreage() {
		return building_acreage;
	}
	public void setBuilding_acreage(String building_acreage) {
		this.building_acreage = building_acreage;
	}
	public String getBuilding_level() {
		return building_level;
	}
	public void setBuilding_level(String building_level) {
		this.building_level = building_level;
	}
	public String getBuilding_traffic() {
		return building_traffic;
	}
	public void setBuilding_traffic(String building_traffic) {
		this.building_traffic = building_traffic;
	}
	public String getBuilding_userName() {
		return building_userName;
	}
	public void setBuilding_userName(String building_userName) {
		this.building_userName = building_userName;
	}
	public Date getBuilding_time() {
		return building_time;
	}
	public void setBuilding_time(Date building_time) {
		this.building_time = building_time;
	}
	public String getBuilding_sort() {
		return building_sort;
	}
	public void setBuilding_sort(String building_sort) {
		this.building_sort = building_sort;
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
	public int getProperty_id() {
		return property_id;
	}
	public void setProperty_id(int property_id) {
		this.property_id = property_id;
	}

	public String getBuilding_rent_unit() {
		return building_rent_unit;
	}

	public void setBuilding_rent_unit(String building_rent_unit) {
		this.building_rent_unit = building_rent_unit;
	}
	
	public String getBuilding_price_unit() {
		return building_price_unit;
	}
	public void setBuilding_price_unit(String building_price_unit) {
		this.building_price_unit = building_price_unit;
	}
	public String getSEO_describe() {
		return SEO_describe;
	}
	public void setSEO_describe(String sEO_describe) {
		SEO_describe = sEO_describe;
	}
	
	public String getBuilding_price() {
		return building_price;
	}
	public void setBuilding_price(String building_price) {
		this.building_price = building_price;
	}
}
