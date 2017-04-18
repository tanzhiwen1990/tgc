package com.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.github.pagehelper.Page;
import com.model.Problem;

public interface ProblemMapper {

	List<Problem> getProblem();

	int batchDelete(@Param(value="ids")String ids);

	Problem findOne(@Param(value="id")Integer id);

	Page<Problem> pageProblemByCon(@Param(value="beginTime")String beginTime, @Param(value="endTime")String endTime);

	int update(Problem bean);

	void save(Problem entity);

	List<Problem> frontPageProblem();

}
