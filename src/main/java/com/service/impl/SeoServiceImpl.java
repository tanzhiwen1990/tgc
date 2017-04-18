package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mapper.SeoMapper;
import com.model.Seo;
import com.service.SeoService;
@Service
public class SeoServiceImpl implements SeoService {
    @Autowired
    private SeoMapper sm;
	@Override
	public List<Seo> pageSeo() {
		
		return sm.pageSeo();
	}

	@Override
	public void save(Seo bean) {
       sm.save(bean);
	}

	@Override
	public Seo findOne(Integer id) {
		return sm.findOne(id);
	}

	@Override
	public void update(Seo entity) {
        sm.update(entity);
	}

	@Override
	public int delete(String ids) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Seo> pageByConSeo(String beginTime, String endTime) {
		// TODO Auto-generated method stub
		return sm.pageByConSeo(beginTime,endTime);
	}

	@Override
	public Seo search(String position) {
		
		return sm.search(position);
	}

}
