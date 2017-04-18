package com.model;

import java.math.BigDecimal;
import java.util.Date;

/**
 * 楼盘实体类
 * @author MyZhang
 *
 */
public class Building {
	/**
	 * 楼盘编号
	 */
	private int building_id;
	/**
	 * 商圈编号
	 */
	private Trade_Area trade_area_id;
	/**
	 * 子域编号
	 */
	private Child_Domain child_domain_id;
	/**
	 * 物业编号
	 */
	private Property property_id;
	/**
	 * 楼盘名称
	 */
	private String building_name;
	/**
	 * 地址
	 */
	private String building_addr;
	/**
	 * 租金范围
	 */
	private String building_rent;

	private String building_rent_unit;
	/**
	 * 售价
	 */
	private String building_price;
	
	/**
	 * 售价单位
	 */
	private String building_price_unit;
	/**
	 * 建筑年代
	 */
	private String building_year;
	/**
	 * 停车位
	 */
	private int building_car;
	/**
	 * 停车费用
	 */
	private float building_car_money;
	/**
	 * 栋数+楼层数
	 */
	private String building_floor;
	/**
	 * 下属房源数
	 */
	private int building_houseNum;
	/**
	 * 物业公司
	 */
	private String building_property;
	/**
	 * 物业费用
	 */
	private float building_property_money;
	/*物业费单位*/
	private String building_property_unit;
	/**
	 * 开发商
	 */
	private String building_developers;
	/**
	 * 竣工时间
	 */
	private Date building_repairtime;
	/**
	 * 总建筑面积
	 */
	private float building_acreage;
	/**
	 * 单层面积
	 */
	private float building_danacreage;
	/**
	 * 空调:有或者无
	 */
	private String building_kongtiao;
	/**
	 * 电梯数量
	 */
	private int building_liftNum;
	/**
	 * 层高
	 */
	private float building_height;
	/**
	 * 独立卫生间:有/无
	 */
	private String building_toilet;
	/**
	 * 水费
	 */
	private float building_shui;
	/**
	 * 电费
	 */
	private float building_dian;
	/**
	 * 级别
	 */
	private String building_level;
	/**
	 * 交通信息
	 */
	private String building_traffic;
	/**
	 * 是否热门
	 */
	private String building_isHot;
	/**
	 * 状态：未上线 or 已上线
	 */
	private String building_state;
	/**
	 * 更新人
	 */
	private String building_userName;
	/**
	 * 更新时间
	 */
	private Date building_time;
	/**
	 * 排序
	 */
	private int building_sort;
	/**
	 * 经度
	 */
	private String longitude;
	/**
	 * 纬度
	 */
	private String latitude;
	/**
	 * SEO标题
	 */
	private String SEO_title;
	/**
	 * SEO页面描述
	 */
	private String SEO_describe;
	/**
	 * SEO关键字
	 */
	
	private String SEO_keyword;
	
	public Building(int building_id) {
		super();
		this.building_id = building_id;
	}
	public int getBuilding_id() {
		return building_id;
	}
	public void setBuilding_id(int building_id) {
		this.building_id = building_id;
	}
	public Trade_Area getTrade_area_id() {
		return trade_area_id;
	}
	public void setTrade_area_id(Trade_Area trade_area_id) {
		this.trade_area_id = trade_area_id;
	}
	public Child_Domain getChild_domain_id() {
		return child_domain_id;
	}
	public void setChild_domain_id(Child_Domain child_domain_id) {
		this.child_domain_id = child_domain_id;
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
	public String getBuilding_price() {
		return building_price;
	}
	public void setBuilding_price(String building_price) {
		this.building_price = building_price;
	}
	public String getBuilding_year() {
		return building_year;
	}
	public void setBuilding_year(String building_year) {
		this.building_year = building_year;
	}
	public int getBuilding_car() {
		return building_car;
	}
	public void setBuilding_car(int building_car) {
		this.building_car = building_car;
	}
	public float getBuilding_car_money() {
		return building_car_money;
	}
	public void setBuilding_car_money(float building_car_money) {
		this.building_car_money = building_car_money;
	}
	public String getBuilding_floor() {
		return building_floor;
	}
	public void setBuilding_floor(String building_floor) {
		this.building_floor = building_floor;
	}
	public int getBuilding_houseNum() {
		return building_houseNum;
	}
	public void setBuilding_houseNum(int building_houseNum) {
		this.building_houseNum = building_houseNum;
	}
	public String getBuilding_property() {
		return building_property;
	}
	public void setBuilding_property(String building_property) {
		this.building_property = building_property;
	}
	public float getBuilding_property_money() {
		return building_property_money;
	}
	public void setBuilding_property_money(float building_property_money) {
		this.building_property_money = building_property_money;
	}
	public String getBuilding_developers() {
		return building_developers;
	}
	public void setBuilding_developers(String building_developers) {
		this.building_developers = building_developers;
	}
	public Date getBuilding_repairtime() {
		return building_repairtime;
	}
	public void setBuilding_repairtime(Date building_repairtime) {
		this.building_repairtime = building_repairtime;
	}
	public float getBuilding_acreage() {
		return building_acreage;
	}
	public void setBuilding_acreage(float building_acreage) {
		this.building_acreage = building_acreage;
	}
	public float getBuilding_danacreage() {
		return building_danacreage;
	}
	public void setBuilding_danacreage(float building_danacreage) {
		this.building_danacreage = building_danacreage;
	}
	public String getBuilding_kongtiao() {
		return building_kongtiao;
	}
	public void setBuilding_kongtiao(String building_kongtiao) {
		this.building_kongtiao = building_kongtiao;
	}
	public int getBuilding_liftNum() {
		return building_liftNum;
	}
	public void setBuilding_liftNum(int building_liftNum) {
		this.building_liftNum = building_liftNum;
	}
	public float getBuilding_height() {
		return building_height;
	}
	public void setBuilding_height(float building_height) {
		this.building_height = building_height;
	}
	public String getBuilding_toilet() {
		return building_toilet;
	}
	public void setBuilding_toilet(String building_toilet) {
		this.building_toilet = building_toilet;
	}
	public float getBuilding_shui() {
		return building_shui;
	}
	public void setBuilding_shui(float building_shui) {
		this.building_shui = building_shui;
	}
	public float getBuilding_dian() {
		return building_dian;
	}
	public void setBuilding_dian(float building_dian) {
		this.building_dian = building_dian;
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
	public String getBuilding_state() {
		return building_state;
	}
	public void setBuilding_state(String building_state) {
		this.building_state = building_state;
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
	public int getBuilding_sort() {
		return building_sort;
	}
	public void setBuilding_sort(int building_sort) {
		this.building_sort = building_sort;
	}
	public String getSEO_title() {
		return SEO_title;
	}
	public void setSEO_title(String sEO_title) {
		SEO_title = sEO_title;
	}
	public String getSEO_describe() {
		return SEO_describe;
	}
	public void setSEO_describe(String sEO_describe) {
		SEO_describe = sEO_describe;
	}
	public String getSEO_keyword() {
		return SEO_keyword;
	}
	public void setSEO_keyword(String sEO_keyword) {
		SEO_keyword = sEO_keyword;
	}
	public Property getProperty_id() {
		return property_id;
	}
	public void setProperty_id(Property property_id) {
		this.property_id = property_id;
	}
	public Building() {
		super();
	}
	public String getBuilding_price_unit() {
		return building_price_unit;
	}
	public void setBuilding_price_unit(String building_price_unit) {
		this.building_price_unit = building_price_unit;
	}
	
	public String getBuilding_property_unit() {
		return building_property_unit;
	}
	public void setBuilding_property_unit(String building_property_unit) {
		this.building_property_unit = building_property_unit;
	}
	public Building(Trade_Area trade_area_id, Child_Domain child_domain_id, Property property_id, String building_name,
					String building_addr, String building_rent,String building_rent_unit, String building_price, String building_year, int building_car,
					float building_car_money, String building_floor, int building_houseNum, String building_property,
					float building_property_money, String building_developers, Date building_repairtime, float building_acreage,
					float building_danacreage, String building_kongtiao, int building_liftNum, float building_height,
					String building_toilet, float building_shui, float building_dian, String building_level,
					String building_traffic, String building_isHot, String building_state, String building_userName,
					Date building_time, int building_sort, String longitude, String latitude, String sEO_title,
					String sEO_describe, String sEO_keyword,String building_price_unit,String building_property_unit) {
		super();
		this.trade_area_id = trade_area_id;
		this.child_domain_id = child_domain_id;
		this.property_id = property_id;
		this.building_name = building_name;
		this.building_addr = building_addr;
		this.building_rent = building_rent;
		this.building_rent_unit = building_rent_unit;
		this.building_price = building_price;
		this.building_year = building_year;
		this.building_car = building_car;
		this.building_car_money = building_car_money;
		this.building_floor = building_floor;
		this.building_houseNum = building_houseNum;
		this.building_property = building_property;
		this.building_property_money = building_property_money;
		this.building_developers = building_developers;
		this.building_repairtime = building_repairtime;
		this.building_acreage = building_acreage;
		this.building_danacreage = building_danacreage;
		this.building_kongtiao = building_kongtiao;
		this.building_liftNum = building_liftNum;
		this.building_height = building_height;
		this.building_toilet = building_toilet;
		this.building_shui = building_shui;
		this.building_dian = building_dian;
		this.building_level = building_level;
		this.building_traffic = building_traffic;
		this.building_isHot = building_isHot;
		this.building_state = building_state;
		this.building_userName = building_userName;
		this.building_time = building_time;
		this.building_sort = building_sort;
		this.longitude = longitude;
		this.latitude = latitude;
		SEO_title = sEO_title;
		SEO_describe = sEO_describe;
		SEO_keyword = sEO_keyword;
		this.building_price_unit=building_price_unit;
		this.building_property_unit=building_property_unit;
	}
	public Building(int building_id, Trade_Area trade_area_id, Child_Domain child_domain_id, Property property_id,
					String building_name, String building_addr, String building_rent,String building_rent_unit, String building_price,
					String building_year, int building_car, float building_car_money, String building_floor,
					int building_houseNum, String building_property, float building_property_money, String building_developers,
					Date building_repairtime, float building_acreage, float building_danacreage, String building_kongtiao,
					int building_liftNum, float building_height, String building_toilet, float building_shui,
					float building_dian, String building_level, String building_traffic, String building_isHot,
					String building_state, String building_userName, Date building_time, int building_sort, String longitude,
					String latitude, String sEO_title, String sEO_describe, String sEO_keyword,String building_price_unit,String building_property_unit) {
		super();
		this.building_id = building_id;
		this.trade_area_id = trade_area_id;
		this.child_domain_id = child_domain_id;
		this.property_id = property_id;
		this.building_name = building_name;
		this.building_addr = building_addr;
		this.building_rent = building_rent;
		this.building_rent_unit = building_rent_unit;
		this.building_price = building_price;
		this.building_year = building_year;
		this.building_car = building_car;
		this.building_car_money = building_car_money;
		this.building_floor = building_floor;
		this.building_houseNum = building_houseNum;
		this.building_property = building_property;
		this.building_property_money = building_property_money;
		this.building_developers = building_developers;
		this.building_repairtime = building_repairtime;
		this.building_acreage = building_acreage;
		this.building_danacreage = building_danacreage;
		this.building_kongtiao = building_kongtiao;
		this.building_liftNum = building_liftNum;
		this.building_height = building_height;
		this.building_toilet = building_toilet;
		this.building_shui = building_shui;
		this.building_dian = building_dian;
		this.building_level = building_level;
		this.building_traffic = building_traffic;
		this.building_isHot = building_isHot;
		this.building_state = building_state;
		this.building_userName = building_userName;
		this.building_time = building_time;
		this.building_sort = building_sort;
		this.longitude = longitude;
		this.latitude = latitude;
		SEO_title = sEO_title;
		SEO_describe = sEO_describe;
		SEO_keyword = sEO_keyword;
		this.building_price_unit=building_price_unit;
		this.building_property_unit=building_property_unit;
	}
	@Override
	public String toString() {
		return "Building [building_id=" + building_id + ", trade_area_id=" + trade_area_id + ", child_domain_id="
				+ child_domain_id + ", property_id=" + property_id + ", building_name=" + building_name
				+ ", building_addr=" + building_addr + ", building_rent=" + building_rent + ", building_price="
				+ building_price + ", building_year=" + building_year + ", building_car=" + building_car
				+ ", building_car_money=" + building_car_money + ", building_floor=" + building_floor
				+ ", building_houseNum=" + building_houseNum + ", building_property=" + building_property
				+ ", building_property_money=" + building_property_money + ", building_developers="
				+ building_developers + ", building_repairtime=" + building_repairtime + ", building_acreage="
				+ building_acreage + ", building_danacreage=" + building_danacreage + ", building_kongtiao="
				+ building_kongtiao + ", building_liftNum=" + building_liftNum + ", building_height=" + building_height
				+ ", building_toilet=" + building_toilet + ", building_shui=" + building_shui + ", building_dian="
				+ building_dian + ", building_level=" + building_level + ", building_traffic=" + building_traffic
				+ ", building_isHot=" + building_isHot + ", building_state=" + building_state + ", building_userName="
				+ building_userName + ", building_time=" + building_time + ", building_sort=" + building_sort
				+ ", longitude=" + longitude + ", latitude=" + latitude + ", SEO_title=" + SEO_title + ", SEO_describe="
				+ SEO_describe + ", SEO_keyword=" + SEO_keyword + "]";
	}
	public Building(Trade_Area trade_area_id, String building_name, String building_addr, String building_rent,String building_rent_unit,
					String building_year, int building_car, float building_car_money,
					String building_property, float building_property_money, String building_developers,
					Date building_repairtime, float building_acreage, String building_level, String building_traffic,
					String building_userName, Date building_time) {
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
	}
	public Building(int building_id, String building_state, String building_userName, Date building_time) {
		super();
		this.building_id = building_id;
		this.building_state = building_state;
		this.building_userName = building_userName;
		this.building_time = building_time;
	}
	public String getBuilding_isHot() {
		return building_isHot;
	}
	public void setBuilding_isHot(String building_isHot) {
		this.building_isHot = building_isHot;
	}
	public Building(int building_id, String building_isHot) {
		super();
		this.building_id = building_id;
		this.building_isHot = building_isHot;
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

	public String getBuilding_rent_unit() {
		return building_rent_unit;
	}

	public void setBuilding_rent_unit(String building_rent_unit) {
		this.building_rent_unit = building_rent_unit;
	}
}
