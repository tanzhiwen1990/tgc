package com.service;

import java.util.List;

import com.github.pagehelper.Page;
import com.model.Indexbanner;
import com.model.Property;
import com.model.pojo.PagePojo;

public interface IndexBannerService extends BaseService<Indexbanner>{

	Page<Property> pageBanner();

	Page<Indexbanner> pageByConIndexBanner(PagePojo p);

	List<Indexbanner> search(String position, String title, String platform);


}
