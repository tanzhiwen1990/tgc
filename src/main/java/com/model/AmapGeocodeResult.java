package com.model;

import java.util.List;

/**   
* @Title: AmapGeocodeResult.java 
* 
* @Description: TODO(用一句话描述该文件做什么) 
* 
* @author tianjianping@meloinfo.com 
* 
* @date 2016年11月3日 下午4:10:02 
*/
public class AmapGeocodeResult {
	String status;
	String info;
	String infocode;
	String count;
	List<Geocode> geocodes;
	
	
	/**
	 * @return the status
	 */
	public String getStatus() {
		return status;
	}


	/**
	 * @param status the status to set
	 */
	public void setStatus(String status) {
		this.status = status;
	}


	/**
	 * @return the info
	 */
	public String getInfo() {
		return info;
	}


	/**
	 * @param info the info to set
	 */
	public void setInfo(String info) {
		this.info = info;
	}


	/**
	 * @return the infocode
	 */
	public String getInfocode() {
		return infocode;
	}


	/**
	 * @param infocode the infocode to set
	 */
	public void setInfocode(String infocode) {
		this.infocode = infocode;
	}


	/**
	 * @return the count
	 */
	public String getCount() {
		return count;
	}


	/**
	 * @param count the count to set
	 */
	public void setCount(String count) {
		this.count = count;
	}


	/**
	 * @return the geocodes
	 */
	public List<Geocode> getGeocodes() {
		return geocodes;
	}


	/**
	 * @param geocodes the geocodes to set
	 */
	public void setGeocodes(List<Geocode> geocodes) {
		this.geocodes = geocodes;
	}


	public class Geocode{
		String location;
		
		String province;
		
		String city;
		
		String district;
		/**
		 * @return the location
		 */
		public String getLocation() {
			return location;
		}

		/**
		 * @param location the location to set
		 */
		public void setLocation(String location) {
			this.location = location;
		}

		/**
		 * @return the province
		 */
		public String getProvince() {
			return province;
		}

		/**
		 * @param province the province to set
		 */
		public void setProvince(String province) {
			this.province = province;
		}

		/**
		 * @return the city
		 */
		public String getCity() {
			return city;
		}

		/**
		 * @param city the city to set
		 */
		public void setCity(String city) {
			this.city = city;
		}

		/**
		 * @return the district
		 */
		public String getDistrict() {
			return district;
		}

		/**
		 * @param district the district to set
		 */
		public void setDistrict(String district) {
			this.district = district;
		}
		
		
		
	}
}
