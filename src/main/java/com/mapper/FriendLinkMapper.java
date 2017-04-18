package com.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.model.FriendLink;

public interface FriendLinkMapper {

	void save(FriendLink entity);

	FriendLink findOne(@Param(value="id")Integer id);

	int update(FriendLink bean);

	int delete(@Param(value="ids")String ids);

	List<FriendLink> pageFriendLink();

	List<FriendLink> pageByConFriendLink(@Param(value="beginTime")String beginTime, @Param(value="endTime")String endTime);

	List<FriendLink> findShow();

}
