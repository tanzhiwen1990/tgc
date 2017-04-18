package com.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.github.pagehelper.Page;
import com.model.Indexbanner;
import com.model.Property;
import com.model.pojo.DeletePojo;
import com.model.pojo.PagePojo;
import com.util.BaseMapper;


public interface IndexbannerMapper extends BaseMapper<Indexbanner>{

	Page<Indexbanner> pageByConIndexBanner(PagePojo p);

	Page<Property> pageBanner();

	int deleteBatch(DeletePojo deletePojo);

	int update(Indexbanner entity);

	Indexbanner findOne(Object id);

	int add(Indexbanner entity);

	List<Indexbanner> search(@Param(value="position")String position, @Param(value="title")String title, @Param(value="platform")String platform);
}
