package com.controller.response;

/**
 * 请求异常返回的对象
 * @author MyZhang
 *
 */
public class ExceptionResponse extends Response {

	public ExceptionResponse(Exception e) {
		this.setCode(ResponseCode.EXCEPTION);
		this.setMessage(e.getMessage());
		this.setData(null);
		this.setSuccess(false);
	}
}
