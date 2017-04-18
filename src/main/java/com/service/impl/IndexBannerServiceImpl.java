package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.mapper.IndexbannerMapper;
import com.model.Indexbanner;
import com.model.Property;
import com.model.pojo.DeletePojo;
import com.model.pojo.PagePojo;
import com.service.IndexBannerService;

@Service("indexBannerService")
public class IndexBannerServiceImpl extends BaseServiceImpl<Indexbanner> implements IndexBannerService {
    
	@Autowired
	private IndexbannerMapper indexBannerMapper;
	
	@Override
	public Indexbanner findOne(Object id) {
		return indexBannerMapper.findOne(id);
	}
	@Override
	public int save(Indexbanner entity) {
		return indexBannerMapper.add(entity);
	}
	@Override
	public int updateAll(Indexbanner entity) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int updateNotNull(Indexbanner entity) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int delete(Object ids) {
		return indexBannerMapper.deleteBatch(new DeletePojo((String)ids));
	}
	@Override
	public List<Indexbanner> selectByExample(Object example) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<Indexbanner> queryPage(PagePojo p) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public int update(Indexbanner entity) {
		return indexBannerMapper.update(entity);
	}
	@Override
	public Page<Property> pageBanner() {
		return indexBannerMapper.pageBanner();
	}
	@Override
	public Page<Indexbanner> pageByConIndexBanner(PagePojo p) {
		return indexBannerMapper.pageByConIndexBanner(p);
	}
	@Override
	public List<Indexbanner> search(String position,String title,String platform) {
		return indexBannerMapper.search( position,title,platform);
	}
    
	

}
