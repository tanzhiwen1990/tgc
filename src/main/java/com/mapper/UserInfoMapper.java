package com.mapper;

import java.util.List;

import com.model.UserInfo;

public interface UserInfoMapper {

	UserInfo get(String openid);

	void save(UserInfo info);

	List<UserInfo> pageUserInfo();

}
