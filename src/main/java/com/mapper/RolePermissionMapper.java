package com.mapper;

import org.apache.ibatis.annotations.Param;

import com.model.RolePermission;

/**
 * 账号-角色对应表
 * @author Administrator
 *
 */
public interface RolePermissionMapper {

	void save(RolePermission rp);
    /**
     * 根据角色id删除角色权限
     * @param id
     */
	void deletePermissionsByRoleId(@Param(value="id")Integer id);
  
}
