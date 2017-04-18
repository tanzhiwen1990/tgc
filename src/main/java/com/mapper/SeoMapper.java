package com.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.model.Seo;

/**
 * Seo Mapper接口
 * @author Administrator
 *
 */
public interface SeoMapper {

	List<Seo> pageSeo();

	void save(Seo bean);

	Seo findOne(Integer id);

	void update(Seo entity);

	List<Seo> pageByConSeo(@Param(value="beginTime")String beginTime, @Param(value="endTime")String endTime);

	Seo search(@Param(value="position")String position);

}
