package com.service;

import java.util.List;

import com.model.Seo;

/**
 * seo设置接口
 * @author Administrator
 *
 */
public interface SeoService {

	List<Seo> pageSeo();

	void save(Seo bean);

	Seo findOne(Integer id);

	void update(Seo entity);

	int delete(String ids);

	List<Seo> pageByConSeo(String beginTime, String endTime);

	Seo search(String string);
   
}
