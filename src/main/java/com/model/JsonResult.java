package com.model;

import java.util.Map;

import com.google.common.collect.Maps;

public class JsonResult {
private boolean success = true;
	
	private int code = 0;
	
	private String message = "";
	
	private Map<Object, Object> data = Maps.newHashMap();
	
	public JsonResult() {
		super();
	}

	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}


	public int getCode() {
		return code;
	}


	public void setCode(int code) {
		this.code = code;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Map<Object, Object> getData() {
		return data;
	}

	public void setData(Map<Object, Object> data) {
		this.data = data;
	}
	
	public void appendData(Object key, Object value) {
		this.data.put(key, value);
	}

	public void appendData(Map<?, ?> map) {
		this.data.putAll(map);
	}
}
