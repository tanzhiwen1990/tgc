package com.model.pojo;

public class PageRecommendPojo {
	private String beginTime;//开始时间
	private String endTime;//结束时间
	private String city;//城市
	private String district;//区县
	private String trade_Area;//商圈
	private String type;//推荐类别
	private String state;//状态
	public PageRecommendPojo(String beginTime, String endTime, String city, String district, String trade_Area,
			String type, String state) {
		super();
		this.beginTime = beginTime;
		this.endTime = endTime;
		this.city = city;
		this.district = district;
		this.trade_Area = trade_Area;
		this.type = type;
		this.state = state;
	}
	@Override
	public String toString() {
		return "PageRecommendPojo [beginTime=" + beginTime + ", endTime=" + endTime + ", city=" + city + ", district="
				+ district + ", trade_Area=" + trade_Area + ", type=" + type + ", state=" + state + "]";
	}

	public PageRecommendPojo() {
		super();
	}
	public String getBeginTime() {
		return beginTime;
	}
	public void setBeginTime(String beginTime) {
		this.beginTime = beginTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
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
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
}
