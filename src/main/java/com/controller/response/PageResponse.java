package com.controller.response;
/**
 * 分页请求时候返回的对象
 * @author MyZhang
 *
 */
public class PageResponse extends Response {
	private int pageNum;//页码
	private int pageSize;//页面大小
	private long total;//total
	private int pages;//总页数
	public PageResponse(int pageNum, int pageSize, long total, int pages, Object data, boolean success) {
		super();
		this.pageNum = pageNum;
		this.pageSize = pageSize;
		this.total = total;
		this.pages = pages;
		this.setData(data);
		this.setSuccess(success);
		this.setCode(ResponseCode.OK);
	}
	public PageResponse() {
		super();
		this.setData(null);
		this.setSuccess(false);
		this.setCode(ResponseCode.EMPTY);
	}
	public PageResponse(Exception e) {
		super();
		this.setData(null);
		this.setMessage(e.getMessage());
		this.setSuccess(false);
		this.setCode(ResponseCode.EMPTY);
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public long getTotal() {
		return total;
	}
	public void setTotal(long total) {
		this.total = total;
	}
	public int getPages() {
		return pages;
	}
	public void setPages(int pages) {
		this.pages = pages;
	}
}
