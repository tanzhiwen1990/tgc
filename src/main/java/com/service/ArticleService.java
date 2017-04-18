package com.service;

import java.util.List;

import com.github.pagehelper.Page;
import com.model.Article;
import com.model.pojo.PagePojo;

public interface ArticleService extends BaseService<Article>{

	Page<Article> pageByConArticle(PagePojo p);

	Page<Article> pageArticle();

	List<Article> getPre(Integer id);

	Article getNext(Integer id);
	List<Article> frontPageArticle();

	List<Article> findLatest();

}
