package com.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * 友情链接
 * @author Administrator
 *
 */
public class FriendLink {
	
	private Integer id;
	/*公司名称*/
	private String companyname;
	/*公司logo*/
	private String logo;
	/*公司描述*/
	private String description;
	/*链接地址*/
	private String linkurl;
	/*更新人*/
	private String username;
	/*状态(已上线,未上线)*/
	private String status;
	/*更新时间*/
	@DateTimeFormat(pattern="yyyy-MM-dd hh:mm:ss")
	private Date releaseDate;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getCompanyname() {
		return companyname;
	}
	public void setCompanyname(String companyname) {
		this.companyname = companyname;
	}
	public String getLogo() {
		return logo;
	}
	public void setLogo(String logo) {
		this.logo = logo;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getLinkurl() {
		return linkurl;
	}
	public void setLinkurl(String linkurl) {
		this.linkurl = linkurl;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Date getReleaseDate() {
		return releaseDate;
	}
	public void setReleaseDate(Date releaseDate) {
		this.releaseDate = releaseDate;
	}
	
	public static void main(String[] args){
		System.out.println(new Date().getTime());
	}

}
