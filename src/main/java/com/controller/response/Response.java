package com.controller.response;

/**
 * 前段请求相应对象,用于封装返回页面的数据
 * @author MyZhang
 *
 */
public abstract class Response {
	/**
	 * 是否请求成功，true/false
	 */
	private boolean success;
	/**
	 * 错误代码
	 */
	private ResponseCode code;
	/**
	 * 消息内容
	 */
	private String message;
	/**
	 * 返回的数据
	 */
	private Object data;
	
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public ResponseCode getCode() {
		return code;
	}

	public void setCode(ResponseCode code) {
		this.code = code;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}

	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}
	
}
