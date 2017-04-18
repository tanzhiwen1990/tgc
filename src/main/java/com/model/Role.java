package com.model;

import java.util.Date;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 角色相关
 * @author Administrator
 *
 */
@Table(name="t_role")
public class Role {
	 /**
     * id
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 角色名
     */
    private String name;

    /**
     * 描述
     */
    private String description;
    
    
    private String permission;
    
    /**
     * 创建时间
     */
    private Date createtime;
    
    /**
     * 创建时间
     */
    private Integer creatorid;

    /**
     * 获取id
     *
     * @return id - id
     */
    public Integer getId() {
        return id;
    }

    /**
     * 设置id
     *
     * @param id id
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * 获取角色名
     *
     * @return name - 角色名
     */
    public String getName() {
        return name;
    }

    /**
     * 设置角色名
     *
     * @param name 角色名
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * 获取描述
     *
     * @return description - 描述
     */
    public String getDescription() {
        return description;
    }
    
    public String getPermission() {
		return permission;
	}
    
    public void setPermission(String integer) {
		this.permission = integer;
	}

    /**
     * 设置描述
     *
     * @param description 描述
     */
    public void setDescription(String description) {
        this.description = description;
    }

    

	/**
	 * @return the createtime
	 */
	public Date getCreatetime() {
		return createtime;
	}

	/**
	 * @param createtime the createtime to set
	 */
	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}

	/**
	 * @return the creatorid
	 */
	public Integer getCreatorid() {
		return creatorid;
	}

	/**
	 * @param creatorid the creatorid to set
	 */
	public void setCreatorid(Integer creatorid) {
		this.creatorid = creatorid;
	}
}
