package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.mapper.ProblemMapper;
import com.model.Problem;
import com.service.ProblemService;

@Service("problemService")
public class ProblemServiceImpl implements ProblemService{
    
	@Autowired
	private ProblemMapper pm;
	
	@Override
	public List<Problem> pageProblem() {
		return pm.getProblem();
	}

	@Override
	public int delete(String ids) {
		return pm.batchDelete(ids);
	}

	@Override
	public int update(Problem bean) {
	   return pm.update(bean);
		
	}

	@Override
	public Problem findOne(Integer id) {
		return pm.findOne(id);
	}

	@Override
	public Page<Problem> pageProblemByCon(String beginTime, String endTime) {
		return pm. pageProblemByCon(beginTime,endTime);
	}

	@Override
	public void save(Problem entity) {
		pm.save(entity);
	}

	@Override
	public List<Problem> frontPageProblem() {
		return pm.frontPageProblem();
	}

}
