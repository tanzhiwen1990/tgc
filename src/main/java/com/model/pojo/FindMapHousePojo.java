package com.model.pojo;

public class FindMapHousePojo {
	private String typeText;
	private String  district_id;
	private int property_id;
	private int paixu;
	public FindMapHousePojo(String typeText, String district_id, int property_id, int paixu) {
		super();
		this.typeText = typeText;
		this.district_id = district_id;
		this.property_id = property_id;
		this.paixu = paixu;
	}
	public FindMapHousePojo() {
		super();
	}
	public String getTypeText() {
		return typeText;
	}
	public void setTypeText(String typeText) {
		this.typeText = typeText;
	}
	public String  getDistrict_id() {
		return district_id;
	}
	public void setDistrict_id(String  district_id) {
		this.district_id = district_id;
	}
	public int getProperty_id() {
		return property_id;
	}
	public void setProperty_id(int property_id) {
		this.property_id = property_id;
	}
	public int getPaixu() {
		return paixu;
	}
	public void setPaixu(int paixu) {
		this.paixu = paixu;
	}
	@Override
	public String toString() {
		return "FindMapHousePojo [typeText=" + typeText + ", district_id=" + district_id + ", property_id="
				+ property_id + ", paixu=" + paixu + "]";
	}
}
