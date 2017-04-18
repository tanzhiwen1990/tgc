package com.model;

import java.util.Date;

/**
 * 热门推荐
 * @author MyZhang
 *
 */
public class Recommend {
	/**
	 * 编号
	 */
	private int recommend_id;
	/**
	 * 被推荐者编号
	 */
	private int recommended_id;
	/**
	 * 城市名称
	 */
	private String recommend_cityName;
	/**
	 * 区县名称
	 */
	private String recommend_districtName;
	/**
	 * 商圈名称
	 */
	private String recommend_trade_areatName;
	/**
	 * 楼盘名称
	 */
	private String recommend_building_name;
	/**
	 * 房源名称
	 */
	private String recommend_house_name;
	/**
	 * 推荐类别:房源，楼盘
	 */
	private String recommend_type;
	/**
	 * 状态：未上线 or 已上线
	 */
	private String recommend_state;
	/**
	 * 更新人
	 */
	private String recommend_userName;
	/**
	 * 修改时间
	 */
	private Date recommend_time;
	public Recommend(int recommended_id, String recommend_cityName, String recommend_districtName,
			String recommend_trade_areatName, String recommend_building_name, String recommend_type,
			String recommend_userName) {
		super();
		this.recommended_id = recommended_id;
		this.recommend_cityName = recommend_cityName;
		this.recommend_districtName = recommend_districtName;
		this.recommend_trade_areatName = recommend_trade_areatName;
		this.recommend_building_name = recommend_building_name;
		this.recommend_type = recommend_type;
		this.recommend_userName = recommend_userName;
	}
	public Recommend(int recommend_id, int recommended_id, String recommend_cityName,
			String recommend_districtName, String recommend_trade_areatName, String recommend_building_name,
			String recommend_type, String recommend_state, String recommend_userName, Date recommend_time) {
		super();
		this.recommend_id = recommend_id;
		this.recommended_id = recommended_id;
		this.recommend_cityName = recommend_cityName;
		this.recommend_districtName = recommend_districtName;
		this.recommend_trade_areatName = recommend_trade_areatName;
		this.recommend_building_name = recommend_building_name;
		this.recommend_type = recommend_type;
		this.recommend_state = recommend_state;
		this.recommend_userName = recommend_userName;
		this.recommend_time = recommend_time;
	}
	public Recommend(int recommend_id, String recommend_state, String recommend_userName, Date recommend_time) {
		super();
		this.recommend_id = recommend_id;
		this.recommend_state = recommend_state;
		this.recommend_userName = recommend_userName;
		this.recommend_time = recommend_time;
	}
	public Recommend(int recommended_id, String recommend_cityName, String recommend_districtName,
			String recommend_trade_areatName, String recommend_building_name, String recommend_house_name,
			String recommend_type, String recommend_userName) {
		super();
		this.recommended_id = recommended_id;
		this.recommend_cityName = recommend_cityName;
		this.recommend_districtName = recommend_districtName;
		this.recommend_trade_areatName = recommend_trade_areatName;
		this.recommend_building_name = recommend_building_name;
		this.recommend_house_name = recommend_house_name;
		this.recommend_type = recommend_type;
		this.recommend_userName = recommend_userName;
	}
	public Recommend() {
		super();
	}
	public int getRecommend_id() {
		return recommend_id;
	}
	public void setRecommend_id(int recommend_id) {
		this.recommend_id = recommend_id;
	}
	public int getRecommended_id() {
		return recommended_id;
	}
	public void setRecommended_id(int recommended_id) {
		this.recommended_id = recommended_id;
	}
	public String getRecommend_cityName() {
		return recommend_cityName;
	}
	public void setRecommend_cityName(String recommend_cityName) {
		this.recommend_cityName = recommend_cityName;
	}
	public String getRecommend_districtName() {
		return recommend_districtName;
	}
	public void setRecommend_districtName(String recommend_districtName) {
		this.recommend_districtName = recommend_districtName;
	}
	public String getRecommend_trade_areatName() {
		return recommend_trade_areatName;
	}
	public void setRecommend_trade_areatName(String recommend_trade_areatName) {
		this.recommend_trade_areatName = recommend_trade_areatName;
	}
	public String getRecommend_building_name() {
		return recommend_building_name;
	}
	public void setRecommend_building_name(String recommend_building_name) {
		this.recommend_building_name = recommend_building_name;
	}
	public String getRecommend_type() {
		return recommend_type;
	}
	public void setRecommend_type(String recommend_type) {
		this.recommend_type = recommend_type;
	}
	public String getRecommend_state() {
		return recommend_state;
	}
	public void setRecommend_state(String recommend_state) {
		this.recommend_state = recommend_state;
	}
	public String getRecommend_userName() {
		return recommend_userName;
	}
	public void setRecommend_userName(String recommend_userName) {
		this.recommend_userName = recommend_userName;
	}
	public Date getRecommend_time() {
		return recommend_time;
	}
	public void setRecommend_time(Date recommend_time) {
		this.recommend_time = recommend_time;
	}
	public String getRecommend_house_name() {
		return recommend_house_name;
	}
	public void setRecommend_house_name(String recommend_house_name) {
		this.recommend_house_name = recommend_house_name;
	}
}
