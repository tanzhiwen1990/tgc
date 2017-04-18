package com.model.pojo;
/**
 * 商圈分页查询条件Pojo类
 * @author MyZhang
 *
 */
public class PageTrade_AreaPojo {
	private String city;//城市
	private String district;//区县
	private String name;//输入的条件
	public PageTrade_AreaPojo() {
		super();
	}
	public PageTrade_AreaPojo(String city, String district, String name) {
		super();
		this.city = city;
		this.district = district;
		this.name = name;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}
