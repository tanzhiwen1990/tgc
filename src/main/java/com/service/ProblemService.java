package com.service;

import java.util.List;

import com.github.pagehelper.Page;
import com.model.Problem;

public interface ProblemService {

	List<Problem> pageProblem();

	int delete(String ids);

	int update(Problem bean);

	Problem findOne(Integer id);

	Page<Problem> pageProblemByCon(String beginTime, String endTime);

	void save(Problem entity);

	List<Problem> frontPageProblem();

	
   
}
