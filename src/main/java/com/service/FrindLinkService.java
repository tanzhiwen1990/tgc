package com.service;

import java.util.List;

import com.model.FriendLink;

public interface FrindLinkService {

	void save(FriendLink entity);

	FriendLink findOne(Integer id);

	int update(FriendLink bean);

	int delete(String ids);

	List<FriendLink> pageFriendLink();

	List<FriendLink> pageByConFriendLink(String beginTime, String endTime);

	List<FriendLink> findShow();

}
