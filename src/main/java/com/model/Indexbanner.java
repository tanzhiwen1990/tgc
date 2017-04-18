package com.model;

import java.util.Date;
/**
 * 首页banner表
 * @author huxiuqin
 *
 */

public class Indexbanner {
	private Integer id;
	private String url;
    private String title;
    private String pic;
    private Date groundtime;
    private String status;
    private Integer sort;
    private String platform;
    private String position;
    
    public String getPlatform() {
		return platform;
	}
    public void setPlatform(String platform) {
		this.platform = platform;
	}
    public String getPosition() {
		return position;
	}
    public void setPosition(String position) {
		this.position = position;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPic() {
		return pic;
	}
	public void setPic(String pic) {
		this.pic = pic;
	}

	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Date getGroundtime() {
		return groundtime;
	}
	public void setGroundtime(Date groundtime) {
		this.groundtime = groundtime;
	}
	
	public Integer getSort() {
		return sort;
	}
	
	public void setSort(Integer sort) {
		this.sort = sort;
	}
	public Indexbanner(String url, String title, String pic, Date groundtime, String status, Integer sort,
			String platform, String position) {
		super();
		this.url = url;
		this.title = title;
		this.pic = pic;
		this.groundtime = groundtime;
		this.status = status;
		this.sort = sort;
		this.platform = platform;
		this.position = position;
	}
	public Indexbanner() {
		super();
	}
    
	
}
