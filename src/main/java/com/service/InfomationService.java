package com.service;
import java.util.List;
import com.model.Information;


public interface InfomationService {

	public List<Information> pageInfomation();

	public List<Information> pageByConInformation(String beginTime, String endTime);

	public Information findOne(Integer id);

	public void save(Information entity);

	public int update(Information bean);

	public int delete(String ids);

	public List<Information> findLatest();

	public List<Information> getPre(Integer id);

	public Information getNext(Integer id);
 
}
