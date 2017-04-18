package com.model.pojo;
/**
 * 分页查询条件类
 * @author MyZhang
 *
 */
public class PagePojo {
	private String beginTime;//开始时间
	private String endTime;//结束时间
	private String name;//名称
	private String type;//类型
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
	public PagePojo(String beginTime, String endTime, String name, String type) {
		super();
		this.beginTime = beginTime;
		this.endTime = endTime;
		this.name = name;
		this.type = type;
	}
}
