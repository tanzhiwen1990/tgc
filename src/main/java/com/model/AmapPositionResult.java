package com.model;

/**   
* @Title: AmapPositionResult.java 
* 
* @Description: TODO(用一句话描述该文件做什么) 
* 
* @author tianjianping@meloinfo.com 
* 
* @date 2016年10月21日 下午5:06:34 
*/
public class AmapPositionResult {
	
	String status;
	String info;
	String infocode;
	regeocode regeocode;
	
	
	
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
	 * @return the regeocode
	 */
	public regeocode getRegeocode() {
		return regeocode;
	}

	/**
	 * @param regeocode the regeocode to set
	 */
	public void setRegeocode(regeocode regeocode) {
		this.regeocode = regeocode;
	}

	public class regeocode{
		String formatted_address;
		addressComponent addressComponent;
		/**
		 * @return the formatted_address
		 */
		public String getFormatted_address() {
			return formatted_address;
		}
		/**
		 * @param formatted_address the formatted_address to set
		 */
		public void setFormatted_address(String formatted_address) {
			this.formatted_address = formatted_address;
		}
		/**
		 * @return the addressComponent
		 */
		public addressComponent getAddressComponent() {
			return addressComponent;
		}
		/**
		 * @param addressComponent the addressComponent to set
		 */
		public void setAddressComponent(addressComponent addressComponent) {
			this.addressComponent = addressComponent;
		}
		
		
	}
	
	public class addressComponent{
		String district;
		
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
		String citycode;
		/**
		 * @return the citycode
		 */
		public String getCitycode() {
			return citycode;
		}
		/**
		 * @param citycode the citycode to set
		 */
		public void setCitycode(String citycode) {
			this.citycode = citycode;
		}
		
	}
	
	public class neighborhood{
		String name;
		String type;
		/**
		 * @return the name
		 */
		public String getName() {
			return name;
		}
		/**
		 * @param name the name to set
		 */
		public void setName(String name) {
			this.name = name;
		}
		/**
		 * @return the type
		 */
		public String getType() {
			return type;
		}
		/**
		 * @param type the type to set
		 */
		public void setType(String type) {
			this.type = type;
		}
		
	}
	
	public class building{
		String name;
		String type;
		/**
		 * @return the name
		 */
		public String getName() {
			return name;
		}
		/**
		 * @param name the name to set
		 */
		public void setName(String name) {
			this.name = name;
		}
		/**
		 * @return the type
		 */
		public String getType() {
			return type;
		}
		/**
		 * @param type the type to set
		 */
		public void setType(String type) {
			this.type = type;
		}
		
	}
	
	public class streetNumber{
		String street;
		String number;
		String location;
		String direction;
		String distance;
		/**
		 * @return the street
		 */
		public String getStreet() {
			return street;
		}
		/**
		 * @param street the street to set
		 */
		public void setStreet(String street) {
			this.street = street;
		}
		/**
		 * @return the number
		 */
		public String getNumber() {
			return number;
		}
		/**
		 * @param number the number to set
		 */
		public void setNumber(String number) {
			this.number = number;
		}
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
		 * @return the direction
		 */
		public String getDirection() {
			return direction;
		}
		/**
		 * @param direction the direction to set
		 */
		public void setDirection(String direction) {
			this.direction = direction;
		}
		/**
		 * @return the distance
		 */
		public String getDistance() {
			return distance;
		}
		/**
		 * @param distance the distance to set
		 */
		public void setDistance(String distance) {
			this.distance = distance;
		}
		
	}
	
	public class businessArea{
		String location;
		String name;
		String id;
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
		 * @return the name
		 */
		public String getName() {
			return name;
		}
		/**
		 * @param name the name to set
		 */
		public void setName(String name) {
			this.name = name;
		}
		/**
		 * @return the id
		 */
		public String getId() {
			return id;
		}
		/**
		 * @param id the id to set
		 */
		public void setId(String id) {
			this.id = id;
		}
		
	}
}
