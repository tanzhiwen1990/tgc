package com.model;

import java.util.Date;

/**
 * 行业动态model
 * @author Administrator
 *关联表 information
 */
public class Information {
	/*主键自增*/
     private Integer id;
     /*标题*/
     private String title;
     /*点击访问路径*/
     private String url;
     /*描述*/
     private String description;
     /*图片*/
     private String img;
     /*状态*/
     private String status;
     /*展示平台*/
     private String platform;
     /*更新人*/
     private String username;
     /*更新时间*/
     private Date updateDate;
     
     public String getPlatform() {
		return platform;
	}
     public void setPlatform(String platform) {
		this.platform = platform;
	}
     
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	public String getStatus() {
		return status;
	}
	
	public void setStatus(String status) {
		this.status = status;
	}
     
     
}
