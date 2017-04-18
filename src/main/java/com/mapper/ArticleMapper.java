package com.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.github.pagehelper.Page;
import com.model.Article;
import com.model.pojo.PagePojo;
import com.util.BaseMapper;

public interface ArticleMapper extends BaseMapper<Article> {

	Article findOne(@Param(value="id")Object id);

	int save(Article entity);

	int deleteBacth(@Param(value="ids")Object ids);

	List<Article> queryPage(PagePojo p);

	int update(Article entity);

	Page<Article> pageArticle();

	Page<Article> pageByConArticle(PagePojo p);

	List<Article> getPre(@Param(value="id")Integer id);

	Article getNext(@Param(value="id")Integer id);

	List<Article> frontPageArticle();

	List<Article> findLatest();

}
