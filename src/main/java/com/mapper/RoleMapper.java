package com.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.model.Role;

public interface RoleMapper {

	int delete(@Param(value="ids") String ids);

	void update(Role bean);

	Role getOneById(@Param(value="id") Integer id);

	void save(Role entity);

	List<Role> pageRole();

}
