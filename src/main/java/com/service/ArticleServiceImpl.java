package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.mapper.ArticleMapper;
import com.model.Article;
import com.model.pojo.PagePojo;
import com.service.impl.BaseServiceImpl;

@Service("articleService")
public class ArticleServiceImpl extends BaseServiceImpl<Article> implements ArticleService {
    
	@Autowired
	private ArticleMapper am;
	
	
	@Override
	public Article findOne(Object id) {
		return am.findOne(id);
	}

	@Override
	public int save(Article entity) {
		return am.save(entity);
	}

	@Override
	public int updateAll(Article entity) {
		
		return 0;
	}

	@Override
	public int updateNotNull(Article entity) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(Object ids) {
		return am.deleteBacth(ids);
	}

	@Override
	public List<Article> selectByExample(Object example) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Article> queryPage(PagePojo p) {
		return am.queryPage(p);
	}

	@Override
	public int update(Article entity) {
		return am.update(entity);
	}

	@Override
	public Page<Article> pageByConArticle(PagePojo p) {
		return am.pageByConArticle(p);
	}

	@Override
	public Page<Article> pageArticle() {
		return am.pageArticle();
	}

	@Override
	public List<Article> getPre(Integer id) {
		return am.getPre(id);
	}

	@Override
	public Article getNext(Integer id) {
		// TODO Auto-generated method stub
		return am.getNext(id);
	}

	@Override
	public List<Article> frontPageArticle() {
		return am.frontPageArticle();
	}

	@Override
	public List<Article> findLatest() {
		return am.findLatest();
	}


}
