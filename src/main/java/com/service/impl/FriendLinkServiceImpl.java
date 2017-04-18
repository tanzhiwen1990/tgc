package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mapper.FriendLinkMapper;
import com.model.FriendLink;
import com.service.FrindLinkService;

@Service
public class FriendLinkServiceImpl implements FrindLinkService{
	
	@Autowired 
	private FriendLinkMapper fm;

	@Override
	public void save(FriendLink entity) {
		fm.save(entity);
		
	}

	@Override
	public FriendLink findOne(Integer id) {
		return fm.findOne(id);
	}

	@Override
	public int update(FriendLink bean) {
		return fm.update(bean);
	}

	@Override
	public int delete(String ids) {

		return fm.delete(ids);
	}

	@Override
	public List<FriendLink> pageFriendLink() {
		return fm.pageFriendLink();
	}

	@Override
	public List<FriendLink> pageByConFriendLink(String beginTime, String endTime) {

		return fm.pageByConFriendLink(beginTime,endTime);
	}

	@Override
	public List<FriendLink> findShow() {
		return fm.findShow();
	}

}
