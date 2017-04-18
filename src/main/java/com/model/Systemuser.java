package com.model;

import java.util.Date;

//管理员实体类
public class Systemuser {
	private int t_id;//编号
	private String t_user;//账号名
	private String t_name;//创建者
	private String t_realname;
	private Integer roleid;
	private String t_mobilphone;//联系电话
	private String t_status;//状态(激活，未激活)
	private Date t_createtime;//创建时间
	private String t_password;//密码
	public Systemuser(String t_user, String t_name, String t_mobilphone, String t_status, Date t_createtime,
			String t_password,String t_realname ) {
		super();
		this.t_user = t_user;
		this.t_name = t_name;
		this.t_mobilphone = t_mobilphone;
		this.t_status = t_status;
		this.t_createtime = t_createtime;
		this.t_password = t_password;
		this.t_realname=t_realname;
	}
	
	public String getT_realname() {
		return t_realname;
	}
	public void setT_realname(String t_realname) {
		this.t_realname = t_realname;
	}
	public Systemuser() {
		super();
	}
	public Integer getRoleid() {
		return roleid;
	}
	public void setRoleid(Integer roleid) {
		this.roleid = roleid;
	}
	public int getT_id() {
		return t_id;
	}
	public void setT_id(int t_id) {
		this.t_id = t_id;
	}
	public String getT_user() {
		return t_user;
	}
	public void setT_user(String t_user) {
		this.t_user = t_user;
	}
	public String getT_name() {
		return t_name;
	}
	public void setT_name(String t_name) {
		this.t_name = t_name;
	}
	public String getT_mobilphone() {
		return t_mobilphone;
	}
	public void setT_mobilphone(String t_mobilphone) {
		this.t_mobilphone = t_mobilphone;
	}
	public String getT_status() {
		return t_status;
	}
	public void setT_status(String t_status) {
		this.t_status = t_status;
	}
	public Date getT_createtime() {
		return t_createtime;
	}
	public void setT_createtime(Date t_createtime) {
		this.t_createtime = t_createtime;
	}
	public String getT_password() {
		return t_password;
	}
	public void setT_password(String t_password) {
		this.t_password = t_password;
	}
}
