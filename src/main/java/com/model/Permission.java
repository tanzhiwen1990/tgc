package com.model;
/**
 * 
 * @author Administrator
 *
 */
public class Permission {
	
	private Integer id;
	 
	private String name;
	
	private String url;
	
	private Integer isroot;//是否根目录
	
	private Integer parentid; //父节点
	
	private String logo;
	
	private String link;
	
	public String getLink() {
		return link;
	}
	
	public void setLink(String link) {
		this.link = link;
	}
	
	public String getLogo() {
		return logo;
	}
	
	public void setLogo(String logo) {
		this.logo = logo;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
	
	public Integer getIsroot() {
		return isroot;
	}
	
	public void setIsroot(Integer isroot) {
		this.isroot = isroot;
	}
	
	public Integer getParentid() {
		return parentid;
	}
	public void setParentid(Integer parentid) {
		this.parentid = parentid;
	}
	
	

}
