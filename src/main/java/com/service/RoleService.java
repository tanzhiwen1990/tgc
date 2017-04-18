package com.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.model.Role;

/**
 * 角色相关接口
 * @author Administrator
 *
 */
public interface RoleService {

	int delete(String ids);

	void update(Role bean,HttpServletRequest request);

	Role getOneById(Integer id);

	void save(Role entity);

	List<Role> pageRole();

}
