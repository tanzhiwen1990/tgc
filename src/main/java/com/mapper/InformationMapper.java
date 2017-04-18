package com.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.model.Information;

public interface InformationMapper {

	List<Information> pageInfomation();

	int update(Information bean);

	int batchDelete(@Param(value="ids") String ids);

	void save(Information entity);

	Information findOne(@Param(value="id") Integer id);

	List<Information> pageByConInformation(@Param(value="beginTime") String beginTime, @Param(value="endTime") String endTime);

	List<Information> findLatest();

	List<Information> getPre(@Param(value="id")Integer id);

	Information getNext(@Param(value="id")Integer id);

}
