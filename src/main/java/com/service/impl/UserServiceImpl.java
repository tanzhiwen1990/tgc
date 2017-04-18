package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mapper.UserInfoMapper;
import com.model.UserInfo;
import com.service.UserInfoService;
@Service
public class UserServiceImpl implements UserInfoService{
    @Autowired
    private UserInfoMapper um;
	@Override
	public UserInfo get(String openid) {
		return um.get(openid);
	}

	@Override
	public void save(UserInfo info) {
		um.save(info);
		
	}

	@Override
	public List<UserInfo> pageUserInfo() {
		return um.pageUserInfo();
	}

}
