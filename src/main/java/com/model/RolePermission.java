package com.model;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

public class RolePermission {
	
	    @Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    private Integer id;

	    private Integer roleid;

	    private Integer permissionid;

	    /**
	     * @return id
	     */
	    public Integer getId() {
	        return id;
	    }

	    /**
	     * @param id
	     */
	    public void setId(Integer id) {
	        this.id = id;
	    }

	    /**
	     * @return roleid
	     */
	    public Integer getRoleid() {
	        return roleid;
	    }

	    /**
	     * @param roleid
	     */
	    public void setRoleid(Integer roleid) {
	        this.roleid = roleid;
	    }

	    /**
	     * @return permissionid
	     */
	    public Integer getPermissionid() {
	        return permissionid;
	    }

	    /**
	     * @param permissionid
	     */
	    public void setPermissionid(Integer permissionid) {
	        this.permissionid = permissionid;
	    }

}
