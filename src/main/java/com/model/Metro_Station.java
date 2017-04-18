package com.model;
/**
 * 地铁站表
 * @author MyZhang
 *
 */
public class Metro_Station {
	/**
	 * 地铁站编号
	 */
	private int metro_station_id;
	/**
	 * 地铁编号
	 */
	private Metro metro_id;
	/**
	 * 地铁站名
	 */
	private String metro_station_name;
	public Metro_Station(Metro metro_id, String metro_station_name) {
		super();
		this.metro_id = metro_id;
		this.metro_station_name = metro_station_name;
	}
	public Metro_Station() {
		super();
	}
	public int getMetro_station_id() {
		return metro_station_id;
	}
	public void setMetro_station_id(int metro_station_id) {
		this.metro_station_id = metro_station_id;
	}
	public Metro getMetro_id() {
		return metro_id;
	}
	public void setMetro_id(Metro metro_id) {
		this.metro_id = metro_id;
	}
	public String getMetro_station_name() {
		return metro_station_name;
	}
	public void setMetro_station_name(String metro_station_name) {
		this.metro_station_name = metro_station_name;
	}
}
