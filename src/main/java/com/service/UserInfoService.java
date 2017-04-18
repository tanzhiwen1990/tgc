package com.service;

import java.util.List;
import com.model.UserInfo;

/**
 * 微信用户接口
 * @author Administrator
 *
 */
public interface UserInfoService {

	UserInfo get(String openid);

	void save(UserInfo info);

	List<UserInfo> pageUserInfo();
   
}
